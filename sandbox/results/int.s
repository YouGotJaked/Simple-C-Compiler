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
#before 
	    #ID
	    #END ID
#after -4(%ebp)
	   #INT
	   #END INT
	movl	$100, %ebx
	movl	%ebx, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -8(%ebp)
	   #INT
	   #END INT
	movl	$30, %esi
	movl	%esi, -8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -12(%ebp)
	   #INT
	   #END INT
	movl	$2, %edi
	movl	%edi, -12(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -16(%ebp)
	#ADD
	#ADD
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	-4(%ebp), %eax
	addl	-8(%ebp), %eax
	#END ADD
	    #ID
	    #END ID
	addl	-12(%ebp), %eax
	#END ADD
	movl	%eax, -16(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -20(%ebp)
	#SUBTRACT
	#SUBTRACT
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	-4(%ebp), %ecx
	subl	-8(%ebp), %ecx
	#END SUBTRACT
	    #ID
	    #END ID
	subl	-12(%ebp), %ecx
	#END SUBTRACT
	movl	%ecx, -20(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -24(%ebp)
	#MULTIPLY
	#MULTIPLY
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	-4(%ebp), %edx
	imull	-8(%ebp), %edx
	#END MULTIPLY
	    #ID
	    #END ID
	imull	-12(%ebp), %edx
	#END MULTIPLY
	movl	%edx, -24(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -28(%ebp)
	#ADD
	#DIVIDE
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -36(%ebp)
	movl	-4(%ebp), %eax
	cltd
	idivl	-8(%ebp)
	#END DIVIDE
	    #ID
	    #END ID
	addl	-12(%ebp), %eax
	#END ADD
	movl	%eax, -28(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -32(%ebp)
	#SUBTRACT
	#REMAINDER
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -40(%ebp)
	movl	-4(%ebp), %eax
	cltd
	idivl	-8(%ebp)
	#END REMAINDER
	    #ID
	    #END ID
	subl	-12(%ebp), %edx
	#END SUBTRACT
	movl	%edx, -32(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%ecx, -44(%ebp)
	movl	%edx, -48(%ebp)
	    #ID
	    #END ID
	pushl	-16(%ebp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L1, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -52(%ebp)
	    #ID
	    #END ID
	pushl	-20(%ebp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L2, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -56(%ebp)
	    #ID
	    #END ID
	pushl	-24(%ebp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L3, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -60(%ebp)
	    #ID
	    #END ID
	pushl	-28(%ebp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L4, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -64(%ebp)
	    #ID
	    #END ID
	pushl	-32(%ebp)
	#ADDRESS
	#operand = 
	   #STRING
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
	.set	main.size, 64
	.globl	main
#GLOBALS
#STRINGS
.L1:	.asciz	"%d\n"
.L2:	.asciz	"%d\n"
.L3:	.asciz	"%d\n"
.L4:	.asciz	"%d\n"
.L5:	.asciz	"%d\n"
#REALS
