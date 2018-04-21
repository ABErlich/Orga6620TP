#include <stdio.h>
#include "helper.h"

int
main(int argc, char* const argv[]){
    char p[5];
    printf("hola mundo \n");
    nop();
    caller_nop();
    my_print("a", 1);
    my_print("\n", 1);
    convert_to_str(p, (unsigned)100);
    my_print(p, 5);
    convert_to_str(p, (unsigned)1);
    my_print(p, 5);
    convert_to_str(p, (unsigned)251);
    my_print(p, 5);
    convert_to_str(p, (unsigned)20);
    my_print(p, 5);
    return 0;
}
