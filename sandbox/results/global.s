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
#register %eax is empty
#reg= %eax
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
#register %ecx is empty
#reg= %ecx
	movl	x, %ecx
	addl	$1, %ecx
	#END ADD
	movl	%eax, -4(%ebp)
#reg= %eax
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
#register %ecx is empty
#reg= %ecx
	movl	$65, %ecx
	movl	%ecx, x
	  #END ASSIGNMENT
	#CALL
	movl	%eax, -4(%ebp)
	movl	%ecx, -8(%ebp)
	    #ID
	    #END ID
	pushl	x
	call	putchar
	addl	$4, %esp
	#END CALL
	#CALL
	#CALL
	call	foo
	#END CALL
	pushl	
	call	putchar
	addl	$4, %esp
	#END CALL
	#CALL
	    #ID
	    #END ID
	pushl	x
	call	putchar
	addl	$4, %esp
	#END CALL
	#CALL
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
	.set	main.size, 8
	.globl	main
#GLOBALS
	.comm	x, 4
#STRINGS
#REALS
