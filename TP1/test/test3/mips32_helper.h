#include <stdio.h>

#ifndef __HELPER__
#define __HELPER__

extern int
mips32_write(FILE* f, const char *buf, size_t nbyte);

extern char*
mips32_to_str(int c);

extern int
mips32_length(const char* str);

#endif
