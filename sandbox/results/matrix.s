#FUNCTION
#int	0
#int	0
#int **	0
#off: 20
#off: 0
#off: 0
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
#before 
	    #ID
	    #offset(i) = -4
	    #END ID
#after -4(%ebp)
	   #INT
	   #END INT
	movl	$0, %ebx
	movl	%ebx, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset(a) = -8
	    #END ID
#after -8(%ebp)
	#CAST
	#CALL
	#MULTIPLY
	    #ID
	    #offset(n) = 20
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
	    #offset(i) = -4
	    #END ID
	    #ID
	    #offset(n) = 20
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
	    #offset(a) = -8
	    #END ID
	#MULTIPLY
	    #ID
	    #offset(i) = -4
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
	movl	%eax, -12(%ebp)
	movl	%edx, -16(%ebp)
	#MULTIPLY
	    #ID
	    #offset(n) = 20
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
	movl	-16(%ebp), %ecx
	movl	%eax, (%ecx)

	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset(i) = -4
	    #END ID
#after -4(%ebp)
	#ADD
	    #ID
	    #offset(i) = -4
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
	    #offset(a) = -8
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
	.set	allocate.size, 16
	.globl	allocate
#FUNCTION
#int **	0
#int	0
#int	0
#int	0
#off: 20
#off: 24
#off: 0
#off: 0
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
#before 
	    #ID
	    #offset(i) = -4
	    #END ID
#after -4(%ebp)
	   #INT
	   #END INT
	movl	$0, %ebx
	movl	%ebx, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L4:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #offset(i) = -4
	    #END ID
	    #ID
	    #offset(n) = 24
	    #END ID
	movl	-4(%ebp), %eax
	cmp	24(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L5
	 #BLOCK
	  #ASSIGNMENT
#before 
	    #ID
	    #offset(j) = -8
	    #END ID
#after -8(%ebp)
	   #INT
	   #END INT
	movl	$0, %esi
	movl	%esi, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L6:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #offset(j) = -8
	    #END ID
	    #ID
	    #offset(n) = 24
	    #END ID
	movl	-8(%ebp), %eax
	cmp	24(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L7
	 #BLOCK
	  #ASSIGNMENT
	#ADD
	#DEREFERENCE
	#ADD
	    #ID
	    #offset(a) = 20
	    #END ID
	#MULTIPLY
	    #ID
	    #offset(i) = -4
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
	#MULTIPLY
	    #ID
	    #offset(j) = -8
	    #END ID
	   #INT
	   #END INT
	movl	-8(%ebp), %eax
	imull	$4, %eax
	#END MULTIPLY
	addl	%eax, %ecx
	#END ADD
	#ADD
	    #ID
	    #offset(i) = -4
	    #END ID
	    #ID
	    #offset(j) = -8
	    #END ID
	movl	-4(%ebp), %eax
	addl	-8(%ebp), %eax
	#END ADD
	movl	%eax, (%ecx)

	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset(j) = -8
	    #END ID
#after -8(%ebp)
	#ADD
	    #ID
	    #offset(j) = -8
	    #END ID
	   #INT
	   #END INT
	movl	-8(%ebp), %edx
	addl	$1, %edx
	#END ADD
	movl	%edx, -8(%ebp)
	  #END ASSIGNMENT
	jmp	.L6
.L7:
	#END WHILE
	  #ASSIGNMENT
#before 
	    #ID
	    #offset(i) = -4
	    #END ID
#after -4(%ebp)
	#ADD
	    #ID
	    #offset(i) = -4
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
#int **	0
#int	0
#int	0
#int	0
#int *	0
#off: 20
#off: 24
#off: 0
#off: 0
#off: 0
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
#before 
	    #ID
	    #offset(i) = -4
	    #END ID
#after -4(%ebp)
	   #INT
	   #END INT
	movl	$0, %ebx
	movl	%ebx, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L9:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #offset(i) = -4
	    #END ID
	    #ID
	    #offset(n) = 24
	    #END ID
	movl	-4(%ebp), %eax
	cmp	24(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L10
	 #BLOCK
	  #ASSIGNMENT
#before 
	    #ID
	    #offset(j) = -8
	    #END ID
#after -8(%ebp)
	   #INT
	   #END INT
	movl	$0, %esi
	movl	%esi, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L11:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #offset(j) = -8
	    #END ID
	    #ID
	    #offset(n) = 24
	    #END ID
	movl	-8(%ebp), %eax
	cmp	24(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L12
	 #BLOCK
	  #ASSIGNMENT
#before 
	    #ID
	    #offset(p) = -12
	    #END ID
#after -12(%ebp)
	#DEREFERENCE
	#ADD
	    #ID
	    #offset(a) = 20
	    #END ID
	#MULTIPLY
	    #ID
	    #offset(i) = -4
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
	movl	%ecx, -12(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%ecx, -16(%ebp)
	#DEREFERENCE
	#ADD
	    #ID
	    #offset(p) = -12
	    #END ID
	#MULTIPLY
	    #ID
	    #offset(j) = -8
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
	#operand = 
	   #STRING
	leal	.L13, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset(j) = -8
	    #END ID
#after -8(%ebp)
	#ADD
	    #ID
	    #offset(j) = -8
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
#before 
	    #ID
	    #offset(i) = -4
	    #END ID
#after -4(%ebp)
	#ADD
	    #ID
	    #offset(i) = -4
	    #END ID
	   #INT
	   #END INT
	movl	-4(%ebp), %eax
	addl	$1, %eax
	#END ADD
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -20(%ebp)
	#ADDRESS
	#operand = 
	   #STRING
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
	.set	display.size, 20
	.globl	display
#FUNCTION
#int **	0
#int	0
#int	0
#off: 20
#off: 24
#off: 0
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
#before 
	    #ID
	    #offset(i) = -4
	    #END ID
#after -4(%ebp)
	   #INT
	   #END INT
	movl	$0, %ebx
	movl	%ebx, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L16:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #offset(i) = -4
	    #END ID
	    #ID
	    #offset(n) = 24
	    #END ID
	movl	-4(%ebp), %eax
	cmp	24(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L17
	 #BLOCK
	#CALL
	#DEREFERENCE
	#ADD
	    #ID
	    #offset(a) = 20
	    #END ID
	#MULTIPLY
	    #ID
	    #offset(i) = -4
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
#before 
	    #ID
	    #offset(i) = -4
	    #END ID
#after -4(%ebp)
	#ADD
	    #ID
	    #offset(i) = -4
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
	    #offset(a) = 20
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
	.set	deallocate.size, 4
	.globl	deallocate
#FUNCTION
#int **	0
#int	0
#off: 0
#off: 0
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
	#operand = 
	    #ID
	    #offset(n) = -8
	    #END ID
	leal	-8(%ebp), %eax
	#END ADDRESS
	pushl	%eax
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L19, %ecx
	#END ADDRESS
	pushl	%ecx
	call	scanf
	addl	$8, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset(a) = -4
	    #END ID
#after -4(%ebp)
	#CALL
	movl	%eax, -12(%ebp)
	movl	%ecx, -16(%ebp)
	    #ID
	    #offset(n) = -8
	    #END ID
	pushl	-8(%ebp)
	call	allocate
	addl	$4, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -20(%ebp)
	    #ID
	    #offset(n) = -8
	    #END ID
	pushl	-8(%ebp)
	    #ID
	    #offset(a) = -4
	    #END ID
	pushl	-4(%ebp)
	call	initialize
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -24(%ebp)
	    #ID
	    #offset(n) = -8
	    #END ID
	pushl	-8(%ebp)
	    #ID
	    #offset(a) = -4
	    #END ID
	pushl	-4(%ebp)
	call	display
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -28(%ebp)
	    #ID
	    #offset(n) = -8
	    #END ID
	pushl	-8(%ebp)
	    #ID
	    #offset(a) = -4
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
	.set	main.size, 28
	.globl	main
#GLOBALS
#STRINGS
.L13:	.asciz	"%d "
.L14:	.asciz	"\n"
.L19:	.asciz	"%d"
#REALS
