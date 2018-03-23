
#include <stdio.h>
#include "Headers/bool.h"
#include "Headers/complex.h"
#include "Headers/succession.h"
 
Complex calculate(Complex f, Complex c);

int main (int argc, char **argv){

    Complex f;
    Complex c;
    Complex result;
    short iterationCount = 0;

    f.real = 0;
    f.img = 0;
    
    c.real = 0.279;
    c.img = 0;

    result = f;
    do {
        result = CalculateNext(result, c, calculate);    
        iterationCount ++;

        printf("-- %d:%f --", iterationCount, Module(result));
    } while (Module(result) < 1);

    return 0;
}


/* La funcion que se le pasa al calculateNext para obtener el proximo numero de la sucesion
f^2 + c */
Complex calculate(Complex f, Complex c){

    Complex fSquared;
    Complex result;

    fSquared = Square(f);
    result = Add(fSquared, c);

    return result;

}


