#GLOBALS
	.comm	x, 4
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
	#LOAD
	#expr != nullptr
	#expr = x
	movl	x, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	$1, %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
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
	#LOAD
	#expr != nullptr
	#expr = x
	movl	x, %ebx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	$1, %ebx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	#LOAD
	#expr != nullptr
	#expr = %ebx
	movl	%ebx, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#END RETURN
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
	.comm	x, 4
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
	#LOAD
	#reg->_node != expr
	movl	%eax, -4(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	x
	call	putchar
	#END CALL
	#CALL
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	call	foo
	#END CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	
	call	putchar
	#END CALL
	#CALL
	    #ID
	    #_operand = x
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	x
	call	putchar
	#END CALL
	#CALL
	   #INT
	   #_operand = $10
	   #END INT
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	$10
	call	putchar
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
