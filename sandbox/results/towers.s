#GLOBALS
#FUNCTION
.globl towers
	#PROLOGUE
towers:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	#CALL
	    #ID
	pushl	0xfa88c0
	    #ID
	pushl	0xfa8840
	    #ID
	pushl	0xfa87f0
	    #ID
	pushl	0xfa8550
	call	call_towers
	#CALL
	    #ID
	pushl	0xfa89d0
	    #ID
	pushl	0xfa8980
	call	print_move
	#CALL
	    #ID
	pushl	0xfa8bf0
	    #ID
	pushl	0xfa8b70
	    #ID
	pushl	0xfa8b00
	    #ID
	pushl	0xfa8ab0
	call	call_towers
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
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
	movl	0xfa9050, %eax
	  #done loading
	  #_left->dereference() == nullptr #2
	#HERE
	movl	%eax, 0xfa9000
	#HERE
	  #ASSIGNMENT DONE
	#CALL
	    #ID
	pushl	0xfa9140
	call	print
	#CALL
	   #INT
	pushl	0xfa9380
	   #INT
	pushl	0xfa9300
	   #INT
	pushl	0xfa9290
	    #ID
	pushl	0xfa9240
	call	towers
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
