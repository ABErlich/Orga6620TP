#include <stdio.h>
#include "Headers/bool.h"
#include "Headers/complex.h"
#include "Headers/succession.h"
#include "Headers/heapHandler.h"
#include "Headers/exportHandler.h"
 
Complex calculate(Complex f, Complex c);
double Map(double pixelNumber, int totalPixels, Complex center, int width, int height);

int main (int argc, char **argv){

    /* Obtener estos parametros de la linea de comandos. Por defecto 640x480 */
    int rowCount = 480, colCount = 640;
    /* Entran como parametro, por defecto 2 y 2 */
    int width = 2, height = 2;
    /* Entra como parametro. Por defecto 0,5+i0,5 */
    Complex center;
    center.real = 0.5;
    center.img = 0.5;
    /* Entra como parametro. Por defecto */
    Complex seed;
    seed.real = 0.279;
    seed.img = 0;

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
            while (Module(result) < 1) {
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
f^2 + c */
Complex calculate(Complex f, Complex seed){

    Complex fSquared;
    Complex result;

    fSquared = Square(f);
    result = Add(fSquared, seed);

    return result;

}


