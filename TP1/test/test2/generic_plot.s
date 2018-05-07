	.file	"generic_plot.c"
	.section	.rodata
.LC0:
	.string	"P2\n"
.LC1:
	.string	"%u\n"
.LC3:
	.string	"i/o error.\n"
.LC4:
	.string	"cannot flush output file.\n"
	.text
	.globl	generic_plot
	.type	generic_plot, @function
generic_plot:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, %rcx
	movl	$3, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movq	-56(%rbp), %rax
	movq	32(%rax), %rax
	movl	%eax, %edx
	movq	-56(%rbp), %rax
	movq	56(%rax), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	-56(%rbp), %rax
	movq	40(%rax), %rax
	movl	%eax, %edx
	movq	-56(%rbp), %rax
	movq	56(%rax), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	-56(%rbp), %rax
	movq	48(%rax), %rax
	leal	-1(%rax), %edx
	movq	-56(%rbp), %rax
	movq	56(%rax), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, -20(%rbp)
	movq	-56(%rbp), %rax
	movss	4(%rax), %xmm0
	movss	%xmm0, -36(%rbp)
	jmp	.L2
.L11:
	movl	$0, -24(%rbp)
	movq	-56(%rbp), %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -40(%rbp)
	jmp	.L3
.L10:
	movss	-40(%rbp), %xmm0
	movss	%xmm0, -32(%rbp)
	movss	-36(%rbp), %xmm0
	movss	%xmm0, -28(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L4
.L8:
	movss	-32(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	mulss	-32(%rbp), %xmm1
	movss	-28(%rbp), %xmm0
	mulss	-28(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	movss	-12(%rbp), %xmm0
	ucomiss	.LC2(%rip), %xmm0
	jnb	.L13
	movq	-56(%rbp), %rax
	movss	24(%rax), %xmm1
	movss	-32(%rbp), %xmm0
	mulss	-32(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movss	-28(%rbp), %xmm1
	mulss	-28(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	movq	-56(%rbp), %rax
	movss	28(%rax), %xmm1
	movss	-32(%rbp), %xmm0
	mulss	-28(%rbp), %xmm0
	addss	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-8(%rbp), %xmm0
	movss	%xmm0, -32(%rbp)
	movss	-4(%rbp), %xmm0
	movss	%xmm0, -28(%rbp)
	addl	$1, -16(%rbp)
.L4:
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	movq	48(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L8
	jmp	.L7
.L13:
	nop
.L7:
	movl	-16(%rbp), %edx
	movq	-56(%rbp), %rax
	movq	56(%rax), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	testl	%eax, %eax
	jns	.L9
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$11, %edx
	movl	$1, %esi
	movl	$.LC3, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L9:
	addl	$1, -24(%rbp)
	movq	-56(%rbp), %rax
	movss	16(%rax), %xmm0
	movss	-40(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -40(%rbp)
.L3:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	movq	32(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L10
	addl	$1, -20(%rbp)
	movq	-56(%rbp), %rax
	movss	20(%rax), %xmm1
	movss	-36(%rbp), %xmm0
	subss	%xmm1, %xmm0
	movss	%xmm0, -36(%rbp)
.L2:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	movq	40(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L11
	movq	-56(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, %rdi
	call	fflush
	testl	%eax, %eax
	je	.L14
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$26, %edx
	movl	$1, %esi
	movl	$.LC4, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L14:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	generic_plot, .-generic_plot
	.section	.rodata
	.align 4
.LC2:
	.long	1082130432
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
