#include "Headers/exportHandler.h"
#include "Headers/matrixHandler.h"
#include <stdio.h>

void printToStdout(short **mp, int rowCount, int colCount){

    int i,j;

    for(i = 0; i < rowCount; i++){
        for(j = 0; j < colCount; j++){
            printf("%d", GetMatrixValue(mp, i,j));
        }
    }
}
