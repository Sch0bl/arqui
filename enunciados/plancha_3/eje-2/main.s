	.file	"main.c"
	.text
	.section	.rodata
.LC4:
	.string	"No hay soluci\303\263n."
.LC5:
	.string	"X = %f, y = %f \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movss	.LC0(%rip), %xmm5
	movss	.LC1(%rip), %xmm4
	pxor	%xmm3, %xmm3
	movss	.LC3(%rip), %xmm2
	pxor	%xmm1, %xmm1
	movl	.LC1(%rip), %eax
	movd	%eax, %xmm0
	call	solve@PLT
	testl	%eax, %eax
	je	.L2
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	-8(%rbp), %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movq	-16(%rbp), %rax
	movss	(%rax), %xmm1
	pxor	%xmm6, %xmm6
	cvtss2sd	%xmm1, %xmm6
	movq	%xmm6, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$2, %eax
	call	printf@PLT
	movl	$0, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1071225242
	.align 4
.LC1:
	.long	1065353216
	.align 4
.LC3:
	.long	1069547520
	.ident	"GCC: (GNU) 13.1.1 20230714"
	.section	.note.GNU-stack,"",@progbits
