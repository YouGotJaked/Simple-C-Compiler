#FUNCTION
	#PROLOGUE
main:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$main.size, %esp
	#BODY
	 #BLOCK
	#CALL
	#ADDRESS
	   #STRING
	leal	.L1, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$4, %esp
	#END CALL
.L0:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	main.size, 0
	.globl	main
#GLOBALS
#STRINGS
.L1:	.asciz	"hello world\n"
#REALS
