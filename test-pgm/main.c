#include <stdio.h>
#include "helper.h"

#define TAM_STACK_FRAME 2

int
main(int argc, char* const argv[]){
    printf("hola mundo %d\n", TAM_STACK_FRAME);
    nop();
    caller_nop();
    my_print("a", 1);
    my_print("\n", 1);
    return 0;
}
