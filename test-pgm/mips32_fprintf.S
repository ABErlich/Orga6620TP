#include <mips/regdef.h>
#define SIZE_SF 32
#define OFFSET_RA 24
#define OFFSET_FP 20
#define OFFSET_GP 16
#define OFFSET_A0 32
#define OFFSET_A1 36
#define UMBRAL 2552
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
    .global mips32_fprintf  #Accedida en cualquier parte.
    .ent mips32_fprintf
mips32_fprintf: 
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
    sw a1, OFFSET_A1($fp)   #end: stack frame
    lw a0, OFFSET_A1($fp)
    jal mips32_to_str
    move a0, v0
    jal mips32_save
    la t2, length
    lw t3, 0(t2)
    li t4, UMBRAL
    sub t5, t4, t3
    bge t5, zero, not_call
    nop
    lw a0, OFFSET_A0($fp)
    jal mips32_fflush
not_call:
    lw gp, OFFSET_GP($fp)   #begin: return
    lw $fp, OFFSET_FP(sp)
    lw ra, OFFSET_RA(sp)
    addiu sp, sp, SIZE_SF
    jr  ra                  #end: return
    .end mips32_fprintf
