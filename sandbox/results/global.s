#FUNCTION
	#PROLOGUE
foo:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	%esp, %ebp
	subl	$foo.size, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = x
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
#reg %eax is empty
	#LOAD
	movl	x, %eax
	#END LOAD
	addl	$1, %eax
	#END ADD
	    #ID
	    #_operand = x
	    #END ID
	movl	%eax, x
	  #END ASSIGNMENT
	#RETURN
	#ADD
	    #ID
	    #_operand = x
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
#reg %ebx is empty
	#LOAD
	movl	x, %ebx
	#END LOAD
	addl	$1, %ebx
	#END ADD
	#LOAD
	movl	%ebx, %eax
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
	.set	foo.size, 0
	.globl	foo
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
	   #_operand = $65
	   #END INT
	    #ID
	    #_operand = x
	    #END ID
	movl	$65, x
	  #END ASSIGNMENT
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
	    #ID
	    #_operand = x
	    #END ID
	pushl	x
	call	putchar
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
	#CALL
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	call	foo
	#END CALL
	pushl	
	call	putchar
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
	    #_operand = x
	    #END ID
	pushl	x
	call	putchar
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
	   #INT
	   #_operand = $10
	   #END INT
	pushl	$10
	call	putchar
	addl	$4, %esp
	#END CALL
.L1:
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%edi
	popl	%esi
	popl	%ebx
	pop	%ebp
	ret
	.set	main.size, 4
	.globl	main
#GLOBALS
	.comm	x, 4
#STRINGS
