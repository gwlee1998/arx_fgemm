#include "platform_info.h"
#include "ervp_assert.h"
#include "ervp_printf.h"
#include "ervp_blocked_matrix_op.h"
#include "ervp_matrix_op_transform.h"

#include "ip_instance_info.h"
#include "vta_ctrl_api.h"
#include "vta_matrix_api.h"

#include "map_your_matrix_hw.h"
#include "dca_matrix_qgemm.h"

const char matrix_hw_name[] = "BLOCKED_VTA";

// VTA

static vta_hwinfo_t i_vta0;

static void i_vta0_wait()
{
  vta_ctrl_wait(&i_vta0);
}

ervp_task_wait_fx_t i_vta0_matrix_mult_16x16le(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, int options)
{
  return vta_matrix_mult_16x16le(mop_mapping, &i_vta0, ma_info, mb_info, mc_info, options);
}

ervp_task_wait_fx_t i_dca_matrix_qgemm16x16(ervp_mop_mapping_t *mop_mapping, const dca_matrix_qgemm_hwinfo_t* const hwinfo, const ErvpMatrixInfo *mx_info, const ErvpMatrixInfo *mw_info, ErvpMatrixInfo *mo_info, int qgemm_options)
{
  return dca_matrix_qgemm16x16(mop_mapping, hwinfo, mx_info, mw_info, mo_info, qgemm_options);
}

ervp_task_wait_fx_t i_vta0_matrix_mult_16x16le_aligned(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, int options)
{
  return _vta_matrix_mult_16x16le_aligned(mop_mapping, &i_vta0, ma_info, mb_info, mc_info, options);
}

static ervp_blocked_matrix_info_t *blocked_info_mac;

ervp_task_wait_fx_t i_blocked_matrix_mult(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, int options)
{
  // matrix_mult_size_print(ma_info, mb_info, mc_info);
  return blocked_matrix_mult(blocked_info_mac, ma_info, mb_info, mc_info, options);
}

void map_your_matrix_function(ervp_mop_mapping_t *mop_mapping)
{

  i_vta0.block_size = 16;
  i_vta0.ctrl_addr = I_VTA00_CONFIG_BASEADDR;
  i_vta0.wait_fx = i_vta0_wait;
  set_vta_inst_for_qgemm(&i_vta0);
  vta_matrix_setup_buffer_for_qgemm();

  /* map your own functions */
  blocked_info_mac = blocked_matrix_info_alloc();
  blocked_info_mac->block_size = i_vta0.block_size;
  blocked_info_mac->subop_mapping = matrix_op_mapping_alloc();
  blocked_info_mac->subop_mapping->matrix_mult = i_dca_matrix_qgemm16x16;

  //
  mop_mapping->matrix_mult = i_blocked_matrix_mult;
}
