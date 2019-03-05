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
	  #_left->dereference() == nullptr
	    #ID
	   #INT
	  #_right->_register == nullptr
	#expr != nullptr
	movl	0x14a3240, %eax
	  #done loading
	  #_left->dereference() == nullptr #2
	#HERE
	movl	%eax, 0x14a31f0
	#HERE
	  #ASSIGNMENT DONE
	#CALL
	    #ID
	pushl	0x14a3340
	call	init_array
	#CALL
	    #ID
	pushl	0x14a3440
	call	print_array
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
