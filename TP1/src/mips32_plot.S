


.align 2

.data

# Aca podria inicializarlos con un valor default por las dudas que la inicializacion en C no funcione

parametros: 	.word 0

upperLeftReal: 	.float -1.0
upperLeftImg: 	.float 1.0
lowerRightReal: .float 1.0
lowerRightImg: 	.float -1.0
stepReal: 		.float 0.003125
stepImg: 		.double 0.004666
seedReal:		.float 0.72689534770911
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
		l.d $f0, 16($a0)
		s.d $f0, 0($t0)

		la $t0, stepImg
		l.d $f2, 20($a0)
		s.d $f2, 0($t0)

		la $t0, seedReal
		l.s $f1, 24($a0)
		s.s $f1, 0($t0)

		la $t0, seedImg
		l.s $f1, 28($a0)
		s.s $f1, 0($t0)

		la $t0, resolutionX
		lw $t1, 32($a0)
		sw $t1, 0($t0)

		la $t0, resolutionY
		lw $t1, 36($a0)
		sw $t1, 0($t0)

		la $t0, shades
		lw $t1, 40($a0)
		sw $t1, 0($t0)

		la $t0, filePointer
		lw $t1, 44($a0)
		sw $t1, 0($t0)

		# paso parametros y llamo a la funcion que imprime el header

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

		l.s $f10, pointReal
		l.s $f11, pointImg
		
		# inicializo variables para el loop sobre el pixel
		# c=0

		la $t0, c

		addu $t1, $0, $0
		sw $t1, 0($t0)
		
		lw $t0, x
		lw $t1, y
		li $t2, 0

		li  $v0, 1          # service 1 is print integer
    	add $a0, $t0, $t2  # load desired value into argument register $a0, using pseudo-op
    	syscall

		li  $v0, 1           # service 1 is print integer
    	add $a0, $t1, $t2  # load desired value into argument register $a0, using pseudo-op
    	syscall


		b LoopPixel
	
.end LoopReal

LoopPixel: # LoopPixel: Loop en cada punto
		lw $t0, shades
		lw $t1, c

		jal calculateMod

		li.s $f0, 4.0

		c.le.s $f0, $f12
		bc1t EndLoopPixel
		bge $t1, $t0, EndLoopPixel
		

		l.s $f0, seedReal
		l.s $f1, seedImg
		li.s $f2, 2.0

		mul.s $f30, $f10, $f11 # f30 = zr * zi
		mul.s $f30, $f30, $f1 # f30 = zr * zi * 2
		mul.s $f10, $f10, $f10 # f10 = zr*zr
		mul.s $f11, $f11, $f11 # f11 = zi*zi
		
		sub.s $f29, $f10, $f11 # f29 =  zr*zr - zi*zi
		add.s $f10, $f29, $f0 # f10 = s_re + zr * zr - zi * zi
		add.s $f11, $f30, $f1 # f11 = (zr * zi * 2) + s_im

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

		li.s $f2, 0.0

		add.s $f0, $f10, $f2
		add.s $f1, $f11, $f2

		mul.s $f0, $f0, $f0
		mul.s $f1, $f1, $f1

		add.s $f12, $f0, $f1

		jr $ra
.end calculateMod
		
End_mips32_plot: # End_mips32_plot

		# #################ACA TENGO QUE TIRAR EL FLUSH####################
		addi $sp, $sp, 56

		li $v0, 10
		syscall
.end End_mips32_plot
	
	
	
	
	
	
	
	
	