#include <mips/regdef.h>
#include <sys/syscall.h>
#define SIZE_SF 32
#define OFFSET_RA 24
#define OFFSET_FP 20
#define OFFSET_GP 16
#define OFFSET_A0 32
#define OFFSET_A1 36
#define OFFSET_A2 40
#define OFFSET_A3 44
#define SIZE_HEADER 3
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
    .rdata                  #Seccion de rdata.
    .align 2
header:
    .ascii "P2\n\000"
space:
    .ascii " \000"
    .text                   #Seccion de instrucciones.
    .abicalls
    .align 2                #Instrucciones alineadas en 4bytes.
    .global mips32_header   #Accedida en cualquier parte.
    .ent mips32_header
mips32_header: 
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
    sw a2, OFFSET_A2($fp)   
    sw a3, OFFSET_A3($fp)   #end: stack frame
    la t2, length           #begin: inicializo el length del buff
    sw zero, 0(t2)          #end: inicializo el length del buff
    lw a0, OFFSET_A0($fp)   #begin: print P2
    la a1, header
    li a2, SIZE_HEADER
    jal mips32_write        #end: print P2
    lw a0, OFFSET_A1($fp)   #begin: print x_res
    jal mips32_to_str
    move a0, v0
    sw a0, OFFSET_A1($fp)
    jal mips32_length
    lw a0, OFFSET_A0($fp)
    lw a1, OFFSET_A1($fp)
    move a2, v0
    sub a2, a2, 1           #le resto 1 para no imprimir \n
    jal mips32_write        #end: print x_res
    lw a0, OFFSET_A0($fp)   #begin: print space
    la a1, space
    li a2, 1
    jal mips32_write        #end: print space
    lw a0, OFFSET_A2($fp)   #begin: print y_res
    jal mips32_to_str
    move a0, v0
    sw a0, OFFSET_A2($fp)
    jal mips32_length
    lw a0, OFFSET_A0($fp)
    lw a1, OFFSET_A2($fp)
    move a2, v0
    jal mips32_write        #end: print y_res
    lw a0, OFFSET_A3($fp)   #begin: print shades
    jal mips32_to_str
    move a0, v0
    sw a0, OFFSET_A3($fp)
    jal mips32_length
    lw a0, OFFSET_A0($fp)
    lw a1, OFFSET_A3($fp)
    move a2, v0
    jal mips32_write        #end: print shades
    lw gp, OFFSET_GP($fp)   #begin: return
    lw $fp, OFFSET_FP(sp)
    lw ra, OFFSET_RA(sp)
    addiu sp, sp, SIZE_SF
    jr  ra                  #end: return
    .end mips32_header
