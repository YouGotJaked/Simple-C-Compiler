#GLOBALS
	.comm	a, 40
#FUNCTION
.globl main
	#PROLOGUE
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	    #ID
	movl	$10, -4(%ebp)
	  #ASSIGNMENT DONE
	#CALL
	    #ID
	#OK WHAT NOW
	pushl	-4(%ebp)
	call	init_array
	#CALL
	    #ID
	#OK WHAT NOW
	pushl	-4(%ebp)
	call	print_array
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
