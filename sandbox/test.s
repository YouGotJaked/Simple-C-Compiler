#GLOBALS
	.comm	a, 4
	.comm	b, 4
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
	#RETURN
	   #INT
	   #_operand = $0
	   #END INT
	#LOAD
	#expr != nullptr
	#expr = $0
	movl	$0, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#END RETURN
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
