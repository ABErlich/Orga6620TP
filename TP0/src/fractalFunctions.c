#include "Headers/fractalFunctions.h"

/* La funcion que se le pasa al calculateNext para obtener el proximo numero de la sucesion
f^2 + seed */
Complex fc(Complex f, Complex seed){
    Complex fSquared;
    Complex result;
    fSquared = Square(f);
    result = Add(fSquared, seed);
    return result;
}
