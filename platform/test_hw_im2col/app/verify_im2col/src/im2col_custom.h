#ifndef IM2COL_CUSTOM_H
#define IM2COL_CUSTOM_H

extern unsigned char* im2col_engine_col_buffer;

void quantized_im2col_cpu(const unsigned char* data_im, const int channels,
    const int height, const int width, const int kernel_h, const int kernel_w,
    const int pad_h, const int pad_w,
    const int stride_h, const int stride_w,
    const int dilation_h, const int dilation_w,
    unsigned char* data_col, int input_zeropoint);
void quantized_im2col_engine(const unsigned char* data_im, const int channels,
    const int height, const int width, const int kernel_h, const int kernel_w,
    const int pad_h, const int pad_w,
    const int stride_h, const int stride_w,
    const int dilation_h, const int dilation_w,
    int input_zeropoint);
void compare_im2col_results(const unsigned char* data_col, const unsigned char* data_col_ref, int size);

#endif