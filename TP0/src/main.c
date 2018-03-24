#include <stdio.h>
#include "Headers/bool.h"
#include "Headers/complex.h"
#include "Headers/succession.h"
#include "Headers/matrixHandler.h"
#include "Headers/exportHandler.h"
#include "Headers/inputHandler.h"
 
Complex calculate(Complex f, Complex c);
double Map(double pixelNumber, int totalPixels, Complex center, int width, int height);

int main (int argc, char **argv){

    int rowCount,colCount,width,height;
    Complex center,seed;

    GetParameterValues(argc,argv,&rowCount,&colCount,&width,&height,&center,&seed);

    double i,j;
    Complex f;
    Complex result;
    short iterationCount = 0;
 
    short **mp = GetMatrixPointer(rowCount, colCount);
 
    /* Iteracion sobre todos los puntos de la imagen */
    for(i = 0; i < rowCount; i++){
        for(j = 0; j < colCount; j++){

            // TODO: Hacer la funcio Map como se debe
            f.real = Map(i, rowCount, center, width, height);
            f.img = Map(j, colCount, center, width, height);

            /* Sucesion de numeros hasta cumplir la condicion de corte */
            result = f;
            while (Module(result) < 1 || iterationCount >= 255) {
                result = CalculateNext(result, seed, calculate);    
                iterationCount++;
 
            } // La condicion < 1 es la que impone el punto de corte para el calculo de la sucesion

            SetMatrixValue(mp, i, j, iterationCount);

            iterationCount = 0;
        }
    }

    printToStdout(mp, rowCount, colCount);

    DestroyMatrixPointer(mp, rowCount, colCount);

    return 0;
}

double Map(double pixelNumber, int totalPixels, Complex center, int width, int height){
    // Por ahora devuelvo esto;
    return pixelNumber/totalPixels;
}


/* La funcion que se le pasa al calculateNext para obtener el proximo numero de la sucesion
f^2 + seed */
Complex calculate(Complex f, Complex seed){

    Complex fSquared;
    Complex result;

    fSquared = Square(f);
    result = Add(fSquared, seed);

    return result;

}


