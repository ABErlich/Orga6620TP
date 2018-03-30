#ifndef __EXPORT_HANDLER_H
#define __EXPORT_HANDLER_H

#define SIZE_BUFF_NAME 100
#define SIZE_BUFF_PATH 100

typedef enum {PGM, PPM} type_format;

void printToStdout(short **mp, int rowCount, int colCount);

void save_with_format(type_format format, char* path, char* name, short **mp, int rows, int columns);
void save_with_format_PGM(char* path, char* name, short **mp, int rows, int columns);

#endif
