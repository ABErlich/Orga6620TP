#include "Headers/complex.h"

Complex Square(Complex number){

    double real = number.real;
    double img = number.img;
    Complex resultComplex;
    double resultReal = 0;
    double resultImg = 0;

    resultReal = real * real - img * img;
    resultImg = 2 * real * img;

    resultComplex.real = resultReal;
    resultComplex.img = resultImg;


    return resultComplex;
}