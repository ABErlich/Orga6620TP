#include <stdio.h>
#include "helper.h"
#include "mips32_stdio.h"
/*
#include "mips32_save_buff.h"
*/

int
main(int argc, char* const argv[]){
    //mips32_write(stdout, "P2\n",4);
    mips32_header(stdout, 255, 30, 255);
    
    //printf("%d",mips32_length("150\n\000"));
    /*
    size_t c = 241;
    char* str = mips32_to_str((unsigned)c);
    printf("%s", str);
    
    count_buff = 0;
    mips32_save_buff("hola");
    printf("%d\n",count_buff);
    printf("%s\n",mips32_buff[0]);

    mips32_save_buff("P2\n");
    printf("%d\n",count_buff);
    printf("%s\n",mips32_buff[1]);*/


    return 0;
}
