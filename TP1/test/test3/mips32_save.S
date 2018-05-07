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
    .rdata                  #Seccion de rdata.
    .align 2
endLn:
    .ascii "\000"
    .text                   #Seccion de instrucciones.
    .abicalls
    .align 2                #Instrucciones alineadas en 4bytes.
    .global mips32_save     #Accedida en cualquier parte.
    .ent mips32_save
mips32_save: 
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
    lw a0, OFFSET_A0($fp)   # begin: size
    jal mips32_length
    move t6, v0             # end: size, tam de a0
    move t7, v0             # begin: save, t7 = i veces loop
    lw a0, OFFSET_A0($fp)   # cargo Dir char*
    la t3, mips32_buff      # t3 = dir mips32_buff
    la t4, length           # t4 = dir length
    lw t8, 0(t4)            # t8 = length
    add t9, t8, t3          # t9 proximo byte a escrbir
loop:
    lb t5, 0(a0)            # levanto caracter
    sb t5, 0(t9)            # guardo por caracter
    sub t7, t7, 1           # i--
    beq t7, zero, endLoop   # si llegue a 0 finalizo
    addu a0, a0, 1          # me muevo en 1 byte
    addu t9, t9, 1          # me muevo en 1 byte
    j loop                  # end: save
   # lw a0, OFFSET_A0($fp)   #begin: strcpy(mips32_buff[length],a0)
   # la t6, mips32_buff
   # la t7, length       
   # lw t8, 0(t7)
   # add t8, t8, t6
   # lb t5, 0(a0)
   # sb t5, 0(t8)            #end: strcpy(mips32_buff[length],a0)
endLoop:
    add t8, t6, t8           #begin: t8* = actualizo length
    sw t8, 0(t4)             #end: actualizo length
    #la t6, mips32_buff      #begin: add \0
    #add t8, t8, t6
    #la t5, endLn
    #lw t4, 0(t5)
    #sb t4, 0(t8)            #end: add \0
    lw gp, OFFSET_GP($fp)   #begin: return
    lw $fp, OFFSET_FP(sp)
    lw ra, OFFSET_RA(sp)
    addiu sp, sp, SIZE_SF
    jr  ra                  #end: return
    .end mips32_save
