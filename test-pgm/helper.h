
#ifndef __HELPER__
#define __HELPER__

extern void
nop();

extern void
caller_nop();

extern int
my_print(char* value, int length);

extern void
convert_to_str(char* buf,unsigned c);

extern int
my_write(FILE* f, const void *buf, size_t nbyte);

extern short
my_open(const char *path, int oflag);

extern void
my_close(FILE* f);

#endif
