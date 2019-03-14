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
	    #offset=0
	    #END ID
#after c
	   #REAL
	movsd	.L1, %xmm0
	movsd	%xmm0, c
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after d
	   #REAL
	movsd	.L2, %xmm1
	movsd	%xmm1, d
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after out
	#MULTIPLY
	#MULTIPLY
	#MULTIPLY
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movsd	c, %xmm2
	mulsd	d, %xmm2
	#END MULTIPLY
	   #REAL
	mulsd	.L3, %xmm2
	#END MULTIPLY
	   #REAL
	mulsd	.L4, %xmm2
	#END MULTIPLY
	movsd	%xmm2, out
	  #END ASSIGNMENT
	#CALL
	    #ID
	    #offset=0
	    #END ID
	movsd	out, %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	    #ID
	    #offset=0
	    #END ID
	movsd	d, %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	    #ID
	    #offset=0
	    #END ID
	movsd	c, %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L5, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$28, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after out
	#DIVIDE
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movsd	c, %xmm3
	divsd	d, %xmm3
	#END DIVIDE
	movsd	%xmm3, out
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	movsd	out, %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	    #ID
	    #offset=0
	    #END ID
	movsd	d, %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	    #ID
	    #offset=0
	    #END ID
	movsd	c, %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L6, %eax
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
.L5:	.asciz	"\n%f * %f = %f\n"
.L6:	.asciz	"\n%f / %f = %f\n"
#REALS
.L1:	.double	2.2
.L2:	.double	2.0
.L3:	.double	234.345345
.L4:	.double	323
