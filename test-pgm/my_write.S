#include <mips/regdef.h>
#include <sys/syscall.h>
#define SIZE_SF 32
#define OFFSET_RA 24
#define OFFSET_FP 20
#define OFFSET_GP 16
#define OFFSET_A0 32
#define OFFSET_A1 36
#define OFFSET_A2 40
                            # 32______
                            #   |////|
                            # 28+----+
                            #   | ra |
                            # 24+----+
                            #   | fp |
                            # 20+----+
                            #   | gp |
                            # 16======
                            #   |(a3)|
                            # 12+----+
                            #   |(a2)|
                            #  8+----+
                            #   |(a1)|
                            #  4+----+
                            #   |(a0)|
                            #  0------
    .text                   #Seccion de instrucciones.
    .abicalls
    .align 2                #Instrucciones alineadas en 4bytes.
    .global my_write        #Accedida en cualquier parte.
    .ent my_write
my_write: 
    .frame $fp, SIZE_SF, ra
    .set noreorder
    .cpload t9
    .set reorder
    subu sp, sp, SIZE_SF    #begin: stack frame
    .cprestore OFFSET_GP    #analogo a sw gp, OFFSET_GP(sp)
    sw $fp, OFFSET_FP(sp)
    sw ra, OFFSET_RA(sp)
    move $fp, sp
    sw a0, OFFSET_A0($fp) 
    sw a1, OFFSET_A1($fp)   
    sw a2, OFFSET_A2($fp)   #end: stack frame
    lw t8, OFFSET_A0($fp)   #begin: syscall
    lhu a0, 14(t8)
    lw a1, OFFSET_A1($fp)
    lw a2, OFFSET_A2($fp)
    li v0, SYS_write                  
    syscall                 #end: syscall
    lw gp, OFFSET_GP($fp)   #begin: return
    lw $fp, OFFSET_FP(sp)
    lw ra, OFFSET_RA(sp)
    addiu sp, sp, SIZE_SF
    jr  ra                  #end: return
    .end my_write
