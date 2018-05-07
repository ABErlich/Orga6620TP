#include <mips/regdef.h>
#include <sys/syscall.h>

.align 2

.data

# Aca podria inicializarlos con un valor default por las dudas que la inicializacion en C no funcione

# parametros: 	.word 0

upperLeftReal: 	.float -1.0
upperLeftImg: 	.float 1.0
lowerRightReal: .float 1.0
lowerRightImg: 	.float -1.0
stepReal: 		.float 0.003125
stepImg: 		.float 0.004666
seedReal:		.float -0.72689534770911
seedImg:		.float 0.18888712904384
resolutionX: 	.word 640
resolutionY: 	.word 480
shades: 		.word 255
filePointer: 	.word 0


centerReal: 	.float 0.0
centerImg: 		.float 0.0
pointReal: 		.float 0.0
pointImg: 		.float 0.0
y:				.word 0
x:				.word 0
c:				.word 0


.text
.globl mips32_plot
.ent mips32_plot

mips32_plot: # mips32_plot
# main:
		.frame $fp, 56, ra
		# temporal
		# la $a0, parametros
		# addi $a0, $a0, 4

		# Inicializo el StackFrame
		addi sp, sp, -56

		# guardo el valor del framePointer del caller
		sw $fp, 52(sp)
		# guardo el valor del globalPointer del caller
		.cprestore  48    # analogo a sw gp,  48(sp)
		# sw gp, 48(sp)
		# muevo el fp para que coincida con el stackframe del callee
		move $fp, sp
		
		# cargo el parametro en el ABA del caller
		# sw $a0, 56($sp)
		
		# cargo mis variables desde el parametro
		la t0, upperLeftReal
		l.s $f1, 0(a0)
		s.s $f1, 0(t0) 
			
		la t0, upperLeftImg
		l.s $f1, 4(a0)
		s.s $f1, 0(t0)

		la t0, lowerRightReal
		l.s $f1, 8(a0)
		s.s $f1, 0(t0)

		la t0, lowerRightImg
		l.s $f1, 12(a0)
		s.s $f1, 0(t0)

		la t0, stepReal
		l.s $f0, 16(a0)
		s.s $f0, 0(t0)

		la t0, stepImg
		l.s $f1, 20(a0)
		s.s $f1, 0(t0)

		la t0, seedReal
		l.s $f1, 24(a0)
		s.s $f1, 0(t0)

		la t0, seedImg
		l.s $f1, 28(a0)
		s.s $f1, 0(t0)

		la t0, resolutionX
		lw t1, 32(a0)
		sw t1, 0(t0)

		la t0, resolutionY
		lw t1, 36(a0)
		sw t1, 0(t0)

		la t0, shades
		lw t1, 40(a0)
		sw t1, 0(t0)

		la t0, filePointer
		lw t1, 44(a0)
		sw t1, 0(t0)

		# paso parametros y llamo a la funcion que imprime el header
		lw a0, filePointer
		lw a1, resolutionX
		lw a2, resolutionY
		lw a3, shades

		# #########################################################
		# jal mips32_header
		# ########################################################

		# inicializacion del for mas grande
		l.s $f2, upperLeftImg
		la t3, pointImg
		la t4, y

		li.s $f0, 0.0

		add.s $f2, $f2, $f0
		addu t2, $0, $0

		s.s $f2, 0(t3) # ci = upperLeftImg
		sw t2, 0(t4) # y = 0 
		
		b LoopImg



LoopImg: # LoopImg: Loop sobre eje imaginario
		lw t0, resolutionY
		lw t1, y

		bge t1, t0, End_mips32_plot
			
		# Inicializo variables para el loop real
		# cr = upperLeftReal, x = 0		
		l.s $f2, upperLeftReal
		la t3, pointReal
		la t4, x

		li.s $f0, 0.0

		add.s $f2, $f2, $f0 
		addu t2, $0, $0

		sw t2, 0(t4) # x = 0
		s.s $f2, 0(t3) # cr = upperLeftReal

		b LoopReal


LoopReal: # LoopReal: Loop sobre eje real
		lw t0, resolutionX
		lw t1, x

		bge t1, t0, EndLoopReal

		l.s $f12, pointReal
		l.s $f14, pointImg
		# inicializo variables para el loop sobre el pixel
		# c=0

		la t0, c

		addu t1, zero, zero
		sw t1, 0(t0)

		b LoopPixel
	


LoopPixel: # LoopPixel: Loop en cada punto
		lw t0, shades
		lw t1, c

		bge t1, t0, EndLoopPixel # condicion del loop

		jal calculateMod
		li.s $f0, 4.0
		c.le.s $f0, $f16
		bc1t EndLoopPixel # Si modulo >= 4
		
		l.s $f0, seedReal
		l.s $f2, seedImg
		li.s $f4, 2.0

		mul.s $f30, $f12, $f14 # f30 = zr * zi
		mul.s $f30, $f30, $f4 # f30 = zr * zi * 2
		mul.s $f12, $f12, $f12 # f12 = zr*zr
		mul.s $f14, $f14, $f14 # f14 = zi*zi
		
		sub.s $f28, $f12, $f14 # f28 =  zr*zr - zi*zi
		add.s $f12, $f0, $f28 # f12 = s_re + zr * zr - zi * zi
		add.s $f14, $f30, $f2 # f14 = (zr * zi * 2) + s_im

		la t2, c

		addu t1, t1, 1
		sw t1, 0(t2)

		b LoopPixel


		
EndLoopPixel: # EndLoopPixel

		# ###############ACA IMPRIMO EL NUMERO##########################
		lw a0, filePointer
		lw a1, c

		# jal mips32_fprintf
		# ##############################################################

		# Por ahora lo saco por consola
		lw t1, c
		li  v0, 1          # service 1 is print integer
    	add a0, zero, t1  # load desired value into argument register $a0, using pseudo-op
    	syscall

		# incremento variables del loop real
		# cr += stepreal
		# x++

		la t0, x
		lw t1, x
		la t2, pointReal
		l.s $f0, pointReal
		l.s $f2, stepReal

		addu t1, t1, 1
		sw t1, 0(t0) # x++
		add.s $f0, $f0, $f2 # cr += stepreal
		s.s $f0, 0(t2)

		b LoopReal


EndLoopReal: # EndLoopReal
		# incremento variables del loop img
		# ci -= stepimg
		# y++

		la t0, y
		lw t1, y
		la t2, pointImg
		l.s $f0, pointImg
		l.s $f2, stepImg

		addu t1, t1, 1
		sw t1, 0(t0) # y++
		sub.s $f0, $f0, $f2 # ci -= stepimg
		s.s $f0, 0(t2)
		
		b LoopImg

		
calculateMod: # calculateMod: Calcula el modulo de un numero complejo

		li.s $f4, 0.0

		add.s $f0, $f12, $f4
		add.s $f2, $f14, $f4

		mul.s $f0, $f0, $f0
		mul.s $f2, $f2, $f2

		add.s $f16, $f0, $f2

		jr ra

		
End_mips32_plot: # End_mips32_plot

		# #################ACA TENGO QUE TIRAR EL FLUSH####################
		addi sp, sp, 56

		li v0, 10
		syscall

	
.end mips32_plot
	

