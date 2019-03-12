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
#reg %eax is empty
	#LOAD
	movl	-4(%ebp), %eax
	#END LOAD
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
	movl	%eax, -16(%ebp)
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
#reg %ebx is empty
	#LOAD
	movl	-4(%ebp), %ebx
	#END LOAD
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
	movl	%ebx, -20(%ebp)
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
#reg %ecx is empty
	#LOAD
	movl	-4(%ebp), %ecx
	#END LOAD
	imull	-8(%ebp), %ecx
	#END MULTIPLY
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	imull	-12(%ebp), %ecx
	#END MULTIPLY
	    #ID
	    #_operand = -24(%ebp)
	    #END ID
	movl	%ecx, -24(%ebp)
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
	movl	-4(%ebp), %eax
	#END LOAD
	cltd
	idivl	-8(%ebp)
	#END DIVIDE
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	addl	-12(%ebp), %eax
	#END ADD
	    #ID
	    #_operand = -28(%ebp)
	    #END ID
	movl	%eax, -28(%ebp)
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
	movl	%eax, -36(%ebp)
	movl	-4(%ebp), %eax
	#END LOAD
#temp=%ebx
	cltd
	idivl	-8(%ebp)
	#END REMAINDER
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	subl	-12(%ebp), %edx
	#END SUBTRACT
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	movl	%edx, -32(%ebp)
	  #END ASSIGNMENT
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	movl	%edx, -40(%ebp)
	#END LOAD
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	pushl	-16(%ebp)
	#ADDRESS
	   #STRING
#reg %edx is empty
	leal	.L1, %edx
	#END ADDRESS
	pushl	%edx
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
	    #_operand = -20(%ebp)
	    #END ID
	pushl	-20(%ebp)
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -44(%ebp)
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
	    #_operand = -24(%ebp)
	    #END ID
	pushl	-24(%ebp)
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -48(%ebp)
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
	    #_operand = -28(%ebp)
	    #END ID
	pushl	-28(%ebp)
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -52(%ebp)
	#END LOAD
	leal	.L4, %eax
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
	    #_operand = -32(%ebp)
	    #END ID
	pushl	-32(%ebp)
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -56(%ebp)
	#END LOAD
	leal	.L5, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
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
	.set	main.size, 56
	.globl	main
#GLOBALS
#STRINGS
.L1:	.asciz	"%d\n"
.L2:	.asciz	"%d\n"
.L3:	.asciz	"%d\n"
.L4:	.asciz	"%d\n"
.L5:	.asciz	"%d\n"
