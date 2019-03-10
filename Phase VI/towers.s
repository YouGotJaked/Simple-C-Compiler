_towers:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	20(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	_call_towers
	addl	$16, %esp
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	12(%ebp)
	call	_print_move
	addl	$16, %esp
	pushl	12(%ebp)
	pushl	16(%ebp)
	pushl	20(%ebp)
	pushl	8(%ebp)
	call	_call_towers
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_towers

_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	$3, -4(%ebp)
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_print
	addl	$16, %esp
	pushl	$3
	pushl	$2
	pushl	$1
	pushl	-4(%ebp)
	call	_towers
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_main

