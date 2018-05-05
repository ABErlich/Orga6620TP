


.align 2

.data

# Aca podria inicializarlos con un valor default por las dudas que la inicializacion en C no funcione

parametros: 	.word 0

upperLeftReal: 	.float -1.0
upperLeftImg: 	.float 1.0
lowerRightReal: .float 1.0
lowerRightImg: 	.float -1.0
stepReal: 		.float 0.003125
stepImg: 		.float 0.004666
resolutionX: 	.word 640
resolutionY: 	.word 480
shades: 		.word 255
centerReal: 	.float 0.0
centerImg: 		.float 0.0
fileNumber: 	.word 1
pointReal: 		.float 0.0
pointImg: 		.float 0.0
y:				.word 0
x:				.word 0
c:				.word 0


.text
.globl mips32_plot
.ent mips32_plot

# mips32_plot: # mips32_plot
main:
		# temporal
		la $a0, parametros
		addi $a0, $a0, 4

		# Inicializo el StackFrame
		addi $sp, $sp, -56

		# guardo el valor del framePointer del caller
		sw $fp, 52($sp)
		# guardo el valor del globalPointer del caller
		sw $gp, 48($sp)
		# muevo el fp para que coincida con el stackframe del callee
		move $fp, $sp
		
		# cargo el parametro en el ABA del caller
		sw $a0, 56($sp)
		
		# cargo mis variables desde el parametro
		la $t0, upperLeftReal
		l.s $f1, 0($a0)
		s.s $f1, 0($t0) 
			
		la $t0, upperLeftImg
		l.s $f1, 4($a0)
		s.s $f1, 0($t0)

		la $t0, lowerRightReal
		l.s $f1, 8($a0)
		s.s $f1, 0($t0)

		la $t0, lowerRightImg
		l.s $f1, 12($a0)
		s.s $f1, 0($t0)

		la $t0, stepReal
		l.s $f0, 16($a0)
		s.s $f0, 0($t0)

		la $t0, stepImg
		l.s $f0, 20($a0)
		s.s $f0, 0($t0)

		la $t0, resolutionX
		lw $t1, 24($a0)
		sw $t1, 0($t0)

		la $t0, resolutionY
		lw $t1, 28($a0)
		sw $t1, 0($t0)

		la $t0, shades
		lw $t1, 32($a0)
		sw $t1, 0($t0)

		la $t0, centerReal
		l.s $f1, 36($a0)
		s.s $f1, 0($t0)

		la $t0, centerImg
		l.s $f1, 40($a0)
		s.s $f1, 0($t0)

		la $t0, fileNumber
		lw $t1, 44($a0)
		sw $t1, 0($t0)

		# paso parametros y llamo a la funcion que imprime el header
		lw $t0, fileNumber
		# #########################################################
		# jal mips32_header
		# ########################################################

		# inicializacion del for mas grande
		l.s $f1, upperLeftImg
		la $t3, pointImg
		la $t4, y

		li.s $f0, 0.0

		add.s $f1, $f1, $f0
		addu $t2, $0, $0

		s.s $f1, 0($t3) # ci = upperLeftImg
		sw $t2, 0($t4) # y = 0 
		
		b LoopImg

.end mips32_plot


LoopImg: # LoopImg: Loop sobre eje imaginario
		lw $t0, resolutionY
		lw $t1, y

		bge $t1, $t0, End_mips32_plot
			
		# Inicializo variables para el loop real
		# cr = upperLeftReal, x = 0		
		l.s $f1, upperLeftReal
		la $t3, pointReal
		la $t4, x

		li.s $f0, 0.0

		add.s $f1, $f1, $f0 
		addu $t2, $0, $0

		sw $t2, 0($t4) # x = 0
		s.s $f1, 0($t3) # cr = upperLeftReal

		b LoopReal

.end LoopImg

LoopReal: # LoopReal: Loop sobre eje real
		lw $t0, resolutionX
		lw $t1, x

		bge $t1, $t0, EndLoopReal
		
		# inicializo variables para el loop sobre el pixel
		# c=0

		la $t0, c

		addu $t1, $0, $0
		sw $t1, 0($t0)

		b LoopPixel
	
.end LoopReal

LoopPixel: # LoopPixel: Loop en cada punto
		lw $t0, shades
		lw $t1, c

		jal calculateMod

		bge $v0, 4, EndLoopPixel
		bge $t1, $t0, EndLoopPixel
		
		la $t2, c

		addu $t1, $t1, 1
		sw $t1, 0($t2)

		b LoopPixel
		
.end LoopPixel		

		
EndLoopPixel: # EndLoopPixel

		# ###############ACA DEBERIA IMPRIMIR EL NUMERO##########################

		# incremento variables del loop real
		# cr += stepreal
		# x++

		la $t0, x
		lw $t1, x
		la $t2, pointReal
		l.s $f0, pointReal
		l.s $f1, stepReal

		addu $t1, $t1, 1
		sw $t1, 0($t0) # x++
		add.s $f0, $f0, $f1 # cr += stepreal
		s.s $f0, 0($t2)

		b LoopReal

.end EndLoopPixel

EndLoopReal: # EndLoopReal
		# incremento variables del loop img
		# ci -= stepimg
		# y++

		la $t0, y
		lw $t1, y
		la $t2, pointImg
		l.s $f0, pointImg
		l.s $f1, stepImg

		addu $t1, $t1, 1
		sw $t1, 0($t0) # y++
		sub.s $f0, $f0, $f1 # ci -= stepimg
		s.s $f0, 0($t2)
		
		b LoopImg

.end EndLoopReal
		
calculateMod: # calculateMod: Calcula el modulo de un numero complejo
	jr $ra
.end calculateMod
		
End_mips32_plot: # End_mips32_plot

	# #################ACA TENGO QUE TIRAR EL FLUSH####################
	addi $sp, $sp, 56

	li $v0, 10
	syscall
.end End_mips32_plot
	
	
	
	
	
	
	
	
	