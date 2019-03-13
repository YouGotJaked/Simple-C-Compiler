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
	movl	$7, %eax
	movl	%eax, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$393, %ecx
	movl	%ecx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	a, %edx
	addl	b, %edx
	#END ADD
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -53(%ebp)
	movl	%ecx, -57(%ebp)
	movl	%edx, -61(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L1, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$50, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	$170, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#SUBTRACT
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -65(%ebp)
#reg= %eax
	movl	a, %eax
	subl	b, %eax
	#END SUBTRACT
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -69(%ebp)
	movl	%ecx, -73(%ebp)
	movl	%edx, -77(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L2, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$9, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	$8, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #REAL
#reg= %xmm0
	movsd	.L3, %xmm0
	movsd	%xmm0, d
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#MULTIPLY
	    #ID
	    #END ID
	   #REAL
#reg= %xmm1
	movsd	d, %xmm1
	mulsd	.L4, %xmm1
	#END MULTIPLY
	movsd	%xmm1, -17(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -81(%ebp)
	movl	%ecx, -85(%ebp)
	movl	%edx, -89(%ebp)
	    #ID
	    #END ID
	movsd	-17(%ebp), %xmm2
	subl	$8, %esp
	movsd	%xmm2, (%esp)
	    #ID
	    #END ID
	movsd	d, %xmm2
	subl	$8, %esp
	movsd	%xmm2, (%esp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L5, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$20, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#MULTIPLY
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %ecx is empty
#reg= %ecx
	movl	a, %ecx
	imull	b, %ecx
	#END MULTIPLY
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -93(%ebp)
	movl	%ecx, -97(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L6, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$100, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	$5, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#DIVIDE
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -101(%ebp)
#reg= %eax
	movl	a, %eax
	cltd
	idivl	b
	#END DIVIDE
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -105(%ebp)
	movl	%ecx, -109(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L7, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#DIVIDE
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	%eax, -113(%ebp)
#reg= %eax
	movl	a, %eax
	cltd
#reg= %ebx
	movl	$50, %ebx
	idivl	%ebx
	#END DIVIDE
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -117(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L8, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#DIVIDE
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	%eax, -121(%ebp)
#reg= %eax
	movl	b, %eax
	cltd
#reg= %ebx
	movl	$2, %ebx
	idivl	%ebx
	#END DIVIDE
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -125(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L9, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$12, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	$7, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#REMAINDER
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -129(%ebp)
#reg= %eax
	movl	a, %eax
#temp=%ebx
	cltd
	idivl	b
	#END REMAINDER
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%ecx, -133(%ebp)
	movl	%edx, -137(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L10, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$100, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#REMAINDER
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -141(%ebp)
#reg= %eax
	movl	a, %eax
#temp=%ebx
	cltd
	idivl	b
	#END REMAINDER
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%ecx, -145(%ebp)
	movl	%edx, -149(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L11, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$24, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	$33, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#REMAINDER
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -153(%ebp)
#reg= %eax
	movl	a, %eax
#temp=%ebx
	cltd
	idivl	b
	#END REMAINDER
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%ecx, -157(%ebp)
	movl	%edx, -161(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L12, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#NEGATE
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$66, %ecx
	negl	%ecx
	#END NEGATE
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#NEGATE
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	a, %edx
	negl	%edx
	#END NEGATE
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -165(%ebp)
	movl	%ecx, -169(%ebp)
	movl	%edx, -173(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L13, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#NEGATE
	    #ID
	    #END ID
#reg= %xmm2
	movsd	d, %xmm2
	pxor	%xmm3, %xmm3
	subsd	%xmm3, %xmm2
	#END NEGATE
	movsd	%xmm2, -17(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -177(%ebp)
	    #ID
	    #END ID
	movsd	-17(%ebp), %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	    #ID
	    #END ID
	movsd	d, %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L14, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$20, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$0, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#NOT
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	a, %edx
	cmpl	$0, %edx
	sete	%dl
	movzbl	%dl, %edx
	#END NOT
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -181(%ebp)
	movl	%ecx, -185(%ebp)
	movl	%edx, -189(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L15, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$1, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#NOT
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	a, %edx
	cmpl	$0, %edx
	sete	%dl
	movzbl	%dl, %edx
	#END NOT
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -193(%ebp)
	movl	%ecx, -197(%ebp)
	movl	%edx, -201(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L16, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$10, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADDRESS
	    #ID
	    #END ID
#register %edx is empty
	leal	a, %edx
	#END ADDRESS
	movl	%edx, aa
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -205(%ebp)
	movl	%ecx, -209(%ebp)
	movl	%edx, -225(%ebp)
	#DEREFERENCE
	    #ID
	    #END ID
#register %eax is empty
#reg= %eax
	movl	aa, %eax
	movl	(%eax), %eax
	#END DEREFERENCE
	pushl	%eax
	#ADDRESS
	   #STRING
#register %ecx is empty
	leal	.L17, %ecx
	#END ADDRESS
	pushl	%ecx
	call	printf
	addl	$8, %esp
	#END CALL
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
.L18:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	%eax, -229(%ebp)
#reg= %eax
	movl	-8(%ebp), %eax
	cmp	$20, %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L19
	 #BLOCK
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
	movl	-8(%ebp), %eax
	addl	$1, %eax
	#END ADD
	movl	%eax, -8(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -233(%ebp)
	movl	%ecx, -237(%ebp)
	movl	%edx, -241(%ebp)
	    #ID
	    #END ID
	pushl	-8(%ebp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L20, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	jmp	.L18
.L19:
	#END WHILE
	#IF
	#EXPRESSION::TEST
	#NOT EQUAL
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	a, %eax
	cmpl	$0, %eax
	setne	%al
	movzbl	%al, %eax
	#END EQUAL
	#END NOT EQUAL
	cmpl	$0, %eax
	je	.L21
	 #BLOCK
	#CALL
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L23, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	jmp	.L22
.L21:
	 #BLOCK
	#CALL
	movl	%eax, -245(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L24, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
.L22:
	#END IF
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$66, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#LESS THAN
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	a, %edx
	cmp	$10, %edx
	setl	%dl
	movzbl	%dl, %edx
	#END LESS THAN
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -249(%ebp)
	movl	%ecx, -253(%ebp)
	movl	%edx, -257(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L25, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#LESS THAN
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	a, %ecx
	cmp	$90, %ecx
	setl	%cl
	movzbl	%cl, %ecx
	#END LESS THAN
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -261(%ebp)
	movl	%ecx, -265(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L26, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$21, %ecx
	movl	%ecx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#GREATER THAN
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	a, %edx
	cmp	b, %edx
	setg	%dl
	movzbl	%dl, %edx
	#END GREATER THAN
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -269(%ebp)
	movl	%ecx, -273(%ebp)
	movl	%edx, -277(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L27, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#GREATER THAN
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %ecx is empty
#reg= %ecx
	movl	b, %ecx
	cmp	a, %ecx
	setg	%cl
	movzbl	%cl, %ecx
	#END GREATER THAN
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -281(%ebp)
	movl	%ecx, -285(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	    #ID
	    #END ID
	pushl	b
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L28, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#LESS OR EQUAL
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %ecx is empty
#reg= %ecx
	movl	a, %ecx
	cmp	b, %ecx
	setle	%cl
	movzbl	%cl, %ecx
	#END LESS OR EQUAL
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -289(%ebp)
	movl	%ecx, -293(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L29, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$21, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#LESS OR EQUAL
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	a, %edx
	cmp	b, %edx
	setle	%dl
	movzbl	%dl, %edx
	#END LESS OR EQUAL
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -297(%ebp)
	movl	%ecx, -301(%ebp)
	movl	%edx, -305(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L30, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#GREATER OR EQUAL
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %ecx is empty
#reg= %ecx
	movl	a, %ecx
	cmp	b, %ecx
	setge	%cl
	movzbl	%cl, %ecx
	#END GREATER OR EQUAL
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -309(%ebp)
	movl	%ecx, -313(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L31, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$243, %ecx
	movl	%ecx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#GREATER OR EQUAL
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	b, %edx
	cmp	a, %edx
	setge	%dl
	movzbl	%dl, %edx
	#END GREATER OR EQUAL
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -317(%ebp)
	movl	%ecx, -321(%ebp)
	movl	%edx, -325(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	    #ID
	    #END ID
	pushl	b
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L32, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$345, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	$345, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#EQUAL
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -329(%ebp)
#reg= %eax
	movl	a, %eax
	cmpl	b, %eax
	sete	%al
	movzbl	%al, %eax
	#END EQUAL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -333(%ebp)
	movl	%ecx, -337(%ebp)
	movl	%edx, -341(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L35, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$366, %ecx
	movl	%ecx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#EQUAL
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	a, %edx
	cmpl	b, %edx
	sete	%dl
	movzbl	%dl, %edx
	#END EQUAL
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -345(%ebp)
	movl	%ecx, -349(%ebp)
	movl	%edx, -353(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L38, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$21, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	$44, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#NOT EQUAL
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -357(%ebp)
#reg= %eax
	movl	a, %eax
	cmpl	b, %eax
	setne	%al
	movzbl	%al, %eax
	#END EQUAL
	#END NOT EQUAL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -361(%ebp)
	movl	%ecx, -365(%ebp)
	movl	%edx, -369(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L39, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$21, %ecx
	movl	%ecx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#NOT EQUAL
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	a, %edx
	cmpl	b, %edx
	setne	%dl
	movzbl	%dl, %edx
	#END EQUAL
	#END NOT EQUAL
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -373(%ebp)
	movl	%ecx, -377(%ebp)
	movl	%edx, -381(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L40, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$1, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	$0, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#OR
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -385(%ebp)
#reg= %eax
	movl	a, %eax
	cmpl	$0, %eax
	jne	.L41
	cmpl	$0, b
	jne	.L41
	movl	%eax, -389(%ebp)
	mov	$0, %eax
	jmp	.L42
.L41:
	mov	$1, %eax
.L42:
	#END OR
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -393(%ebp)
	movl	%ecx, -397(%ebp)
	movl	%edx, -401(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L43, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$0, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	$1, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#OR
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -405(%ebp)
#reg= %eax
	movl	a, %eax
	cmpl	$0, %eax
	jne	.L44
	cmpl	$0, b
	jne	.L44
	movl	%eax, -409(%ebp)
	mov	$0, %eax
	jmp	.L45
.L44:
	mov	$1, %eax
.L45:
	#END OR
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -413(%ebp)
	movl	%ecx, -417(%ebp)
	movl	%edx, -421(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L46, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$1, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#OR
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	a, %edx
	cmpl	$0, %edx
	jne	.L47
	cmpl	$0, b
	jne	.L47
	movl	%eax, -425(%ebp)
	mov	$0, %eax
	jmp	.L48
.L47:
	mov	$1, %eax
.L48:
	#END OR
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -429(%ebp)
	movl	%ecx, -433(%ebp)
	movl	%edx, -437(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L49, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$0, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	$0, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#OR
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	%eax, -441(%ebp)
#reg= %eax
	movl	a, %eax
	cmpl	$0, %eax
	jne	.L50
	cmpl	$0, b
	jne	.L50
	movl	%eax, -445(%ebp)
	mov	$0, %eax
	jmp	.L51
.L50:
	mov	$1, %eax
.L51:
	#END OR
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -449(%ebp)
	movl	%ecx, -453(%ebp)
	movl	%edx, -457(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L52, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#AND
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %ecx is empty
#reg= %ecx
	movl	a, %ecx
#register %edx is empty
#reg= %edx
	movl	b, %edx
	andl	%edx, %ecx
	cmp	$0, %edx
	je	.L53
	mov	$1, %edx
.L53:
	#END AND
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -461(%ebp)
	movl	%ecx, -465(%ebp)
	movl	%edx, -469(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L54, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$1, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#AND
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	a, %edx
	movl	%eax, -473(%ebp)
#reg= %eax
	movl	b, %eax
	andl	%eax, %edx
	cmp	$0, %eax
	je	.L55
	mov	$1, %eax
.L55:
	#END AND
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -477(%ebp)
	movl	%ecx, -481(%ebp)
	movl	%edx, -485(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L56, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$1, %ecx
	movl	%ecx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#AND
	    #ID
	    #END ID
	    #ID
	    #END ID
#register %edx is empty
#reg= %edx
	movl	a, %edx
	movl	%eax, -489(%ebp)
#reg= %eax
	movl	b, %eax
	andl	%eax, %edx
	cmp	$0, %eax
	je	.L57
	mov	$1, %eax
.L57:
	#END AND
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -493(%ebp)
	movl	%ecx, -497(%ebp)
	movl	%edx, -501(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L58, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	#RETURN
	   #INT
	   #END INT
	movl	%eax, -505(%ebp)
#reg= %eax
	movl	$0, %eax
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
	.set	main.size, 508
	.globl	main
#GLOBALS
	.comm	a, 4
	.comm	b, 4
	.comm	aa, 16
	.comm	d, 8
#STRINGS
.L1:	.asciz	"\n%d+%d=%d\n"
.L2:	.asciz	"\n%d-%d=%d\n"
.L5:	.asciz	"\n%f * 69 = %f\n"
.L6:	.asciz	"\n%d*%d=%d\n"
.L7:	.asciz	"\n%d/%d=%d\n"
.L8:	.asciz	"\n%d/50=%d\n"
.L9:	.asciz	"\n%d/2=%d\n"
.L10:	.asciz	"\n%d%%%d=%d\n"
.L11:	.asciz	"\n%d%%%d=%d\n"
.L12:	.asciz	"\n%d%%%d=%d\n"
.L13:	.asciz	"\n-(%d)=%d\n"
.L14:	.asciz	"\b-(%f)=%f\n"
.L15:	.asciz	"\n!%d = %d\n"
.L16:	.asciz	"\n!%d = %d\n"
.L17:	.asciz	"\nvalue of a: %d\n"
.L20:	.asciz	"\n%d\n"
.L23:	.asciz	"\n%d != 0"
.L24:	.asciz	"\n%d == 0"
.L25:	.asciz	"\n%d < 10: %d\n"
.L26:	.asciz	"\n%d < 90: %d\n"
.L27:	.asciz	"\n%d > %d: %d\n"
.L28:	.asciz	"\n%d > %d: %d\n"
.L29:	.asciz	"\n%d <= %d: %d\n"
.L30:	.asciz	"\n%d <= %d: %d\n"
.L31:	.asciz	"\n%d >= %d: %d\n"
.L32:	.asciz	"\n%d >= %d: %d\n"
.L35:	.asciz	"\n%d == %d: %d\n"
.L38:	.asciz	"\n%d == %d: %d\n"
.L39:	.asciz	"\n%d != %d: %d\n"
.L40:	.asciz	"\n%d != %d: %d\n"
.L43:	.asciz	"\n%d or %d = %d\n"
.L46:	.asciz	"\n%d or %d = %d\n"
.L49:	.asciz	"\n%d or %d = %d\n"
.L52:	.asciz	"\n%d or %d = %d\n"
.L54:	.asciz	"\n%d && %d = %d\n"
.L56:	.asciz	"\n%d && %d = %d\n"
.L58:	.asciz	"\n%d && %d = %d\n"
#REALS
.L3:	.double	3.14
.L4:	.double	69
