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
	   #INT
	   #_operand = $7
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$7, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $393
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$393, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
#reg %eax is empty
	#LOAD
	movl	a, %eax
	#END LOAD
	addl	b, %eax
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#reg %ebx is empty
	leal	.L1, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $50
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$50, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $170
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$170, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#SUBTRACT
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
#reg %ecx is empty
	#LOAD
	movl	a, %ecx
	#END LOAD
	subl	b, %ecx
	#END SUBTRACT
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%ecx, -4(%ebp)
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
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#reg %edx is empty
	leal	.L2, %edx
	#END ADDRESS
	pushl	%edx
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $9
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$9, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $8
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$8, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#MULTIPLY
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -24(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	imull	b, %eax
	#END MULTIPLY
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -28(%ebp)
	#END LOAD
	leal	.L3, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $100
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$100, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $5
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$5, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#DIVIDE
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	a, %eax
	#END LOAD
	cltd
	idivl	b
	#END DIVIDE
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	#LOAD
	movl	%eax, -32(%ebp)
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -36(%ebp)
	#END LOAD
	leal	.L4, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	#DIVIDE
	    #ID
	    #_operand = a
	    #END ID
	   #INT
	   #_operand = $50
	   #END INT
	#LOAD
	movl	a, %eax
	#END LOAD
	cltd
	#LOAD
	movl	$50, %ebx
	#END LOAD
	idivl	%ebx
	#END DIVIDE
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	#LOAD
	movl	%eax, -40(%ebp)
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -44(%ebp)
	#END LOAD
	leal	.L5, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	#DIVIDE
	    #ID
	    #_operand = b
	    #END ID
	   #INT
	   #_operand = $2
	   #END INT
	#LOAD
	movl	b, %eax
	#END LOAD
	cltd
	#LOAD
	movl	$2, %ebx
	#END LOAD
	idivl	%ebx
	#END DIVIDE
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	#LOAD
	movl	%eax, -48(%ebp)
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -52(%ebp)
	#END LOAD
	leal	.L6, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $12
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$12, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $7
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$7, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#REMAINDER
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	a, %eax
	#END LOAD
#temp=%ebx
	cltd
	idivl	b
	#END REMAINDER
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	movl	%edx, -56(%ebp)
	#END LOAD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -60(%ebp)
	#END LOAD
	leal	.L7, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $100
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$100, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#REMAINDER
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	a, %eax
	#END LOAD
#temp=%ebx
	cltd
	idivl	b
	#END REMAINDER
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	movl	%edx, -64(%ebp)
	#END LOAD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -68(%ebp)
	#END LOAD
	leal	.L8, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $24
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$24, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $33
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$33, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#REMAINDER
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	a, %eax
	#END LOAD
#temp=%ebx
	cltd
	idivl	b
	#END REMAINDER
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	movl	%edx, -72(%ebp)
	#END LOAD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -76(%ebp)
	#END LOAD
	leal	.L9, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	#NEGATE
	   #INT
	   #_operand = $66
	   #END INT
	#LOAD
	movl	%eax, -80(%ebp)
	#END LOAD
	#LOAD
	movl	$66, %eax
	#END LOAD
	negl	%eax
	#END NEGATE
	    #ID
	    #_operand = a
	    #END ID
	movl	%eax, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#NEGATE
	    #ID
	    #_operand = a
	    #END ID
	#LOAD
	movl	%eax, -84(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	negl	%eax
	#END NEGATE
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -88(%ebp)
	#END LOAD
	leal	.L10, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$0, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#NOT
	    #ID
	    #_operand = a
	    #END ID
	#LOAD
	movl	%eax, -92(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	notl	%eax
	#END NOT
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -96(%ebp)
	#END LOAD
	leal	.L11, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $1
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$1, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#NOT
	    #ID
	    #_operand = a
	    #END ID
	#LOAD
	movl	%eax, -100(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	notl	%eax
	#END NOT
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -104(%ebp)
	#END LOAD
	leal	.L12, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $66
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$66, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#LESS THAN
	    #ID
	    #_operand = a
	    #END ID
	   #INT
	   #_operand = $10
	   #END INT
	#LOAD
	movl	%eax, -108(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmp	$10, %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -112(%ebp)
	#END LOAD
	leal	.L13, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	#LESS THAN
	    #ID
	    #_operand = a
	    #END ID
	   #INT
	   #_operand = $90
	   #END INT
	#LOAD
	movl	%eax, -116(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmp	$90, %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -120(%ebp)
	#END LOAD
	leal	.L14, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $21
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$21, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#GREATER THAN
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -124(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmp	b, %eax
	setg	%al
	movzbl	%al, %eax
	#END GREATER THAN
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -128(%ebp)
	#END LOAD
	leal	.L15, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	#GREATER THAN
	    #ID
	    #_operand = b
	    #END ID
	    #ID
	    #_operand = a
	    #END ID
	#LOAD
	movl	%eax, -132(%ebp)
	#END LOAD
	#LOAD
	movl	b, %eax
	#END LOAD
	cmp	a, %eax
	setg	%al
	movzbl	%al, %eax
	#END GREATER THAN
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -136(%ebp)
	#END LOAD
	leal	.L16, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	#LESS OR EQUAL
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -140(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmp	b, %eax
	setle	%al
	movzbl	%al, %eax
	#END LESS OR EQUAL
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -144(%ebp)
	#END LOAD
	leal	.L17, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $21
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$21, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#LESS OR EQUAL
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -148(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmp	b, %eax
	setle	%al
	movzbl	%al, %eax
	#END LESS OR EQUAL
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -152(%ebp)
	#END LOAD
	leal	.L18, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	#GREATER OR EQUAL
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -156(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmp	b, %eax
	setge	%al
	movzbl	%al, %eax
	#END GREATER OR EQUAL
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -160(%ebp)
	#END LOAD
	leal	.L19, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $243
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$243, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#GREATER OR EQUAL
	    #ID
	    #_operand = b
	    #END ID
	    #ID
	    #_operand = a
	    #END ID
	#LOAD
	movl	%eax, -164(%ebp)
	#END LOAD
	#LOAD
	movl	b, %eax
	#END LOAD
	cmp	a, %eax
	setge	%al
	movzbl	%al, %eax
	#END GREATER OR EQUAL
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -168(%ebp)
	#END LOAD
	leal	.L20, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $345
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$345, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $345
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$345, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#EQUAL
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -172(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmpl	b, %eax
	sete	%al
	movzbl	%al, %eax
	#END EQUAL
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -176(%ebp)
	#END LOAD
	leal	.L23, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $366
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$366, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#EQUAL
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -180(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmpl	b, %eax
	sete	%al
	movzbl	%al, %eax
	#END EQUAL
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -184(%ebp)
	#END LOAD
	leal	.L26, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $21
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$21, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $44
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$44, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#NOT EQUAL
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -188(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmpl	b, %eax
	setne	%al
	movzbl	%al, %eax
	#END EQUAL
	#END NOT EQUAL
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -192(%ebp)
	#END LOAD
	leal	.L27, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $21
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$21, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#NOT EQUAL
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -196(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmpl	b, %eax
	setne	%al
	movzbl	%al, %eax
	#END EQUAL
	#END NOT EQUAL
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -200(%ebp)
	#END LOAD
	leal	.L28, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $1
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$1, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$0, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#OR
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -204(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmpl	$0, %eax
	jne	.L29
	cmpl	$0, b
	jne	.L29
	#LOAD
	movl	%eax, -208(%ebp)
	#END LOAD
	mov	$0, %eax
	jmp	.L30
.L29:
	mov	$1, %eax
.L30:
	#END OR
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -212(%ebp)
	#END LOAD
	leal	.L31, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$0, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $1
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$1, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#OR
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -216(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmpl	$0, %eax
	jne	.L32
	cmpl	$0, b
	jne	.L32
	#LOAD
	movl	%eax, -220(%ebp)
	#END LOAD
	mov	$0, %eax
	jmp	.L33
.L32:
	mov	$1, %eax
.L33:
	#END OR
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -224(%ebp)
	#END LOAD
	leal	.L34, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $1
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$1, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#OR
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -228(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmpl	$0, %eax
	jne	.L35
	cmpl	$0, b
	jne	.L35
	#LOAD
	movl	%eax, -232(%ebp)
	#END LOAD
	mov	$0, %eax
	jmp	.L36
.L35:
	mov	$1, %eax
.L36:
	#END OR
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -236(%ebp)
	#END LOAD
	leal	.L37, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$0, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$0, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#OR
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -240(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	cmpl	$0, %eax
	jne	.L38
	cmpl	$0, b
	jne	.L38
	#LOAD
	movl	%eax, -244(%ebp)
	#END LOAD
	mov	$0, %eax
	jmp	.L39
.L38:
	mov	$1, %eax
.L39:
	#END OR
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -248(%ebp)
	#END LOAD
	leal	.L40, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	#AND
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -252(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	#LOAD
	movl	%eax, -256(%ebp)
	#END LOAD
	#LOAD
	movl	b, %eax
	#END LOAD
	andl	%eax, -256(%ebp)
	cmp	$0, %eax
	je	.L41
	mov	$1, %eax
.L41:
	#END AND
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -260(%ebp)
	#END LOAD
	leal	.L42, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $1
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$1, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#AND
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -264(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	#LOAD
	movl	%eax, -268(%ebp)
	#END LOAD
	#LOAD
	movl	b, %eax
	#END LOAD
	andl	%eax, -268(%ebp)
	cmp	$0, %eax
	je	.L43
	mov	$1, %eax
.L43:
	#END AND
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -272(%ebp)
	#END LOAD
	leal	.L44, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	   #INT
	   #_operand = $1
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$1, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#AND
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	#LOAD
	movl	%eax, -276(%ebp)
	#END LOAD
	#LOAD
	movl	a, %eax
	#END LOAD
	#LOAD
	movl	%eax, -280(%ebp)
	#END LOAD
	#LOAD
	movl	b, %eax
	#END LOAD
	andl	%eax, -280(%ebp)
	cmp	$0, %eax
	je	.L45
	mov	$1, %eax
.L45:
	#END AND
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
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #_operand = b
	    #END ID
	pushl	b
	    #ID
	    #_operand = a
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -284(%ebp)
	#END LOAD
	leal	.L46, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	#RETURN
	   #INT
	   #_operand = $0
	   #END INT
	#LOAD
	movl	$0, %eax
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
	.set	main.size, 284
	.globl	main
#GLOBALS
	.comm	a, 4
	.comm	b, 4
	.comm	d, 8
#STRINGS
.L1:	.asciz	"\n%d+%d=%d\n"
.L2:	.asciz	"\n%d-%d=%d\n"
.L3:	.asciz	"\n%d*%d=%d\n"
.L4:	.asciz	"\n%d/%d=%d\n"
.L5:	.asciz	"\n%d/50=%d\n"
.L6:	.asciz	"\n%d/2=%d\n"
.L7:	.asciz	"\n%d%%%d=%d\n"
.L8:	.asciz	"\n%d%%%d=%d\n"
.L9:	.asciz	"\n%d%%%d=%d\n"
.L10:	.asciz	"\n-(%d)=%d\n"
.L11:	.asciz	"\n!%d = %d\n"
.L12:	.asciz	"\n!%d = %d\n"
.L13:	.asciz	"\n%d < 10: %d\n"
.L14:	.asciz	"\n%d < 90: %d\n"
.L15:	.asciz	"\n%d > %d: %d\n"
.L16:	.asciz	"\n%d > %d: %d\n"
.L17:	.asciz	"\n%d <= %d: %d\n"
.L18:	.asciz	"\n%d <= %d: %d\n"
.L19:	.asciz	"\n%d >= %d: %d\n"
.L20:	.asciz	"\n%d >= %d: %d\n"
.L23:	.asciz	"\n%d == %d: %d\n"
.L26:	.asciz	"\n%d == %d: %d\n"
.L27:	.asciz	"\n%d != %d: %d\n"
.L28:	.asciz	"\n%d != %d: %d\n"
.L31:	.asciz	"\n%d or %d = %d\n"
.L34:	.asciz	"\n%d or %d = %d\n"
.L37:	.asciz	"\n%d or %d = %d\n"
.L40:	.asciz	"\n%d or %d = %d\n"
.L42:	.asciz	"\n%d && %d = %d\n"
.L44:	.asciz	"\n%d && %d = %d\n"
.L46:	.asciz	"\n%d && %d = %d\n"
