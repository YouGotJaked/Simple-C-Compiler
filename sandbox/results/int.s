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
	movl	-4(%ebp), %eax
	addl	-8(%ebp), %eax
	#END ADD
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	addl	-12(%ebp), %eax
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
	movl	-4(%ebp), %ebx
	subl	-8(%ebp), %ebx
	#END SUBTRACT
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	subl	-12(%ebp), %ebx
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
	movl	-4(%ebp), %ecx
	imull	-8(%ebp), -4(%ebp)
	#END MULTIPLY
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	imull	-12(%ebp), 
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
	movl	-4(%ebp), %eax
	movl	-8(%ebp), %ecx
	movl	 %eax, %edx
	sarl	$31, %edx
	idivl	%ecx
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	addl	-12(%ebp), %eax
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
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	-8(%ebp), %ecx
	movl	 %eax, %edx
	sarl	$31, %edx
	idivl	%ecx
	#END REMAINDER
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	subl	-12(%ebp), %edx
	#END SUBTRACT
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	movl	, -32(%ebp)
	  #END ASSIGNMENT
	#CALL
	#ADDRESS
	   #STRING
	leal	.L1, %eax
	#END ADDRESS
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	movl	%edx, -8(%ebp)
	pushl	-16(%ebp)
	pushl	%edx
	call	printf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	movl	%eax, -12(%ebp)
	leal	.L2, %eax
	#END ADDRESS
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
	pushl	-20(%ebp)
	pushl	%eax
	call	printf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	movl	%eax, -16(%ebp)
	leal	.L3, %eax
	#END ADDRESS
	    #ID
	    #_operand = -24(%ebp)
	    #END ID
	pushl	-24(%ebp)
	pushl	%eax
	call	printf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	movl	%eax, -20(%ebp)
	leal	.L4, %eax
	#END ADDRESS
	    #ID
	    #_operand = -28(%ebp)
	    #END ID
	pushl	-28(%ebp)
	pushl	%eax
	call	printf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	movl	%eax, -24(%ebp)
	leal	.L5, %eax
	#END ADDRESS
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	pushl	-32(%ebp)
	pushl	%eax
	call	printf
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
#STRINGS
.L1:	.asciz	"%d\n"
.L2:	.asciz	"%d\n"
.L3:	.asciz	"%d\n"
.L4:	.asciz	"%d\n"
.L5:	.asciz	"%d\n"
