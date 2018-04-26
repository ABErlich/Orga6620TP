
.align 2

.data

upperLeftReal: .word
upperLeftImg: .word
lowerRightReal: .word
lowerRightImg: .word
stepReal: .word
stepImg: .word
resolutionX: .word
resolutionY: .word
shades: .word
centerReal: .word
centerImg: .word
fileNumber: .word

.text
.globl mips32_plot

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
		
		# ACA SE DEBERIA IMPRIMIR EL HEADER
		
y:	0
x:	0
c:	0
	
#Loop sobre eje imaginario
LoopImg:
		bneg 
		# Si se cumple la cond
		
		
		addu y, y, 1
		b LoopImg
EndLoop:
		b EndLoop

#Loop sobre eje real	
LoopReal:
		bneg
		# Si se cumple la cond
	
	
		addu x, x, 1
		b LoopReal
EndLoopReal:
		b LoopImg
	
	
#Loop en cada punto
LoopPixel:
		bneg
		# Si se cumple la condicion
		#ACA DEBERIA IMPRIMIR EL NUMERO
	
		
		b LoopPixel
EndLoopPixel:
		b LoopReal
		
		
		
EndLoop:
	
		
	
	
	
	
	
	
	
	
	