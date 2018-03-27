#include <stdlib.h>

#ifndef __MATRIX_HANDLER_H_
#define __MATRIX_HANDLER_H_

/* Arma una matriz de short de forma dinamica con la cantidad de filas y columnas especificadas y devuelve el puntero generado*/
short** GetMatrixPointer(int rows, int cols);

/* Libera la memoria del puntero generado en GetMatrixPointer*/
void DestroyMatrixPointer(short** mp, int rows, int cols);

/* Almacena un valor en la posicion de la matriz especificada*/
void SetMatrixValue(short** mp, int row, int col, int value);

/* Obtiene el valor en la posicion de la matriz especificada*/
int GetMatrixValue(short** mp, int real, int img);

#endif
