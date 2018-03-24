#include "Headers/inputHandler.h"


//TODO: Obtener los parametros de la linea de comando
void GetParameterValues(int argc, char **argv, int *rowCount, int *colCount, int *width, int *height, Complex *center, Complex *seed){

    // Por ahora le cargo a los parametros los valores por defecto;
    *rowCount = 640;
    *colCount = 480;
    *width = 2;
    *height = 2;
    center->real = 0;
    center->img = 0;
    seed->real = -0.726895347709114071439;
    seed->img = 0.188887129043845954792;

}