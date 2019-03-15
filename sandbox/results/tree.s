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
	    #ID
	    #END ID
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
	movl	24(%ebp), %ecx
	movl	%ecx, (%edx)
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
	movl	$1, %ebx
	imull	$4, %ebx
	#END MULTIPLY
	movl	20(%ebp), %esi
	addl	%ebx, %esi
	#END ADD
	    #ID
	    #END ID
#caller spill
	movl	%eax, -4(%ebp)
	movl	null, %eax
	movl	%eax, (%esi)
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
	movl	$2, %ebx
	imull	$4, %ebx
	#END MULTIPLY
	movl	20(%ebp), %edi
	addl	%ebx, %edi
	#END ADD
	    #ID
	    #END ID
#caller spill
	movl	%eax, -8(%ebp)
	movl	null, %eax
	movl	%eax, (%edi)
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
	movl	$0, %ebx
	imull	$4, %ebx
	#END MULTIPLY
	movl	20(%ebp), %esi
	addl	%ebx, %esi
	#END ADD
	movl	(%esi), %esi
	#END DEREFERENCE
#caller spill
	movl	%eax, -16(%ebp)
	movl	24(%ebp), %eax
	cmp	%esi, %eax
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
	movl	20(%ebp), %ebx
	addl	%eax, %ebx
	#END ADD
	#CAST
	#CALL
	movl	%ecx, -20(%ebp)
	movl	%edx, -24(%ebp)
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
	movl	%eax, (%ebx)
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
	.set	insert.size, 24
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
	   #STRING
	leal	.L17, %ebx
	#END ADDRESS
	pushl	%ebx
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
	   #STRING
	leal	.L21, %ebx
	#END ADDRESS
	pushl	%ebx
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
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$0, %eax
	movl	%eax, -48(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L23:
	#EXPRESSION::TEST
	#LESS THAN
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-48(%ebp), %ecx
	cmp	$8, %ecx
	setl	%cl
	movzbl	%cl, %ecx
	#END LESS THAN
	cmpl	$0, %ecx
	je	.L24
	 #BLOCK
	  #ASSIGNMENT
	#ADD
	#ADDRESS
	    #ID
	    #END ID
	leal	-44(%ebp), %ebx
	#END ADDRESS
	#MULTIPLY
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-48(%ebp), %ecx
	imull	$4, %ecx
	#END MULTIPLY
	addl	%ecx, %ebx
	#END ADD
	    #ID
	    #END ID
	movl	-48(%ebp), %ecx
	movl	%ecx, (%ebx)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	-48(%ebp), %edx
	addl	$1, %edx
	#END ADD
	movl	%edx, -48(%ebp)
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
	movl	null, %eax
	#LONG TO BYTE/LONG
	#END CAST
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -52(%ebp)
	#ADDRESS
	#ADD
	#ADDRESS
	    #ID
	    #END ID
	leal	-44(%ebp), %ebx
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$7, %eax
	imull	$4, %eax
	#END MULTIPLY
	addl	%eax, %ebx
	#END ADD
	pushl	%ebx
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -56(%ebp)
	#ADDRESS
	#ADD
	#ADDRESS
	    #ID
	    #END ID
	leal	-44(%ebp), %esi
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$4, %eax
	imull	$4, %eax
	#END MULTIPLY
	addl	%eax, %esi
	#END ADD
	pushl	%esi
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -60(%ebp)
	#ADDRESS
	#ADD
	#ADDRESS
	    #ID
	    #END ID
	leal	-44(%ebp), %edi
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$1, %eax
	imull	$4, %eax
	#END MULTIPLY
	addl	%eax, %edi
	#END ADD
	pushl	%edi
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -64(%ebp)
	#ADDRESS
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#callee spill
	movl	%ebx, -68(%ebp)
	leal	-44(%ebp), %ebx
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$0, %eax
	imull	$4, %eax
	#END MULTIPLY
	addl	%eax, %ebx
	#END ADD
	pushl	%ebx
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -72(%ebp)
	#ADDRESS
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#callee spill
	movl	%ebx, -76(%ebp)
	leal	-44(%ebp), %ebx
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$5, %eax
	imull	$4, %eax
	#END MULTIPLY
	addl	%eax, %ebx
	#END ADD
	pushl	%ebx
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -80(%ebp)
	#ADDRESS
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#callee spill
	movl	%ebx, -84(%ebp)
	leal	-44(%ebp), %ebx
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$2, %eax
	imull	$4, %eax
	#END MULTIPLY
	addl	%eax, %ebx
	#END ADD
	pushl	%ebx
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -88(%ebp)
	#ADDRESS
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#callee spill
	movl	%ebx, -92(%ebp)
	leal	-44(%ebp), %ebx
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$3, %eax
	imull	$4, %eax
	#END MULTIPLY
	addl	%eax, %ebx
	#END ADD
	pushl	%ebx
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #END ID
	#CALL
	movl	%eax, -96(%ebp)
	#ADDRESS
	#ADD
	#ADDRESS
	    #ID
	    #END ID
#callee spill
	movl	%ebx, -100(%ebp)
	leal	-44(%ebp), %ebx
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #END INT
	   #INT
	   #END INT
	movl	$6, %eax
	imull	$4, %eax
	#END MULTIPLY
	addl	%eax, %ebx
	#END ADD
	pushl	%ebx
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	insert
	addl	$8, %esp
	#END CALL
	movl	%eax, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -104(%ebp)
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -108(%ebp)
	leal	.L25, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -112(%ebp)
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	preorder
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -116(%ebp)
	#ADDRESS
	   #STRING
#callee spill
	movl	%ebx, -120(%ebp)
	leal	.L26, %ebx
	#END ADDRESS
	pushl	%ebx
	call	printf
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -124(%ebp)
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
	.set	main.size, 124
	.globl	main
#GLOBALS
	.comm	null, 4
#STRINGS
.L17:	.asciz	"%d\n"
.L21:	.asciz	"%d\n"
.L25:	.asciz	"preorder traversal:\n"
.L26:	.asciz	"inorder traversal:\n"
#REALS
