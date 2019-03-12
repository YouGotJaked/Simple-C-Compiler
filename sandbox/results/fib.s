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
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $0
	   #END INT
#reg %eax is empty
	#LOAD
	movl	8(%ebp), %eax
	#END LOAD
	cmpl	$0, %eax
	sete	%al
	movzbl	%al, %eax
	#END EQUAL
	#EQUAL
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
#reg %ebx is empty
	#LOAD
	movl	8(%ebp), %ebx
	#END LOAD
	cmpl	$1, %ebx
	sete	%bl
	movzbl	%bl, %ebx
	#END EQUAL
	cmpl	$0, %eax
	jne	.L3
	cmpl	$0, %ebx
	jne	.L3
#reg %ecx is empty
	mov	$0, %ecx
	jmp	.L4
.L3:
	mov	$1, %ecx
.L4:
	#END OR
	cmpl	$0, %ecx
	je	.L1
	#RETURN
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	movl	$1, %eax
	#END LOAD
	jmp	.L0
	#END RETURN
.L1:
	#END IF
	#RETURN
	#ADD
	#CALL
	#LOAD
	movl	%eax, -4(%ebp)
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#SUBTRACT
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
#reg %ecx is empty
	#LOAD
	movl	8(%ebp), %ecx
	#END LOAD
	subl	$1, %ecx
	#END SUBTRACT
	pushl	%ecx
	call	fib
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
	#SUBTRACT
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $2
	   #END INT
#reg %edx is empty
	#LOAD
	movl	8(%ebp), %edx
	#END LOAD
	subl	$2, %edx
	#END SUBTRACT
	pushl	%edx
	call	fib
	addl	$4, %esp
	#END CALL
	#LOAD
	movl	%eax, -8(%ebp)
	#END LOAD
	#LOAD
	movl	, %eax
	#END LOAD
	addl	, %eax
	#END ADD
	#LOAD
	movl	%eax, %eax
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
	.set	fib.size, 8
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
	#LOAD
	movl	%eax, -8(%ebp)
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#ADDRESS
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
#reg %eax is empty
	leal	-4(%ebp), %eax
	#END ADDRESS
	pushl	%eax
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -24(%ebp)
	#END LOAD
	leal	.L10, %eax
	#END ADDRESS
	pushl	%eax
	call	scanf
	addl	$20, %esp
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
	call	fib
	addl	$4, %esp
	#END CALL
	pushl	
	#ADDRESS
	   #STRING
	#LOAD
	movl	%eax, -28(%ebp)
	#END LOAD
	leal	.L11, %eax
	#END ADDRESS
	pushl	%eax
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
	.set	main.size, 28
	.globl	main
#GLOBALS
#STRINGS
.L10:	.asciz	"%d"
.L11:	.asciz	"%d\n"
