#FUNCTION
	#PROLOGUE
pi:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$pi.size, %esp
	#BODY
	 #BLOCK
	#RETURN
	   #REAL
	movsd	.L1, %xmm0
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
	.set	pi.size, 0
	.globl	pi
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
	    #offset=-57
	    #END ID
#after -57(%ebp)
	#CALL
	call	pi
	#END CALL
	movsd	%xmm0, -57(%ebp)
	  #END ASSIGNMENT
	#CALL
	    #ID
	    #offset=-57
	    #END ID
	movsd	-57(%ebp), %xmm1
	subl	$8, %esp
	movsd	%xmm1, (%esp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L3, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	$7, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	$393, %esi
	movl	%esi, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#ADD
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	addl	b, %ecx
	#END ADD
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -65(%ebp)
	movl	%ecx, -69(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L4, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	$50, %edi
	movl	%edi, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -73(%ebp)
	movl	$170, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#SUBTRACT
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	subl	b, %ecx
	#END SUBTRACT
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -77(%ebp)
	movl	%ecx, -81(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L5, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -85(%ebp)
	movl	$9, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -89(%ebp)
	movl	$8, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after d
	   #REAL
	movsd	.L6, %xmm1
	movsd	%xmm1, d
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-57
	    #END ID
#after -57(%ebp)
	#MULTIPLY
	    #ID
	    #offset=0
	    #END ID
	   #REAL
	movsd	d, %xmm2
	mulsd	.L7, %xmm2
	#END MULTIPLY
	movsd	%xmm2, -57(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -93(%ebp)
	    #ID
	    #offset=-57
	    #END ID
	movsd	-57(%ebp), %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	    #ID
	    #offset=0
	    #END ID
	movsd	d, %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L8, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$20, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#MULTIPLY
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	imull	b, %ecx
	#END MULTIPLY
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -97(%ebp)
	movl	%ecx, -101(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L9, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -105(%ebp)
	movl	$100, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -109(%ebp)
	movl	$5, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#DIVIDE
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	%eax, -113(%ebp)
	movl	a, %eax
	cltd
	idivl	b
	#END DIVIDE
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -117(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L10, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#DIVIDE
	    #ID
	    #offset=0
	    #END ID
	   #INT
	   #END INT
	movl	%eax, -121(%ebp)
	movl	a, %eax
	cltd
	movl	$50, %ecx
	idivl	%ecx
	#END DIVIDE
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -125(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L11, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#DIVIDE
	    #ID
	    #offset=0
	    #END ID
	   #INT
	   #END INT
	movl	%eax, -129(%ebp)
	movl	b, %eax
	cltd
	movl	$2, %ecx
	idivl	%ecx
	#END DIVIDE
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -133(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L12, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -137(%ebp)
	movl	$12, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -141(%ebp)
	movl	$7, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#REMAINDER
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	%eax, -145(%ebp)
	movl	a, %eax
	cltd
	idivl	b
	#END REMAINDER
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%edx, -149(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L13, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -153(%ebp)
	movl	$100, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#REMAINDER
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	%eax, -157(%ebp)
	movl	a, %eax
	cltd
	idivl	b
	#END REMAINDER
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%edx, -161(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L14, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -165(%ebp)
	movl	$24, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -169(%ebp)
	movl	$33, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#REMAINDER
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	%eax, -173(%ebp)
	movl	a, %eax
	cltd
	idivl	b
	#END REMAINDER
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%edx, -177(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L15, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	#NEGATE
	   #INT
	   #END INT
	movl	$66, %ecx
	negl	%ecx
	#END NEGATE
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#NEGATE
	    #ID
	    #offset=0
	    #END ID
	movl	a, %edx
	negl	%edx
	#END NEGATE
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -181(%ebp)
	movl	%ecx, -185(%ebp)
	movl	%edx, -189(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L16, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-57
	    #END ID
#after -57(%ebp)
	#NEGATE
	    #ID
	    #offset=0
	    #END ID
	movsd	d, %xmm3
	pxor	%xmm4, %xmm4
	subsd	%xmm3, %xmm4
	movsd	%xmm4, %xmm3
	#END NEGATE
	movsd	%xmm3, -57(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -193(%ebp)
	    #ID
	    #offset=-57
	    #END ID
	movsd	-57(%ebp), %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	    #ID
	    #offset=0
	    #END ID
	movsd	d, %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L17, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$20, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -197(%ebp)
	movl	$17, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -201(%ebp)
	movl	$5, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-57
	    #END ID
#after -57(%ebp)
	#DIVIDE
	#CAST
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	#LONG TO FP
	cvtsi2sd	%ecx, %xmm4
	#END CAST
	#CAST
	    #ID
	    #offset=0
	    #END ID
	movl	b, %ecx
	#LONG TO FP
	cvtsi2sd	%ecx, %xmm5
	#END CAST
	movsd	%xmm4, %xmm6
	divsd	%xmm5, %xmm6
	#END DIVIDE
	movsd	%xmm6, -57(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -205(%ebp)
	    #ID
	    #offset=-57
	    #END ID
	movsd	-57(%ebp), %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L18, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$20, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-49
	    #END ID
#after -49(%ebp)
	#CAST
	   #INT
	   #END INT
	movl	$15, %ecx
	#LONG TO BYTE/LONG
	#END CAST
	movb	%cl, -49(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	#CAST
	    #ID
	    #offset=-49
	    #END ID
	movb	-49(%ebp), %dl
	#BYTE TO LONG
	movl	%eax, -209(%ebp)
	movsx	%dl, %eax
	#END CAST
	movl	%eax, a
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -213(%ebp)
	movb	%cl, -214(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#CAST
	    #ID
	    #offset=-49
	    #END ID
	movb	-49(%ebp), %al
	#BYTE TO LONG
	movsx	%al, %ecx
	#END CAST
	pushl	%ecx
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L19, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-57
	    #END ID
#after -57(%ebp)
	#CAST
	    #ID
	    #offset=-49
	    #END ID
	movb	-49(%ebp), %dl
	#BYTE TO FP
	movl	%eax, -218(%ebp)
	movsx	%dl, %eax
	cvtsi2sd	%eax, %xmm4
	#END CAST
	movsd	%xmm4, -57(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%ecx, -222(%ebp)
	    #ID
	    #offset=-57
	    #END ID
	movsd	-57(%ebp), %xmm5
	subl	$8, %esp
	movsd	%xmm5, (%esp)
	#CAST
	    #ID
	    #offset=-49
	    #END ID
	movb	-49(%ebp), %al
	#BYTE TO LONG
	movsx	%al, %ecx
	#END CAST
	pushl	%ecx
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L20, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -226(%ebp)
	movl	$0, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#NOT
	    #ID
	    #offset=0
	    #END ID
	movl	a, %edx
	cmpl	$0, %edx
	sete	%dl
	movzbl	%dl, %edx
	#END NOT
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -230(%ebp)
	movl	%ecx, -234(%ebp)
	movl	%edx, -238(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L21, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -242(%ebp)
	movl	$1, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#NOT
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmpl	$0, %ecx
	sete	%cl
	movzbl	%cl, %ecx
	#END NOT
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -246(%ebp)
	movl	%ecx, -250(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L22, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -254(%ebp)
	movl	$10, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after aa
	#ADDRESS
	#operand = 
	    #ID
	    #offset=0
	    #END ID
	leal	a, %ecx
	#END ADDRESS
	movl	%ecx, aa
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -258(%ebp)
	movl	%ecx, -262(%ebp)
	#DEREFERENCE
	    #ID
	    #offset=0
	    #END ID
	movl	aa, %eax
	movl	(%eax), %eax
	#END DEREFERENCE
	pushl	%eax
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L23, %ecx
	#END ADDRESS
	pushl	%ecx
	call	printf
	addl	$8, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-8
	    #END ID
#after -8(%ebp)
	   #INT
	   #END INT
	movl	%ebx, -266(%ebp)
	movl	$0, %ebx
	movl	%ebx, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L24:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #offset=-8
	    #END ID
	   #INT
	   #END INT
	movl	-8(%ebp), %edx
	cmp	$20, %edx
	setl	%dl
	movzbl	%dl, %edx
	#END LESS THAN
	cmpl	$0, %edx
	je	.L25
	 #BLOCK
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-8
	    #END ID
#after -8(%ebp)
	#ADD
	    #ID
	    #offset=-8
	    #END ID
	   #INT
	   #END INT
	movl	-8(%ebp), %edx
	addl	$1, %edx
	#END ADD
	movl	%edx, -8(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -270(%ebp)
	movl	%ecx, -274(%ebp)
	movl	%edx, -278(%ebp)
	    #ID
	    #offset=-8
	    #END ID
	pushl	-8(%ebp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L26, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	jmp	.L24
.L25:
	#END WHILE
	#IF
	#EXPRESSION::TEST
	#NOT EQUAL
	    #ID
	    #offset=0
	    #END ID
	   #INT
	   #END INT
	movl	a, %eax
	cmpl	$0, %eax
	setne	%al
	movzbl	%al, %eax
	#END EQUAL
	#END NOT EQUAL
	cmpl	$0, %eax
	je	.L27
	 #BLOCK
	#CALL
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L29, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	jmp	.L28
.L27:
	 #BLOCK
	#CALL
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L30, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
.L28:
	#END IF
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -282(%ebp)
	movl	$66, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#LESS THAN
	    #ID
	    #offset=0
	    #END ID
	   #INT
	   #END INT
	movl	a, %eax
	cmp	$10, %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -286(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L31, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#LESS THAN
	    #ID
	    #offset=0
	    #END ID
	   #INT
	   #END INT
	movl	a, %ecx
	cmp	$90, %ecx
	setl	%cl
	movzbl	%cl, %ecx
	#END LESS THAN
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -290(%ebp)
	movl	%ecx, -294(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L32, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -298(%ebp)
	movl	$21, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#GREATER THAN
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmp	b, %ecx
	setg	%cl
	movzbl	%cl, %ecx
	#END GREATER THAN
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -302(%ebp)
	movl	%ecx, -306(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L33, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#GREATER THAN
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	b, %ecx
	cmp	a, %ecx
	setg	%cl
	movzbl	%cl, %ecx
	#END GREATER THAN
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -310(%ebp)
	movl	%ecx, -314(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L34, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#LESS OR EQUAL
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmp	b, %ecx
	setle	%cl
	movzbl	%cl, %ecx
	#END LESS OR EQUAL
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -318(%ebp)
	movl	%ecx, -322(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L35, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -326(%ebp)
	movl	$21, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#LESS OR EQUAL
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmp	b, %ecx
	setle	%cl
	movzbl	%cl, %ecx
	#END LESS OR EQUAL
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -330(%ebp)
	movl	%ecx, -334(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L36, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#GREATER OR EQUAL
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmp	b, %ecx
	setge	%cl
	movzbl	%cl, %ecx
	#END GREATER OR EQUAL
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -338(%ebp)
	movl	%ecx, -342(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L37, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -346(%ebp)
	movl	$243, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#GREATER OR EQUAL
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	b, %ecx
	cmp	a, %ecx
	setge	%cl
	movzbl	%cl, %ecx
	#END GREATER OR EQUAL
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -350(%ebp)
	movl	%ecx, -354(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L38, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -358(%ebp)
	movl	$345, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -362(%ebp)
	movl	$345, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#EQUAL
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmpl	b, %ecx
	sete	%cl
	movzbl	%cl, %ecx
	#END EQUAL
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -366(%ebp)
	movl	%ecx, -370(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L41, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -374(%ebp)
	movl	$366, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#EQUAL
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmpl	b, %ecx
	sete	%cl
	movzbl	%cl, %ecx
	#END EQUAL
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -378(%ebp)
	movl	%ecx, -382(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L44, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -386(%ebp)
	movl	$21, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -390(%ebp)
	movl	$44, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#NOT EQUAL
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmpl	b, %ecx
	setne	%cl
	movzbl	%cl, %ecx
	#END EQUAL
	#END NOT EQUAL
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -394(%ebp)
	movl	%ecx, -398(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L45, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -402(%ebp)
	movl	$21, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#NOT EQUAL
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmpl	b, %ecx
	setne	%cl
	movzbl	%cl, %ecx
	#END EQUAL
	#END NOT EQUAL
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -406(%ebp)
	movl	%ecx, -410(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L46, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -414(%ebp)
	movl	$1, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -418(%ebp)
	movl	$0, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#OR
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmpl	$0, %ecx
	jne	.L47
	cmpl	$0, b
	jne	.L47
	mov	$0, %edx
	jmp	.L48
.L47:
	mov	$1, %edx
.L48:
	#END OR
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -422(%ebp)
	movl	%ecx, -426(%ebp)
	movl	%edx, -430(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L49, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -434(%ebp)
	movl	$0, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -438(%ebp)
	movl	$1, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#OR
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmpl	$0, %ecx
	jne	.L50
	cmpl	$0, b
	jne	.L50
	mov	$0, %edx
	jmp	.L51
.L50:
	mov	$1, %edx
.L51:
	#END OR
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -442(%ebp)
	movl	%ecx, -446(%ebp)
	movl	%edx, -450(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L52, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -454(%ebp)
	movl	$1, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#OR
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmpl	$0, %ecx
	jne	.L53
	cmpl	$0, b
	jne	.L53
	mov	$0, %edx
	jmp	.L54
.L53:
	mov	$1, %edx
.L54:
	#END OR
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -458(%ebp)
	movl	%ecx, -462(%ebp)
	movl	%edx, -466(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L55, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -470(%ebp)
	movl	$0, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -474(%ebp)
	movl	$0, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#OR
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	cmpl	$0, %ecx
	jne	.L56
	cmpl	$0, b
	jne	.L56
	mov	$0, %edx
	jmp	.L57
.L56:
	mov	$1, %edx
.L57:
	#END OR
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -478(%ebp)
	movl	%ecx, -482(%ebp)
	movl	%edx, -486(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L58, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#AND
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	movl	b, %edx
	andl	%edx, %ecx
	cmp	$0, %edx
	je	.L59
	mov	$1, %edx
.L59:
	#END AND
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -490(%ebp)
	movl	%ecx, -494(%ebp)
	movl	%edx, -498(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L60, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after a
	   #INT
	   #END INT
	movl	%ebx, -502(%ebp)
	movl	$1, %ebx
	movl	%ebx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#AND
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	movl	b, %edx
	andl	%edx, %ecx
	cmp	$0, %edx
	je	.L61
	mov	$1, %edx
.L61:
	#END AND
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -506(%ebp)
	movl	%ecx, -510(%ebp)
	movl	%edx, -514(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L62, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=0
	    #END ID
#after b
	   #INT
	   #END INT
	movl	%ebx, -518(%ebp)
	movl	$1, %ebx
	movl	%ebx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-4
	    #END ID
#after -4(%ebp)
	#AND
	    #ID
	    #offset=0
	    #END ID
	    #ID
	    #offset=0
	    #END ID
	movl	a, %ecx
	movl	b, %edx
	andl	%edx, %ecx
	cmp	$0, %edx
	je	.L63
	mov	$1, %edx
.L63:
	#END AND
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -522(%ebp)
	movl	%ecx, -526(%ebp)
	movl	%edx, -530(%ebp)
	    #ID
	    #offset=-4
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #offset=0
	    #END ID
	pushl	b
	    #ID
	    #offset=0
	    #END ID
	pushl	a
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L64, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-8
	    #END ID
#after -8(%ebp)
	   #INT
	   #END INT
	movl	%ebx, -534(%ebp)
	movl	$0, %ebx
	movl	%ebx, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L65:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #offset=-8
	    #END ID
	   #INT
	   #END INT
	movl	-8(%ebp), %ecx
	cmp	$8, %ecx
	setl	%cl
	movzbl	%cl, %ecx
	#END LESS THAN
	cmpl	$0, %ecx
	je	.L66
	 #BLOCK
	  #ASSIGNMENT
	#ADD
	#ADDRESS
	#operand = 
	    #ID
	    #offset=-48
	    #END ID
	leal	-48(%ebp), %ecx
	#END ADDRESS
	#MULTIPLY
	    #ID
	    #offset=-8
	    #END ID
	   #INT
	   #END INT
	movl	-8(%ebp), %edx
	imull	$4, %edx
	#END MULTIPLY
	addl	%edx, %ecx
	#END ADD
	    #ID
	    #offset=-8
	    #END ID
	movl	%ebx, -538(%ebp)
	movl	-8(%ebp), %ebx
	movl	%ebx, (%ecx)

	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #offset=-8
	    #END ID
#after -8(%ebp)
	#ADD
	    #ID
	    #offset=-8
	    #END ID
	   #INT
	   #END INT
	movl	-8(%ebp), %edx
	addl	$1, %edx
	#END ADD
	movl	%edx, -8(%ebp)
	  #END ASSIGNMENT
	jmp	.L65
.L66:
	#END WHILE
	#RETURN
	   #INT
	   #END INT
	movl	$0, %eax
	jmp	.L2
	#END RETURN
.L2:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	main.size, 540
	.globl	main
#GLOBALS
	.comm	a, 4
	.comm	b, 4
	.comm	aa, 4
	.comm	d, 8
#STRINGS
.L3:	.asciz	"\npi()=%f\n"
.L4:	.asciz	"\n%d+%d=%d\n"
.L5:	.asciz	"\n%d-%d=%d\n"
.L8:	.asciz	"\n%f * 69 = %f\n"
.L9:	.asciz	"\n%d*%d=%d\n"
.L10:	.asciz	"\n%d/%d=%d\n"
.L11:	.asciz	"\n%d/50=%d\n"
.L12:	.asciz	"\n%d/2=%d\n"
.L13:	.asciz	"\n%d%%%d=%d\n"
.L14:	.asciz	"\n%d%%%d=%d\n"
.L15:	.asciz	"\n%d%%%d=%d\n"
.L16:	.asciz	"\n-(%d)=%d\n"
.L17:	.asciz	"\n-(%f)=%f\n"
.L18:	.asciz	"(double) %d / %d = %f"
.L19:	.asciz	"\n(int)%c = %d\n"
.L20:	.asciz	"\b(double)%c = %f\n"
.L21:	.asciz	"\n!%d = %d\n"
.L22:	.asciz	"\n!%d = %d\n"
.L23:	.asciz	"\nvalue of a: %d\n"
.L26:	.asciz	"\n%d\n"
.L29:	.asciz	"\n%d != 0"
.L30:	.asciz	"\n%d == 0"
.L31:	.asciz	"\n%d < 10: %d\n"
.L32:	.asciz	"\n%d < 90: %d\n"
.L33:	.asciz	"\n%d > %d: %d\n"
.L34:	.asciz	"\n%d > %d: %d\n"
.L35:	.asciz	"\n%d <= %d: %d\n"
.L36:	.asciz	"\n%d <= %d: %d\n"
.L37:	.asciz	"\n%d >= %d: %d\n"
.L38:	.asciz	"\n%d >= %d: %d\n"
.L41:	.asciz	"\n%d == %d: %d\n"
.L44:	.asciz	"\n%d == %d: %d\n"
.L45:	.asciz	"\n%d != %d: %d\n"
.L46:	.asciz	"\n%d != %d: %d\n"
.L49:	.asciz	"\n%d or %d = %d\n"
.L52:	.asciz	"\n%d or %d = %d\n"
.L55:	.asciz	"\n%d or %d = %d\n"
.L58:	.asciz	"\n%d or %d = %d\n"
.L60:	.asciz	"\n%d && %d = %d\n"
.L62:	.asciz	"\n%d && %d = %d\n"
.L64:	.asciz	"\n%d && %d = %d\n"
#REALS
.L1:	.double	3.14
.L6:	.double	3.14
.L7:	.double	69
