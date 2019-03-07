#FUNCTION
.globl allocate
	#PROLOGUE
allocate:
.L0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
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
	#MULTIPLY
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $16
	   #END INT
	movl	8(%ebp), %eax
	imull	$16, 8(%ebp)
	#END MULTIPLY
	pushl	%eax
	call	malloc
	#END CALL
	#END CAST
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L1:
	movl	, %ebx
	cmpl	$0, %ebx
	je	.L2
	 #BLOCK
	  #ASSIGNMENT
	#CALL
	#MULTIPLY
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $4
	   #END INT
	movl	8(%ebp), %ebx
	imull	$4, 8(%ebp)
	#END MULTIPLY
	pushl	%ebx
	call	malloc
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
	movl	-4(%ebp), %ecx
	imull	$16, -4(%ebp)
	#END MULTIPLY
	movl	-8(%ebp), %edx
	addl	%ecx, %edx
	#END ADD
	movl		(%edx), %edx
	#END DEREFERENCE
	movl	, 
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	movl	-4(%ebp), %ecx
	addl	$1, %ecx
	#END ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	jmp	.L1
.L2:
	#END WHILE
	#RETURN
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	-8(%ebp), %eax
	#END RETURN
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#FUNCTION
.globl initialize
	#PROLOGUE
initialize:
.L3:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
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
	movl	%eax, -4(%ebp)
	movl	, %eax
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
	movl	, %eax
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
	movl	-4(%ebp), %eax
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
	movl	%eax, -8(%ebp)
	movl	-4(%ebp), %eax
	imull	$16, -4(%ebp)
	#END MULTIPLY
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	addl	-12(%ebp), %eax
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
	movl	%eax, -28(%ebp)
	movl	-8(%ebp), %eax
	imull	$4, -8(%ebp)
	#END MULTIPLY
	movl	%eax, -32(%ebp)
	movl	-28(%ebp), %eax
	addl	-32(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	movl	-8(%ebp), 
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	movl	%eax, -36(%ebp)
	movl	-8(%ebp), %eax
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	, -8(%ebp)
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
	movl	%eax, -40(%ebp)
	movl	-4(%ebp), %eax
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	jmp	.L4
.L5:
	#END WHILE
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#FUNCTION
.globl display
	#PROLOGUE
display:
.L8:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
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
	movl	%eax, -44(%ebp)
	movl	, %eax
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
	movl	, %eax
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
	movl	-4(%ebp), %eax
	imull	$16, -4(%ebp)
	#END MULTIPLY
	movl	%eax, -48(%ebp)
	movl	8(%ebp), %eax
	addl	-48(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	movl	, -12(%ebp)
	  #END ASSIGNMENT
	#CALL
	#ADDRESS
	   #STRING
	movl	%eax, -64(%ebp)
	leal	.L13, %eax
	#END ADDRESS
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
	movl	%eax, -68(%ebp)
	movl	-8(%ebp), %eax
	imull	$4, -8(%ebp)
	#END MULTIPLY
	movl	%eax, -72(%ebp)
	movl	-12(%ebp), %eax
	addl	-72(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	pushl	%eax
	pushl	-68(%ebp)
	call	printf
	#END CALL
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	movl	%eax, -76(%ebp)
	movl	-8(%ebp), %eax
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	, -8(%ebp)
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
	movl	%eax, -80(%ebp)
	movl	-4(%ebp), %eax
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	#ADDRESS
	   #STRING
	movl	%eax, -84(%ebp)
	leal	.L14, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	#END CALL
	jmp	.L9
.L10:
	#END WHILE
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#FUNCTION
.globl deallocate
	#PROLOGUE
deallocate:
.L15:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
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
	movl	%eax, -88(%ebp)
	movl	, %eax
	cmpl	$0, %eax
	je	.L17
	 #BLOCK
	#CALL
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
	movl	-4(%ebp), %eax
	imull	$16, -4(%ebp)
	#END MULTIPLY
	movl	%eax, -92(%ebp)
	movl	8(%ebp), %eax
	addl	-92(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	pushl	%eax
	call	free
	#END CALL
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	movl	%eax, -108(%ebp)
	movl	-4(%ebp), %eax
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	jmp	.L16
.L17:
	#END WHILE
	#CALL
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	pushl	8(%ebp)
	call	free
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#FUNCTION
.globl main
	#PROLOGUE
main:
.L18:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	#BODY
	 #BLOCK
	#CALL
	#ADDRESS
	   #STRING
	movl	%eax, -112(%ebp)
	leal	.L19, %eax
	#END ADDRESS
	#ADDRESS
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	%eax, -116(%ebp)
	leal	-8(%ebp), %eax
	#END ADDRESS
	pushl	%eax
	pushl	-116(%ebp)
	call	scanf
	#END CALL
	  #ASSIGNMENT
	#CALL
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	pushl	-8(%ebp)
	call	allocate
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	call	initialize
	#END CALL
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	call	display
	#END CALL
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	call	deallocate
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
#STRINGS
.L13:	.asciz	"%d "
.L14:	.asciz	"\n"
.L19:	.asciz	"%d"
