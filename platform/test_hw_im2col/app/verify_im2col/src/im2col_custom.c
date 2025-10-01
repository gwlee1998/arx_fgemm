// #include "im2col.h"
#include "im2col_custom.h"
#include "ervp_profiling.h"
#include "ervp_memory_util.h"
#include "ervp_reg_util.h"
#include "ervp_printf.h"
#include "platform_info.h"

// #define I_IM2COL_ENGINE_SLAVE_BASEADDR 0xc0000000 in memorymap_info.h
#define IM2COL_ENGINE_IM_BUFFER_ADDRESS I_IM2COL_ENGINE_SLAVE_BASEADDR                   
#define IM2COL_ENGINE_COL_BUFFER_ADDRESS (I_IM2COL_ENGINE_SLAVE_BASEADDR + 0x10000)
#define IM2COL_ENGINE_CONTROL_ADDRESS (I_IM2COL_ENGINE_SLAVE_BASEADDR + 0x20000)


#define IM2COL_ENGINE_STATUS_BUSY (4*13)

unsigned char* im2col_engine_im_buffer = (unsigned char*)IM2COL_ENGINE_IM_BUFFER_ADDRESS;
unsigned char* im2col_engine_col_buffer = (unsigned char*)IM2COL_ENGINE_COL_BUFFER_ADDRESS;
unsigned char* im2col_engine_control_buffer = (unsigned char*)IM2COL_ENGINE_CONTROL_ADDRESS;

static int im_size, col_size;

inline static void set_im2col_engine_register32(int value, int reg_idx){
    REG32(IM2COL_ENGINE_CONTROL_ADDRESS+(4*reg_idx)) = value;
}

inline static int is_a_ge_zero_and_a_lt_b(int a, int b) {
    return (unsigned)(a) < (unsigned)(b);
}

/*
    Add your own api list for im2col_engine
*/

///////////////////
// Fixed
//////////////////

static inline int get_im2col_engine_status_busy(){
    return REG32(IM2COL_ENGINE_CONTROL_ADDRESS + IM2COL_ENGINE_STATUS_BUSY);
}

void quantized_im2col_engine(const unsigned char* data_im, const int channels,
    const int height, const int width, const int kernel_h, const int kernel_w,
    const int pad_h, const int pad_w,
    const int stride_h, const int stride_w,
    const int dilation_h, const int dilation_w,
    int input_zeropoint)
{
    printf("quantized_im2col_engine start\n");

    im_size = channels * height * width;

    memcpy_rvx(im2col_engine_im_buffer, data_im, im_size * sizeof(unsigned char));

    printf("memcpy done\n");
    
    set_im2col_engine_register32(channels,          0);
    set_im2col_engine_register32(height,            1);
    set_im2col_engine_register32(width,             2);
    set_im2col_engine_register32(kernel_h,          3);
    set_im2col_engine_register32(kernel_w,          4);
    set_im2col_engine_register32(pad_h,             5);
    set_im2col_engine_register32(pad_w,             6);
    set_im2col_engine_register32(stride_h,          7);
    set_im2col_engine_register32(stride_w,          8);
    set_im2col_engine_register32(dilation_h,        9);
    set_im2col_engine_register32(dilation_w,        10);
    set_im2col_engine_register32(input_zeropoint,   11);
    set_im2col_engine_register32(1,                 12);

    printf("set_register_done!\n");

    while (get_im2col_engine_status_busy() == 0) ;
    // wait until end_flag (regfile[13])
    
    set_im2col_engine_register32(0,                 12);
    printf("quantized_im2col_engine done!\n");
}


// CPU Operation
void quantized_im2col_cpu(const unsigned char* data_im, const int channels,
    const int height, const int width, const int kernel_h, const int kernel_w,
    const int pad_h, const int pad_w,
    const int stride_h, const int stride_w,
    const int dilation_h, const int dilation_w,
    unsigned char* data_col, int input_zeropoint)
{   
    printf("quantized_im2col_cpu start\n");

    const int output_h = (height + 2 * pad_h -
        (dilation_h * (kernel_h - 1) + 1)) / stride_h + 1;
    const int output_w = (width + 2 * pad_w -
        (dilation_w * (kernel_w - 1) + 1)) / stride_w + 1;
    const int channel_size = height * width;
    int channel, kernel_row, kernel_col, output_rows, output_col;

    for (channel = channels; channel--; data_im += channel_size) {
        for (kernel_row = 0; kernel_row < kernel_h; kernel_row++) {
            for (kernel_col = 0; kernel_col < kernel_w; kernel_col++) {
                int input_row = -pad_h + kernel_row * dilation_h;
                for (output_rows = output_h; output_rows; output_rows--) {
                    if (!is_a_ge_zero_and_a_lt_b(input_row, height)) { // is_a_ge_zero_and_a_lt_b(a,b){return ((a >= 0) && (a < b));}
                        for (output_col = output_w; output_col; output_col--) {
                            *(data_col++) = input_zeropoint;
                        }
                    }
                    else {
                        int input_col = -pad_w + kernel_col * dilation_w;
                        for (output_col = output_w; output_col; output_col--) {
                            if (is_a_ge_zero_and_a_lt_b(input_col, width)) { // is_a_ge_zero_and_a_lt_b(a,b){return ((a >= 0) && (a < b));}
                                *(data_col++) = data_im[input_row * width + input_col];
                            }
                            else {
                                *(data_col++) = input_zeropoint;
                            }
                            input_col += stride_w;
                        }
                    }
                    input_row += stride_h;
                }
            }
        }
    } 
}

void quantized_im2col_cpu_ext(const unsigned char* data_im, const int channels,
    const int height, const int width, const int kernel_h, const int kernel_w,
    const int pad_h, const int pad_w,
    const int stride_h, const int stride_w,
    const int dilation_h, const int dilation_w,
    unsigned char* data_col, int input_zeropoint)
{
    // printf("data_im:%p\n,data_im");
    #ifndef USE_Q_IM2COL_ENGINE
        quantized_im2col_cpu(data_im, channels, height, width,
            kernel_h, kernel_w, pad_h, pad_w,
            stride_h, stride_w, dilation_h, dilation_w,
            data_col, input_zeropoint);
    #else
        quantized_im2col_engine(data_im, channels, height, width,
            kernel_h, kernel_w, pad_h, pad_w,
            stride_h, stride_w, dilation_h, dilation_w,
            input_zeropoint);
        memcpy_rvx(data_col, im2col_engine_col_buffer, col_size * sizeof(unsigned char));
    #endif
}

void compare_im2col_results(const unsigned char* data_col, const unsigned char* data_col_ref, int size)
{
    int i, mismatch_count = 0;
    if (data_col == NULL || data_col_ref == NULL) {
        printf("One of the input arrays is NULL.\n");
        return;
    }
    if (size <= 0) {
        printf("Invalid size: %d\n", size);
        return;
    }

    printf("Comparing im2col results...\n");
    for (i = 0; i < size; i++) {
        if (data_col[i] != data_col_ref[i]) {
            mismatch_count++;
            printf("Mismatch at index %d: expected %d, got %d\n", i, data_col_ref[i], data_col[i]);
        }
        // printf("in progress: %d \n",i);
    }
    if (mismatch_count > 0) {
        printf("Total mismatches: %d\n", mismatch_count);
    } else {
        printf("All values match!\n");
    }
}
