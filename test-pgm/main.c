#include <stdio.h>
#include "helper.h"
#include "mips32_stdio.h"

int
main(int argc, char* const argv[]){
    int i;
    mips32_header(stdout, (unsigned)255, (unsigned)30, (unsigned)255);
    for(i=0; i<=255; i++){
        mips32_fprintf(stdout,(unsigned)i);
    }
    mips32_fflush(stdout);
    return 0;
}
