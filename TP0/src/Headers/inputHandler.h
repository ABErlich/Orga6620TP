#include "complex.h"

#ifndef __INPUT_HANDLER_H
#define __INPUT_HANDLER_H
#define PLUS_OR_MINUS(c)  ((c) == '+' || (c) == '-')
#define IMAGINARY_UNIT(x) ((x) == 'i' || (x) == 'j')
#define MINIMUM(x, y) ((x) <= (y) ? (x) : (y))
#define MAXIMUM(x, y) ((x) >= (y) ? (x) : (y))
#define SIGN(c) ((c) == '-' ? -1.0 : +1.0)
void GetParameterValues(int argc, char **argv, int *rowCount, int *colCount, double *width, double *height, Complex *center, Complex *seed, char *name);
static void GetResolution(const char *, const char *, int *rowCount, int *colCount);
static void GetCenter(const char *, const char *, Complex *center);
static void GetSeed(const char *, const char *, Complex *seed);
static void GetWidth(const char *, const char *, double *width);
static void GetHeight(const char *, const char *, double *height);
static void GetOutput(const char *, const char *, char *name);
#endif
