#include <stdio.h>


void
convert_to_str(char* buf, unsigned c){
    sprintf(buf,"%u\n", c);
    return;
}
