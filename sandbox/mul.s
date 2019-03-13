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
#calling getFPReg
	movsd	.L1, %xmm0
	movsd	%xmm0, c
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #REAL
#calling getFPReg
	movsd	.L2, %xmm1
	movsd	%xmm1, d
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#MULTIPLY
	    #ID
	    #END ID
	    #ID
	    #END ID
#calling getFPReg
	movsd	c, %xmm2
	mulsd	d, %xmm2
	#END MULTIPLY
	movsd	%xmm2, out
	  #END ASSIGNMENT
	#CALL
	    #ID
	    #END ID
#calling getFPReg
	movsd	out, %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	    #ID
	    #END ID
#calling getFPReg
	movsd	d, %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	    #ID
	    #END ID
#calling getFPReg
	movsd	c, %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L3, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$28, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#DIVIDE
	    #ID
	    #END ID
	    #ID
	    #END ID
#calling getFPReg
	movsd	c, %xmm3
	divsd	d, %xmm3
	#END DIVIDE
	movsd	%xmm3, out
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -4(%ebp)
	    #ID
	    #END ID
#calling getFPReg
	movsd	out, %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	    #ID
	    #END ID
#calling getFPReg
	movsd	d, %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	    #ID
	    #END ID
#calling getFPReg
	movsd	c, %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L4, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$28, %esp
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
	.set	main.size, 4
	.globl	main
#GLOBALS
	.comm	c, 8
	.comm	d, 8
	.comm	out, 8
#STRINGS
.L3:	.asciz	"\n%f * %f = %f\n"
.L4:	.asciz	"\n%f / %f = %f\n"
#REALS
.L1:	.double	2.2
.L2:	.double	2.0
