#include <mips/regdef.h>
#include <sys/syscall.h>
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
    .global mips32_fflush   #Accedida en cualquier parte.
    .ent mips32_fflush
mips32_fflush: 
    .frame $fp, SIZE_SF, ra
    .set noreorder
    .cpload t9
    .set reorder
    subu sp, sp, SIZE_SF    # begin: stack frame
    .cprestore OFFSET_GP    # analogo a sw gp, OFFSET_GP(sp)
    sw $fp, OFFSET_FP(sp)
    sw ra, OFFSET_RA(sp)
    move $fp, sp
    sw a0, OFFSET_A0($fp)   # end: stack frame
    lw a0, OFFSET_A0($fp)   # begin: liberando buff
    la a1, mips32_buff
    la t2, length
    lw a2, 0(t2)
    jal mips32_write      
    la t2, length           
    li t3, 0
    sw t3, 0(t2)            # end: liberando buff
    lw gp, OFFSET_GP($fp)   # begin: return
    lw $fp, OFFSET_FP(sp)
    lw ra, OFFSET_RA(sp)
    addiu sp, sp, SIZE_SF
    jr  ra                  # end: return
    .end mips32_fflush
