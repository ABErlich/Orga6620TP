
.align 2

.data

#Aca podria inicializarlos con un valor default por las dudas que la inicializacion en C no funcione

upperLeftReal: 	.word
upperLeftImg: 	.word
lowerRightReal: .word
lowerRightImg: 	.word
stepReal: 		.float
stepImg: 		.float
resolutionX: 	.word
resolutionY: 	.word
shades: 		.word
centerReal: 	.word
centerImg: 		.word
fileNumber: 	.word
pointReal: 		.word
pointImg: 		.word
y:				.word 0
x:				.word 0
c:				.word 0


.text
.globl mips32_plot
.ent mips32_plot

mips32_plot: 
		#Inicializo el StackFrame
		subu sp, sp, 68 				#Por ahora le pongo 68
		#guardo el valor del framePointer del caller
		sw $fp, 60(sp)
		#guardo el valor del globalPointer del caller
		sw $gp, 56(sp)
		#muevo el fp para que coincida con el stackframe del callee
		move $fp, sp
		
		#cargo el parametro en el ABA del caller
		sw a0, sp(68)
		
		#cargo mis variables locales desde el parametro
		lw upperLeftReal, 0(a0)
		lw upperLeftImg, 4(a0)
		lw lowerRightReal, 8(a0)
		lw lowerRightImg, 12(a0)
		lw stepReal, 16(a0)
		lw stepImg, 20(a0)
		lw resolutionX, 24(a0)
		lw resolutionY, 28(a0)
		lw shades, 32(a0)
		lw centerReal, 36(a0)
		lw centerImg, 40(a0)
		lw fileNumber, 44(a0)
		
		#########################ACA SE DEBERIA IMPRIMIR EL HEADER#####################################


		addu pointImg, upperLeftImg, zero	
		addu x, zero, zero

		b LoopImg

.end mips32_plot

#Loop sobre eje imaginario
LoopImg:
		bge resolutionY, y, End_mips32_plot
			
		# Inicializo variables para el loop interno
		subu pointReal, upperLeftReal
		addu x, zero, zero
		b LoopReal
		
		addu y, y, 1
		subu pointImg, pointImg, stepImg
		
		b LoopImg

.end LoopImg


#Loop sobre eje real
LoopReal:
		bge resolutionX, x, EndLoopReal
		
		addu c, zero, zero
		b LoopPixel
	
		addu x, x, 1
		addu pointReal, pointReal, stepReal
		b LoopReal
	
.end LoopReal


#Loop en cada punto
LoopPixel:
		jal calculateMod

		bge $v0, 4, EndLoopPixel
		bge c, shades, EndLoopPixel
		# Si se cumple la condicion
		
		
		################ACA DEBERIA IMPRIMIR EL NUMERO##########################
	
		addu c, c, 1
		b LoopPixel
		
.end LoopPixel		

		
EndLoopPixel:
		b LoopReal

.end EndLoopPixel

EndLoopReal:
		b LoopImg

.end EndLoopReal
		
calculateMod:
		jr $ra
.end calculateMod
		
End_mips32_plot:
	li $v0, 10
	syscall
.end End_mips32_plot
	
	
	
	
	
	
	
	
	