#include "Headers/matrixHandler.h"

short** GetMatrixPointer(int rows, int cols){
    short **mp = 0;
    int i;

    mp = (short **)malloc(cols * sizeof(short *));
    for(i = 0; i < cols; i++){
        mp[i] = (short *)malloc(rows * sizeof(short));
    }

    return mp;
}

void DestroyMatrixPointer(short** mp, int rows, int cols){
    int i;

    for(i = 0; i < cols; i++){
        free(mp[i]);
    }

    free(mp);

}

void SetMatrixValue(short** mp, int real, int img, int value){
    mp[real][img] = value;
}

int GetMatrixValue(short** mp, int real, int img){
    return mp[real][img];
}


