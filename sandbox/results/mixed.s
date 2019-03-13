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
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$100, %eax
	movl	%eax, -16(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$30, %ecx
	movl	%ecx, -20(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #REAL
#reg= %xmm0
	movsd	.L1, %xmm0
	movsd	%xmm0, -44(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CAST
	#ADD
	#CAST
	#ADD
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	-16(%ebp), %edx
	addl	-20(%ebp), %edx
	#END ADD
	cvtsi2sd	%edx, %xmm1
	#END CAST
	    #ID
	    #END ID
#register %edx is empty
	addsd	-44(%ebp), %xmm1
	#END ADD
	cvttsd2si	%xmm1, 
	#END CAST
#register %edx is empty
#reg= %edx
	movl	, %edx
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CAST
	#SUBTRACT
	#CAST
	#SUBTRACT
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -48(%ebp)
#reg= %eax
	movl	-16(%ebp), %eax
	subl	-20(%ebp), %eax
	#END SUBTRACT
	cvtsi2sd	%eax, %xmm2
	#END CAST
	    #ID
	    #END ID
	subsd	-44(%ebp), %xmm2
	#END SUBTRACT
	cvttsd2si	%xmm2, 
	#END CAST
#register %eax is empty
#reg= %eax
	movl	, %eax
	movl	%eax, -8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CAST
	#MULTIPLY
	#fp=true
	#CAST
	#MULTIPLY
	#fp=false
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -52(%ebp)
#reg= %eax
	movl	-16(%ebp), %eax
	imull	-20(%ebp), %eax
	#END MULTIPLY
	cvtsi2sd	%eax, %xmm3
	#END CAST
	    #ID
	    #END ID
	mulsd	-44(%ebp), %xmm3
	#END MULTIPLY
	cvttsd2si	%xmm3, 
	#END CAST
#register %eax is empty
#reg= %eax
	movl	, %eax
	movl	%eax, -12(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	#CAST
	#DIVIDE
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -56(%ebp)
#reg= %eax
	movl	-16(%ebp), %eax
	cltd
	idivl	-20(%ebp)
	#END DIVIDE
	cvtsi2sd	%eax, %xmm4
	#END CAST
	    #ID
	    #END ID
#register %eax is empty
	addsd	-44(%ebp), %xmm4
	#END ADD
	movsd	%xmm4, -28(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#SUBTRACT
	#CAST
	#REMAINDER
	    #ID
	    #END ID
	    #ID
	    #END ID
#reg= %eax
	movl	-16(%ebp), %eax
#temp=%ebx
	cltd
	idivl	-20(%ebp)
	#END REMAINDER
	cvtsi2sd	%edx, %xmm5
	#END CAST
	    #ID
	    #END ID
	subsd	-44(%ebp), %xmm5
	#END SUBTRACT
	movsd	%xmm5, -36(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%ecx, -60(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L2, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -64(%ebp)
	    #ID
	    #END ID
	pushl	-8(%ebp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L3, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -68(%ebp)
	    #ID
	    #END ID
	pushl	-12(%ebp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L4, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -72(%ebp)
	    #ID
	    #END ID
	movsd	-28(%ebp), %xmm6
	subl	$8, %esp
	movsd	%xmm6, (%esp)
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
	movl	%eax, -76(%ebp)
	    #ID
	    #END ID
	movsd	-36(%ebp), %xmm6
	subl	$8, %esp
	movsd	%xmm6, (%esp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L6, %eax
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
	.set	main.size, 76
	.globl	main
#GLOBALS
#STRINGS
.L2:	.asciz	"%d\n"
.L3:	.asciz	"%d\n"
.L4:	.asciz	"%d\n"
.L5:	.asciz	"%f\n"
.L6:	.asciz	"%f\n"
#REALS
.L1:	.double	2
