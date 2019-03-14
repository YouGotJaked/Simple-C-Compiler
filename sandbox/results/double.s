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
#after -8(%ebp)
	   #REAL
	movsd	.L1, %xmm0
	movsd	%xmm0, -8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -16(%ebp)
	   #REAL
	movsd	.L2, %xmm1
	movsd	%xmm1, -16(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -24(%ebp)
	   #REAL
	movsd	.L3, %xmm2
	movsd	%xmm2, -24(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -32(%ebp)
	#ADD
	#ADD
	    #ID
	    #END ID
	    #ID
	    #END ID
	movsd	-8(%ebp), %xmm3
	addsd	-16(%ebp), %xmm3
	#END ADD
	    #ID
	    #END ID
	addsd	-24(%ebp), %xmm3
	#END ADD
	movsd	%xmm3, -32(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -40(%ebp)
	#SUBTRACT
	#SUBTRACT
	    #ID
	    #END ID
	    #ID
	    #END ID
	movsd	-8(%ebp), %xmm4
	subsd	-16(%ebp), %xmm4
	#END SUBTRACT
	    #ID
	    #END ID
	subsd	-24(%ebp), %xmm4
	#END SUBTRACT
	movsd	%xmm4, -40(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -48(%ebp)
	#MULTIPLY
	#MULTIPLY
	    #ID
	    #END ID
	    #ID
	    #END ID
	movsd	-8(%ebp), %xmm5
	mulsd	-16(%ebp), %xmm5
	#END MULTIPLY
	    #ID
	    #END ID
	mulsd	-24(%ebp), %xmm5
	#END MULTIPLY
	movsd	%xmm5, -48(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -56(%ebp)
	#ADD
	#DIVIDE
	    #ID
	    #END ID
	    #ID
	    #END ID
	movsd	-8(%ebp), %xmm6
	divsd	-16(%ebp), %xmm6
	#END DIVIDE
	    #ID
	    #END ID
	addsd	-24(%ebp), %xmm6
	#END ADD
	movsd	%xmm6, -56(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -64(%ebp)
	#SUBTRACT
	#DIVIDE
	    #ID
	    #END ID
	    #ID
	    #END ID
	movsd	-8(%ebp), %xmm7
	divsd	-16(%ebp), %xmm7
	#END DIVIDE
	    #ID
	    #END ID
	subsd	-24(%ebp), %xmm7
	#END SUBTRACT
	movsd	%xmm7, -64(%ebp)
	  #END ASSIGNMENT
	#CALL
	    #ID
	    #END ID
	movsd	%xmm0, -72(%ebp)
	movsd	-32(%ebp), %xmm0
	subl	$8, %esp
	movsd	%xmm0, (%esp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L4, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	movl	%eax, -76(%ebp)
	    #ID
	    #END ID
	movsd	-40(%ebp), %xmm0
	subl	$8, %esp
	movsd	%xmm0, (%esp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L5, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	movl	%eax, -80(%ebp)
	    #ID
	    #END ID
	movsd	-48(%ebp), %xmm0
	subl	$8, %esp
	movsd	%xmm0, (%esp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L6, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	movl	%eax, -84(%ebp)
	    #ID
	    #END ID
	movsd	-56(%ebp), %xmm0
	subl	$8, %esp
	movsd	%xmm0, (%esp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L7, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	movl	%eax, -88(%ebp)
	    #ID
	    #END ID
	movsd	-64(%ebp), %xmm0
	subl	$8, %esp
	movsd	%xmm0, (%esp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L8, %eax
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
	.set	main.size, 88
	.globl	main
#GLOBALS
#STRINGS
.L4:	.asciz	"%f\n"
.L5:	.asciz	"%f\n"
.L6:	.asciz	"%f\n"
.L7:	.asciz	"%f\n"
.L8:	.asciz	"%f\n"
#REALS
.L1:	.double	100
.L2:	.double	30
.L3:	.double	2
