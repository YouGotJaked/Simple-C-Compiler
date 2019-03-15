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
	movl	$0, %eax
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CAST
	#CALL
	movl	%eax, -12(%ebp)
	#MULTIPLY
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	20(%ebp), %eax
	imull	$4, %eax
	#END MULTIPLY
	pushl	%eax
	call	malloc
	addl	$4, %esp
	#END CALL
	#LONG TO BYTE/LONG
	#END CAST
	movl	%eax, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L1:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	-4(%ebp), %ecx
	cmp	20(%ebp), %ecx
	setl	%cl
	movzbl	%cl, %ecx
	#END LESS THAN
	cmpl	$0, %ecx
	je	.L2
	 #BLOCK
	  #ASSIGNMENT
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-4(%ebp), %ecx
	imull	$4, %ecx
	#END MULTIPLY
	movl	-8(%ebp), %edx
	addl	%ecx, %edx
	#END ADD
	#CALL
	movl	%eax, -16(%ebp)
	movl	%edx, -20(%ebp)
	#MULTIPLY
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	20(%ebp), %eax
	imull	$4, %eax
	#END MULTIPLY
	pushl	%eax
	call	malloc
	addl	$4, %esp
	#END CALL
	movl	-20(%ebp), %ecx
	movl	%eax, (%ecx)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
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
	movl	-8(%ebp), %eax
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
	.set	allocate.size, 20
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
	movl	$0, %eax
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L4:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	-4(%ebp), %ecx
	cmp	24(%ebp), %ecx
	setl	%cl
	movzbl	%cl, %ecx
	#END LESS THAN
	cmpl	$0, %ecx
	je	.L5
	 #BLOCK
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$0, %ecx
	movl	%ecx, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L6:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	-8(%ebp), %edx
	cmp	24(%ebp), %edx
	setl	%dl
	movzbl	%dl, %edx
	#END LESS THAN
	cmpl	$0, %edx
	je	.L7
	 #BLOCK
	  #ASSIGNMENT
	#ADD
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-4(%ebp), %edx
	imull	$4, %edx
	#END MULTIPLY
	movl	20(%ebp), %ebx
	addl	%edx, %ebx
	#END ADD
	movl	(%ebx), %ebx
	#END DEREFERENCE
	#MULTIPLY
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-8(%ebp), %edx
	imull	$4, %edx
	#END MULTIPLY
	addl	%edx, %ebx
	#END ADD
	#ADD
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	-4(%ebp), %edx
	addl	-8(%ebp), %edx
	#END ADD
	movl	%edx, (%ebx)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-8(%ebp), %esi
	addl	$1, %esi
	#END ADD
	movl	%esi, -8(%ebp)
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
	.set	initialize.size, 8
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
	movl	-4(%ebp), %ecx
	cmp	24(%ebp), %ecx
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
	movl	-8(%ebp), %edx
	cmp	24(%ebp), %edx
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
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-4(%ebp), %edx
	imull	$4, %edx
	#END MULTIPLY
	movl	20(%ebp), %ebx
	addl	%edx, %ebx
	#END ADD
	movl	(%ebx), %ebx
	#END DEREFERENCE
	movl	%ebx, -12(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -16(%ebp)
	movl	%ecx, -20(%ebp)
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-8(%ebp), %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	-12(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	pushl	%ecx
	#ADDRESS
	   #STRING
	leal	.L13, %esi
	#END ADDRESS
	pushl	%esi
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
	movl	-4(%ebp), %eax
	addl	$1, %eax
	#END ADD
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -24(%ebp)
	#ADDRESS
	   #STRING
	leal	.L14, %ebx
	#END ADDRESS
	pushl	%ebx
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
	.set	display.size, 24
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
	movl	-4(%ebp), %ecx
	cmp	24(%ebp), %ecx
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
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-4(%ebp), %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	pushl	%ecx
	call	free
	addl	$4, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-4(%ebp), %edx
	addl	$1, %edx
	#END ADD
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	jmp	.L16
.L17:
	#END WHILE
	#CALL
	    #ID
	    #END ID
	pushl	20(%ebp)
	call	free
	addl	$4, %esp
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
	leal	-8(%ebp), %ebx
	#END ADDRESS
	pushl	%ebx
	#ADDRESS
	   #STRING
	leal	.L19, %esi
	#END ADDRESS
	pushl	%esi
	call	scanf
	addl	$8, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -12(%ebp)
	    #ID
	    #END ID
	pushl	-8(%ebp)
	call	allocate
	addl	$4, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -16(%ebp)
	    #ID
	    #END ID
	pushl	-8(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	initialize
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -20(%ebp)
	    #ID
	    #END ID
	pushl	-8(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	display
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -24(%ebp)
	    #ID
	    #END ID
	pushl	-8(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	deallocate
	addl	$8, %esp
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
	.set	main.size, 24
	.globl	main
#GLOBALS
#STRINGS
.L13:	.asciz	"%d "
.L14:	.asciz	"\n"
.L19:	.asciz	"%d"
#REALS
