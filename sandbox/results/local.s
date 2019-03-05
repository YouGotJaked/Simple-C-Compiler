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
	movl	0x7fa54b500410, %eax
	  #done loading
	  #_left->dereference() == nullptr #2
	#HERE
	movl	%eax, 0x7fa54b5003b0
	#HERE
	  #ASSIGNMENT DONE
	  #ASSIGNMENT
	  #_left->dereference() == nullptr
	    #ID
	   #INT
	  #_right->_register == nullptr
	#expr != nullptr
	movl	0x7fa54b500500, %ebx
	  #done loading
	  #_left->dereference() == nullptr #2
	#HERE
	movl	%ebx, 0x7fa54b5004a0
	#HERE
	  #ASSIGNMENT DONE
	  #ASSIGNMENT
	  #_left->dereference() == nullptr
	    #ID
	   #INT
	  #_right->_register == nullptr
	#expr != nullptr
	movl	0x7fa54b5005f0, %ecx
	  #done loading
	  #_left->dereference() == nullptr #2
	#HERE
	movl	%ecx, 0x7fa54b500590
	#HERE
	  #ASSIGNMENT DONE
	#CALL
	    #ID
	pushl	0x7fa54b500760
	    #ID
	pushl	0x7fa54b500700
	    #ID
	pushl	0x7fa54b5006a0
	call	print
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
