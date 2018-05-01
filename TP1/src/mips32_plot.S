
.align 2

.data

#Aca podria inicializarlos con un valor default por las dudas que la inicializacion en C no funcione

upperLeftReal: 	.word 0
upperLeftImg: 	.word 0
lowerRightReal: .word 0
lowerRightImg: 	.word 0
stepReal: 		.float 0.0
stepImg: 		.float 0.0
resolutionX: 	.word 0
resolutionY: 	.word 0
shades: 		.word 0
centerReal: 	.word 0
centerImg: 		.word 0
fileNumber: 	.word 0
pointReal: 		.word 0
pointImg: 		.word 0
y:				.word 0
x:				.word 0
c:				.word 0


.text
.globl mips32_plot
.ent mips32_plot

mips32_plot: 
		#Inicializo el StackFrame
		li $t0, 68
		subu $sp, $sp, $t0
		#guardo el valor del framePointer del caller
		sw $fp, 60($sp)
		#guardo el valor del globalPointer del caller
		sw $gp, 56($sp)
		#muevo el fp para que coincida con el stackframe del callee
		move $fp, $sp
		
		#cargo el parametro en el ABA del caller
		sw $a0, 68($sp)
		
		#cargo mis variables desde el parametro
		la $t0, upperLeftReal
		sw $t0, 0($a0)
		
		la $t0, upperLeftImg
		sw $t0, 4($a0)

		la $t0, lowerRightReal
		sw $t0, 8($a0)

		la $t0, lowerRightImg
		sw $t0, 12($a0)

		la $t0, stepReal
		sw $t0, 16($a0)

		la $t0, stepImg
		sw $t0, 20($a0)

		la $t0, resolutionX
		sw $t0, 24($a0)

		la $t0, resolutionY
		sw $t0, 28($a0)

		la $t0, shades
		sw $t0, 32($a0)

		la $t0, centerReal
		sw $t0, 36($a0)

		la $t0, centerImg
		sw $t0, 40($a0)

		la $t0, fileNumber
		sw $t0, 44($a0)

		#########################ACA SE DEBERIA IMPRIMIR EL HEADER#####################################

		#inicializacion del for mas grande
		# ci = upperLeftImg, y = 0		

		lw $t0, upperLeftImg

		addu $t1, $t0, $0 
		addu $t2, $0, $0

		la $t3, pointImg
		la $t4, y

		sw $t3, 0($t1)
		sw $t4, 0($t2)
		
		b LoopImg

.end mips32_plot

#Loop sobre eje imaginario
LoopImg:
		lw $t0, resolutionY
		lw $t1, y

		bge $t0, $t1, End_mips32_plot
			
		# Inicializo variables para el loop real
		# cr = upperLeftReal, x = 0		

		lw $t0, upperLeftReal

		addu $t1, $t0, $0 
		addu $t2, $0, $0

		la $t3, pointReal
		la $t4, x

		sw $t3, 0($t1)
		sw $t4, 0($t2)

		b LoopReal

.end LoopImg


#Loop sobre eje real
LoopReal:
		lw $t0, resolutionX
		lw $t1, x

		bge $t0, $t1, EndLoopReal
		
		#inicializo variables para el loop sobre el pixel
		# c=0

		la $t0, c

		addu $t1, $0, $0
		sw $t0, 0($t1)

		b LoopPixel
	
.end LoopReal


#Loop en cada punto
LoopPixel:
		lw $t0, shades
		lw $t1, c

		jal calculateMod

		bge $v0, 4, EndLoopPixel
		bge $t1, $t0, EndLoopPixel
		
		la $t2, c
		addu $t1, $t1, 1
		sw $t2, 0($t1)

		b LoopPixel
		
.end LoopPixel		

		
EndLoopPixel:

		################ACA DEBERIA IMPRIMIR EL NUMERO##########################

		#incremento variables del loop real
		la $t0, x
		lw $t1, x
		la $t2, pointReal
		lw $t3, pointReal
		lw $t4, stepReal

		addu $t1, $t1, 1
		addu $t3, $t3, $t3
		sw $t2, 0($t3)

		b LoopReal

.end EndLoopPixel

EndLoopReal:
		 #incremento variables del loop img
		la $t0, y
		lw $t1, y
		la $t2, pointImg
		lw $t3, pointImg
		lw $t4, stepImg

		addu $t1, $t1, 1
		subu $t3, $t3, $t3
		sw $t2, 0($t3)
		
		b LoopImg

.end EndLoopReal
		
calculateMod:
		jr $ra
.end calculateMod
		
End_mips32_plot:

	##################ACA TENGO QUE TIRAR EL FLUSH####################

	li $v0, 10
	syscall
.end End_mips32_plot
	
	
	
	
	
	
	
	
	