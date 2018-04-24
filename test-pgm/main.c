#include <stdio.h>
#include "mips32_stdio.h"
#include "mips32_save_buff.h"

int
main(int argc, char* const argv[]){
    count_buff = 0;
    mips32_save_buff("hola");
    printf("%d\n",count_buff);
    printf("%s\n",mips32_buff[0]);

    mips32_save_buff("P2\n");
    printf("%d\n",count_buff);
    printf("%s\n",mips32_buff[1]);
    return 0;
}
