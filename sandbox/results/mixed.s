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
	movl	$100, %eax
	movl	%eax, -16(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$30, %ecx
	movl	%ecx, -20(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #REAL
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
	movl	-16(%ebp), %edx
	addl	-20(%ebp), %edx
	#END ADD
	#LONG TO FP
	cvtsi2sd	%edx, %xmm1
	#END CAST
	    #ID
	    #END ID
	addsd	-44(%ebp), %xmm1
	#END ADD
	#FP TO LONG
	cvttsd2si	%xmm1, %edx
	#END CAST
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
	movl	-16(%ebp), %ebx
	subl	-20(%ebp), %ebx
	#END SUBTRACT
	#LONG TO FP
	cvtsi2sd	%ebx, %xmm1
	#END CAST
	    #ID
	    #END ID
	subsd	-44(%ebp), %xmm1
	#END SUBTRACT
	#FP TO LONG
	cvttsd2si	%xmm1, %ebx
	#END CAST
	movl	%ebx, -8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CAST
	#MULTIPLY
	#CAST
	#MULTIPLY
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	-16(%ebp), %esi
	imull	-20(%ebp), %esi
	#END MULTIPLY
	#LONG TO FP
	cvtsi2sd	%esi, %xmm1
	#END CAST
	    #ID
	    #END ID
	mulsd	-44(%ebp), %xmm1
	#END MULTIPLY
	#FP TO LONG
	cvttsd2si	%xmm1, %esi
	#END CAST
	movl	%esi, -12(%ebp)
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
	movl	%eax, -48(%ebp)
	movl	-16(%ebp), %eax
	cltd
	idivl	-20(%ebp)
	#END DIVIDE
	#LONG TO FP
	cvtsi2sd	%eax, %xmm1
	#END CAST
	    #ID
	    #END ID
	addsd	-44(%ebp), %xmm1
	#END ADD
	movsd	%xmm1, -28(%ebp)
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
	movl	-16(%ebp), %eax
	cltd
	idivl	-20(%ebp)
	#END REMAINDER
	#LONG TO FP
	cvtsi2sd	%edx, %xmm2
	#END CAST
	    #ID
	    #END ID
	subsd	-44(%ebp), %xmm2
	#END SUBTRACT
	movsd	%xmm2, -36(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%ecx, -52(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	#ADDRESS
	   #STRING
	leal	.L2, %edi
	#END ADDRESS
	pushl	%edi
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -56(%ebp)
	    #ID
	    #END ID
	pushl	-8(%ebp)
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -60(%ebp)
	leal	.L3, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -64(%ebp)
	    #ID
	    #END ID
	pushl	-12(%ebp)
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -68(%ebp)
	leal	.L4, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -72(%ebp)
	    #ID
	    #END ID
	movsd	-28(%ebp), %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -76(%ebp)
	leal	.L5, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$12, %esp
	#END CALL
	#CALL
	movl	%eax, -80(%ebp)
	    #ID
	    #END ID
	movsd	-36(%ebp), %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -84(%ebp)
	leal	.L6, %ebx
	#END ADDRESS
	pushl	%ebx
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
.L2:	.asciz	"%d\n"
.L3:	.asciz	"%d\n"
.L4:	.asciz	"%d\n"
.L5:	.asciz	"%f\n"
.L6:	.asciz	"%f\n"
#REALS
.L1:	.double	2
