#FUNCTION
	#PROLOGUE
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$main.size, %esp
	#BODY
	 #BLOCK
	#CALL
	#ADDRESS
	   #STRING
	leal	.L1, %eax
	#END ADDRESS
	pushl	%eax
	movl	$0, %eax
	call	printf
	addl	$4, %esp
	#END CALL
.L0:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	pop	%ebp
	ret
	.set	main.size, 0
	.globl	main
#GLOBALS
#STRINGS
.L1:	.asciz	"hello world\n"
