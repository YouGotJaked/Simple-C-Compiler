	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	L_.str(%rip), %rdi
	movl	$8, %eax
	movl	%eax, %esi
	movl	$4, %eax
	movl	%eax, %edx
	xorl	%eax, %eax
	movl	%eax, %ecx
	leaq	-6(%rbp), %r8
	movsbl	-1(%rbp), %eax
	movslq	%eax, %r9
	addq	%r9, %r8
	movq	%r8, -16(%rbp)
	movq	-16(%rbp), %r8
	movsbl	-1(%rbp), %eax
	movslq	%eax, %r9
	subq	%r9, %rcx
	addq	%rcx, %r8
	movq	%r8, -16(%rbp)
	movb	$0, %al
	callq	_printf
	xorl	%r10d, %r10d
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	movl	%r10d, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"d=%lu bytes\ni=%lu bytes\n"

	.comm	_global,4,2             ## @global

.subsections_via_symbols
