#GLOBALS
#FUNCTION
.globl main
	#PROLOGUE
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	  #_left->dereference() == nullptr
	    #ID
	   #INT
	  #_right->_register == nullptr
	#expr != nullptr
	movl	0xf67280, %eax
	  #done loading
	  #_left->dereference() == nullptr #2
	#HERE
	movl	%eax, 0xf66e30
	#HERE
	  #ASSIGNMENT DONE
	  #ASSIGNMENT
	  #_left->dereference() == nullptr
	    #ID
	   #INT
	  #_right->_register == nullptr
	#expr != nullptr
	movl	0xf67350, %ebx
	  #done loading
	  #_left->dereference() == nullptr #2
	#HERE
	movl	%ebx, 0xf67300
	#HERE
	  #ASSIGNMENT DONE
	  #ASSIGNMENT
	  #_left->dereference() == nullptr
	    #ID
	   #INT
	  #_right->_register == nullptr
	#expr != nullptr
	movl	0xf67460, %ecx
	  #done loading
	  #_left->dereference() == nullptr #2
	#HERE
	movl	%ecx, 0xf67410
	#HERE
	  #ASSIGNMENT DONE
	#CALL
	    #ID
	pushl	0xf67600
	    #ID
	pushl	0xf67590
	    #ID
	pushl	0xf67540
	call	print
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
