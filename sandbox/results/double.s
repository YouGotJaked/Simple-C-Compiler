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
	    #ID
	    #END ID
	   #REAL
#reg= %xmm0
	movsd	.L1, %xmm0
	movsd	%xmm0, -8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #REAL
#reg= %xmm1
	movsd	.L2, %xmm1
	movsd	%xmm1, -16(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #REAL
#reg= %xmm2
	movsd	.L3, %xmm2
	movsd	%xmm2, -24(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	#ADD
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %eax is empty
#reg= %eax
	movsd	-8(%ebp), %eax
	addsd	-16(%ebp), %eax
	#END ADD
	    #ID
	    #END ID
#register %ecx is empty
	addsd	-24(%ebp), %eax
	#END ADD
	movsd	%eax, -32(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#SUBTRACT
	#SUBTRACT
	    #ID
	    #END ID
	    #ID
	    #END ID
#reg= %xmm3
	movsd	-8(%ebp), %xmm3
	subsd	-16(%ebp), %xmm3
	#END SUBTRACT
	    #ID
	    #END ID
	subsd	-24(%ebp), %xmm3
	#END SUBTRACT
	movsd	%xmm3, -40(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#MULTIPLY
	#fp=true
	#MULTIPLY
	#fp=true
	    #ID
	    #END ID
	    #ID
	    #END ID
#reg= %xmm4
	movsd	-8(%ebp), %xmm4
	mulsd	-16(%ebp), %xmm4
	#END MULTIPLY
	    #ID
	    #END ID
	mulsd	-24(%ebp), %xmm4
	#END MULTIPLY
	movsd	%xmm4, -48(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	#DIVIDE
	    #ID
	    #END ID
	    #ID
	    #END ID
	movsd	%eax, -72(%ebp)
#reg= %eax
	movsd	-8(%ebp), %eax
	cqto
	idivq	-16(%ebp)
	#END DIVIDE
	    #ID
	    #END ID
#register %ecx is empty
	addsd	-24(%ebp), %eax
	#END ADD
	movsd	%eax, -56(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#SUBTRACT
	#DIVIDE
	    #ID
	    #END ID
	    #ID
	    #END ID
	movsd	%eax, -80(%ebp)
#reg= %eax
	movsd	-8(%ebp), %eax
	cqto
	idivq	-16(%ebp)
	#END DIVIDE
	    #ID
	    #END ID
	subsd	-24(%ebp), %eax
	#END SUBTRACT
	movsd	%eax, -64(%ebp)
	  #END ASSIGNMENT
	#CALL
	movsd	%eax, -88(%ebp)
	    #ID
	    #END ID
	movsd	-32(%ebp), %xmm5
	subl	$8, %esp
	movsd	%xmm5, (%esp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L4, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	movl	%eax, -92(%ebp)
	    #ID
	    #END ID
	movsd	-40(%ebp), %xmm5
	subl	$8, %esp
	movsd	%xmm5, (%esp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L5, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	movl	%eax, -96(%ebp)
	    #ID
	    #END ID
	movsd	-48(%ebp), %xmm5
	subl	$8, %esp
	movsd	%xmm5, (%esp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L6, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	movl	%eax, -100(%ebp)
	    #ID
	    #END ID
	movsd	-56(%ebp), %xmm5
	subl	$8, %esp
	movsd	%xmm5, (%esp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L7, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	movl	%eax, -104(%ebp)
	    #ID
	    #END ID
	movsd	-64(%ebp), %xmm5
	subl	$8, %esp
	movsd	%xmm5, (%esp)
	#ADDRESS
	   #STRING
#register %eax is empty
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
	.set	main.size, 104
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
