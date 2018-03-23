#include <stdio.h>
#include "bool.h"
#include "complex.h"


int main(int argc, char **argv){

    Complex num;
    Complex resultNum;
    num.real = 1;
    num.img = 2;
    
    resultNum = Square(num);

    printf("Hello world! %f, %f", resultNum.real, resultNum.img);

}




