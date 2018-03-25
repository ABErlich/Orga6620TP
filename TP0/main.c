#include <stdio.h>
#include "src/Headers/bool.h"
#include "src/Headers/complex.h"
#include "src/Headers/succession.h"
#include "src/Headers/matrixHandler.h"
#include "src/Headers/exportHandler.h"
#include "src/Headers/inputHandler.h"

#define EJE_X 0
#define EJE_Y 1


Complex calculate(Complex f, Complex c);
double MapPixel(double pixelNumber, int totalPixels, double center, int scale, int eje);

int main (int argc, char **argv){

    int rowCount,colCount,width,height;
    Complex center,seed;

    GetParameterValues(argc,argv,&rowCount,&colCount,&width,&height,&center,&seed);

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
                result = CalculateNext(result, seed, calculate);
                iterationCount++;

            } // La condicion < 2 es la que impone el punto de corte para el calculo de la sucesion

            SetMatrixValue(mp, i, j, iterationCount);

            iterationCount = 0;
        }

    }

    printToStdout(mp, rowCount, colCount);

    DestroyMatrixPointer(mp, rowCount, colCount);

    return 0;
}


////// ACA ESTA LA MAGIA
// Mapea mis pixeles numerados del 0 a la cantidad total a un valor en el eje imaginaro o real dependiendo del parametro
// Por ejemplo: Si el centro esta en el 0+i0
/*
    Considerando que el ancho de la pantalla es de 1 y la cantidad de pixeles es 5 y los valores estan sobre el eje real
    Se maparearan de la siguiente forma:
    0 1 2 3 4 5  -------->   -0.4  -0.2  0  0.2  0.4
*/
double MapPixel(double pixelNumber, int totalPixels, double center, int scale, int eje){

    double result;
    double paso = scale/(double)totalPixels;

    // este va a ser mi pixel cuya posicion es el centro osea 0+i0
    int pixelCentral = totalPixels/2 + 1;

    // Al numero de pixel que yo quiero mapear, le tengo que restar el numero de pixel central
    pixelNumber -= pixelCentral;

    // Ahora que tengo la posicion relatival del pixel a mapear con respecto al centro, puedo calcular su posicion en el rango de la escala especificada
    result = pixelNumber * paso;

    // Por la forma en que numero los pixeles, los valores negativos del eje y me quedan por encima del centro y los positivos por debajo
    // Por eso se agrega esta correccion de signo
    if(eje == EJE_Y){
        result *= -1;
    }

   // Ahora hago un corrimiento del valor del pixel dependiendo del centro especificado
    result += center;

    return result;
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


