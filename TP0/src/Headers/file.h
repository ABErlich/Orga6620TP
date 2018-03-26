
#ifndef __FILE_H_
#define __FILE_H_

typedef enum {PGM, PPM} type_format;

void save_with_format(type_format format, char* path, char* name, short **mp, int rows, int columns);
void save_with_format_PGM(char* path, char* name, short **mp, int rows, int columns);



#endif


