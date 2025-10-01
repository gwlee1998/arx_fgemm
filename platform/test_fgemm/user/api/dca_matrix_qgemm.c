#include "platform_info.h"
#include "ervp_malloc.h"
#include "ervp_matrix_op_sw.h"
#include "ervp_printf.h"
#include "dca_matrix_info.h"
#include "ervp_assert.h"

#include "dca_matrix_qgemm.h"
#include "vta_matrix_api.h"
#include "ervp_assert.h"

#include "ip_instance_info.h"
#include "vta_ctrl_api.h"

typedef struct {
	dca_matrix_info_t mx;
	dca_matrix_info_t mw;
	dca_matrix_info_t mo;
	unsigned int option;
} dca_matrix_qgemm_inst_t;

typedef union{
	uint32_t hex;
	struct
	{
		unsigned int i_moreg2store_busy : 1;
		unsigned int i_load2mwreg_busy : 1;
		unsigned int i_load2mxreg_busy : 1;
		unsigned int i_qdq_controller_dq_busy : 1;
		unsigned int i_qdq_controller_qw_busy : 1;
		unsigned int i_qdq_controller_qx_busy : 1;
		unsigned int dq_state : 2;
		unsigned int q_state : 2;
		unsigned int unused : 22;
	} log;
} dca_matrix_qgemm_log_t;

#define BUFFER_SIZE 16

// Register Map
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//       *bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
//=====================================================================================
// INFO - Blocked GEMM test: batch=16, in_channels=16, out_channels=16, uop_comp=0
// inp_size=16 wgt_size=1 out_size=16
// batch =16 [16][16] : max
static uint32_t vta_insns[] NOTCACHED_DATA VTA_CTRL = {
	0x00000000, 0x00000000, 0x00100001, 0x00000010,  // LOAD
	0x000001a0, 0x00000000, 0x00010010, 0x00000088,  // LOAD
	0x00000090, 0x00000000, 0x00010001, 0x00000040,  // LOAD
	0x00000140, 0x00000000, 0x00010010, 0x00000088,  // LOAD
	0x0200004a, 0x00020008, 0x00000000, 0x00000000,  // GEMM
	0x00000229, 0x00000000, 0x00010010, 0x00000088,  // STORE
	0x00000013, 0x00000000, 0x00000000, 0x00000000}; // FINISH

////// micro operation  (dst_idx, src_idx, wgt_idx)
static uint32_t uops[] NOTCACHED_DATA VTA_CTRL = {
    0x00000000,
    0x00000801,
    0x00001002,
    0x00001803,
    0x00002004,
    0x00002805,
    0x00003006,
    0x00003807,
    0x00004008,
    0x00004809,
    0x0000500a,
    0x0000580b,
    0x0000600c,
    0x0000680d,
    0x0000700e,
    0x0000780f};

static vta_hwinfo_t * vta_info;;

static uint32_t *qx_buffer;
static uint32_t *qw_buffer;
static uint32_t *qo_buffer;

static const uint32_t zero_buffer[BUFFER_SIZE * BUFFER_SIZE] BIG_DATA_BSS VTA_DATA;

const unsigned int buffer_stride_for_qgemm = sizeof(uint32_t) * BUFFER_SIZE;

static ErvpMatrixInfo *left_buffer_info = NULL;
static ErvpMatrixInfo *right_buffer_info = NULL;
static ErvpMatrixInfo *output_buffer_info = NULL;
static dca_matrix_qgemm_log_t qgemm_log_buffer;

static void update_vta_inst_stride(VTAGenericInsn *insn, int input_stride, int weight_stride, int bias_stride, int output_stride)
{
  VTAMemInsn *mem_insn = insn;
  VTAGemInsn *gemm_insn = insn;
  // Load bias
  mem_insn[1].x_stride = bias_stride;
  // Load weight
  mem_insn[2].x_stride = weight_stride;
  // Load input
  mem_insn[3].x_stride = input_stride;
  // Store output
  mem_insn[5].x_stride = output_stride;
}

static void update_vta_inst_batch(VTAGenericInsn *insn, int batch)
{
  VTAMemInsn *mem_insn = insn;
  VTAGemInsn *gemm_insn = insn;
  // Load uops
  mem_insn[0].x_size = batch;
  mem_insn[0].x_stride = batch;
  // Load bias
  mem_insn[1].y_size = batch;
  // Load input
  mem_insn[3].y_size = batch;
  // Perform GEMM
  gemm_insn[4].uop_end = gemm_insn[4].uop_bgn + batch;
  // Store output
  mem_insn[5].y_size = batch;
}

static void __attribute__((constructor)) construct_vta_block(){
	qx_buffer = I_DCA_MATRIX_QGEMM_MQ2VTA_BASEADDR;
	qw_buffer = I_DCA_MATRIX_QGEMM_MQ2VTA_BASEADDR + 0x1000;
	qo_buffer = I_DCA_MATRIX_QGEMM_MQ2VTA_BASEADDR + (I_DCA_MATRIX_QGEMM_MQ2VTA_SIZE/2);
	left_buffer_info = matrix_generate_info(MATRIX_DATATYPE_SINT32, BUFFER_SIZE, BUFFER_SIZE, qx_buffer, NULL);
	right_buffer_info = matrix_generate_info(MATRIX_DATATYPE_SINT32, BUFFER_SIZE, BUFFER_SIZE, qw_buffer, NULL);
	output_buffer_info = matrix_generate_info(MATRIX_DATATYPE_SINT32, BUFFER_SIZE, BUFFER_SIZE, qo_buffer, NULL);
	update_vta_inst_stride(vta_insns, buffer_stride_for_qgemm, buffer_stride_for_qgemm, buffer_stride_for_qgemm, buffer_stride_for_qgemm);
	// vta_setup_register_all()
}

ervp_task_wait_fx_t dca_qgemm_quant_wait_busy(const dca_matrix_qgemm_hwinfo_t* const hwinfo){
	mmiox1_inst_wait_busy(hwinfo->mmiox_info);
	return NULL;
}

ervp_task_wait_fx_t dca_qgemm_wait_dequant(const dca_matrix_qgemm_hwinfo_t* const hwinfo){
	mmiox1_inst_wait_busy(hwinfo->mmiox_info);
	return NULL;
}

void set_vta_inst_for_qgemm(vta_hwinfo_t * i_vta_info){
  	assert(i_vta_info != NULL);
	assert(i_vta_info->ctrl_addr != NULL);
	vta_info = i_vta_info;
}

void vta_matrix_setup_buffer_for_qgemm(){
  int num_inst = sizeof(vta_insns) / sizeof(uint32_t) / 4;
  vta_setup_register_all(vta_info, num_inst, vta_insns, uops, qx_buffer, qw_buffer, zero_buffer, qo_buffer);
}


void dca_matrix_qgemm_hwinfo_elaborate(dca_matrix_qgemm_hwpara_t* hwpara, dca_matrix_qgemm_hwinfo_t* hwinfo)
{
	hwinfo->input_matrix_size = hwpara->input_matrix_size;
	hwinfo->weight_matrix_size = hwpara->weight_matrix_size;
	hwinfo->output_matrix_size = hwpara->output_matrix_size;
	hwinfo->inp_fifo_depth = hwpara->input_fifo_depth;
	hwinfo->wait_quant = dca_qgemm_quant_wait_busy;
	hwinfo->wait_dequant = dca_qgemm_wait_dequant;
}

ervp_task_wait_fx_t dca_matrix_qgemm16x16(ervp_mop_mapping_t *mop_mapping, const dca_matrix_qgemm_hwinfo_t* const hwinfo, const ErvpMatrixInfo *mx_info, const ErvpMatrixInfo *mw_info, ErvpMatrixInfo *mo_info, int qgemm_options)
{
	uint32_t req_dq[1] = {0x1};
	dca_matrix_qgemm_inst_t inst;
	
  	ervp_task_wait_fx_t task_wait_fx = NULL;
	dca_generate_matrix_info(mx_info, &(inst.mx));
	dca_generate_matrix_info(mw_info, &(inst.mw));
	dca_generate_matrix_info(mo_info, &(inst.mo));
	inst.option = qgemm_options;
	flush_cache();
	mmiox1_inst_push(hwinfo->mmiox_info, &inst, 1, 0);
	task_wait_fx = hwinfo->wait_quant(hwinfo);
  	task_wait_finish(task_wait_fx);
	update_vta_inst_batch(vta_insns, 16);
	vta_ctrl_write(vta_info, 0x0);
	task_wait_finish(task_wait_fx);
	vta_ctrl_write(vta_info, 0x1);
	flush_cache();
	task_wait_fx = vta_info->wait_fx;
  	task_wait_finish(task_wait_fx);
	mmiox1_input_push(hwinfo->mmiox_info, req_dq, 1);
	task_wait_fx = hwinfo->wait_dequant(hwinfo);
	task_wait_finish(task_wait_fx);
	return task_wait_fx;
}