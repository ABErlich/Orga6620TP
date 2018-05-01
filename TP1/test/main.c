#include <stdio.h>
#include "../src/mips32_helper.h"
#include "../src/mips32_stdio.h"

int
main(int argc, char* const argv[]){
    printf("test1: se prueban todos los numeros del 0 al 255\n");
    int i;
    mips32_header(stdout, (unsigned)640, (unsigned)480, (unsigned)255);
    for(i=0; i<=255; i++){
        mips32_fprintf(stdout,(unsigned)i);
    }
    mips32_fflush(stdout);
    /*for(i=0; i<=3000; i++){
        mips32_fprintf(stdout,(unsigned)240);
    }
    mips32_fflush(stdout);*/
    return 0;
}
