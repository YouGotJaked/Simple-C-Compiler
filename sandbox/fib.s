#FUNCTION
.globl fib
	#PROLOGUE
fib:
.L0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	#IF
	#EXPRESSION::TEST
	#OR
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $0
	   #END INT
	movl	8(%ebp), %eax
	cmpl	$0, %eax
	je	.L3
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	movl	8(%ebp), %ebx
	cmpl	$1, %ebx
	je	.L3
	mov	 $0, %ecx
	jmp	.L4
.L3:
	mov	 $1, %ecx
.L4:
	#END OR
	cmpl	$0, %ecx
	je	.L1
	#RETURN
	   #INT
	   #_operand = $1
	   #END INT
	movl	$1, %eax
	#END RETURN
.L1:
	#END IF
	#RETURN
	#ADD
	#CALL
	#SUBTRACT
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	movl	8(%ebp), %ecx
	subl	$1, %ecx
	#END SUBTRACT
	movl	%eax, -4(%ebp)
	pushl	%ecx
	call	fib
	#END CALL
	#CALL
	#SUBTRACT
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $2
	   #END INT
	movl	8(%ebp), %edx
	subl	$2, %edx
	#END SUBTRACT
	movl	%eax, -8(%ebp)
	pushl	%edx
	call	fib
	#END CALL
	movl	%eax, -12(%ebp)
	movl	-8(%ebp), %eax
	addl	%eax, %eax
	#END ADD
	movl	%eax, %eax
	#END RETURN
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#FUNCTION
.globl main
	#PROLOGUE
main:
.L5:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	#BODY
	 #BLOCK
	#CALL
	#ADDRESS
	   #STRING
	leal	.L6, %eax
	#END ADDRESS
	#ADDRESS
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%eax, -16(%ebp)
	leal	-4(%ebp), %eax
	#END ADDRESS
	movl	%eax, -20(%ebp)
	pushl	%eax
	#IDK IF THIS WORKS
	movl	-16(%ebp), %eax
	pushl	%eax
	movl	$0, %eax
	call	scanf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	movl	%eax, -36(%ebp)
	leal	.L7, %eax
	#END ADDRESS
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	%eax, -40(%ebp)
	#IDK IF THIS WORKS
	movl	-4(%ebp), %eax
	pushl	%eax
	call	fib
	#END CALL
	movl	%eax, -44(%ebp)
	#IDK IF THIS WORKS
	movl	-44(%ebp), %eax
	pushl	%eax
	pushl	%eax
	movl	$0, %eax
	call	printf
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
#STRINGS
.L6:	.asciz	"%d"
.L7:	.asciz	"%d\n"
