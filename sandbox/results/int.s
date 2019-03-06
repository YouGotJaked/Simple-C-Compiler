#GLOBALS
#FUNCTION
.globl main
	#PROLOGUE
main:
.L0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $100
	   #END INT
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	$100, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $30
	   #END INT
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	$30, -8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $2
	   #END INT
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	movl	$2, -12(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	-8(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	addl	-12(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	movl	, -16(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#SUBTRACT
	#SUBTRACT
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %ebx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	subl	-8(%ebp), %ebx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END SUBTRACT
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	subl	-12(%ebp), %ebx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END SUBTRACT
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
	movl	, -20(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#MULTIPLY
	#MULTIPLY
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %ecx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	-8(%ebp), -4(%ebp)
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	imull	-12(%ebp), 
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	    #ID
	    #_operand = -24(%ebp)
	    #END ID
	movl	, -24(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	#DIVIDE
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = -8(%ebp)
	movl	-8(%ebp), %ecx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#END LOAD
	movl	 %eax, %edx
	sarl	$31, %edx
	idivl	%ecx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	addl	-12(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	    #ID
	    #_operand = -28(%ebp)
	    #END ID
	movl	, -28(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#SUBTRACT
	#REMAINDER
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	#reg->_node != expr
	movl	%eax, -4(%ebp)
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = -8(%ebp)
	movl	-8(%ebp), %ecx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#END LOAD
	movl	 %eax, %edx
	sarl	$31, %edx
	idivl	%ecx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END REMAINDER
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	subl	-12(%ebp), %edx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END SUBTRACT
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	movl	, -32(%ebp)
	  #END ASSIGNMENT
	#CALL
	#ADDRESS
	   #STRING
	#ASSIGN
	#END ASSIGN
	leal	.L1, %eax
	#END ADDRESS
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#reg->_node != expr
	movl	%edx, -8(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	pushl	-16(%ebp)
	pushl	%edx
	call	printf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	#ASSIGN
	#END ASSIGN
	#LOAD
	#reg->_node != expr
	movl	%eax, -12(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#ASSIGN
	#END ASSIGN
	leal	.L2, %eax
	#END ADDRESS
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	-20(%ebp)
	pushl	%eax
	call	printf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	#LOAD
	#reg->_node != expr
	movl	%eax, -16(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#ASSIGN
	#END ASSIGN
	leal	.L3, %eax
	#END ADDRESS
	    #ID
	    #_operand = -24(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	-24(%ebp)
	pushl	%eax
	call	printf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	#LOAD
	#reg->_node != expr
	movl	%eax, -20(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#ASSIGN
	#END ASSIGN
	leal	.L4, %eax
	#END ADDRESS
	    #ID
	    #_operand = -28(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	-28(%ebp)
	pushl	%eax
	call	printf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	#LOAD
	#reg->_node != expr
	movl	%eax, -24(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#ASSIGN
	#END ASSIGN
	leal	.L5, %eax
	#END ADDRESS
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	-32(%ebp)
	pushl	%eax
	call	printf
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
.L1:	.asciz	"%d\n"
.L2:	.asciz	"%d\n"
.L3:	.asciz	"%d\n"
.L4:	.asciz	"%d\n"
.L5:	.asciz	"%d\n"
