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
	    #ID
	    #END ID
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	x, %eax
	addl	$1, %eax
	#END ADD
	movl	%eax, x
	  #END ASSIGNMENT
	#RETURN
	#ADD
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	x, %ecx
	addl	$1, %ecx
	#END ADD
	movl	%eax, -4(%ebp)
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
	.set	foo.size, 4
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
	    #ID
	    #END ID
	   #INT
	   #END INT
	movl	$65, %eax
	movl	%eax, x
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -4(%ebp)
	    #ID
	    #END ID
	pushl	x
	call	putchar
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -8(%ebp)
	#CALL
	call	foo
	#END CALL
	pushl	%eax
	call	putchar
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -12(%ebp)
	    #ID
	    #END ID
	pushl	x
	call	putchar
	addl	$4, %esp
	#END CALL
	#CALL
	movl	%eax, -16(%ebp)
	   #INT
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
	.set	main.size, 16
	.globl	main
#GLOBALS
	.comm	x, 4
#STRINGS
#REALS
