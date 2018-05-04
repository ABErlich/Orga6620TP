
.align 2

.data

# Aca podria inicializarlos con un valor default por las dudas que la inicializacion en C no funcione

parametros: 	.word 0

upperLeftReal: 	.word -1
upperLeftImg: 	.word 1
lowerRightReal: .word 1
lowerRightImg: 	.word -1
stepReal: 		.float 0.003125
stepImg: 		.float 0.004666
resolutionX: 	.word 640
resolutionY: 	.word 480
shades: 		.word 255
centerReal: 	.word 0
centerImg: 		.word 0
fileNumber: 	.word 1
pointReal: 		.word 0
pointImg: 		.word 0
y:				.word 1
x:				.word 1
c:				.word 1


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
		lw $t1, 0($a0)
		sw $t1, 0($t0) 
			
		la $t0, upperLeftImg
		lw $t1, 4($a0)
		sw $t1, 0($t0)

		la $t0, lowerRightReal
		lw $t1, 8($a0)
		sw $t1, 0($t0)

		la $t0, lowerRightImg
		lw $t1, 12($a0)
		sw $t1, 0($t0)

		la $t0, stepReal
		lwc1 $f0, 16($a0)
		swc1 $f0, 0($t0)

		la $t0, stepImg
		lwc1 $f0, 20($a0)
		swc1 $f0, 0($t0)

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
		lw $t1, 36($a0)
		sw $t1, 0($t0)

		la $t0, centerImg
		lw $t1, 40($a0)
		sw $t1, 0($t0)

		la $t0, fileNumber
		lw $t1, 44($a0)
		sw $t1, 0($t0)

		# paso parametros y llamo a la funcion que imprime el header
		lw $t0, fileNumber
		# #########################################################
		# jal mips32_header
		# ########################################################

		# inicializacion del for mas grande
		lw $t0, upperLeftImg
		la $t3, pointImg
		la $t4, y

		addu $t1, $t0, $0 
		addu $t2, $0, $0

		sw $t1, 0($t3) # ci = upperLeftImg
		sw $t2, 0($t4) # y = 0 
		
		b LoopImg

.end mips32_plot


LoopImg: # LoopImg: Loop sobre eje imaginario
		lw $t0, resolutionY
		lw $t1, y

		bge $t0, $t1, End_mips32_plot
			
		# Inicializo variables para el loop real
		# cr = upperLeftReal, x = 0		
		lw $t0, upperLeftReal
		la $t3, pointReal
		la $t4, x

		addu $t1, $t0, $0 
		addu $t2, $0, $0

		sw $t2, 0($t4) # x = 0
		sw $t1, 0($t3) # cr = upperLeftReal

		b LoopReal

.end LoopImg

LoopReal: # LoopReal: Loop sobre eje real
		lw $t0, resolutionX
		lw $t1, x

		bge $t0, $t1, EndLoopReal
		
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
		la $t0, x
		lw $t1, x
		la $t2, pointReal
		lw $t3, pointReal
		lw $t4, stepReal

		addu $t1, $t1, 1
		addu $t3, $t3, $t4
		sw $t3, 0($t2)

		b LoopReal

.end EndLoopPixel

EndLoopReal: # EndLoopReal
		# incremento variables del loop img
		la $t0, y
		lw $t1, y
		la $t2, pointImg
		lw $t3, pointImg
		lw $t4, stepImg

		addu $t1, $t1, 1
		subu $t3, $t3, $t4
		sw $t3, 0($t2)
		
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
	
	
	
	
	
	
	
	
	