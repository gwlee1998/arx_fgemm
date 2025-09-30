#include "platform_info.h"
#include "ervp_printf.h"
#include "ervp_printf_section.h"
#include "ervp_variable_allocation.h"
#include "ervp_special_matrix_op.h"
#include "ervp_matrix.h"
#include "ervp_matrix_op_sw.h"
#include "ervp_core_id.h"
#include "ervp_assert.h"
#include "ip_instance_info.h"

#include "test_matrix.h"
#include "map_your_matrix_hw.h"
#include "ervp_profiling.h"

// this app is modified from "verify_matrix_opt"

///////////////////////////////////////////////////////////////

#define NUN_MATRIX 1
#define TEST_MATRIX_SIZE 16

#define VERIFY_ADD 0
#define VERIFY_SUB 0
#define VERIFY_EWMULT 0
#define VERIFY_MULT 1
#define VERIFY_SCALAR_MULT 0

#define ML_DATATYPE MATRIX_DATATYPE_FLOAT32
#define MR_DATATYPE MATRIX_DATATYPE_FLOAT32
#define MO_DATATYPE MATRIX_DATATYPE_FLOAT32

#if (GET_NUM_BITS(ML_DATATYPE)==32)
typedef uint32_t ml_type_t;
#elif (GET_NUM_BITS(ML_DATATYPE)==16)
typedef uint16_t ml_type_t;
#else
typedef uint8_t ml_type_t;
#endif

#if (GET_NUM_BITS(MR_DATATYPE)==32)
typedef uint32_t mr_type_t;
#elif (GET_NUM_BITS(MR_DATATYPE)==16)
typedef uint16_t mr_type_t;
#else
typedef uint8_t mr_type_t;
#endif

#if (GET_NUM_BITS(MO_DATATYPE)==32)
typedef uint32_t mo_type_t;
#elif (GET_NUM_BITS(MO_DATATYPE)==16)
typedef uint16_t mo_type_t;
#else
typedef uint8_t mo_type_t;
#endif

#define SKIP_SIM 1

#define ALIGNED_MATRIX __attribute__ ((aligned(0x1000)))

ml_type_t input_left_array[NUN_MATRIX][TEST_MATRIX_SIZE][TEST_MATRIX_SIZE] BIG_DATA_BSS ALIGNED_MATRIX;
mr_type_t input_right_array[NUN_MATRIX][TEST_MATRIX_SIZE][TEST_MATRIX_SIZE] BIG_DATA_BSS ALIGNED_MATRIX;
mo_type_t output_array[NUN_MATRIX][TEST_MATRIX_SIZE][TEST_MATRIX_SIZE] BIG_DATA_BSS ALIGNED_MATRIX;
mo_type_t ref_array[NUN_MATRIX][TEST_MATRIX_SIZE][TEST_MATRIX_SIZE] BIG_DATA_BSS ALIGNED_MATRIX;

ErvpMatrixInfo* input_left_info = NULL;
ErvpMatrixInfo* input_right_info = NULL;
ErvpMatrixInfo* output_info = NULL;
ErvpMatrixInfo* ref_info = NULL;

void matrix_info_init()
{
  input_left_info = matrix_generate_info(ML_DATATYPE,TEST_MATRIX_SIZE,TEST_MATRIX_SIZE,NULL,NULL);
  input_right_info = matrix_generate_info(MR_DATATYPE,TEST_MATRIX_SIZE,TEST_MATRIX_SIZE,NULL,NULL);
  output_info = matrix_generate_info(MO_DATATYPE,TEST_MATRIX_SIZE,TEST_MATRIX_SIZE,NULL,NULL);
  ref_info = matrix_generate_info(MO_DATATYPE,TEST_MATRIX_SIZE,TEST_MATRIX_SIZE,NULL,NULL);
}

void matrix_info_setup(int index)
{
  input_left_info->addr = (void*)(input_left_array[index]);
  input_right_info->addr = (void*)(input_right_array[index]);
  output_info->addr = (void*)(output_array[index]);
  ref_info->addr = (void*)(ref_array[index]);
}

float get_matrix_error_RMS(ErvpMatrixInfo* result, ErvpMatrixInfo* ref){
  assert(result->num_row==ref->num_row);
  assert(result->num_col==ref->num_col);
  assert(result->datatype==MATRIX_DATATYPE_FLOAT32);
  assert(ref->datatype==MATRIX_DATATYPE_FLOAT32);
  float rms = 0.0f;
  int num_elem = result->num_row*result->num_col;
  for(int i=0; i<result->num_row; i++){
    float* result_row = (float*)matrix_get_row_addr(result, i);
    float* ref_row = (float*)matrix_get_row_addr(ref, i);
    for(int j=0; j<result->num_col; j++){
      float relative_error = (result_row[j]-ref_row[j])/ref_row[j];
      rms += relative_error*relative_error;
    }
  }
  rms = sqrtf(rms/num_elem);
  return rms;
}

int main()
{
  if(EXCLUSIVE_ID==0)
  {
    ervp_task_wait_fx_t task_wait_fx;
    ervp_mop_mapping_t* mop_mapping = matrix_op_mapping_alloc();
    map_your_matrix_function(mop_mapping);
    matrix_info_init();
    printf("start gen test matrix\n");
    for(int i=0; i<NUN_MATRIX; i=i+1)
    {
      matrix_info_setup(i);
      generate_test_matrix(input_left_info, i);
      generate_test_matrix(input_right_info, i+1);
    }
    printf("end gen test matrix\n");
    for(int i=0; i<NUN_MATRIX; i=i+1)
    {
      flush_cache();
      matrix_info_setup(i);
      profiling_start("qgemm16x16_hw");
      dca_matrix_qgemm16x16(mop_mapping, i_dca_matrix_qgemm_info, input_left_info, input_right_info, output_info, 0);
      profiling_end("qgemm16x16_hw");
      flush_cache();
      profiling_start("fgemm16x16_sw");
      matrix_mult_sw(input_left_info, input_right_info, ref_info, 0);
      profiling_end("fgemm16x16_sw");
      float rms_error = get_matrix_error_RMS(output_info, ref_info);
      printf("\nRMS %f", rms_error);
      if (1){
        matrix_print(input_left_info);
        matrix_print(input_right_info);
        matrix_print(output_info);
        matrix_print(ref_info);
      } 
    }
  }

  return 0;
}

