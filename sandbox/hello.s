#GLOBALS
#FUNCTION
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
		#getreg=%eax
	leal	.L0, %eax
	#ADDRESS DONE
	pushl	%eax
	call	printf
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
.L0:	.asciz	"hello world\n"
