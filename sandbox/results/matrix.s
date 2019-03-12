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
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	$0, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CAST
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#MULTIPLY
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $16
	   #END INT
#reg %eax is empty
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	pushl	%eax
	call	malloc
	addl	$4, %esp
	#END CALL
	#END CAST
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L1:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
#reg %ebx is empty
	#LOAD
	movl	-4(%ebp), %ebx
	#END LOAD
	cmp	8(%ebp), %ebx
	setl	%bl
	movzbl	%bl, %ebx
	#END LESS THAN
	cmpl	$0, %ebx
	je	.L2
	 #BLOCK
	  #ASSIGNMENT
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#MULTIPLY
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $4
	   #END INT
#reg %ebx is empty
	#LOAD
	movl	8(%ebp), %ebx
	#END LOAD
	imull	$4, %ebx
	#END MULTIPLY
	pushl	%ebx
	call	malloc
	addl	$4, %esp
	#END CALL
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#MULTIPLY
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $16
	   #END INT
#reg %ecx is empty
	#LOAD
	movl	-4(%ebp), %ecx
	#END LOAD
	imull	$16, %ecx
	#END MULTIPLY
#reg %edx is empty
	#LOAD
	movl	-8(%ebp), %edx
	#END LOAD
	addl	%ecx, %edx
	#END ADD
	movl		(%edx), %edx
	#END DEREFERENCE
	movl	, %edx
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
#reg %ecx is empty
	#LOAD
	movl	-4(%ebp), %ecx
	#END LOAD
	addl	$1, %ecx
	#END ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	jmp	.L1
.L2:
	#END WHILE
	#RETURN
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	movl	-8(%ebp), %eax
	#END LOAD
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
	.set	allocate.size, 8
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
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	$0, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L4:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -12(%ebp)
	#END LOAD
	#LOAD
	movl	-4(%ebp), %eax
	#END LOAD
	cmp	12(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L5
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	$0, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L6:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
#reg %eax is empty
	#LOAD
	movl	-8(%ebp), %eax
	#END LOAD
	cmp	12(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L7
	 #BLOCK
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
#reg %eax is empty
	#LOAD
	movl	-4(%ebp), %eax
	#END LOAD
	addl	-8(%ebp), %eax
	#END ADD
	#DEREFERENCE
	#ADD
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	movl	%eax, -16(%ebp)
	#END LOAD
	#LOAD
	movl	-4(%ebp), %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -20(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-20(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#MULTIPLY
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	movl	%eax, -36(%ebp)
	#END LOAD
	#LOAD
	movl	-8(%ebp), %eax
	#END LOAD
	imull	$4, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -40(%ebp)
	#END LOAD
	#LOAD
	movl	-36(%ebp), %eax
	#END LOAD
	addl	-40(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	movl	-16(%ebp), %eax
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	movl	%eax, -44(%ebp)
	#END LOAD
	#LOAD
	movl	-8(%ebp), %eax
	#END LOAD
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	%eax, -8(%ebp)
	  #END ASSIGNMENT
	jmp	.L6
.L7:
	#END WHILE
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	movl	%eax, -48(%ebp)
	#END LOAD
	#LOAD
	movl	-4(%ebp), %eax
	#END LOAD
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
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
	.set	initialize.size, 48
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
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	$0, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L9:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -16(%ebp)
	#END LOAD
	#LOAD
	movl	-4(%ebp), %eax
	#END LOAD
	cmp	12(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L10
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	$0, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L11:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
#reg %eax is empty
	#LOAD
	movl	-8(%ebp), %eax
	#END LOAD
	cmp	12(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L12
	 #BLOCK
	  #ASSIGNMENT
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $16
	   #END INT
#reg %eax is empty
	#LOAD
	movl	-4(%ebp), %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -20(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-20(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	movl	%eax, -12(%ebp)
	  #END ASSIGNMENT
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	#MULTIPLY
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	movl	%eax, -36(%ebp)
	#END LOAD
	#LOAD
	movl	-8(%ebp), %eax
	#END LOAD
	imull	$4, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -40(%ebp)
	#END LOAD
	#LOAD
	movl	-12(%ebp), %eax
	#END LOAD
	addl	-40(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	pushl	%eax
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -44(%ebp)
	#END LOAD
	leal	.L13, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	movl	%eax, -48(%ebp)
	#END LOAD
	#LOAD
	movl	-8(%ebp), %eax
	#END LOAD
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	%eax, -8(%ebp)
	  #END ASSIGNMENT
	jmp	.L11
.L12:
	#END WHILE
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	movl	%eax, -52(%ebp)
	#END LOAD
	#LOAD
	movl	-4(%ebp), %eax
	#END LOAD
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -56(%ebp)
	#END LOAD
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
	.set	display.size, 56
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
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	$0, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L16:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -8(%ebp)
	#END LOAD
	#LOAD
	movl	-4(%ebp), %eax
	#END LOAD
	cmp	12(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L17
	 #BLOCK
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $16
	   #END INT
#reg %eax is empty
	#LOAD
	movl	-4(%ebp), %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -12(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-12(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	pushl	%eax
	call	free
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	movl	%eax, -28(%ebp)
	#END LOAD
	#LOAD
	movl	-4(%ebp), %eax
	#END LOAD
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	jmp	.L16
.L17:
	#END WHILE
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	pushl	8(%ebp)
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
	.set	deallocate.size, 28
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
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#ADDRESS
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -12(%ebp)
	#END LOAD
	leal	-8(%ebp), %eax
	#END ADDRESS
	pushl	%eax
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -28(%ebp)
	#END LOAD
	leal	.L19, %eax
	#END ADDRESS
	pushl	%eax
	call	scanf
	addl	$20, %esp
	#END CALL
	  #ASSIGNMENT
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	pushl	-8(%ebp)
	call	allocate
	addl	$4, %esp
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	pushl	-8(%ebp)
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	initialize
	addl	$20, %esp
	#END CALL
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	pushl	-8(%ebp)
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	display
	addl	$20, %esp
	#END CALL
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	pushl	-8(%ebp)
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
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
	.set	main.size, 28
	.globl	main
#GLOBALS
#STRINGS
.L13:	.asciz	"%d "
.L14:	.asciz	"\n"
.L19:	.asciz	"%d"
