#include <stdio.h>
#include "helper.h"

int
main(int argc, char* const argv[]){
    char p[5];
    FILE* t;
    printf("hola mundo \n");
    nop();
    caller_nop();
    my_print("a", 1);
    my_print("\n", 1);
    convert_to_str(p, (unsigned)100);
    //my_write(stdout, p, 5);
    t = fopen("hola.txt", "w");
    my_write(t, p, 5);
    my_close(t);
    return 0;
}
