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
	movsd	.L1, %xmm0
#top
	movsd	%xmm0, c
#bot
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #REAL
	movsd	.L2, %xmm1
#top
	movsd	%xmm1, d
#bot
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#DIVIDE
	#MULTIPLY
	#MULTIPLY
	    #ID
	    #END ID
	    #ID
	    #END ID
	movsd	c, %xmm2
	mulsd	d, %xmm2
	#END MULTIPLY
	   #REAL
	mulsd	.L3, %xmm2
	#END MULTIPLY
	   #REAL
	movsd	%xmm2, %xmm3
	divsd	.L4, %xmm3
	#END DIVIDE
#top
	movsd	%xmm3, out
#bot
	  #END ASSIGNMENT
	#CALL
	    #ID
	    #END ID
	movsd	out, %xmm2
	subl	$8, %esp
	movsd	%xmm2, (%esp)
	    #ID
	    #END ID
	movsd	d, %xmm2
	subl	$8, %esp
	movsd	%xmm2, (%esp)
	    #ID
	    #END ID
	movsd	c, %xmm2
	subl	$8, %esp
	movsd	%xmm2, (%esp)
	#ADDRESS
	   #STRING
	leal	.L5, %eax
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
	movsd	c, %xmm2
	divsd	d, %xmm2
	#END DIVIDE
#top
	movsd	%xmm2, out
#bot
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -4(%ebp)
	    #ID
	    #END ID
	movsd	out, %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	    #ID
	    #END ID
	movsd	d, %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	    #ID
	    #END ID
	movsd	c, %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	#ADDRESS
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
.L5:	.asciz	"\n%f * %f * 234.345345 / 323 = %f\n"
.L6:	.asciz	"\n%f / %f = %f\n"
#REALS
.L1:	.double	2.2
.L2:	.double	2.0
.L3:	.double	234.345345
.L4:	.double	323
