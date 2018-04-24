#ifndef __MIPS32_STDIO_H__
#define __MIPS32_STDIO_H__
#define SIZE_BUFF 1024
#define SIZE_STRING 4

int count_buff;
char mips32_buff[SIZE_BUFF][SIZE_STRING];

extern int
mips32_fprintf(FILE* f, const char* fmt, ...);

extern int
mips32_fflush(FILE* f);

#endif /*__MIPS32_STDIO_H__*/
