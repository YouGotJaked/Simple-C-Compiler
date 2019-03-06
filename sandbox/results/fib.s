#GLOBALS
#FUNCTION
.globl fib
	#PROLOGUE
fib:
.L0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	#IF
	#END IF
	#RETURN
	#ADD
	#CALL
	#SUBTRACT
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	#expr != nullptr
	#expr = 8(%ebp)
	movl	8(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	subl	$1, %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END SUBTRACT
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%eax
	call	fib
	#END CALL
	#CALL
	#SUBTRACT
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $2
	   #END INT
	#LOAD
	#expr != nullptr
	#expr = 8(%ebp)
	movl	8(%ebp), %ebx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	subl	$2, %ebx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END SUBTRACT
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%ebx
	call	fib
	#END CALL
	#LOAD
	#expr != nullptr
	#expr = 
	movl	, %ecx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	, %ecx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	#LOAD
	#expr != nullptr
	#expr = %ecx
	movl	%ecx, %eax
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
#FUNCTION
.globl main
	#PROLOGUE
main:
.L1:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	#BODY
	 #BLOCK
	#CALL
	#ADDRESS
	   #STRING
	#ASSIGN
	#END ASSIGN
	leal	.L2, %eax
	#END ADDRESS
	#ADDRESS
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	#ASSIGN
	#END ASSIGN
	leal	-4(%ebp), %eax
	#END ADDRESS
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
	pushl	%edx
	pushl	%ecx
	call	scanf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	#LOAD
	#reg->_node != expr
	movl	%eax, -8(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#ASSIGN
	#END ASSIGN
	leal	.L3, %eax
	#END ADDRESS
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	-4(%ebp)
	call	fib
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
	pushl	%eax
	call	printf
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
.L2:	.asciz	"%d"
.L3:	.asciz	"%d\n"
