#include <mips/regdef.h>
#define SIZE_SF 32
#define OFFSET_RA 24
#define OFFSET_FP 20
#define OFFSET_GP 16
#define OFFSET_A0 32
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
    .global mips32_save_buff  #Accedida en cualquier parte.
    .ent mips32_save_buff
mips32_save_buff: 
    .frame $fp, SIZE_SF, ra
    .set noreorder
    .cpload t9
    .set reorder
    subu sp, sp, SIZE_SF    #begin: stack frame
    .cprestore OFFSET_GP    #analogo a sw gp, OFFSET_GP(sp)
    sw $fp, OFFSET_FP(sp)
    sw ra, OFFSET_RA(sp)
    move $fp, sp
    sw a0, OFFSET_A0($fp)   #end: stack frame
    lw a0, OFFSET_A0($fp)   #begin: strcpy(mips32_buff[count_buff],a0)
    la t6, mips32_buff
    la t7, count_buff       
    lw t8, 0(t7)
    mul t8, t8, 4
    add t8, t8, t6
    lw t5, 0(a0)
    sw t5, 0(t8)            #end: strcpy(mips32_buff[count_buff],a0)
    la t7, count_buff       #begin: count_buff++
    lw t8, 0(t7)
    addi t8,t8, 1
    sw t8, 0(t7)            #end: count_buff++
    lw gp, OFFSET_GP($fp)   #begin: return
    lw $fp, OFFSET_FP(sp)
    lw ra, OFFSET_RA(sp)
    addiu sp, sp, SIZE_SF
    jr  ra                  #end: return
    .end mips32_save_buff
