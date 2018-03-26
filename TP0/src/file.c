#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "Headers/file.h"


#define SPACE "     \0"
#define BASE 10

typedef enum {PGM, PPM} type_format;

void save_with_format(type_format format, char* path, char* name, short **mp, int rows, int columns);

void save_with_format_PGM(char* path, char* name, short **mp, int rows, int columns){
    save_with_format(PGM, path, name, mp, rows, columns);
    return;
}

void save_with_format(type_format format, char* path, char* name, short **mp, int rows, int columns){
    char aux[10] = "";
    char buff[500] = "";

    FILE * f;
    strcat(buff,path);
    strcat(buff,name);
    f = fopen(buff, "w");
    if(f == NULL){
        printf("No se puede abrir el archivo");
        exit(1);
    }
    fputs("P2\n", f);
    sprintf(aux,"%d",rows-1);
    fputs(aux, f);
    fputs(" ", f);
    aux[0] = '\0';
    sprintf(aux,"%d", columns-1);
    fputs(aux, f);
    fputs("\n", f);
    aux[0] = '\0';
    fputs("255\n", f);

    if(format == PGM){
        for(int i = 0; i < rows - 1; i++){
            for(int j = 0; j < columns - 1; j++){
                sprintf(aux,"%d",mp[i][j]);
                if(j != columns - 2){
                    strcat(aux,SPACE);
                }
                fputs(aux, f);
                aux[0] = '\0';
            }
            fputs("\n", f);
        }
    }
    else{


    }
    fclose(f);
    return;
}


