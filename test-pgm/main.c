#include <stdio.h>
#include "helper.h"

#define TAM_STACK_FRAME 2

int
main(int argc, char* const argv[]){
    printf("hola mundo %d", TAM_STACK_FRAME);
    nop();
    caller_nop();
    return 0;
}
