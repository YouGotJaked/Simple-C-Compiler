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
	    #ID
	   #INT
	movl	0x7faceec05330, %eax
	#HERE
	movl	0x7faceec05330, 0x7faceec052d0
	#HERE
	#CALL
	    #ID
	pushl	0x7faceec053d0
	call	init_array
	#CALL
	    #ID
	pushl	0x7faceec054c0
	call	print_array
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
