	.file	"test.c"
	.comm	global,4,4
	.comm	arr,40,32
	.comm	pp,8,8
	.comm	d,16,16
	.section	.rodata
.LC0:
	.string	"d=%lu bytes\ni=%lu bytes\n"
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
	subq	$32, %rsp
	movsbq	-1(%rbp), %rax
	leaq	-32(%rbp), %rdx
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movsbq	-1(%rbp), %rax
	negq	%rax
	addq	%rax, -16(%rbp)
	movl	$4, %edx
	movl	$8, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-36)"
	.section	.note.GNU-stack,"",@progbits
