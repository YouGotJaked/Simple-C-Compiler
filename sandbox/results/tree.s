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
	movl	20(%ebp), %eax
	cmpl	$0, %eax
	sete	%al
	movzbl	%al, %eax
	#END NOT
	cmpl	$0, %eax
	je	.L1
	 #BLOCK
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after 20(%ebp)
	#CAST
	#CALL
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$4, %eax
	imull	$3, %eax
	#END MULTIPLY
	pushl	%eax
	call	malloc
	addl	$4, %esp
	#END CALL
	#LONG TO BYTE/LONG
	#END CAST
	movl	%eax, 20(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$0, %ecx
	imull	$4, %ecx
	#END MULTIPLY
	movl	20(%ebp), %edx
	addl	%ecx, %edx
	#END ADD
	    #ID
	    #END ID
	movl	24(%ebp), %ebx
	movl	%ebx, (%edx)

	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$1, %ecx
	imull	$4, %ecx
	#END MULTIPLY
	movl	%eax, -4(%ebp)
	movl	20(%ebp), %eax
	addl	%ecx, %eax
	#END ADD
	    #ID
	    #END ID
	movl	null, %esi
	movl	%esi, (%eax)

	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$2, %ecx
	imull	$4, %ecx
	#END MULTIPLY
	movl	%eax, -8(%ebp)
	movl	20(%ebp), %eax
	addl	%ecx, %eax
	#END ADD
	    #ID
	    #END ID
	movl	null, %edi
	movl	%edi, (%eax)

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
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$0, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	movl	24(%ebp), %eax
	cmp	%ecx, %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L3
	  #ASSIGNMENT
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$1, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	#CAST
	#CALL
	movl	%ecx, -12(%ebp)
	    #ID
	    #END ID
	pushl	24(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$1, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#LONG TO BYTE/LONG
	#END CAST
	pushl	%ecx
	call	insert
	addl	$8, %esp
	#END CALL
	#LONG TO BYTE/LONG
	#END CAST
	movl	-12(%ebp), %edx
	movl	%eax, (%edx)

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
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	%eax, -16(%ebp)
	movl	$0, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	%eax, -20(%ebp)
	movl	20(%ebp), %eax
	addl	-20(%ebp), %eax
	#END ADD
	movl	(%eax), %eax
	#END DEREFERENCE
	movl	%eax, -24(%ebp)
	movl	24(%ebp), %eax
	cmp	-24(%ebp), %eax
	setg	%al
	movzbl	%al, %eax
	#END GREATER THAN
	cmpl	$0, %eax
	je	.L5
	  #ASSIGNMENT
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$2, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	%eax, -28(%ebp)
	movl	20(%ebp), %eax
	addl	-28(%ebp), %eax
	#END ADD
	#CAST
	#CALL
	movl	%eax, -32(%ebp)
	movl	%ecx, -36(%ebp)
	movl	%edx, -40(%ebp)
	    #ID
	    #END ID
	pushl	24(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$2, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#LONG TO BYTE/LONG
	#END CAST
	pushl	%ecx
	call	insert
	addl	$8, %esp
	#END CALL
	#LONG TO BYTE/LONG
	#END CAST
	movl	-32(%ebp), %edx
	movl	%eax, (%edx)

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
	.set	insert.size, 40
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
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$0, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	movl	24(%ebp), %eax
	cmp	%ecx, %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L10
	#RETURN
	#CALL
	    #ID
	    #END ID
	pushl	24(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$1, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#LONG TO BYTE/LONG
	#END CAST
	pushl	%ecx
	call	search
	addl	$8, %esp
	#END CALL
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
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$0, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	movl	24(%ebp), %eax
	cmp	%ecx, %eax
	setg	%al
	movzbl	%al, %eax
	#END GREATER THAN
	cmpl	$0, %eax
	je	.L12
	#RETURN
	#CALL
	    #ID
	    #END ID
	pushl	24(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$2, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#LONG TO BYTE/LONG
	#END CAST
	pushl	%ecx
	call	search
	addl	$8, %esp
	#END CALL
	jmp	.L7
	#END RETURN
.L12:
	#END IF
	#RETURN
	   #INT
	   #END INT
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
	.set	search.size, 0
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
	movl	20(%ebp), %eax
	cmpl	$0, %eax
	je	.L15
	 #BLOCK
	#CALL
	#DEREFERENCE
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$0, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	movl	(%ecx), %ecx
	#END DEREFERENCE
	pushl	%ecx
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L17, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -4(%ebp)
	movl	%ecx, -8(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$1, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#LONG TO BYTE/LONG
	#END CAST
	pushl	%ecx
	call	preorder
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -12(%ebp)
	movl	%ecx, -16(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$2, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#LONG TO BYTE/LONG
	#END CAST
	pushl	%ecx
	call	preorder
	addl	$4, %esp
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
	.set	preorder.size, 16
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
	movl	20(%ebp), %eax
	cmpl	$0, %eax
	je	.L19
	 #BLOCK
	#CALL
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$1, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#LONG TO BYTE/LONG
	#END CAST
	pushl	%ecx
	call	inorder
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -4(%ebp)
	movl	%ecx, -8(%ebp)
	#DEREFERENCE
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$0, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	movl	(%ecx), %ecx
	#END DEREFERENCE
	pushl	%ecx
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L21, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$8, %esp
	#END CALL
	#CALL
	movl	%eax, -12(%ebp)
	movl	%ecx, -16(%ebp)
	#CAST
	#DEREFERENCE
	#ADD
	    #ID
	    #END ID
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$2, %eax
	imull	$4, %eax
	#END MULTIPLY
	movl	20(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	(%ecx), %ecx
	#END DEREFERENCE
	#LONG TO BYTE/LONG
	#END CAST
	pushl	%ecx
	call	inorder
	addl	$4, %esp
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
	.set	inorder.size, 16
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
#before 
	    #ID
	    #END ID
#after -48(%ebp)
	   #INT
	   #END INT
	movl	$0, %ebx
	movl	%ebx, -48(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L23:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-48(%ebp), %eax
	cmp	$8, %eax
	setl	%al
	movzbl	%al, %eax
	#END LESS THAN
	cmpl	$0, %eax
	je	.L24
	 #BLOCK
	  #ASSIGNMENT
	#ADD
	#ADDRESS
	#operand = 
	    #ID
	    #END ID
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-48(%ebp), %ecx
	imull	$4, %ecx
	#END MULTIPLY
	addl	%ecx, %eax
	#END ADD
	    #ID
	    #END ID
	movl	-48(%ebp), %esi
	movl	%esi, (%eax)

	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -48(%ebp)
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-48(%ebp), %ecx
	addl	$1, %ecx
	#END ADD
	movl	%ecx, -48(%ebp)
	  #END ASSIGNMENT
	jmp	.L23
.L24:
	#END WHILE
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -4(%ebp)
	#CAST
	    #ID
	    #END ID
	movl	null, %eax
	#LONG TO BYTE/LONG
	#END CAST
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -4(%ebp)
	#CALL
	movl	%eax, -52(%ebp)
	#ADDRESS
	#operand = 
	#ADD
	#ADDRESS
	#operand = 
	    #ID
	    #END ID
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$7, %ecx
	imull	$4, %ecx
	#END MULTIPLY
	addl	%ecx, %eax
	#END ADD
	pushl	%eax
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -4(%ebp)
	#CALL
	movl	%eax, -56(%ebp)
	#ADDRESS
	#operand = 
	#ADD
	#ADDRESS
	#operand = 
	    #ID
	    #END ID
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$4, %ecx
	imull	$4, %ecx
	#END MULTIPLY
	addl	%ecx, %eax
	#END ADD
	pushl	%eax
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -4(%ebp)
	#CALL
	movl	%eax, -60(%ebp)
	#ADDRESS
	#operand = 
	#ADD
	#ADDRESS
	#operand = 
	    #ID
	    #END ID
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$1, %ecx
	imull	$4, %ecx
	#END MULTIPLY
	addl	%ecx, %eax
	#END ADD
	pushl	%eax
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -4(%ebp)
	#CALL
	movl	%eax, -64(%ebp)
	#ADDRESS
	#operand = 
	#ADD
	#ADDRESS
	#operand = 
	    #ID
	    #END ID
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$0, %ecx
	imull	$4, %ecx
	#END MULTIPLY
	addl	%ecx, %eax
	#END ADD
	pushl	%eax
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -4(%ebp)
	#CALL
	movl	%eax, -68(%ebp)
	#ADDRESS
	#operand = 
	#ADD
	#ADDRESS
	#operand = 
	    #ID
	    #END ID
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$5, %ecx
	imull	$4, %ecx
	#END MULTIPLY
	addl	%ecx, %eax
	#END ADD
	pushl	%eax
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -4(%ebp)
	#CALL
	movl	%eax, -72(%ebp)
	#ADDRESS
	#operand = 
	#ADD
	#ADDRESS
	#operand = 
	    #ID
	    #END ID
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$2, %ecx
	imull	$4, %ecx
	#END MULTIPLY
	addl	%ecx, %eax
	#END ADD
	pushl	%eax
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -4(%ebp)
	#CALL
	movl	%eax, -76(%ebp)
	#ADDRESS
	#operand = 
	#ADD
	#ADDRESS
	#operand = 
	    #ID
	    #END ID
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$3, %ecx
	imull	$4, %ecx
	#END MULTIPLY
	addl	%ecx, %eax
	#END ADD
	pushl	%eax
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
#before 
	    #ID
	    #END ID
#after -4(%ebp)
	#CALL
	movl	%eax, -80(%ebp)
	#ADDRESS
	#operand = 
	#ADD
	#ADDRESS
	#operand = 
	    #ID
	    #END ID
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$6, %ecx
	imull	$4, %ecx
	#END MULTIPLY
	addl	%ecx, %eax
	#END ADD
	pushl	%eax
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -84(%ebp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L25, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -88(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	preorder
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -92(%ebp)
	#ADDRESS
	#operand = 
	   #STRING
	leal	.L26, %eax
	#END ADDRESS
	pushl	%eax
	call	printf
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -96(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	inorder
	addl	$4, %esp
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
	.set	main.size, 96
	.globl	main
#GLOBALS
	.comm	null, 4
#STRINGS
.L17:	.asciz	"%d\n"
.L21:	.asciz	"%d\n"
.L25:	.asciz	"preorder traversal:\n"
.L26:	.asciz	"inorder traversal:\n"
#REALS
