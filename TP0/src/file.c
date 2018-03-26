#include "Headers/file.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SPACE "     \0"
#define BASE 10



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
    sprintf(aux,"%d",columns);
    fputs(aux, f);
    fputs(" ", f);
    aux[0] = '\0';
    sprintf(aux,"%d", rows);
    fputs(aux, f);
    fputs("\n", f);
    aux[0] = '\0';
    fputs("255\n", f);

    if(format == PGM){
        for(int i = 0; i < rows; i++){
            for(int j = 0; j < columns; j++){
                sprintf(aux,"%d",mp[j][i]);
                if(j != columns - 1){
                    //strcat(aux,SPACE);
                    strcat(aux," ");
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


void save_with_format_PGM(char* path, char* name, short **mp, int rows, int columns){
    save_with_format(PGM, path, name, mp, rows, columns);
    return;
}



