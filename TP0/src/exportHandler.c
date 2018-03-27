#include "Headers/exportHandler.h"
#include "Headers/matrixHandler.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>



void load_header(type_format format, int rows, int columns, char* buff_header, size_t n);

void printToStdout(short **mp, int rowCount, int colCount){
    char buff_header[200] = "";
    int i,j;
    load_header(PGM, rowCount, colCount, buff_header, 200);
    printf("%s",buff_header);
    for(i = 0; i < rowCount; i++){
        for(j = 0; j < colCount; j++){
            printf("%d ", GetMatrixValue(mp, j,i));
        }
        printf("\n");
    }
}




void save_with_format(type_format format, char* path, char* name, short **mp, int rows, int columns){
    char aux[10] = "";
    char buff[500] = "";
    char buff_header[200] = "";

    FILE * f;
    strcat(buff,path);
    strcat(buff,name);
    f = fopen(buff, "w");
    if(f == NULL){
        printf("No se puede abrir el archivo");
        return;
    }

    load_header(format, rows, columns, buff_header, 200);
    fputs(buff_header, f);

    if(format == PGM){
        for(int i = 0; i < rows; i++){
            for(int j = 0; j < columns; j++){
                sprintf(aux,"%d", GetMatrixValue(mp, j, i));
                if(j != columns - 1){
                    strcat(aux," ");
                }
                fputs(aux, f);
                aux[0] = '\0';
            }
            fputs("\n", f);
        }
    }
    else{
        //TODO: IMPLEMENT PPM
        return;
    }
    fclose(f);
    return;
}


void save_with_format_PGM(char* path, char* name, short **mp, int rows, int columns){
    save_with_format(PGM, path, name, mp, rows, columns);
    return;
}


void load_header(type_format format, int rows, int columns, char* buff_header, size_t n){
    char aux[40];
    if(format == PGM){
        strncpy(buff_header, "P2\n", n);
    }
    else{
        strncpy(buff_header, "P3\n", n);
    }
    sprintf(aux,"%d %d\n255\n", columns, rows);
    strncat(buff_header, aux, n);
    return;
}
