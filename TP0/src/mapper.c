#include "Headers/mapper.h"

// Mapea mis pixeles numerados del 0 a la cantidad total a un valor en el eje imaginaro o real dependiendo del parametro
// Por ejemplo: Si el centro esta en el 0+i0
/*
    Considerando que el ancho de la pantalla es de 1 y la cantidad de pixeles es 5 y los valores estan sobre el eje real
    Se maparearan de la siguiente forma:
    0 1 2 3 4 5  -------->   -0.4  -0.2  0  0.2  0.4
*/
double MapPixel(double pixelNumber, int totalPixels, double center, double scale, int eje){

    double result;
    double paso = scale/(double)totalPixels;

    /*este va a ser mi pixel cuya posicion es el centro osea 0+i0*/
    int pixelCentral = totalPixels/2 + 1;

    /* Al numero de pixel que yo quiero mapear, le tengo que restar el numero de pixel central*/
    pixelNumber -= pixelCentral;

    /* Ahora que tengo la posicion relatival del pixel a mapear con respecto al centro, puedo calcular su posicion en el rango de la escala especificada*/
    result = pixelNumber * paso;

    /* Por la forma en que numero los pixeles, los valores negativos del eje y me quedan por encima del centro y los positivos por debajo*/
    /* Por eso se agrega esta correccion de signo*/
    if(eje == EJE_Y){
        result *= -1;
    }

   /* Ahora hago un corrimiento del valor del pixel dependiendo del centro especificado*/
    result += center;

    return result;
}

