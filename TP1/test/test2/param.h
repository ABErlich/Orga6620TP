#include <stdio.h>
#include <stdlib.h>

typedef struct {
	float UL_re; /* upper left point, real part */
	float UL_im; /* upper left point, imaginary part */
	float LR_re; /* lower right point, real part */
	float LR_im; /* lower right point, imaginary part */
	float d_re;  /* pixel step, real part */
	float d_im;  /* pixel step, imaginary part */
	float s_re;  /* seed of julia set, real part */
	float s_im;  /* seed of julia set, imaginary part */

	size_t x_res;  /* horizontal resolution, e.g. 640 */
	size_t y_res;  /* vertical resolution, e.g. 480 */
	size_t shades; /* amount of shades of gray, e.g. 255 */

	FILE *fp;
} param_t;
