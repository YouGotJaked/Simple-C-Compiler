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
	    #END ID
#register %eax is empty
#reg= %eax
	movl	20(%ebp), %eax
	cmpl	$0, %eax
	sete	%al
	movzbl	%al, %eax
	#END NOT
	cmpl	$0, %eax
	je	.L1
	 #BLOCK
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CAST
	#CALL
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$16, %eax
	imull	$3, %eax
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
	movl	%edx, 20(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	%eax, -4(%ebp)
#reg= %eax
	movl	$0, %eax
	imull	$16, %eax
	#END MULTIPLY
	movl	%eax, -8(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
	addl	-8(%ebp), %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	    #ID
	    #END ID
	movl	%eax, -24(%ebp)
#reg= %eax
	movl	36(%ebp), %eax
	movl	%eax, -24(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	%eax, -40(%ebp)
#reg= %eax
	movl	$1, %eax
	imull	$16, %eax
	#END MULTIPLY
	movl	%eax, -44(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
	addl	-44(%ebp), %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	    #ID
	    #END ID
	movl	%eax, -60(%ebp)
#reg= %eax
	movl	null, %eax
	movl	%eax, -60(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	%eax, -76(%ebp)
#reg= %eax
	movl	$2, %eax
	imull	$16, %eax
	#END MULTIPLY
	movl	%eax, -80(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
	addl	-80(%ebp), %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	    #ID
	    #END ID
	movl	%eax, -96(%ebp)
#reg= %eax
	movl	null, %eax
	movl	%eax, -96(%ebp)
	  #END ASSIGNMENT
	jmp	.L2
.L1:
	#IF
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	%eax, -112(%ebp)
#reg= %eax
	movl	$0, %eax
	imull	$16, %eax
	#END MULTIPLY
	movl	%eax, -116(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
	addl	-116(%ebp), %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	movl	%eax, -132(%ebp)
#reg= %eax
	movl	36(%ebp), %eax
	cmp	-132(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L3
	  #ASSIGNMENT
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$1, %eax
	imull	$16, %eax
	#END MULTIPLY
	movl	%eax, -136(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
	addl	-136(%ebp), %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	#CAST
	#CALL
	movl	%eax, -152(%ebp)
	movl	%ecx, -168(%ebp)
	movl	%edx, -184(%ebp)
	    #ID
	    #END ID
	pushl	36(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$1, %eax
	imull	$16, %eax
	#END MULTIPLY
#register %ecx is empty
#reg= %ecx
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#END CAST
	pushl	
	call	insert
	addl	$32, %esp
	#END CALL
#register %eax is empty
#reg= %eax
	movl	, %eax
	#END CAST
#register %edx is empty
#reg= %edx
	movl	, %edx
	movl	%edx, -152(%ebp)
	  #END ASSIGNMENT
	jmp	.L4
.L3:
	#IF
	#EXPRESSION::TEST
	#GREATER THAN
	    #ID
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	%eax, -200(%ebp)
#reg= %eax
	movl	$0, %eax
	imull	$16, %eax
	#END MULTIPLY
	movl	%eax, -204(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
	addl	-204(%ebp), %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	movl	%eax, -220(%ebp)
#reg= %eax
	movl	36(%ebp), %eax
	cmp	-220(%ebp), %eax
	setg	%al
	movzbl	%al, %eax
	#END GREATER THAN
	cmpl	$0, %eax
	je	.L5
	  #ASSIGNMENT
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$2, %eax
	imull	$16, %eax
	#END MULTIPLY
	movl	%eax, -224(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
	addl	-224(%ebp), %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	#CAST
	#CALL
	movl	%eax, -240(%ebp)
	movl	%ecx, -256(%ebp)
	movl	%edx, -272(%ebp)
	    #ID
	    #END ID
	pushl	36(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$2, %eax
	imull	$16, %eax
	#END MULTIPLY
#register %ecx is empty
#reg= %ecx
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#END CAST
	pushl	
	call	insert
	addl	$32, %esp
	#END CALL
#register %eax is empty
#reg= %eax
	movl	, %eax
	#END CAST
#register %edx is empty
#reg= %edx
	movl	, %edx
	movl	%edx, -240(%ebp)
	  #END ASSIGNMENT
.L5:
	#END IF
.L4:
	#END IF
.L2:
	#END IF
	#RETURN
	    #ID
	    #END ID
	movl	%eax, -288(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
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
	.set	insert.size, 288
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
	    #END ID
	movl	%eax, -16(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
	cmpl	$0, %eax
	sete	%al
	movzbl	%al, %eax
	#END NOT
	cmpl	$0, %eax
	je	.L8
	#RETURN
	   #INT
	   #END INT
#reg= %eax
	movl	$0, %eax
	jmp	.L7
	#END RETURN
.L8:
	#END IF
	#IF
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	%eax, -20(%ebp)
#reg= %eax
	movl	$0, %eax
	imull	$16, %eax
	#END MULTIPLY
	movl	%eax, -24(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
	addl	-24(%ebp), %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	movl	%eax, -40(%ebp)
#reg= %eax
	movl	36(%ebp), %eax
	cmp	-40(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L10
	#RETURN
	#CALL
	movl	%ecx, -56(%ebp)
	movl	%edx, -72(%ebp)
	    #ID
	    #END ID
	pushl	36(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$1, %eax
	imull	$16, %eax
	#END MULTIPLY
#register %ecx is empty
#reg= %ecx
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#END CAST
	pushl	
	call	search
	addl	$32, %esp
	#END CALL
#reg= %eax
	movl	, %eax
	jmp	.L7
	#END RETURN
.L10:
	#END IF
	#IF
	#EXPRESSION::TEST
	#GREATER THAN
	    #ID
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	$0, %edx
	imull	$16, %edx
	#END MULTIPLY
	movl	%eax, -76(%ebp)
#reg= %eax
	movl	20(%ebp), %eax
	addl	%edx, %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
#register %edx is empty
#reg= %edx
	movl	36(%ebp), %edx
	cmp	%eax, %edx
	setg	%dl
	movzbl	%dl, %edx
	#END GREATER THAN
	cmpl	$0, %edx
	je	.L12
	#RETURN
	#CALL
	movl	%ecx, -92(%ebp)
	    #ID
	    #END ID
	pushl	36(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$2, %eax
	imull	$16, %eax
	#END MULTIPLY
#register %ecx is empty
#reg= %ecx
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#END CAST
	pushl	
	call	search
	addl	$32, %esp
	#END CALL
#reg= %eax
	movl	, %eax
	jmp	.L7
	#END RETURN
.L12:
	#END IF
	#RETURN
	   #INT
	   #END INT
	movl	%eax, -96(%ebp)
#reg= %eax
	movl	$1, %eax
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
	.set	search.size, 96
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
	    #END ID
#register %edx is empty
#reg= %edx
	movl	20(%ebp), %edx
	cmpl	$0, %edx
	je	.L15
	 #BLOCK
	#CALL
	movl	%eax, -4(%ebp)
	movl	%ecx, -20(%ebp)
	#DEREFERENCE
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$0, %eax
	imull	$16, %eax
	#END MULTIPLY
#register %ecx is empty
#reg= %ecx
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	movl	(%ecx), %ecx
	#END DEREFERENCE
	pushl	%ecx
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L17, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -24(%ebp)
	movl	%ecx, -28(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$1, %eax
	imull	$16, %eax
	#END MULTIPLY
#register %ecx is empty
#reg= %ecx
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#END CAST
	pushl	
	call	preorder
	addl	$16, %esp
	#END CALL
	#CALL
	movl	%ecx, -44(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$2, %eax
	imull	$16, %eax
	#END MULTIPLY
#register %ecx is empty
#reg= %ecx
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#END CAST
	pushl	
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
	.set	preorder.size, 44
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
	    #END ID
#register %eax is empty
#reg= %eax
	movl	20(%ebp), %eax
	cmpl	$0, %eax
	je	.L19
	 #BLOCK
	#CALL
	movl	%ecx, -16(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$1, %eax
	imull	$16, %eax
	#END MULTIPLY
#register %ecx is empty
#reg= %ecx
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#END CAST
	pushl	
	call	inorder
	addl	$16, %esp
	#END CALL
	#CALL
	movl	%ecx, -32(%ebp)
	#DEREFERENCE
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$0, %eax
	imull	$16, %eax
	#END MULTIPLY
#register %ecx is empty
#reg= %ecx
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	movl	(%ecx), %ecx
	#END DEREFERENCE
	pushl	%ecx
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L21, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -36(%ebp)
	movl	%ecx, -40(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$2, %eax
	imull	$16, %eax
	#END MULTIPLY
#register %ecx is empty
#reg= %ecx
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#END CAST
	pushl	
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
	.set	inorder.size, 40
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
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
#reg= %eax
	movl	$0, %eax
	movl	%eax, -44(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L23:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %edx is empty
#reg= %edx
	movl	-44(%ebp), %edx
	cmp	$8, %edx
	setl	%dl
	movzbl	%dl, %edx
	#END LESS THAN
	cmpl	$0, %edx
	je	.L24
	 #BLOCK
	  #ASSIGNMENT
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#register %edx is empty
	leal	-40(%ebp), %edx
	#END ADDRESS
	#MULTIPLY
	#fp=false
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	%eax, -48(%ebp)
#reg= %eax
	movl	-44(%ebp), %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	%eax, -52(%ebp)
	addl	-52(%ebp), %edx
	#END ADD
	movl	(%edx), %edx
	#END DEREFERENCE
	    #ID
	    #END ID
#register %eax is empty
#reg= %eax
	movl	-44(%ebp), %eax
	movl	%eax, %edx
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
	movl	-44(%ebp), %eax
	addl	$1, %eax
	#END ADD
	movl	%eax, -44(%ebp)
	  #END ASSIGNMENT
	jmp	.L23
.L24:
	#END WHILE
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CAST
	    #ID
	    #END ID
#register %eax is empty
#reg= %eax
	movl	null, %eax
	#END CAST
#register %ecx is empty
#reg= %ecx
	movl	, %ecx
	movl	%ecx, 825379886(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -72(%ebp)
	movl	%ecx, -88(%ebp)
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#register %eax is empty
	leal	-40(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$7, %ecx
	imull	$4, %ecx
	#END MULTIPLY
#register %edx is empty
	addl	%ecx, %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
#register %ecx is empty
	leal	, %ecx
	#END ADDRESS
	pushl	%ecx
	    #ID
	    #END ID
	pushl	825379886(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
#register %eax is empty
#reg= %eax
	movl	, %eax
	movl	%eax, 825379886(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -104(%ebp)
	movl	%ecx, -120(%ebp)
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#register %eax is empty
	leal	-40(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$4, %ecx
	imull	$4, %ecx
	#END MULTIPLY
#register %edx is empty
	addl	%ecx, %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
#register %ecx is empty
	leal	, %ecx
	#END ADDRESS
	pushl	%ecx
	    #ID
	    #END ID
	pushl	825379886(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
#register %eax is empty
#reg= %eax
	movl	, %eax
	movl	%eax, 825379886(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -136(%ebp)
	movl	%ecx, -152(%ebp)
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#register %eax is empty
	leal	-40(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$1, %ecx
	imull	$4, %ecx
	#END MULTIPLY
#register %edx is empty
	addl	%ecx, %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
#register %ecx is empty
	leal	, %ecx
	#END ADDRESS
	pushl	%ecx
	    #ID
	    #END ID
	pushl	825379886(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
#register %eax is empty
#reg= %eax
	movl	, %eax
	movl	%eax, 825379886(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -168(%ebp)
	movl	%ecx, -184(%ebp)
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#register %eax is empty
	leal	-40(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$0, %ecx
	imull	$4, %ecx
	#END MULTIPLY
#register %edx is empty
	addl	%ecx, %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
#register %ecx is empty
	leal	, %ecx
	#END ADDRESS
	pushl	%ecx
	    #ID
	    #END ID
	pushl	825379886(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
#register %eax is empty
#reg= %eax
	movl	, %eax
	movl	%eax, 825379886(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -200(%ebp)
	movl	%ecx, -216(%ebp)
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#register %eax is empty
	leal	-40(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$5, %ecx
	imull	$4, %ecx
	#END MULTIPLY
#register %edx is empty
	addl	%ecx, %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
#register %ecx is empty
	leal	, %ecx
	#END ADDRESS
	pushl	%ecx
	    #ID
	    #END ID
	pushl	825379886(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
#register %eax is empty
#reg= %eax
	movl	, %eax
	movl	%eax, 825379886(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -232(%ebp)
	movl	%ecx, -248(%ebp)
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#register %eax is empty
	leal	-40(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$2, %ecx
	imull	$4, %ecx
	#END MULTIPLY
#register %edx is empty
	addl	%ecx, %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
#register %ecx is empty
	leal	, %ecx
	#END ADDRESS
	pushl	%ecx
	    #ID
	    #END ID
	pushl	825379886(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
#register %eax is empty
#reg= %eax
	movl	, %eax
	movl	%eax, 825379886(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -264(%ebp)
	movl	%ecx, -280(%ebp)
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#register %eax is empty
	leal	-40(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$3, %ecx
	imull	$4, %ecx
	#END MULTIPLY
#register %edx is empty
	addl	%ecx, %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
#register %ecx is empty
	leal	, %ecx
	#END ADDRESS
	pushl	%ecx
	    #ID
	    #END ID
	pushl	825379886(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
#register %eax is empty
#reg= %eax
	movl	, %eax
	movl	%eax, 825379886(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -296(%ebp)
	movl	%ecx, -312(%ebp)
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#register %eax is empty
	leal	-40(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	#fp=false
	   #INT
	   #END INT
	   #INT
	   #END INT
#register %ecx is empty
#reg= %ecx
	movl	$6, %ecx
	imull	$4, %ecx
	#END MULTIPLY
#register %edx is empty
	addl	%ecx, %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
#register %ecx is empty
	leal	, %ecx
	#END ADDRESS
	pushl	%ecx
	    #ID
	    #END ID
	pushl	825379886(%ebp)
	call	insert
	addl	$32, %esp
	#END CALL
#register %eax is empty
#reg= %eax
	movl	, %eax
	movl	%eax, 825379886(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -328(%ebp)
	movl	%ecx, -344(%ebp)
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L25, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -348(%ebp)
	    #ID
	    #END ID
	pushl	825379886(%ebp)
	call	preorder
	addl	$16, %esp
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
#register %eax is empty
	leal	.L26, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -352(%ebp)
	    #ID
	    #END ID
	pushl	825379886(%ebp)
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
	.set	main.size, 352
	.globl	main
#GLOBALS
	.comm	null, 16
#STRINGS
.L17:	.asciz	"%d\n"
.L21:	.asciz	"%d\n"
.L25:	.asciz	"preorder traversal:\n"
.L26:	.asciz	"inorder traversal:\n"
#REALS
