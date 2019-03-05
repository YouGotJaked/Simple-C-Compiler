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
	movl	0x7f94d8405330, %eax
	  #done loading
	  #_left->dereference() == nullptr #2
	#HERE
	movl	%eax, 0x7f94d84052d0
	#HERE
	  #ASSIGNMENT DONE
	#CALL
	    #ID
	pushl	0x7f94d84053d0
	call	init_array
	#CALL
	    #ID
	pushl	0x7f94d84054c0
	call	print_array
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
