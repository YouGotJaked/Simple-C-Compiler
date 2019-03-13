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
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$30, %ecx
	movl	%ecx, -8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
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
	movl	%eax, -36(%ebp)
#reg= %eax
	movl	-4(%ebp), %eax
	addl	-8(%ebp), %eax
	#END ADD
	    #ID
	    #END ID
	movl	%eax, -40(%ebp)
#reg= %eax
	movl	-40(%ebp), %eax
	addl	-12(%ebp), %eax
	#END ADD
	movl	%eax, -16(%ebp)
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
	movl	%eax, -44(%ebp)
#reg= %eax
	movl	-4(%ebp), %eax
	subl	-8(%ebp), %eax
	#END SUBTRACT
	    #ID
	    #END ID
	subl	-12(%ebp), %eax
	#END SUBTRACT
	movl	%eax, -20(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	#MULTIPLY
	#fp=false
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -48(%ebp)
#reg= %eax
	movl	-4(%ebp), %eax
	imull	-8(%ebp), %eax
	#END MULTIPLY
	    #ID
	    #END ID
	imull	-12(%ebp), %eax
	#END MULTIPLY
	movl	%eax, -24(%ebp)
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
	movl	%eax, -52(%ebp)
#reg= %eax
	movl	-4(%ebp), %eax
	cltd
	idivl	-8(%ebp)
	#END DIVIDE
	    #ID
	    #END ID
#register %edx is empty
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
	movl	%eax, -56(%ebp)
#reg= %eax
	movl	-4(%ebp), %eax
#temp=%ebx
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
	movl	%ecx, -60(%ebp)
	movl	%edx, -64(%ebp)
	    #ID
	    #END ID
	pushl	-16(%ebp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L1, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -68(%ebp)
	    #ID
	    #END ID
	pushl	-20(%ebp)
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
	movl	%eax, -72(%ebp)
	    #ID
	    #END ID
	pushl	-24(%ebp)
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
	movl	%eax, -76(%ebp)
	    #ID
	    #END ID
	pushl	-28(%ebp)
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
	movl	%eax, -80(%ebp)
	    #ID
	    #END ID
	pushl	-32(%ebp)
	#ADDRESS
	   #STRING
#register %eax is empty
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
	.set	main.size, 80
	.globl	main
#GLOBALS
#STRINGS
.L1:	.asciz	"%d\n"
.L2:	.asciz	"%d\n"
.L3:	.asciz	"%d\n"
.L4:	.asciz	"%d\n"
.L5:	.asciz	"%d\n"
#REALS
