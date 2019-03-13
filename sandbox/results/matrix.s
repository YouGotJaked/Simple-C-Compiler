#FUNCTION
	#PROLOGUE
allocate:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$allocate.size, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$0, %eax
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CAST
	#CALL
	movl	%eax, -24(%ebp)
	#MULTIPLY
	#fp=false
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	20(%ebp), %eax
	imull	$16, %eax
	#END MULTIPLY
	pushl	%eax
	call	malloc
	addl	$4, %esp
	#END CALL
#register %ecx is empty
#reg= %ecx
	movl	, %ecx
	#END CAST
#register %edx is empty
#reg= %edx
	movl	, %edx
	movl	%edx, -20(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L1:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -28(%ebp)
#reg= %eax
	movl	-4(%ebp), %eax
	cmp	20(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L2
	 #BLOCK
	  #ASSIGNMENT
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	-4(%ebp), %eax
	imull	$16, %eax
	#END MULTIPLY
	movl	%eax, -32(%ebp)
#reg= %eax
	movl	-20(%ebp), %eax
	addl	-32(%ebp), %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	#CALL
	movl	%eax, -48(%ebp)
	movl	%ecx, -64(%ebp)
	movl	%edx, -80(%ebp)
	#MULTIPLY
	#fp=false
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	20(%ebp), %eax
	imull	$4, %eax
	#END MULTIPLY
	pushl	%eax
	call	malloc
	addl	$4, %esp
	#END CALL
#register %ecx is empty
#reg= %ecx
	movl	, %ecx
	movl	%ecx, -48(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	-4(%ebp), %edx
	addl	$1, %edx
	#END ADD
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	jmp	.L1
.L2:
	#END WHILE
	#RETURN
	    #ID
	    #END ID
#reg= %eax
	movl	-20(%ebp), %eax
	jmp	.L0
	#END RETURN
.L0:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	allocate.size, 80
	.globl	allocate
#FUNCTION
	#PROLOGUE
initialize:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$initialize.size, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$0, %ecx
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L4:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	-4(%ebp), %edx
	cmp	36(%ebp), %edx
	setl	%dl
	movzbl	%dl, %edx
	#END LESS THAN
	cmpl	$0, %edx
	je	.L5
	 #BLOCK
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	$0, %edx
	movl	%edx, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L6:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -24(%ebp)
#reg= %eax
	movl	-8(%ebp), %eax
	cmp	36(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L7
	 #BLOCK
	  #ASSIGNMENT
	#DEREFERENCE
	#ADD
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	-4(%ebp), %eax
	imull	$16, %eax
	#END MULTIPLY
	movl	%eax, -28(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
	addl	-28(%ebp), %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	#MULTIPLY
	#fp=false
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	%eax, -44(%ebp)
#reg= %eax
	movl	-8(%ebp), %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	%eax, -48(%ebp)
#reg= %eax
	movl	-44(%ebp), %eax
	addl	-48(%ebp), %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	#ADD
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -52(%ebp)
#reg= %eax
	movl	-4(%ebp), %eax
	addl	-8(%ebp), %eax
	#END ADD
	movl	%eax, -52(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	%eax, -56(%ebp)
#reg= %eax
	movl	-8(%ebp), %eax
	addl	$1, %eax
	#END ADD
	movl	%eax, -8(%ebp)
	  #END ASSIGNMENT
	jmp	.L6
.L7:
	#END WHILE
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	-4(%ebp), %eax
	addl	$1, %eax
	#END ADD
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	jmp	.L4
.L5:
	#END WHILE
.L3:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	initialize.size, 56
	.globl	initialize
#FUNCTION
	#PROLOGUE
display:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$display.size, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$0, %eax
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L9:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %ecx is empty
#reg= %ecx
	movl	-4(%ebp), %ecx
	cmp	36(%ebp), %ecx
	setl	%cl
	movzbl	%cl, %ecx
	#END LESS THAN
	cmpl	$0, %ecx
	je	.L10
	 #BLOCK
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$0, %ecx
	movl	%ecx, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L11:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	-8(%ebp), %edx
	cmp	36(%ebp), %edx
	setl	%dl
	movzbl	%dl, %edx
	#END LESS THAN
	cmpl	$0, %edx
	je	.L12
	 #BLOCK
	  #ASSIGNMENT
	    #ID
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	-4(%ebp), %edx
	imull	$16, %edx
	#END MULTIPLY
	movl	%eax, -28(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
	addl	%edx, %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	movl	%eax, -24(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -44(%ebp)
	movl	%ecx, -48(%ebp)
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	-8(%ebp), %eax
	imull	$4, %eax
	#END MULTIPLY
#register %ecx is empty
#reg= %ecx
	movl	-24(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	pushl	%ecx
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L13, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	-8(%ebp), %edx
	addl	$1, %edx
	#END ADD
	movl	%edx, -8(%ebp)
	  #END ASSIGNMENT
	jmp	.L11
.L12:
	#END WHILE
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	-4(%ebp), %eax
	addl	$1, %eax
	#END ADD
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -52(%ebp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L14, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$4, %esp
	#END CALL
	jmp	.L9
.L10:
	#END WHILE
.L8:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	display.size, 52
	.globl	display
#FUNCTION
	#PROLOGUE
deallocate:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$deallocate.size, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$0, %eax
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L16:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %ecx is empty
#reg= %ecx
	movl	-4(%ebp), %ecx
	cmp	36(%ebp), %ecx
	setl	%cl
	movzbl	%cl, %ecx
	#END LESS THAN
	cmpl	$0, %ecx
	je	.L17
	 #BLOCK
	#CALL
	movl	%eax, -8(%ebp)
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	-4(%ebp), %eax
	imull	$16, %eax
	#END MULTIPLY
#register %ecx is empty
#reg= %ecx
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	pushl	%ecx
	call	free
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	-4(%ebp), %eax
	addl	$1, %eax
	#END ADD
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	jmp	.L16
.L17:
	#END WHILE
	#CALL
	    #ID
	    #END ID
	pushl	20(%ebp)
	call	free
	addl	$16, %esp
	#END CALL
.L15:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	deallocate.size, 8
	.globl	deallocate
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
	#CALL
	#ADDRESS
	    #ID
	    #END ID
#register %eax is empty
	leal	-20(%ebp), %eax
	#END ADDRESS
	pushl	%eax
	#ADDRESS
	   #STRING
#register %ecx is empty
	leal	.L19, %ecx
	#END ADDRESS
	pushl	%ecx
	call	scanf
	addl	$20, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -36(%ebp)
	movl	%ecx, -40(%ebp)
	    #ID
	    #END ID
	pushl	-20(%ebp)
	call	allocate
	addl	$4, %esp
	#END CALL
#register %eax is empty
#reg= %eax
	movl	, %eax
	movl	%eax, -16(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -56(%ebp)
	    #ID
	    #END ID
	pushl	-20(%ebp)
	    #ID
	    #END ID
	pushl	-16(%ebp)
	call	initialize
	addl	$20, %esp
	#END CALL
	#CALL
	    #ID
	    #END ID
	pushl	-20(%ebp)
	    #ID
	    #END ID
	pushl	-16(%ebp)
	call	display
	addl	$20, %esp
	#END CALL
	#CALL
	    #ID
	    #END ID
	pushl	-20(%ebp)
	    #ID
	    #END ID
	pushl	-16(%ebp)
	call	deallocate
	addl	$20, %esp
	#END CALL
.L18:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	main.size, 56
	.globl	main
#GLOBALS
#STRINGS
.L13:	.asciz	"%d "
.L14:	.asciz	"\n"
.L19:	.asciz	"%d"
#REALS
