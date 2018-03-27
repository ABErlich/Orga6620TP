#include <stdio.h>
#include <string.h>
#include "src/Headers/bool.h"
#include "src/Headers/complex.h"
#include "src/Headers/succession.h"
#include "src/Headers/matrixHandler.h"
#include "src/Headers/exportHandler.h"
#include "src/Headers/inputHandler.h"
#include "src/Headers/mapper.h"
#include "src/Headers/fractalFunctions.h"

int main (int argc, char **argv){
    char path[SIZE_BUFF_PATH] = "./", name[SIZE_BUFF_NAME] = "tp0.pgm";
    int rowCount,colCount;
    Complex center,seed;
    double width,height;

    GetParameterValues(argc,argv,&rowCount,&colCount,&width,&height,&center,&seed, name);
    double i,j;
    Complex f;
    Complex result;
    short iterationCount = 0;
    short **mp = GetMatrixPointer(rowCount, colCount);
    /* Iteracion sobre todos los pixeles de la imagen */
    for(i = 0; i < rowCount; i++){
        for(j = 0; j < colCount; j++){
            f.real = MapPixel(j+1, colCount, center.real, width, EJE_X);
            f.img = MapPixel(i+1, rowCount, center.img, height, EJE_Y);
            /* Sucesion de numeros hasta cumplir la condicion de corte */
            result = f;
            while (Module(result) < 2 && iterationCount < 255) {
                result = CalculateNext(result, seed, fc);
                iterationCount++;
            } /* La condicion < 2 es la que impone el punto de corte para el calculo de la sucesion*/
            SetMatrixValue(mp, (int)j, (int)i, iterationCount);
            iterationCount = 0;
        }
    }
    if(strcmp(name, "-") == 0){
        printToStdout(mp, rowCount, colCount);
    }
    else{
        save_with_format_PGM(path, name, mp, rowCount, colCount);
    }
    DestroyMatrixPointer(mp, rowCount, colCount);
    return 0;
}
