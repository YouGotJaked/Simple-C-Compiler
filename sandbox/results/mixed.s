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
	   #INT
	   #_operand = $100
	   #END INT
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	movl	$100, -16(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $30
	   #END INT
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
	movl	$30, -20(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #REAL
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	movsd	2, -32(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CAST
	#ADD
	#CAST
	#ADD
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
#reg %eax is empty
	#LOAD
	movl	-16(%ebp), %eax
	#END LOAD
	addl	-20(%ebp), %eax
	#END ADD
#reg %ebx is empty
	movslsd	%eax, %ebx
	#END CAST
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	addsd	-32(%ebp), %ebx
	#END ADD
	#END CAST
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%ebx, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CAST
	#SUBTRACT
	#CAST
	#SUBTRACT
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
#reg %ecx is empty
	#LOAD
	movl	-16(%ebp), %ecx
	#END LOAD
	subl	-20(%ebp), %ecx
	#END SUBTRACT
#reg %edx is empty
	movslsd	%ecx, %edx
	#END CAST
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	subsd	-32(%ebp), %edx
	#END SUBTRACT
	#END CAST
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	%edx, -8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CAST
	#MULTIPLY
	#CAST
	#MULTIPLY
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -36(%ebp)
	#END LOAD
	#LOAD
	movl	-16(%ebp), %eax
	#END LOAD
	imull	-20(%ebp), %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -40(%ebp)
	#END LOAD
	movslsd	-40(%ebp), %eax
	#END CAST
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	imulsd	-32(%ebp), %eax
	#END MULTIPLY
	#END CAST
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	movl	%eax, -12(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	#CAST
	#DIVIDE
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
	#LOAD
	movl	-16(%ebp), %eax
	#END LOAD
	cltd
	idivl	-20(%ebp)
	#END DIVIDE
	#LOAD
	movl	%eax, -44(%ebp)
	#END LOAD
	movslsd	%eax, %eax
	#END CAST
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	addsd	-32(%ebp), %eax
	#END ADD
	    #ID
	    #_operand = -24(%ebp)
	    #END ID
	movsd	%eax, -24(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#SUBTRACT
	#CAST
	#REMAINDER
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -48(%ebp)
	movl	-16(%ebp), %eax
	#END LOAD
#temp=%ebx
	cltd
	idivl	-20(%ebp)
	#END REMAINDER
	#LOAD
	movsd	%eax, -56(%ebp)
	#END LOAD
	movslsd	%edx, %eax
	#END CAST
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	subsd	-32(%ebp), %eax
	#END SUBTRACT
	    #ID
	    #_operand = -28(%ebp)
	    #END ID
	movsd	%eax, -28(%ebp)
	  #END ASSIGNMENT
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	movl	%edx, -60(%ebp)
	#END LOAD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	#ADDRESS
	   #STRING
	#LOAD
	movsd	%eax, -68(%ebp)
	#END LOAD
	leal	.L1, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
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
	    #_operand = -8(%ebp)
	    #END ID
	pushl	-8(%ebp)
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -72(%ebp)
	#END LOAD
	leal	.L2, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
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
	    #_operand = -12(%ebp)
	    #END ID
	pushl	-12(%ebp)
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -76(%ebp)
	#END LOAD
	leal	.L3, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
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
	#LOAD
	movl	%eax, -80(%ebp)
	#END LOAD
	leal	.L4, %eax
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
	    #_operand = -28(%ebp)
	    #END ID
	pushl	-28(%ebp)
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -84(%ebp)
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
	.set	main.size, 84
	.globl	main
#GLOBALS
#STRINGS
.L1:	.asciz	"%d\n"
.L2:	.asciz	"%d\n"
.L3:	.asciz	"%d\n"
.L4:	.asciz	"%f\n"
.L5:	.asciz	"%f\n"
