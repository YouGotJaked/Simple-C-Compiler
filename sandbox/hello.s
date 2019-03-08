#FUNCTION
.globl main
	#PROLOGUE
main:
.L0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
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
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
#STRINGS
.L1:	.asciz	"hello world\n"
