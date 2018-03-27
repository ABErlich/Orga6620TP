#ifndef __EXPORT_HANDLER_H
#define __EXPORT_HANDLER_H

typedef enum {PGM, PPM} type_format;

void printToStdout(short **mp, int rowCount, int colCount);

void save_with_format(type_format format, char* path, char* name, short **mp, int rows, int columns);
void save_with_format_PGM(char* path, char* name, short **mp, int rows, int columns);

#endif
