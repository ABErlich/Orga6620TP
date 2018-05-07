	.file	"main.c"
	.globl	x_res
	.data
	.align 4
	.type	x_res, @object
	.size	x_res, 4
x_res:
	.long	640
	.globl	y_res
	.align 4
	.type	y_res, @object
	.size	y_res, 4
y_res:
	.long	480
	.globl	upper_left_re
	.align 4
	.type	upper_left_re, @object
	.size	upper_left_re, 4
upper_left_re:
	.long	3212836864
	.globl	upper_left_im
	.align 4
	.type	upper_left_im, @object
	.size	upper_left_im, 4
upper_left_im:
	.long	1065353216
	.globl	lower_right_re
	.align 4
	.type	lower_right_re, @object
	.size	lower_right_re, 4
lower_right_re:
	.long	1065353216
	.globl	lower_right_im
	.align 4
	.type	lower_right_im, @object
	.size	lower_right_im, 4
lower_right_im:
	.long	3212836864
	.globl	seed_re
	.align 4
	.type	seed_re, @object
	.size	seed_re, 4
seed_re:
	.long	3208254928
	.globl	seed_im
	.align 4
	.type	seed_im, @object
	.size	seed_im, 4
seed_im:
	.long	1044474785
	.globl	plot
	.bss
	.align 8
	.type	plot, @object
	.size	plot, 8
plot:
	.zero	8
	.globl	output
	.align 8
	.type	output, @object
	.size	output, 8
output:
	.zero	8
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	parse_cmdline
	call	do_plot
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
.LC10:
	.string	"hc:H:m:o:r:w:g:V"
.LC0:
	.string	"help"
.LC1:
	.string	"version"
.LC2:
	.string	"geometry"
.LC3:
	.string	"resolution"
.LC4:
	.string	"center"
.LC5:
	.string	"width"
.LC6:
	.string	"height"
.LC7:
	.string	"output"
	.align 32
.LC9:
	.quad	.LC0
	.long	0
	.zero	4
	.quad	0
	.long	104
	.zero	4
	.quad	.LC1
	.long	0
	.zero	4
	.quad	0
	.long	86
	.zero	4
	.quad	.LC2
	.long	1
	.zero	4
	.quad	0
	.long	103
	.zero	4
	.quad	.LC3
	.long	1
	.zero	4
	.quad	0
	.long	114
	.zero	4
	.quad	.LC4
	.long	1
	.zero	4
	.quad	0
	.long	99
	.zero	4
	.quad	.LC5
	.long	1
	.zero	4
	.quad	0
	.long	119
	.zero	4
	.quad	.LC6
	.long	1
	.zero	4
	.quad	0
	.long	72
	.zero	4
	.quad	.LC7
	.long	1
	.zero	4
	.quad	0
	.long	111
	.zero	4
	.text
	.type	parse_cmdline, @function
parse_cmdline:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$304, %rsp
	movl	%edi, -292(%rbp)
	movq	%rsi, -304(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -280(%rbp)
	leaq	-272(%rbp), %rax
	movl	$.LC9, %esi
	movl	$32, %edx
	movq	%rax, %rdi
	movq	%rdx, %rcx
	rep movsq
	jmp	.L4
.L16:
	movl	-276(%rbp), %eax
	subl	$72, %eax
	cmpl	$47, %eax
	ja	.L5
	movl	%eax, %eax
	movq	.L7(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L7:
	.quad	.L6
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L8
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L9
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L10
	.quad	.L11
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L12
	.quad	.L5
	.quad	.L13
	.quad	.L5
	.quad	.L5
	.quad	.L14
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L15
	.text
.L11:
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	do_usage
	jmp	.L4
.L8:
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	do_version
	jmp	.L4
.L10:
	movq	optarg(%rip), %rdx
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	do_geometry
	jmp	.L4
.L14:
	movq	optarg(%rip), %rdx
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	do_resolution
	jmp	.L4
.L9:
	movq	optarg(%rip), %rdx
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	do_center
	jmp	.L4
.L15:
	movq	optarg(%rip), %rdx
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	do_width
	jmp	.L4
.L6:
	movq	optarg(%rip), %rdx
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	do_height
	jmp	.L4
.L12:
	movq	optarg(%rip), %rdx
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	do_method
	jmp	.L4
.L13:
	movq	optarg(%rip), %rdx
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	do_output
	jmp	.L4
.L5:
	movq	-304(%rbp), %rax
	movq	(%rax), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	do_usage
.L4:
	leaq	-280(%rbp), %rcx
	leaq	-272(%rbp), %rdx
	movq	-304(%rbp), %rsi
	movl	-292(%rbp), %eax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	$.LC10, %edx
	movl	%eax, %edi
	call	getopt_long
	movl	%eax, -276(%rbp)
	cmpl	$-1, -276(%rbp)
	jne	.L16
	movq	plot(%rip), %rax
	testq	%rax, %rax
	jne	.L17
	movq	$mips32_plot, plot(%rip)
.L17:
	movq	output(%rip), %rax
	testq	%rax, %rax
	jne	.L20
	movq	stdout(%rip), %rax
	movq	%rax, output(%rip)
.L20:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L19
	call	__stack_chk_fail
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	parse_cmdline, .-parse_cmdline
	.section	.rodata
.LC11:
	.string	"Usage:\n"
.LC12:
	.string	"  %s -h\n"
.LC13:
	.string	"  %s -V\n"
.LC14:
	.string	"  %s [options]\n"
.LC15:
	.string	"Options:\n"
	.align 8
.LC16:
	.string	"  -r, --resolution  Set bitmap resolution to WxH pixels.\n"
	.align 8
.LC17:
	.string	"  -c, --center      Set coordinates for the center of the image.\n"
	.align 8
.LC18:
	.string	"  -w, --width       Change the width of the spanned region.\n"
	.align 8
.LC19:
	.string	"  -H, --height      Change the height of the spanned region.\n"
	.align 8
.LC20:
	.string	"  -o, --output      Path to output file.\n"
.LC21:
	.string	"Examples:\n"
.LC22:
	.string	"  %s -o output.pgm\n"
	.align 8
.LC23:
	.string	"  %s -r 1600x1200 -o output.pgm\n"
	.align 8
.LC24:
	.string	"  %s -c +0.282+0.01i -o output.pgm\n"
	.text
	.type	do_usage, @function
do_usage:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$7, %edx
	movl	$1, %esi
	movl	$.LC11, %edi
	call	fwrite
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	movl	$.LC12, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	movl	$.LC13, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	movl	$.LC14, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	movl	$.LC15, %edi
	call	fwrite
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$57, %edx
	movl	$1, %esi
	movl	$.LC16, %edi
	call	fwrite
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$65, %edx
	movl	$1, %esi
	movl	$.LC17, %edi
	call	fwrite
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$60, %edx
	movl	$1, %esi
	movl	$.LC18, %edi
	call	fwrite
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$61, %edx
	movl	$1, %esi
	movl	$.LC19, %edi
	call	fwrite
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$41, %edx
	movl	$1, %esi
	movl	$.LC20, %edi
	call	fwrite
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	movl	$.LC21, %edi
	call	fwrite
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	movl	$.LC22, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	movl	$.LC23, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	movl	$.LC24, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	exit
	.cfi_endproc
.LFE4:
	.size	do_usage, .-do_usage
	.section	.rodata
.LC25:
	.string	"0.0.1-cvs"
.LC26:
	.string	"%s\n"
	.text
	.type	do_version, @function
do_version:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	stderr(%rip), %rax
	movl	$.LC25, %edx
	movl	$.LC26, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, %edi
	call	exit
	.cfi_endproc
.LFE5:
	.size	do_version, .-do_version
	.section	.rodata
.LC27:
	.string	"%d%c%d %c"
	.text
	.type	do_resolution, @function
do_resolution:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-17(%rbp), %rdi
	leaq	-12(%rbp), %rsi
	leaq	-18(%rbp), %rcx
	leaq	-16(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	movl	$.LC27, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	cmpl	$3, %eax
	jne	.L24
	movl	-16(%rbp), %eax
	testl	%eax, %eax
	jle	.L24
	movzbl	-18(%rbp), %eax
	cmpb	$120, %al
	jne	.L24
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	jg	.L25
.L24:
	movq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	do_usage
.L25:
	movl	-16(%rbp), %eax
	movl	%eax, x_res(%rip)
	movl	-12(%rbp), %eax
	movl	%eax, y_res(%rip)
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L26
	call	__stack_chk_fail
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	do_resolution, .-do_resolution
	.section	.rodata
	.align 8
.LC28:
	.string	"%lf %c %lf %c %c %lf %c %lf %c %c"
	.align 8
.LC29:
	.string	"invalid geometry specification.\n"
	.text
	.type	do_geometry, @function
do_geometry:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-43(%rbp), %r8
	leaq	-32(%rbp), %rdi
	leaq	-45(%rbp), %rcx
	leaq	-40(%rbp), %rdx
	movq	-64(%rbp), %rax
	leaq	-41(%rbp), %rsi
	pushq	%rsi
	leaq	-42(%rbp), %rsi
	pushq	%rsi
	leaq	-16(%rbp), %rsi
	pushq	%rsi
	leaq	-44(%rbp), %rsi
	pushq	%rsi
	leaq	-24(%rbp), %rsi
	pushq	%rsi
	leaq	-46(%rbp), %rsi
	pushq	%rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	movl	$.LC28, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	addq	$48, %rsp
	cmpl	$9, %eax
	jne	.L28
	movzbl	-45(%rbp), %eax
	cmpb	$43, %al
	je	.L29
	movzbl	-45(%rbp), %eax
	cmpb	$45, %al
	jne	.L28
.L29:
	movzbl	-44(%rbp), %eax
	cmpb	$43, %al
	je	.L30
	movzbl	-44(%rbp), %eax
	cmpb	$45, %al
	jne	.L28
.L30:
	movzbl	-43(%rbp), %eax
	cmpb	$105, %al
	je	.L31
	movzbl	-43(%rbp), %eax
	cmpb	$106, %al
	jne	.L28
.L31:
	movzbl	-42(%rbp), %eax
	cmpb	$105, %al
	je	.L32
	movzbl	-42(%rbp), %eax
	cmpb	$106, %al
	jne	.L28
.L32:
	movzbl	-46(%rbp), %eax
	cmpb	$44, %al
	je	.L33
.L28:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$32, %edx
	movl	$1, %esi
	movl	$.LC29, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L33:
	movzbl	-45(%rbp), %eax
	cmpb	$45, %al
	jne	.L34
	movsd	.LC30(%rip), %xmm0
	jmp	.L35
.L34:
	movsd	.LC31(%rip), %xmm0
.L35:
	movsd	-32(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movzbl	-44(%rbp), %eax
	cmpb	$45, %al
	jne	.L36
	movsd	.LC30(%rip), %xmm0
	jmp	.L37
.L36:
	movsd	.LC31(%rip), %xmm0
.L37:
	movsd	-16(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-40(%rbp), %xmm1
	movsd	-24(%rbp), %xmm0
	ucomisd	%xmm1, %xmm0
	jb	.L55
	movsd	-40(%rbp), %xmm0
	jmp	.L40
.L55:
	movsd	-24(%rbp), %xmm0
.L40:
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, upper_left_re(%rip)
	movsd	-32(%rbp), %xmm0
	movsd	-16(%rbp), %xmm1
	ucomisd	%xmm1, %xmm0
	jb	.L56
	movsd	-32(%rbp), %xmm0
	jmp	.L43
.L56:
	movsd	-16(%rbp), %xmm0
.L43:
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, upper_left_im(%rip)
	movsd	-40(%rbp), %xmm0
	movsd	-24(%rbp), %xmm1
	ucomisd	%xmm1, %xmm0
	jb	.L57
	movsd	-40(%rbp), %xmm0
	jmp	.L46
.L57:
	movsd	-24(%rbp), %xmm0
.L46:
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, lower_right_re(%rip)
	movsd	-32(%rbp), %xmm1
	movsd	-16(%rbp), %xmm0
	ucomisd	%xmm1, %xmm0
	jb	.L58
	movsd	-32(%rbp), %xmm0
	jmp	.L49
.L58:
	movsd	-16(%rbp), %xmm0
.L49:
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, lower_right_im(%rip)
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L50
	call	__stack_chk_fail
.L50:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	do_geometry, .-do_geometry
	.section	.rodata
.LC32:
	.string	"%lf %c %lf %c %c"
	.align 8
.LC33:
	.string	"invalid center specification.\n"
	.text
	.type	do_center, @function
do_center:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-43(%rbp), %r8
	leaq	-32(%rbp), %rdi
	leaq	-42(%rbp), %rcx
	leaq	-40(%rbp), %rdx
	movq	-64(%rbp), %rax
	subq	$8, %rsp
	leaq	-41(%rbp), %rsi
	pushq	%rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	movl	$.LC32, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	addq	$16, %rsp
	cmpl	$4, %eax
	jne	.L60
	movzbl	-42(%rbp), %eax
	cmpb	$43, %al
	je	.L61
	movzbl	-42(%rbp), %eax
	cmpb	$45, %al
	jne	.L60
.L61:
	movzbl	-43(%rbp), %eax
	cmpb	$105, %al
	je	.L62
	movzbl	-43(%rbp), %eax
	cmpb	$106, %al
	je	.L62
.L60:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$30, %edx
	movl	$1, %esi
	movl	$.LC33, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L62:
	movzbl	-42(%rbp), %eax
	cmpb	$45, %al
	jne	.L63
	movsd	.LC30(%rip), %xmm0
	jmp	.L64
.L63:
	movsd	.LC31(%rip), %xmm0
.L64:
	movsd	-32(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movss	upper_left_re(%rip), %xmm0
	movss	lower_right_re(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	.LC34(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm3
	movsd	%xmm3, -24(%rbp)
	movss	upper_left_im(%rip), %xmm0
	movss	lower_right_im(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	.LC34(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm4
	movsd	%xmm4, -16(%rbp)
	movsd	-40(%rbp), %xmm1
	movsd	-24(%rbp), %xmm0
	movsd	.LC35(%rip), %xmm2
	divsd	%xmm2, %xmm0
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, upper_left_re(%rip)
	movsd	-16(%rbp), %xmm0
	movsd	.LC35(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, upper_left_im(%rip)
	movsd	-24(%rbp), %xmm0
	movsd	.LC35(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, lower_right_re(%rip)
	movsd	-32(%rbp), %xmm1
	movsd	-16(%rbp), %xmm0
	movsd	.LC35(%rip), %xmm2
	divsd	%xmm2, %xmm0
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, lower_right_im(%rip)
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L65
	call	__stack_chk_fail
.L65:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	do_center, .-do_center
	.section	.rodata
.LC36:
	.string	"%lf %c"
	.align 8
.LC38:
	.string	"invalid height specification.\n"
	.text
	.type	do_height, @function
do_height:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-41(%rbp), %rcx
	leaq	-40(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$.LC36, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	cmpl	$1, %eax
	jne	.L67
	movsd	-40(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	ucomisd	%xmm1, %xmm0
	jb	.L71
.L67:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$30, %edx
	movl	$1, %esi
	movl	$.LC38, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L71:
	movss	upper_left_re(%rip), %xmm1
	movss	lower_right_re(%rip), %xmm0
	addss	%xmm1, %xmm0
	movss	.LC39(%rip), %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm2
	movsd	%xmm2, -32(%rbp)
	movss	upper_left_im(%rip), %xmm1
	movss	lower_right_im(%rip), %xmm0
	addss	%xmm1, %xmm0
	movss	.LC39(%rip), %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm3
	movsd	%xmm3, -24(%rbp)
	movss	upper_left_re(%rip), %xmm0
	movss	lower_right_re(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	.LC34(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm4
	movsd	%xmm4, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	movsd	.LC35(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, upper_left_re(%rip)
	movsd	-40(%rbp), %xmm0
	movsd	.LC35(%rip), %xmm1
	divsd	%xmm1, %xmm0
	addsd	-24(%rbp), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, upper_left_im(%rip)
	movsd	-16(%rbp), %xmm0
	movsd	.LC35(%rip), %xmm1
	divsd	%xmm1, %xmm0
	addsd	-32(%rbp), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, lower_right_re(%rip)
	movsd	-40(%rbp), %xmm0
	movsd	.LC35(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-24(%rbp), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, lower_right_im(%rip)
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L70
	call	__stack_chk_fail
.L70:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	do_height, .-do_height
	.section	.rodata
.LC40:
	.string	"invalid width specification.\n"
	.text
	.type	do_width, @function
do_width:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-41(%rbp), %rcx
	leaq	-40(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$.LC36, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	cmpl	$1, %eax
	jne	.L73
	movsd	-40(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	ucomisd	%xmm1, %xmm0
	jb	.L77
.L73:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$29, %edx
	movl	$1, %esi
	movl	$.LC40, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L77:
	movss	upper_left_re(%rip), %xmm1
	movss	lower_right_re(%rip), %xmm0
	addss	%xmm1, %xmm0
	movss	.LC39(%rip), %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm2
	movsd	%xmm2, -32(%rbp)
	movss	upper_left_im(%rip), %xmm1
	movss	lower_right_im(%rip), %xmm0
	addss	%xmm1, %xmm0
	movss	.LC39(%rip), %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm3
	movsd	%xmm3, -24(%rbp)
	movss	upper_left_im(%rip), %xmm0
	movss	lower_right_im(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	.LC34(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm4
	movsd	%xmm4, -16(%rbp)
	movsd	-40(%rbp), %xmm0
	movsd	.LC35(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, upper_left_re(%rip)
	movsd	-16(%rbp), %xmm0
	movsd	.LC35(%rip), %xmm1
	divsd	%xmm1, %xmm0
	addsd	-24(%rbp), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, upper_left_im(%rip)
	movsd	-40(%rbp), %xmm0
	movsd	.LC35(%rip), %xmm1
	divsd	%xmm1, %xmm0
	addsd	-32(%rbp), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, lower_right_re(%rip)
	movsd	-16(%rbp), %xmm0
	movsd	.LC35(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-24(%rbp), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, lower_right_im(%rip)
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L76
	call	__stack_chk_fail
.L76:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	do_width, .-do_width
	.section	.rodata
.LC41:
	.string	"generic"
.LC42:
	.string	"mips32"
	.align 8
.LC43:
	.string	"calculation method was not specified.\n"
	.text
	.type	do_method, @function
do_method:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$.LC41, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L79
	movq	$generic_plot, plot(%rip)
	jmp	.L78
.L79:
	movq	-16(%rbp), %rax
	movl	$.LC42, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L81
	movq	$mips32_plot, plot(%rip)
	jmp	.L78
.L81:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$38, %edx
	movl	$1, %esi
	movl	$.LC43, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L78:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	do_method, .-do_method
	.section	.rodata
.LC44:
	.string	"multiple do output files."
.LC45:
	.string	"-"
.LC46:
	.string	"w"
.LC47:
	.string	"cannot open output file.\n"
	.text
	.type	do_output, @function
do_output:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	output(%rip), %rax
	testq	%rax, %rax
	je	.L83
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$25, %edx
	movl	$1, %esi
	movl	$.LC44, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L83:
	movq	-16(%rbp), %rax
	movl	$.LC45, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L84
	movq	stdout(%rip), %rax
	movq	%rax, output(%rip)
	jmp	.L86
.L84:
	movq	-16(%rbp), %rax
	movl	$.LC46, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, output(%rip)
	movq	output(%rip), %rax
	testq	%rax, %rax
	jne	.L86
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$25, %edx
	movl	$1, %esi
	movl	$.LC47, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L86:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	do_output, .-do_output
	.type	do_plot, @function
do_plot:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-80(%rbp), %rax
	movl	$64, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movss	upper_left_re(%rip), %xmm0
	movss	%xmm0, -80(%rbp)
	movss	upper_left_im(%rip), %xmm0
	movss	%xmm0, -76(%rbp)
	movss	lower_right_re(%rip), %xmm0
	movss	%xmm0, -72(%rbp)
	movss	lower_right_im(%rip), %xmm0
	movss	%xmm0, -68(%rbp)
	movss	lower_right_re(%rip), %xmm0
	movss	upper_left_re(%rip), %xmm1
	subss	%xmm1, %xmm0
	movl	x_res(%rip), %eax
	pxor	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -64(%rbp)
	movss	upper_left_im(%rip), %xmm0
	movss	lower_right_im(%rip), %xmm1
	subss	%xmm1, %xmm0
	movl	y_res(%rip), %eax
	pxor	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -60(%rbp)
	movss	seed_re(%rip), %xmm0
	movss	%xmm0, -56(%rbp)
	movss	seed_im(%rip), %xmm0
	movss	%xmm0, -52(%rbp)
	movl	x_res(%rip), %eax
	cltq
	movq	%rax, -48(%rbp)
	movl	y_res(%rip), %eax
	cltq
	movq	%rax, -40(%rbp)
	movq	$256, -32(%rbp)
	movq	output(%rip), %rax
	movq	%rax, -24(%rbp)
	movq	plot(%rip), %rax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %rdi
	call	*%rax
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L88
	call	__stack_chk_fail
.L88:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	do_plot, .-do_plot
	.section	.rodata
	.align 8
.LC30:
	.long	0
	.long	-1074790400
	.align 8
.LC31:
	.long	0
	.long	1072693248
	.align 16
.LC34:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.align 8
.LC35:
	.long	0
	.long	1073741824
	.align 4
.LC39:
	.long	1073741824
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
