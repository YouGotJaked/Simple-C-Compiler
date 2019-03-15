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
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$30, %ecx
	movl	%ecx, -8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$2, %edx
	movl	%edx, -12(%ebp)
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
	movl	-4(%ebp), %ebx
	addl	-8(%ebp), %ebx
	#END ADD
	    #ID
	    #END ID
	addl	-12(%ebp), %ebx
	#END ADD
	movl	%ebx, -16(%ebp)
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
	movl	-4(%ebp), %esi
	subl	-8(%ebp), %esi
	#END SUBTRACT
	    #ID
	    #END ID
	subl	-12(%ebp), %esi
	#END SUBTRACT
	movl	%esi, -20(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#MULTIPLY
	#MULTIPLY
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	-4(%ebp), %edi
	imull	-8(%ebp), %edi
	#END MULTIPLY
	    #ID
	    #END ID
	imull	-12(%ebp), %edi
	#END MULTIPLY
	movl	%edi, -24(%ebp)
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
	    #ID
	    #END ID
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
	   #STRING
#callee spill
	movl	%ebx, -52(%ebp)
	leal	.L1, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -56(%ebp)
	    #ID
	    #END ID
	pushl	-20(%ebp)
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -60(%ebp)
	leal	.L2, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -64(%ebp)
	    #ID
	    #END ID
	pushl	-24(%ebp)
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -68(%ebp)
	leal	.L3, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -72(%ebp)
	    #ID
	    #END ID
	pushl	-28(%ebp)
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -76(%ebp)
	leal	.L4, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -80(%ebp)
	    #ID
	    #END ID
	pushl	-32(%ebp)
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -84(%ebp)
	leal	.L5, %ebx
	#END ADDRESS
	pushl	%ebx
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
	.set	main.size, 84
	.globl	main
#GLOBALS
#STRINGS
.L1:	.asciz	"%d\n"
.L2:	.asciz	"%d\n"
.L3:	.asciz	"%d\n"
.L4:	.asciz	"%d\n"
.L5:	.asciz	"%d\n"
#REALS
