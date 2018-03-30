#include "complex.h"

#ifndef __INPUT_HANDLER_H
#define __INPUT_HANDLER_H

#define PLUS_OR_MINUS(c)  ((c) == '+' || (c) == '-')
#define IMAGINARY_UNIT(x) ((x) == 'i' || (x) == 'j')
#define MINIMUM(x, y) ((x) <= (y) ? (x) : (y))
#define MAXIMUM(x, y) ((x) >= (y) ? (x) : (y))
#define SIGN(c) ((c) == '-' ? -1.0 : +1.0)

void GetParameterValues(int argc, char **argv, int *rowCount, int *colCount, double *width, double *height, Complex *center, Complex *seed, char *name);
void GetResolution(const char *, int *rowCount, int *colCount);
void GetCenter(const char *, Complex *center);
void GetSeed(const char *, Complex *seed);
void GetWidth(const char *, double *width);
void GetHeight(const char *, double *height);
void GetOutput(const char *, char *name, size_t n);

#endif
