#include "Headers/matrixHandler.h"

short** GetMatrixPointer(int rows, int cols){
    short **mp = 0;
    int i;

    mp = (short **)malloc(rows * sizeof(short *));
    for(i = 0; i < rows; i++){
        mp[i] = (short *)malloc(cols * sizeof(short));
    }

    return mp;
}

void DestroyMatrixPointer(short** mp, int rows, int cols){
    int i;

    for(i = 0; i < rows; i++){
        free(mp[i]);
    }

    free(mp);

}

void SetMatrixValue(short** mp, int row, int col, int value){
    mp[row][col] = value;
}

int GetMatrixValue(short** mp, int row, int col){
    return mp[row][col];
}


