#GLOBALS
#FUNCTION
#here
#here
.globl main
	#PROLOGUE
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	#CALL
	#ADDRESS
	   #STRING
	leal	0x65ade0, %eax
	pushl	0x65aeb0
	call	printf
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
.L0:	.asciz	"hello world\n"
