#ifndef __MIPS32_SAVE_BUFF_H__
#define __MIPS32_SAVE_BUFF_H__
#define SIZE_BUFF 1024
#define SIZE_STRING 4

int count_buff;
char mips32_buff[SIZE_BUFF][SIZE_STRING];

extern int
mips32_save_buff(const char* value);

#endif /*__MIPS32_SAVE_BUFF_H__*/
