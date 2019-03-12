#FUNCTION
	#PROLOGUE
insert:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$insert.size, %esp
	#BODY
	 #BLOCK
	#IF
	#EXPRESSION::TEST
	#NOT
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
#reg %eax is empty
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	notl	%eax
	#END NOT
	cmpl	$0, %eax
	je	.L1
	 #BLOCK
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
	   #INT
	   #_operand = $16
	   #END INT
	   #INT
	   #_operand = $3
	   #END INT
#reg %eax is empty
	#LOAD
	movl	$16, %eax
	#END LOAD
	imull	$3, %eax
	#END MULTIPLY
	pushl	%eax
	call	malloc
	addl	$4, %esp
	#END CALL
	#END CAST
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	movl	, 8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $0
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
#reg %ebx is empty
	#LOAD
	movl	$0, %ebx
	#END LOAD
	imull	$16, %ebx
	#END MULTIPLY
#reg %ecx is empty
	#LOAD
	movl	8(%ebp), %ecx
	#END LOAD
	addl	%ebx, %ecx
	#END ADD
	movl		(%ecx), %ecx
	#END DEREFERENCE
	movl	12(%ebp), %ecx
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #_operand = null
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $1
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
#reg %ebx is empty
	#LOAD
	movl	$1, %ebx
	#END LOAD
	imull	$16, %ebx
	#END MULTIPLY
#reg %edx is empty
	#LOAD
	movl	8(%ebp), %edx
	#END LOAD
	addl	%ebx, %edx
	#END ADD
	movl		(%edx), %edx
	#END DEREFERENCE
	movl	null, %edx
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #_operand = null
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $2
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
#reg %ebx is empty
	#LOAD
	movl	$2, %ebx
	#END LOAD
	imull	$16, %ebx
	#END MULTIPLY
	#LOAD
	movl	%eax, -4(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	%ebx, %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	movl	null, %eax
	  #END ASSIGNMENT
	jmp	.L2
.L1:
	#IF
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $0
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
#reg %ebx is empty
	#LOAD
	movl	$0, %ebx
	#END LOAD
	imull	$16, %ebx
	#END MULTIPLY
	#LOAD
	movl	%eax, -20(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	%ebx, %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
#reg %ebx is empty
	#LOAD
	movl	12(%ebp), %ebx
	#END LOAD
	cmp	%eax, %ebx
	setl	%bl
	movzbl	%bl, %ebx
	#END LESS THAN
	cmpl	$0, %ebx
	je	.L3
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
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	pushl	12(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $1
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
#reg %eax is empty
	#LOAD
	movl	$1, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
#reg %ebx is empty
	#LOAD
	movl	8(%ebp), %ebx
	#END LOAD
	addl	%eax, %ebx
	#END ADD
	movl		(%ebx), %ebx
	#END DEREFERENCE
	#END CAST
	pushl	%ebx
	call	insert
	addl	$32, %esp
	#END CALL
	#END CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $1
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
#reg %eax is empty
	#LOAD
	movl	$1, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -24(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-24(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	movl	, %eax
	  #END ASSIGNMENT
	jmp	.L4
.L3:
	#IF
	#EXPRESSION::TEST
	#GREATER THAN
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $0
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	movl	%eax, -40(%ebp)
	#END LOAD
	#LOAD
	movl	$0, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -44(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-44(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#LOAD
	movl	%eax, -60(%ebp)
	#END LOAD
	#LOAD
	movl	12(%ebp), %eax
	#END LOAD
	cmp	-60(%ebp), %eax
	setg	%al
	movzbl	%al, %eax
	#END GREATER THAN
	cmpl	$0, %eax
	je	.L5
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
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	pushl	12(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $2
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
#reg %eax is empty
	#LOAD
	movl	$2, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -64(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-64(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#END CAST
	pushl	%eax
	call	insert
	addl	$32, %esp
	#END CALL
	#END CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $2
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	movl	%eax, -80(%ebp)
	#END LOAD
	#LOAD
	movl	$2, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -84(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-84(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	movl	, %eax
	  #END ASSIGNMENT
.L5:
	#END IF
.L4:
	#END IF
.L2:
	#END IF
	#RETURN
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#LOAD
	movl	8(%ebp), %eax
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
	.set	insert.size, 84
	.globl	insert
#FUNCTION
	#PROLOGUE
search:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$search.size, %esp
	#BODY
	 #BLOCK
	#IF
	#EXPRESSION::TEST
	#NOT
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -16(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	notl	%eax
	#END NOT
	cmpl	$0, %eax
	je	.L8
	#RETURN
	   #INT
	   #_operand = $0
	   #END INT
	#LOAD
	movl	%eax, -32(%ebp)
	movl	$0, %eax
	#END LOAD
	jmp	.L7
	#END RETURN
.L8:
	#END IF
	#IF
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $0
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
#reg %eax is empty
	#LOAD
	movl	$0, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -36(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-36(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#LOAD
	movl	%eax, -52(%ebp)
	#END LOAD
	#LOAD
	movl	12(%ebp), %eax
	#END LOAD
	cmp	-52(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L10
	#RETURN
	#CALL
	#LOAD
	movl	%eax, -56(%ebp)
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	pushl	12(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $1
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
#reg %eax is empty
	#LOAD
	movl	$1, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -60(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-60(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#END CAST
	pushl	%eax
	call	search
	addl	$32, %esp
	#END CALL
	#LOAD
	movl	, %eax
	#END LOAD
	jmp	.L7
	#END RETURN
.L10:
	#END IF
	#IF
	#EXPRESSION::TEST
	#GREATER THAN
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $0
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	movl	%eax, -76(%ebp)
	#END LOAD
	#LOAD
	movl	$0, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -80(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-80(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#LOAD
	movl	%eax, -96(%ebp)
	#END LOAD
	#LOAD
	movl	12(%ebp), %eax
	#END LOAD
	cmp	-96(%ebp), %eax
	setg	%al
	movzbl	%al, %eax
	#END GREATER THAN
	cmpl	$0, %eax
	je	.L12
	#RETURN
	#CALL
	#LOAD
	movl	%eax, -100(%ebp)
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	pushl	12(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $2
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
#reg %eax is empty
	#LOAD
	movl	$2, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -104(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-104(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#END CAST
	pushl	%eax
	call	search
	addl	$32, %esp
	#END CALL
	#LOAD
	movl	, %eax
	#END LOAD
	jmp	.L7
	#END RETURN
.L12:
	#END IF
	#RETURN
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	movl	%eax, -108(%ebp)
	movl	$1, %eax
	#END LOAD
	jmp	.L7
	#END RETURN
.L7:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	search.size, 108
	.globl	search
#FUNCTION
	#PROLOGUE
preorder:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$preorder.size, %esp
	#BODY
	 #BLOCK
	#IF
	#EXPRESSION::TEST
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -16(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	cmpl	$0, %eax
	je	.L15
	 #BLOCK
	#CALL
	#LOAD
	movl	%eax, -20(%ebp)
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#DEREFERENCE
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $0
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
#reg %eax is empty
	#LOAD
	movl	$0, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -24(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-24(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	movl		(%eax), %eax
	#END DEREFERENCE
	pushl	%eax
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -28(%ebp)
	#END LOAD
	leal	.L17, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
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
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $1
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	movl	%eax, -32(%ebp)
	#END LOAD
	#LOAD
	movl	$1, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -36(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-36(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#END CAST
	pushl	%eax
	call	preorder
	addl	$16, %esp
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
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $2
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	movl	%eax, -52(%ebp)
	#END LOAD
	#LOAD
	movl	$2, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -56(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-56(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#END CAST
	pushl	%eax
	call	preorder
	addl	$16, %esp
	#END CALL
.L15:
	#END IF
.L14:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	preorder.size, 56
	.globl	preorder
#FUNCTION
	#PROLOGUE
inorder:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$inorder.size, %esp
	#BODY
	 #BLOCK
	#IF
	#EXPRESSION::TEST
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -16(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	cmpl	$0, %eax
	je	.L19
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
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $1
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
#reg %eax is empty
	#LOAD
	movl	$1, %eax
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
	#END CAST
	pushl	%eax
	call	inorder
	addl	$16, %esp
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
	#DEREFERENCE
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $0
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	movl	%eax, -36(%ebp)
	#END LOAD
	#LOAD
	movl	$0, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -40(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-40(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	movl		(%eax), %eax
	#END DEREFERENCE
	pushl	%eax
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -44(%ebp)
	#END LOAD
	leal	.L21, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
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
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $2
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	movl	%eax, -48(%ebp)
	#END LOAD
	#LOAD
	movl	$2, %eax
	#END LOAD
	imull	$16, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -52(%ebp)
	#END LOAD
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	addl	-52(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#END CAST
	pushl	%eax
	call	inorder
	addl	$16, %esp
	#END CALL
.L19:
	#END IF
.L18:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	inorder.size, 52
	.globl	inorder
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
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -48(%ebp)
	    #END ID
	movl	$0, -48(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L23:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #_operand = -48(%ebp)
	    #END ID
	   #INT
	   #_operand = $8
	   #END INT
	#LOAD
	movl	%eax, -64(%ebp)
	#END LOAD
	#LOAD
	movl	-48(%ebp), %eax
	#END LOAD
	cmp	$8, %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L24
	 #BLOCK
	  #ASSIGNMENT
	    #ID
	    #_operand = -48(%ebp)
	    #END ID
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
#reg %eax is empty
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	    #ID
	    #_operand = -48(%ebp)
	    #END ID
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	movl	%eax, -80(%ebp)
	#END LOAD
	#LOAD
	movl	-48(%ebp), %eax
	#END LOAD
	imull	$4, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -84(%ebp)
	#END LOAD
	#LOAD
	movl	-80(%ebp), %eax
	#END LOAD
	addl	-84(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	movl	-48(%ebp), %eax
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -48(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	movl	%eax, -88(%ebp)
	#END LOAD
	#LOAD
	movl	-48(%ebp), %eax
	#END LOAD
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = -48(%ebp)
	    #END ID
	movl	%eax, -48(%ebp)
	  #END ASSIGNMENT
	jmp	.L23
.L24:
	#END WHILE
	  #ASSIGNMENT
	#CAST
	    #ID
	    #_operand = null
	    #END ID
	#END CAST
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	null, -4(%ebp)
	  #END ASSIGNMENT
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
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -92(%ebp)
	#END LOAD
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $7
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	movl	%eax, -108(%ebp)
	#END LOAD
	#LOAD
	movl	$7, %eax
	#END LOAD
	imull	$4, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -112(%ebp)
	#END LOAD
	#LOAD
	movl	-108(%ebp), %eax
	#END LOAD
	addl	-112(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#LOAD
	movl	%eax, -128(%ebp)
	#END LOAD
	leal	, %eax
	#END ADDRESS
	pushl	%eax
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
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
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -144(%ebp)
	#END LOAD
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $4
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	movl	%eax, -160(%ebp)
	#END LOAD
	#LOAD
	movl	$4, %eax
	#END LOAD
	imull	$4, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -164(%ebp)
	#END LOAD
	#LOAD
	movl	-160(%ebp), %eax
	#END LOAD
	addl	-164(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#LOAD
	movl	%eax, -180(%ebp)
	#END LOAD
	leal	, %eax
	#END ADDRESS
	pushl	%eax
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
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
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -196(%ebp)
	#END LOAD
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $1
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	movl	%eax, -212(%ebp)
	#END LOAD
	#LOAD
	movl	$1, %eax
	#END LOAD
	imull	$4, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -216(%ebp)
	#END LOAD
	#LOAD
	movl	-212(%ebp), %eax
	#END LOAD
	addl	-216(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#LOAD
	movl	%eax, -232(%ebp)
	#END LOAD
	leal	, %eax
	#END ADDRESS
	pushl	%eax
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
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
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -248(%ebp)
	#END LOAD
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $0
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	movl	%eax, -264(%ebp)
	#END LOAD
	#LOAD
	movl	$0, %eax
	#END LOAD
	imull	$4, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -268(%ebp)
	#END LOAD
	#LOAD
	movl	-264(%ebp), %eax
	#END LOAD
	addl	-268(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#LOAD
	movl	%eax, -284(%ebp)
	#END LOAD
	leal	, %eax
	#END ADDRESS
	pushl	%eax
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
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
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -300(%ebp)
	#END LOAD
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $5
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	movl	%eax, -316(%ebp)
	#END LOAD
	#LOAD
	movl	$5, %eax
	#END LOAD
	imull	$4, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -320(%ebp)
	#END LOAD
	#LOAD
	movl	-316(%ebp), %eax
	#END LOAD
	addl	-320(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#LOAD
	movl	%eax, -336(%ebp)
	#END LOAD
	leal	, %eax
	#END ADDRESS
	pushl	%eax
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
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
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -352(%ebp)
	#END LOAD
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $2
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	movl	%eax, -368(%ebp)
	#END LOAD
	#LOAD
	movl	$2, %eax
	#END LOAD
	imull	$4, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -372(%ebp)
	#END LOAD
	#LOAD
	movl	-368(%ebp), %eax
	#END LOAD
	addl	-372(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#LOAD
	movl	%eax, -388(%ebp)
	#END LOAD
	leal	, %eax
	#END ADDRESS
	pushl	%eax
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
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
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -404(%ebp)
	#END LOAD
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $3
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	movl	%eax, -420(%ebp)
	#END LOAD
	#LOAD
	movl	$3, %eax
	#END LOAD
	imull	$4, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -424(%ebp)
	#END LOAD
	#LOAD
	movl	-420(%ebp), %eax
	#END LOAD
	addl	-424(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#LOAD
	movl	%eax, -440(%ebp)
	#END LOAD
	leal	, %eax
	#END ADDRESS
	pushl	%eax
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
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
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#LOAD
	movl	%eax, -456(%ebp)
	#END LOAD
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $6
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	movl	%eax, -472(%ebp)
	#END LOAD
	#LOAD
	movl	$6, %eax
	#END LOAD
	imull	$4, %eax
	#END MULTIPLY
	#LOAD
	movl	%eax, -476(%ebp)
	#END LOAD
	#LOAD
	movl	-472(%ebp), %eax
	#END LOAD
	addl	-476(%ebp), %eax
	#END ADD
	movl		(%eax), %eax
	#END DEREFERENCE
	#LOAD
	movl	%eax, -492(%ebp)
	#END LOAD
	leal	, %eax
	#END ADDRESS
	pushl	%eax
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$32, %esp
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
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -508(%ebp)
	#END LOAD
	leal	.L25, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$4, %esp
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
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	preorder
	addl	$16, %esp
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
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -512(%ebp)
	#END LOAD
	leal	.L26, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$4, %esp
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
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	inorder
	addl	$16, %esp
	#END CALL
.L22:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	main.size, 512
	.globl	main
#GLOBALS
	.comm	null, 16
#STRINGS
.L17:	.asciz	"%d\n"
.L21:	.asciz	"%d\n"
.L25:	.asciz	"preorder traversal:\n"
.L26:	.asciz	"inorder traversal:\n"
