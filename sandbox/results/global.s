#FUNCTION
.globl foo
	#PROLOGUE
foo:
.L0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = x
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	movl	x, %eax
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = x
	    #END ID
	movl	, x
	  #END ASSIGNMENT
	#RETURN
	#ADD
	    #ID
	    #_operand = x
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	movl	x, %ebx
	addl	$1, %ebx
	#END ADD
	movl	%ebx, %eax
	#END RETURN
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#FUNCTION
.globl main
	#PROLOGUE
main:
.L1:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $65
	   #END INT
	    #ID
	    #_operand = x
	    #END ID
	movl	$65, x
	  #END ASSIGNMENT
	#CALL
	    #ID
	    #_operand = x
	    #END ID
	movl	%eax, -4(%ebp)
	pushl	x
	call	putchar
	#END CALL
	#CALL
	#CALL
	call	foo
	#END CALL
	pushl	
	call	putchar
	#END CALL
	#CALL
	    #ID
	    #_operand = x
	    #END ID
	pushl	x
	call	putchar
	#END CALL
	#CALL
	   #INT
	   #_operand = $10
	   #END INT
	pushl	$10
	call	putchar
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
	.comm	x, 4
#STRINGS
