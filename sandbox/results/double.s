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
	   #REAL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movsd	100, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #REAL
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movsd	30, -8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #REAL
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	movsd	2, -12(%ebp)
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
	movsd	-4(%ebp), 
	addsd	-8(%ebp), 
	#END ADD
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	addsd	-12(%ebp), 
	#END ADD
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	movsd	, -16(%ebp)
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
	movsd	-4(%ebp), 
	subsd	-8(%ebp), 
	#END SUBTRACT
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	subsd	-12(%ebp), 
	#END SUBTRACT
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
	movsd	, -20(%ebp)
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
	movsd	-4(%ebp), 
	imulsd	-8(%ebp), -4(%ebp)
	#END MULTIPLY
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	imulsd	-12(%ebp), 
	#END MULTIPLY
	    #ID
	    #_operand = -24(%ebp)
	    #END ID
	movsd	, -24(%ebp)
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
	movsd	-4(%ebp), %eax
	movsd	-8(%ebp), %ecx
	movl	 %eax, %edx
	sarl	$31, %edx
	idivl	%ecx
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	addsd	-12(%ebp), %eax
	#END ADD
	    #ID
	    #_operand = -28(%ebp)
	    #END ID
	movsd	, -28(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#SUBTRACT
	#DIVIDE
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movsd	%eax, -8(%ebp)
	movsd	-4(%ebp), %eax
	movsd	-8(%ebp), %ecx
	movl	 %eax, %edx
	sarl	$31, %edx
	idivl	%ecx
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	subsd	-12(%ebp), %eax
	#END SUBTRACT
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	movsd	, -32(%ebp)
	  #END ASSIGNMENT
	#CALL
	#ADDRESS
	   #STRING
	leal	.L1, %eax
	#END ADDRESS
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	movsd	%eax, -16(%ebp)
	pushsd	-16(%ebp)
	pushl	%eax
	call	printf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	leal	.L2, %eax
	#END ADDRESS
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
	pushsd	-20(%ebp)
	pushl	%ebx
	call	printf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	leal	.L3, %eax
	#END ADDRESS
	    #ID
	    #_operand = -24(%ebp)
	    #END ID
	pushsd	-24(%ebp)
	pushl	%ecx
	call	printf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	leal	.L4, %eax
	#END ADDRESS
	    #ID
	    #_operand = -28(%ebp)
	    #END ID
	pushsd	-28(%ebp)
	pushl	%edx
	call	printf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	movl	%eax, -20(%ebp)
	leal	.L5, %eax
	#END ADDRESS
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	pushsd	-32(%ebp)
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
.L1:	.asciz	"%f\n"
.L2:	.asciz	"%f\n"
.L3:	.asciz	"%f\n"
.L4:	.asciz	"%f\n"
.L5:	.asciz	"%f\n"
