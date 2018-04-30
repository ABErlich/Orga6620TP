#include <stdio.h>

#ifndef __MIPS32_STDIO_H__
#define __MIPS32_STDIO_H__
#define SIZE_BUFF 10//2564

int length;
char mips32_buff[SIZE_BUFF];

extern int
mips32_save(const char* value);

extern int
mips32_header(FILE* f, size_t x_res, size_t y_res, size_t shades);
extern int
mips32_fprintf(FILE* f, size_t c);
extern int
mips32_fflush(FILE* f);

#endif /*__MIPS32_STDIO_H__*/
