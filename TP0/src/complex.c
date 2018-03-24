#include "Headers/complex.h"

// Un complejo al cuadrado
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

// Suma de dos complejos
Complex Add(Complex a, Complex b){

    Complex result;

    result.real = a.real + b.real;
    result.img = a.img + b.img;

    return result;
}

// Calcula el modulo de un numero complejo
double Module(Complex number){

    double a;
    double b;
    double result;

    a = number.real * number.real;
    b = number.img *  number.img;

    result = a+b;

    return result;
}