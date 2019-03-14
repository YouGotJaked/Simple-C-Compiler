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
#after -16(%ebp)
	   #INT
	   #END INT
	movl	$100, %ebx
	movl	%ebx, -16(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -20(%ebp)
	   #INT
	   #END INT
	movl	$30, %esi
	movl	%esi, -20(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -44(%ebp)
	   #REAL
	movsd	.L1, %xmm0
	movsd	%xmm0, -44(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -4(%ebp)
	#CAST
	#ADD
	#CAST
	#ADD
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	-16(%ebp), %eax
	addl	-20(%ebp), %eax
	#END ADD
	#LONG TO FP
	cvtsi2sd	%eax, %xmm1
	#END CAST
	    #ID
	    #END ID
	addsd	-44(%ebp), %xmm1
	#END ADD
	#FP TO LONG
	cvttsd2si	%xmm1, %eax
	#END CAST
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -8(%ebp)
	#CAST
	#SUBTRACT
	#CAST
	#SUBTRACT
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	-16(%ebp), %ecx
	subl	-20(%ebp), %ecx
	#END SUBTRACT
	#LONG TO FP
	cvtsi2sd	%ecx, %xmm1
	#END CAST
	    #ID
	    #END ID
	subsd	-44(%ebp), %xmm1
	#END SUBTRACT
	#FP TO LONG
	cvttsd2si	%xmm1, %ecx
	#END CAST
	movl	%ecx, -8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -12(%ebp)
	#CAST
	#MULTIPLY
	#CAST
	#MULTIPLY
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	-16(%ebp), %edx
	imull	-20(%ebp), %edx
	#END MULTIPLY
	#LONG TO FP
	cvtsi2sd	%edx, %xmm1
	#END CAST
	    #ID
	    #END ID
	mulsd	-44(%ebp), %xmm1
	#END MULTIPLY
	#FP TO LONG
	cvttsd2si	%xmm1, %edx
	#END CAST
	movl	%edx, -12(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -28(%ebp)
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
#before 
	    #ID
	    #END ID
#after -36(%ebp)
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
	pushl	-8(%ebp)
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
	pushl	-12(%ebp)
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
	movsd	-28(%ebp), %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
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
	movl	%eax, -68(%ebp)
	    #ID
	    #END ID
	movsd	-36(%ebp), %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	#ADDRESS
	#operand = 
	   #STRING
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
	.set	main.size, 68
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
