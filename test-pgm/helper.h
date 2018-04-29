#include <stdio.h>

#ifndef __HELPER__
#define __HELPER__

extern int
mips32_write(FILE* f, const char *buf, size_t nbyte);

extern char*
mips32_to_str(int c);

extern int
mips32_length(const char* str);

/*
extern void
nop();

extern void
caller_nop();

extern int
my_print(char* value, int length);

extern void
convert_to_str(char* buf,unsigned c);

extern short
my_open(const char *path, int oflag);

extern void
my_close(FILE* f);
*/
#endif
