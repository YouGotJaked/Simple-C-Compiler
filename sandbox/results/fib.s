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
	movl	, %eax
	cmpl	$0, %eax
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
	movl	8(%ebp), %eax
	subl	$1, %eax
	#END SUBTRACT
	movl	%eax, -4(%ebp)
	pushl	%eax
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
	movl	8(%ebp), %ebx
	subl	$2, %ebx
	#END SUBTRACT
	pushl	%ebx
	call	fib
	#END CALL
	movl	, %ecx
	addl	, %ecx
	#END ADD
	movl	%ecx, %eax
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
.L3:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	#BODY
	 #BLOCK
	#CALL
	#ADDRESS
	   #STRING
	leal	.L4, %eax
	#END ADDRESS
	#ADDRESS
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	leal	-4(%ebp), %eax
	#END ADDRESS
	movl	%eax, -8(%ebp)
	pushl	%edx
	pushl	%ecx
	call	scanf
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	movl	%eax, -12(%ebp)
	leal	.L5, %eax
	#END ADDRESS
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	pushl	-4(%ebp)
	call	fib
	#END CALL
	pushl	
	pushl	%eax
	call	printf
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
#STRINGS
.L4:	.asciz	"%d"
.L5:	.asciz	"%d\n"
