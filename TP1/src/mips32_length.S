#include <mips/regdef.h>
#define SIZE_SF 32
#define OFFSET_RA 24
#define OFFSET_FP 20
#define OFFSET_GP 16
#define OFFSET_A0 32
#define FIN '\0'
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
    .global mips32_length   #Accedida en cualquier parte.
    .ent mips32_length
mips32_length: 
    .frame $fp, SIZE_SF, ra
    .set noreorder
    .cpload t9
    .set reorder
    subu sp, sp, SIZE_SF    #begin: stack frame
    .cprestore OFFSET_GP    #analogo a sw gp, OFFSET_GP(sp)
    sw $fp, OFFSET_FP(sp)
    sw ra, OFFSET_RA(sp)
    move $fp, sp            
    sw a0, OFFSET_A0(sp)    #end: stack frame
    lw t4, OFFSET_A0(sp)
    li v0, 0
loop:
    lb   t1, 0(t4)
    beq  t1, zero, end
    addi v0, v0, 1
    addi t4, t4, 1
    j loop
end:
    lw gp, OFFSET_GP($fp)   #begin: return
    lw $fp, OFFSET_FP(sp)
    lw ra, OFFSET_RA(sp)
    addiu sp, sp, SIZE_SF
    jr  ra                  #end: return
    .end mips32_length
