#ifndef __DCA_NEURGEMM_H__
#define __DCA_NEURGEMM_H__

#include "ervp_matrix_op.h"
#include "ervp_mmiox1.h"
#include "dca_module_memorymap_offset.h"

static const int _DCA_NEURGEMM_ALL_FROM_MEMORY = DCA_NEURGEMM_OPCODE_LSU0_REQ | DCA_NEURGEMM_OPCODE_LSU1_REQ | DCA_NEURGEMM_OPCODE_LSU2_REQ;
static const int DCA_NEURGEMM_ADD = DCA_NEURGEMM_OPCODE_ADDSUB | _DCA_NEURGEMM_ALL_FROM_MEMORY;
static const int DCA_NEURGEMM_SUB = DCA_NEURGEMM_OPCODE_ADDSUB | DCA_NEURGEMM_OPCODE_RSRC_INV | _DCA_NEURGEMM_ALL_FROM_MEMORY;
static const int DCA_NEURGEMM_EWMULT = DCA_NEURGEMM_OPCODE_EWMULT | _DCA_NEURGEMM_ALL_FROM_MEMORY;
static const int DCA_NEURGEMM_SCALAR_MULT = DCA_NEURGEMM_OPCODE_EWMULT | DCA_NEURGEMM_OPCODE_RSRC_CONSTANT | _DCA_NEURGEMM_ALL_FROM_MEMORY;

static const int DCA_NEURGEMM_MULT_COND = DCA_NEURGEMM_OPCODE_MULT_COND | _DCA_NEURGEMM_ALL_FROM_MEMORY;
static const int DCA_NEURGEMM_MULT = DCA_NEURGEMM_MULT_COND | DCA_NEURGEMM_OPCODE_INIT_ACC;
//static const int DCA_MULT_ACC = DCA_NEURGEMM_MULT_COND | DCA_NEURGEMM_OPCODE_LOAD_ACC;

static const int DCA_NEURGEMM_CONV_COND = DCA_NEURGEMM_OPCODE_CONV_COND | DCA_NEURGEMM_OPCODE_RSRC_CONSTANT | _DCA_NEURGEMM_ALL_FROM_MEMORY;
static const int DCA_NEURGEMM_CONV = DCA_NEURGEMM_CONV_COND | DCA_NEURGEMM_OPCODE_INIT_ACC;
//static const int DCA_CONV_ACC = DCA_NEURGEMM_CONV_COND | DCA_NEURGEMM_OPCODE_LOAD_ACC;

typedef struct
{
  unsigned int bw_addr;
  unsigned int ma_bw_data;
  unsigned int ma_has_burden;
  unsigned int ma_bw_burden;
  unsigned int mb_bw_data;
  unsigned int mb_has_burden;
  unsigned int mb_bw_burden;
  unsigned int mc_bw_data;
  unsigned int mc_has_burden;
  unsigned int mc_bw_burden;
  unsigned int matrix_size_para;
  unsigned int tensor_para;
  unsigned int bw_config;
  unsigned int bw_status;
  unsigned int bw_log;
  unsigned int bw_inst;
  unsigned int bw_input;
  unsigned int bw_output;
  unsigned int config_default_value; // invalid due to the limit of data type, but not used
  unsigned int log_fifo_depth;
  unsigned int inst_fifo_depth;
  unsigned int input_fifo_depth;
  unsigned int output_fifo_depth;
  unsigned int lsu_para;
} dca_neurgemm_hwpara_t;

typedef struct
{
  const ervp_mmiox1_hwinfo_t *mmiox_info;
  unsigned int num_row : 16;
  unsigned int num_col : 16;
  uint32_t id;
} dca_neurgemm_hwinfo_t;

void dca_neurgemm_hwinfo_elaborate(dca_neurgemm_hwpara_t *hwpara, dca_neurgemm_hwinfo_t *hwinfo);

static inline ervp_task_wait_fx_t dca_neurgemm_wait_fx(const dca_neurgemm_hwinfo_t *const hwinfo)
{
  return hwinfo->mmiox_info->wait_fx;
}

static inline void dca_neurgemm_wait(const dca_neurgemm_hwinfo_t *const hwinfo)
{
  task_wait_finish(dca_neurgemm_wait_fx(hwinfo));
}

ervp_task_wait_fx_t dca_neurgemm_start(ervp_mop_mapping_t *mop_mapping, const dca_neurgemm_hwinfo_t *const hwinfo, int opcode, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value);

static inline ervp_task_wait_fx_t dca_neurgemm_add(ervp_mop_mapping_t *mop_mapping, const dca_neurgemm_hwinfo_t *const hwinfo, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return dca_neurgemm_start(mop_mapping, hwinfo, DCA_NEURGEMM_ADD, ma_info, mb_info, mc_info, option_value);
}

static inline ervp_task_wait_fx_t dca_neurgemm_sub(ervp_mop_mapping_t *mop_mapping, const dca_neurgemm_hwinfo_t *const hwinfo, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return dca_neurgemm_start(mop_mapping, hwinfo, DCA_NEURGEMM_SUB, ma_info, mb_info, mc_info, option_value);
}

static inline ervp_task_wait_fx_t dca_neurgemm_ewmult(ervp_mop_mapping_t *mop_mapping, const dca_neurgemm_hwinfo_t *const hwinfo, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return dca_neurgemm_start(mop_mapping, hwinfo, DCA_NEURGEMM_EWMULT, ma_info, mb_info, mc_info, option_value);
}

static inline ervp_task_wait_fx_t dca_neurgemm_mult(ervp_mop_mapping_t *mop_mapping, const dca_neurgemm_hwinfo_t *const hwinfo, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return dca_neurgemm_start(mop_mapping, hwinfo, DCA_NEURGEMM_MULT, ma_info, mb_info, mc_info, option_value);
}

ervp_task_wait_fx_t dca_neurgemm_scalar_mult_fixed(ervp_mop_mapping_t *mop_mapping, const dca_neurgemm_hwinfo_t *const hwinfo, const ErvpMatrixInfo *ma_info, int scalar_value, ErvpMatrixInfo *mc_info, unsigned int option_value);
ervp_task_wait_fx_t dca_neurgemm_conv_oneblock(ervp_mop_mapping_t *mop_mapping, const dca_neurgemm_hwinfo_t *const hwinfo, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int conv_option_value);
ervp_task_wait_fx_t dca_neurgemm_conv_oneblock_sharedinput(ervp_mop_mapping_t *mop_mapping, const dca_neurgemm_hwinfo_t *const hwinfo, int num_output, const ErvpMatrixInfo *input_info, const ErvpMatrixInfo **kernel_info_list, ErvpMatrixInfo **output_info_list, unsigned int conv_option_value);
ervp_task_wait_fx_t dca_neurgemm_conv_oneblock_sharedoutput(ervp_mop_mapping_t *mop_mapping, const dca_neurgemm_hwinfo_t *const hwinfo, int num_input, const ErvpMatrixInfo **input_info_list, const ErvpMatrixInfo **kernel_info_list, ErvpMatrixInfo *output_info, unsigned int conv_option_value, int init_ouptut);

#endif