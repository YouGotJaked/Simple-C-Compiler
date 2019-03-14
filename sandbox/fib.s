#FUNCTION
	#PROLOGUE
fib:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$fib.size, %esp
	#BODY
	 #BLOCK
	#IF
	#EXPRESSION::TEST
	#OR
	#EQUAL
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
	movl	20(%ebp), %eax
	cmpl	$0, %eax
	sete	%al
	movzbl	%al, %eax
	#END EQUAL
	#EQUAL
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %ecx is empty
	movl	20(%ebp), %ecx
	cmpl	$1, %ecx
	sete	%cl
	movzbl	%cl, %ecx
	#END EQUAL
	cmpl	$0, %eax
	jne	.L3
	cmpl	$0, %ecx
	jne	.L3
#register %edx is empty
	mov	$0, %edx
	jmp	.L4
.L3:
	mov	$1, %edx
.L4:
	#END OR
	cmpl	$0, %edx
	je	.L1
	#RETURN
	   #INT
	   #END INT
	movl	%eax, -4(%ebp)
	movl	$1, %eax
	jmp	.L0
	#END RETURN
.L1:
	#END IF
	#RETURN
	#ADD
	#CALL
	movl	%eax, -8(%ebp)
	movl	%ecx, -12(%ebp)
	#SUBTRACT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
	movl	20(%ebp), %eax
	subl	$1, %eax
	#END SUBTRACT
	pushl	%eax
	call	fib
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -16(%ebp)
	#SUBTRACT
	    #ID
	    #END ID
	   #INT
	   #END INT
#register %eax is empty
	movl	20(%ebp), %eax
	subl	$2, %eax
	#END SUBTRACT
	pushl	%eax
	call	fib
	addl	$4, %esp
	#END CALL
#register %ecx is empty
	movl	-16(%ebp), %ecx
	addl	%eax, %ecx
	#END ADD
	movl	%ecx, %eax
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
	.set	fib.size, 16
	.globl	fib
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
	#CALL
	movl	%eax, -8(%ebp)
	#ADDRESS
	    #ID
	    #END ID
#register %eax is empty
	leal	-4(%ebp), %eax
	#END ADDRESS
	pushl	%eax
	#ADDRESS
	   #STRING
#register %ecx is empty
	leal	.L10, %ecx
	#END ADDRESS
	pushl	%ecx
	call	scanf
	addl	$20, %esp
	#END CALL
	#CALL
	movl	%eax, -12(%ebp)
	movl	%ecx, -16(%ebp)
	#CALL
	    #ID
	    #END ID
	pushl	-4(%ebp)
	call	fib
	addl	$4, %esp
	#END CALL
	pushl	%eax
	#ADDRESS
	   #STRING
#register %ecx is empty
	leal	.L11, %ecx
	#END ADDRESS
	pushl	%ecx
	call	printf
	addl	$8, %esp
	#END CALL
.L9:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	main.size, 16
	.globl	main
#GLOBALS
#STRINGS
.L10:	.asciz	"%d"
.L11:	.asciz	"%d\n"
#REALS
