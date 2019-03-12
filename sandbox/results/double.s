#FUNCTION
	#PROLOGUE
main:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$main.size, %esp
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
	#LOAD
	movsd	-4(%ebp), 
	#END LOAD
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
	#LOAD
	movsd	-4(%ebp), 
	#END LOAD
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
	#LOAD
	movsd	-4(%ebp), 
	#END LOAD
	imulsd	-8(%ebp), 
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
	#LOAD
	movsd	-4(%ebp), %eax
	#END LOAD
	cqto
	idivq	-8(%ebp)
	#END DIVIDE
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	addsd	-12(%ebp), %eax
	#END ADD
	    #ID
	    #_operand = -28(%ebp)
	    #END ID
	movsd	%eax, -28(%ebp)
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
	#LOAD
	movsd	%eax, -40(%ebp)
	movsd	-4(%ebp), %eax
	#END LOAD
	cqto
	idivq	-8(%ebp)
	#END DIVIDE
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	subsd	-12(%ebp), %eax
	#END SUBTRACT
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	movsd	%eax, -32(%ebp)
	  #END ASSIGNMENT
	#CALL
	#LOAD
	movsd	%eax, -48(%ebp)
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	pushl	-16(%ebp)
	#ADDRESS
	   #STRING
#reg %eax is empty
	leal	.L1, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
	pushl	-20(%ebp)
	#ADDRESS
	   #STRING
#reg %ebx is empty
	leal	.L2, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = -24(%ebp)
	    #END ID
	pushl	-24(%ebp)
	#ADDRESS
	   #STRING
#reg %ecx is empty
	leal	.L3, %ecx
	#END ADDRESS
	pushl	%ecx
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = -28(%ebp)
	    #END ID
	pushl	-28(%ebp)
	#ADDRESS
	   #STRING
#reg %edx is empty
	leal	.L4, %edx
	#END ADDRESS
	pushl	%edx
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	pushl	-32(%ebp)
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -52(%ebp)
	#END LOAD
	leal	.L5, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
.L0:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	main.size, 52
	.globl	main
#GLOBALS
#STRINGS
.L1:	.asciz	"%f\n"
.L2:	.asciz	"%f\n"
.L3:	.asciz	"%f\n"
.L4:	.asciz	"%f\n"
.L5:	.asciz	"%f\n"
