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
	pushl	0x7f8536500840
	    #ID
	pushl	0x7f85365007c0
	    #ID
	pushl	0x7f8536500760
	    #ID
	pushl	0x7f8536500700
	call	call_towers
	#CALL
	    #ID
	pushl	0x7f8536500990
	    #ID
	pushl	0x7f8536500930
	call	print_move
	#CALL
	    #ID
	pushl	0x7f8536500bb0
	    #ID
	pushl	0x7f8536500b30
	    #ID
	pushl	0x7f8536500ad0
	    #ID
	pushl	0x7f8536500a70
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
	movl	0x7f8536500e70, %eax
	  #done loading
	  #_left->dereference() == nullptr #2
	#HERE
	movl	%eax, 0x7f8536500e10
	#HERE
	  #ASSIGNMENT DONE
	#CALL
	    #ID
	pushl	0x7f8536500ee0
	call	print
	#CALL
	   #INT
	pushl	0x7f8536501140
	   #INT
	pushl	0x7f85365010b0
	   #INT
	pushl	0x7f8536501030
	    #ID
	pushl	0x7f8536500fd0
	call	towers
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
