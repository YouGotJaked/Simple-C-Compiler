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
	    #ID
	    #END ID
	#CALL
	call	pi
	#END CALL
	movsd	%xmm0, -57(%ebp)
	  #END ASSIGNMENT
	#CALL
	    #ID
	    #END ID
	movsd	-57(%ebp), %xmm1
	subl	$8, %esp
	movsd	%xmm1, (%esp)
	#ADDRESS
	   #STRING
	leal	.L3, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$7, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$393, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	    #ID
	    #END ID
	movl	a, %esi
	addl	b, %esi
	#END ADD
	movl	%esi, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -65(%ebp)
	movl	%ecx, -69(%ebp)
	movl	%edx, -73(%ebp)
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
	leal	.L4, %edi
	#END ADDRESS
	pushl	%edi
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$50, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
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
#callee spill
	movl	%ebx, -77(%ebp)
	movl	a, %ebx
	subl	b, %ebx
	#END SUBTRACT
	movl	%ebx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -81(%ebp)
	movl	%ecx, -85(%ebp)
	movl	%edx, -89(%ebp)
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
#callee spill
	movl	%ebx, -93(%ebp)
	leal	.L5, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$9, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$8, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #REAL
	movsd	.L6, %xmm1
	movsd	%xmm1, d
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#MULTIPLY
	    #ID
	    #END ID
	   #REAL
	movsd	d, %xmm2
	mulsd	.L7, %xmm2
	#END MULTIPLY
	movsd	%xmm2, -57(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -97(%ebp)
	movl	%ecx, -101(%ebp)
	movl	%edx, -105(%ebp)
	    #ID
	    #END ID
	movsd	-57(%ebp), %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	    #ID
	    #END ID
	movsd	d, %xmm3
	subl	$8, %esp
	movsd	%xmm3, (%esp)
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -109(%ebp)
	leal	.L8, %ebx
	#END ADDRESS
	pushl	%ebx
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
	movl	a, %ecx
	imull	b, %ecx
	#END MULTIPLY
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -113(%ebp)
	movl	%ecx, -117(%ebp)
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
#callee spill
	movl	%ebx, -121(%ebp)
	leal	.L9, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$100, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
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
	movl	%eax, -125(%ebp)
	movl	a, %eax
	cltd
	idivl	b
	#END DIVIDE
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -129(%ebp)
	movl	%ecx, -133(%ebp)
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
#callee spill
	movl	%ebx, -137(%ebp)
	leal	.L10, %ebx
	#END ADDRESS
	pushl	%ebx
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
	movl	%eax, -141(%ebp)
	movl	a, %eax
	cltd
	movl	$50, %ecx
	idivl	%ecx
	#END DIVIDE
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -145(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -149(%ebp)
	leal	.L11, %ebx
	#END ADDRESS
	pushl	%ebx
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
	movl	%eax, -153(%ebp)
	movl	b, %eax
	cltd
	movl	$2, %ecx
	idivl	%ecx
	#END DIVIDE
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -157(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	b
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -161(%ebp)
	leal	.L12, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$12, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
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
	movl	%eax, -165(%ebp)
	movl	a, %eax
#callee spill
	movl	%ebx, -169(%ebp)
	cltd
	idivl	b
	#END REMAINDER
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%ecx, -173(%ebp)
	movl	%edx, -177(%ebp)
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
	leal	.L13, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
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
	movl	%eax, -181(%ebp)
	movl	a, %eax
	cltd
	idivl	b
	#END REMAINDER
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%ecx, -185(%ebp)
	movl	%edx, -189(%ebp)
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
#callee spill
	movl	%ebx, -193(%ebp)
	leal	.L14, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$24, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
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
	movl	%eax, -197(%ebp)
	movl	a, %eax
#callee spill
	movl	%ebx, -201(%ebp)
	cltd
	idivl	b
	#END REMAINDER
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%ecx, -205(%ebp)
	movl	%edx, -209(%ebp)
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
	leal	.L15, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#NEGATE
	   #INT
	   #END INT
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
	movl	a, %edx
	negl	%edx
	#END NEGATE
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -213(%ebp)
	movl	%ecx, -217(%ebp)
	movl	%edx, -221(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -225(%ebp)
	leal	.L16, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#NEGATE
	    #ID
	    #END ID
	movsd	d, %xmm3
	pxor	%xmm4, %xmm4
	subsd	%xmm3, %xmm4
	movsd	%xmm4, %xmm3
	#END NEGATE
	movsd	%xmm3, -57(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -229(%ebp)
	    #ID
	    #END ID
	movsd	-57(%ebp), %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	    #ID
	    #END ID
	movsd	d, %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -233(%ebp)
	leal	.L17, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$20, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$17, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$5, %edx
	movl	%edx, b
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#DIVIDE
	#CAST
	    #ID
	    #END ID
#callee spill
	movl	%ebx, -237(%ebp)
	movl	a, %ebx
	#LONG TO FP
	cvtsi2sd	%ebx, %xmm4
	#END CAST
	#CAST
	    #ID
	    #END ID
	movl	b, %ebx
	#LONG TO FP
	cvtsi2sd	%ebx, %xmm5
	#END CAST
	movsd	%xmm4, %xmm6
	divsd	%xmm5, %xmm6
	#END DIVIDE
	movsd	%xmm6, -57(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -241(%ebp)
	movl	%ecx, -245(%ebp)
	movl	%edx, -249(%ebp)
	    #ID
	    #END ID
	movsd	-57(%ebp), %xmm4
	subl	$8, %esp
	movsd	%xmm4, (%esp)
	    #ID
	    #END ID
	pushl	b
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	leal	.L18, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$20, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CAST
	   #INT
	   #END INT
	movl	$15, %ecx
	#LONG TO BYTE/LONG
	#END CAST
	movb	%cl, -49(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CAST
	    #ID
	    #END ID
	movb	-49(%ebp), %dl
	#BYTE TO LONG
#callee spill
	movl	%ebx, -253(%ebp)
	movsx	%dl, %ebx
	#END CAST
	movl	%ebx, a
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -257(%ebp)
	movb	%cl, -258(%ebp)
	    #ID
	    #END ID
	pushl	a
	#CAST
	    #ID
	    #END ID
	movb	-49(%ebp), %al
	#BYTE TO LONG
	movsx	%al, %ecx
	#END CAST
	pushl	%ecx
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -262(%ebp)
	leal	.L19, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CAST
	    #ID
	    #END ID
	movb	-49(%ebp), %dl
	#BYTE TO FP
#callee spill
	movl	%ebx, -266(%ebp)
	movsx	%dl, %ebx
	cvtsi2sd	%ebx, %xmm4
	#END CAST
	movsd	%xmm4, -57(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -270(%ebp)
	movl	%ecx, -274(%ebp)
	    #ID
	    #END ID
	movsd	-57(%ebp), %xmm5
	subl	$8, %esp
	movsd	%xmm5, (%esp)
	#CAST
	    #ID
	    #END ID
	movb	-49(%ebp), %al
	#BYTE TO LONG
	movsx	%al, %ecx
	#END CAST
	pushl	%ecx
	#ADDRESS
	   #STRING
	leal	.L20, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$16, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$0, %edx
	movl	%edx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#NOT
	    #ID
	    #END ID
#caller spill
	movl	%eax, -278(%ebp)
	movl	a, %eax
	cmpl	$0, %eax
	sete	%al
	movzbl	%al, %eax
	#END NOT
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -282(%ebp)
	movl	%ecx, -286(%ebp)
	movl	%edx, -290(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	leal	.L21, %eax
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
	movl	$1, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#NOT
	    #ID
	    #END ID
	movl	a, %edx
	cmpl	$0, %edx
	sete	%dl
	movzbl	%dl, %edx
	#END NOT
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -294(%ebp)
	movl	%ecx, -298(%ebp)
	movl	%edx, -302(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	leal	.L22, %eax
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
	movl	$10, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADDRESS
	    #ID
	    #END ID
	leal	a, %edx
	#END ADDRESS
	movl	%edx, aa
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -306(%ebp)
	movl	%ecx, -310(%ebp)
	movl	%edx, -314(%ebp)
	#DEREFERENCE
	    #ID
	    #END ID
	movl	aa, %eax
	movl	(%eax), %eax
	#END DEREFERENCE
	pushl	%eax
	#ADDRESS
	   #STRING
	leal	.L23, %ecx
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
	movl	$0, %edx
	movl	%edx, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L24:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	   #INT
	   #END INT
#caller spill
	movl	%eax, -318(%ebp)
	movl	-8(%ebp), %eax
	cmp	$20, %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L25
	 #BLOCK
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-8(%ebp), %eax
	addl	$1, %eax
	#END ADD
	movl	%eax, -8(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -322(%ebp)
	movl	%ecx, -326(%ebp)
	movl	%edx, -330(%ebp)
	    #ID
	    #END ID
	pushl	-8(%ebp)
	#ADDRESS
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
	    #END ID
	   #INT
	   #END INT
	movl	a, %eax
	cmpl	$0, %eax
	setne	%al
	movzbl	%al, %eax
	#END NOT EQUAL
	cmpl	$0, %eax
	je	.L27
	 #BLOCK
	#CALL
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	leal	.L29, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$8, %esp
	#END CALL
	jmp	.L28
.L27:
	 #BLOCK
	#CALL
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	leal	.L30, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$8, %esp
	#END CALL
.L28:
	#END IF
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$66, %eax
	movl	%eax, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#LESS THAN
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	a, %ecx
	cmp	$10, %ecx
	setl	%cl
	movzbl	%cl, %ecx
	#END LESS THAN
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -334(%ebp)
	movl	%ecx, -338(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	leal	.L31, %ebx
	#END ADDRESS
	pushl	%ebx
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
	movl	a, %ecx
	cmp	$90, %ecx
	setl	%cl
	movzbl	%cl, %ecx
	#END LESS THAN
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -342(%ebp)
	movl	%ecx, -346(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	    #ID
	    #END ID
	pushl	a
	#ADDRESS
	   #STRING
	leal	.L32, %esi
	#END ADDRESS
	pushl	%esi
	call	printf
	addl	$12, %esp
	#END CALL
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
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
	movl	a, %edx
	cmp	b, %edx
	setg	%dl
	movzbl	%dl, %edx
	#END GREATER THAN
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -350(%ebp)
	movl	%ecx, -354(%ebp)
	movl	%edx, -358(%ebp)
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
	leal	.L33, %edi
	#END ADDRESS
	pushl	%edi
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
	movl	b, %ecx
	cmp	a, %ecx
	setg	%cl
	movzbl	%cl, %ecx
	#END GREATER THAN
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -362(%ebp)
	movl	%ecx, -366(%ebp)
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
	leal	.L34, %eax
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
	movl	a, %ecx
	cmp	b, %ecx
	setle	%cl
	movzbl	%cl, %ecx
	#END LESS OR EQUAL
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -370(%ebp)
	movl	%ecx, -374(%ebp)
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
	movl	a, %edx
	cmp	b, %edx
	setle	%dl
	movzbl	%dl, %edx
	#END LESS OR EQUAL
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -378(%ebp)
	movl	%ecx, -382(%ebp)
	movl	%edx, -386(%ebp)
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
	leal	.L36, %eax
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
	movl	a, %ecx
	cmp	b, %ecx
	setge	%cl
	movzbl	%cl, %ecx
	#END GREATER OR EQUAL
	movl	%ecx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -390(%ebp)
	movl	%ecx, -394(%ebp)
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
	leal	.L37, %eax
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
	movl	b, %edx
	cmp	a, %edx
	setge	%dl
	movzbl	%dl, %edx
	#END GREATER OR EQUAL
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -398(%ebp)
	movl	%ecx, -402(%ebp)
	movl	%edx, -406(%ebp)
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
	movl	$345, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
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
#caller spill
	movl	%eax, -410(%ebp)
	movl	a, %eax
	cmpl	b, %eax
	sete	%al
	movzbl	%al, %eax
	#END EQUAL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -414(%ebp)
	movl	%ecx, -418(%ebp)
	movl	%edx, -422(%ebp)
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
	leal	.L41, %eax
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
	movl	a, %edx
	cmpl	b, %edx
	sete	%dl
	movzbl	%dl, %edx
	#END EQUAL
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -426(%ebp)
	movl	%ecx, -430(%ebp)
	movl	%edx, -434(%ebp)
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
	leal	.L44, %eax
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
	movl	$21, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
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
#caller spill
	movl	%eax, -438(%ebp)
	movl	a, %eax
	cmpl	b, %eax
	setne	%al
	movzbl	%al, %eax
	#END NOT EQUAL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -442(%ebp)
	movl	%ecx, -446(%ebp)
	movl	%edx, -450(%ebp)
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
	leal	.L45, %eax
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
	movl	a, %edx
	cmpl	b, %edx
	setne	%dl
	movzbl	%dl, %edx
	#END NOT EQUAL
	movl	%edx, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -454(%ebp)
	movl	%ecx, -458(%ebp)
	movl	%edx, -462(%ebp)
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
	movl	$1, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
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
#caller spill
	movl	%eax, -466(%ebp)
	movl	a, %eax
	cmpl	$0, %eax
	jne	.L47
	cmpl	$0, b
	jne	.L47
#caller spill
	movl	%eax, -470(%ebp)
	mov	$0, %eax
	jmp	.L48
.L47:
	mov	$1, %eax
.L48:
	#END OR
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -474(%ebp)
	movl	%ecx, -478(%ebp)
	movl	%edx, -482(%ebp)
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
	movl	$0, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
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
#caller spill
	movl	%eax, -486(%ebp)
	movl	a, %eax
	cmpl	$0, %eax
	jne	.L50
	cmpl	$0, b
	jne	.L50
#caller spill
	movl	%eax, -490(%ebp)
	mov	$0, %eax
	jmp	.L51
.L50:
	mov	$1, %eax
.L51:
	#END OR
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -494(%ebp)
	movl	%ecx, -498(%ebp)
	movl	%edx, -502(%ebp)
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
	leal	.L52, %eax
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
	movl	a, %edx
	cmpl	$0, %edx
	jne	.L53
	cmpl	$0, b
	jne	.L53
#caller spill
	movl	%eax, -506(%ebp)
	mov	$0, %eax
	jmp	.L54
.L53:
	mov	$1, %eax
.L54:
	#END OR
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -510(%ebp)
	movl	%ecx, -514(%ebp)
	movl	%edx, -518(%ebp)
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
	leal	.L55, %eax
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
	movl	$0, %ecx
	movl	%ecx, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	   #INT
	   #END INT
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
#caller spill
	movl	%eax, -522(%ebp)
	movl	a, %eax
	cmpl	$0, %eax
	jne	.L56
	cmpl	$0, b
	jne	.L56
#caller spill
	movl	%eax, -526(%ebp)
	mov	$0, %eax
	jmp	.L57
.L56:
	mov	$1, %eax
.L57:
	#END OR
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -530(%ebp)
	movl	%ecx, -534(%ebp)
	movl	%edx, -538(%ebp)
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
	leal	.L58, %eax
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
	movl	%eax, -542(%ebp)
	movl	%ecx, -546(%ebp)
	movl	%edx, -550(%ebp)
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
	leal	.L60, %eax
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
	movl	a, %edx
#caller spill
	movl	%eax, -554(%ebp)
	movl	b, %eax
	andl	%eax, %edx
	cmp	$0, %eax
	je	.L61
	mov	$1, %eax
.L61:
	#END AND
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -558(%ebp)
	movl	%ecx, -562(%ebp)
	movl	%edx, -566(%ebp)
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
	leal	.L62, %eax
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
	movl	a, %edx
#caller spill
	movl	%eax, -570(%ebp)
	movl	b, %eax
	andl	%eax, %edx
	cmp	$0, %eax
	je	.L63
	mov	$1, %eax
.L63:
	#END AND
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -574(%ebp)
	movl	%ecx, -578(%ebp)
	movl	%edx, -582(%ebp)
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
	leal	.L64, %eax
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
	movl	$0, %ecx
	movl	%ecx, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L65:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-8(%ebp), %edx
	cmp	$8, %edx
	setl	%dl
	movzbl	%dl, %edx
	#END LESS THAN
	cmpl	$0, %edx
	je	.L66
	 #BLOCK
	  #ASSIGNMENT
	#ADD
	#ADDRESS
	    #ID
	    #END ID
	leal	-48(%ebp), %edx
	#END ADDRESS
	#MULTIPLY
	    #ID
	    #END ID
	   #INT
	   #END INT
#caller spill
	movl	%eax, -586(%ebp)
	movl	-8(%ebp), %eax
	imull	$4, %eax
	#END MULTIPLY
	addl	%eax, %edx
	#END ADD
	    #ID
	    #END ID
	movl	-8(%ebp), %eax
	movl	%eax, (%edx)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
#caller spill
	movl	%eax, -590(%ebp)
	movl	-8(%ebp), %eax
	addl	$1, %eax
	#END ADD
	movl	%eax, -8(%ebp)
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
	.set	main.size, 592
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
