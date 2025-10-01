#include "platform_info.h"
#include "ervp_printf.h"
#include "ervp_multicore_synch.h"
#include "ervp_mmio_util.h"
#include "ervp_variable_allocation.h"
#include "ervp_memory_util.h"
#include "ervp_malloc.h"
#include "ervp_core_id.h"
#include "ervp_profiling.h"
#include "im2col_custom.h"
#include "image_data.h"


#define ALIGNED_DATA __attribute__ ((aligned(0x1000)))
int im_channels, im_height, im_width, kernel_h, kernel_w, pad_h, pad_w, stride_h, stride_w, dilation_h, dilation_w, input_zeropoint;

unsigned char data_col_ref[65536] ALIGNED_DATA;

static inline int get_im2col_size(  int channels, int height, int width,
                                    int kernel_h, int kernel_w,
                                    int pad_h, int pad_w,
                                    int stride_h, int stride_w,
                                    int dilation_h, int dilation_w)
{
    int output_h = (height + 2 * pad_h - (dilation_h * (kernel_h - 1) + 1)) / stride_h + 1;
    int output_w = (width + 2 * pad_w - (dilation_w * (kernel_w - 1) + 1)) / stride_w + 1;
    return (channels * output_h * output_w);  
}


int main(int argc, char **argv)
{  
    if(EXCLUSIVE_ID==0)
    {

    // scenario 1: conv1
        {
            im_channels = 1;
            im_height = 28;
            im_width  = 28;
            kernel_h = 3;
            kernel_w = 3;
            pad_h = 0;
            pad_w = 0;
            stride_h = 1;
            stride_w = 1;
            dilation_h = 1;
            dilation_w = 1;
            input_zeropoint = 17;

            profiling_start("quantized_im2col_engine");
                quantized_im2col_engine(
                image_data1, im_channels, im_height, im_width,
                kernel_h, kernel_w, pad_h, pad_w,
                stride_h, stride_w, dilation_h, dilation_w,
                input_zeropoint);
            profiling_end("quantized_im2col_engine");

            profiling_start("quantized_im2col_cpu");
                quantized_im2col_cpu(
                image_data1, im_channels, im_height, im_width,
                kernel_h, kernel_w, pad_h, pad_w,
                stride_h, stride_w, dilation_h, dilation_w,
                data_col_ref, input_zeropoint);
            profiling_end("quantized_im2col_cpu");

            int im2col_size = get_im2col_size(
                im_channels, im_height, im_width,
                kernel_h, kernel_w,
                pad_h, pad_w,
                stride_h, stride_w,
                dilation_h, dilation_w);

            compare_im2col_results(im2col_engine_col_buffer, data_col_ref, im2col_size);
        }
        // scenario 2: conv2
        {
            im_channels = 32;
            im_height = 13;
            im_width  = 13;
            kernel_h = 3;
            kernel_w = 3;
            pad_h = 0;
            pad_w = 0;
            stride_h = 1;
            stride_w = 1;
            dilation_h = 1;
            dilation_w = 1;
            input_zeropoint = 48;

            profiling_start("quantized_im2col_engine");
            quantized_im2col_engine(
                image_data2, im_channels, im_height, im_width,
                kernel_h, kernel_w, pad_h, pad_w,
                stride_h, stride_w, dilation_h, dilation_w,
                input_zeropoint);
            profiling_end("quantized_im2col_engine");

            profiling_start("quantized_im2col_cpu");
                quantized_im2col_cpu(
                image_data2, im_channels, im_height, im_width,
                kernel_h, kernel_w, pad_h, pad_w,
                stride_h, stride_w, dilation_h, dilation_w,
                data_col_ref, input_zeropoint);
            profiling_end("quantized_im2col_cpu");
                   
            int im2col_size = get_im2col_size(
                im_channels, im_height, im_width,
                kernel_h, kernel_w,
                pad_h, pad_w,
                stride_h, stride_w,
                dilation_h, dilation_w);

            compare_im2col_results(im2col_engine_col_buffer, data_col_ref, im2col_size);
        }
    }
    return 0;
}
