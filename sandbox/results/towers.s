#GLOBALS
#FUNCTION
#here
#here
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
	pushl	0x7fd3894057b0
	    #ID
	pushl	0x7fd389405730
	    #ID
	pushl	0x7fd3894056d0
	    #ID
	pushl	0x7fd389405670
	call	call_towers
	#CALL
	    #ID
	pushl	0x7fd389405900
	    #ID
	pushl	0x7fd3894058a0
	call	print_move
	#CALL
	    #ID
	pushl	0x7fd389405b20
	    #ID
	pushl	0x7fd389405aa0
	    #ID
	pushl	0x7fd389405a40
	    #ID
	pushl	0x7fd3894059e0
	call	call_towers
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
#FUNCTION
#here
#here
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
	movl		0x7fd389405de0, 0x7fd389405d80
	#CALL
	    #ID
	pushl	0x7fd389405e50
	call	print
	#CALL
	   #INT
	pushl	0x7fd3894060b0
	   #INT
	pushl	0x7fd389406020
	   #INT
	pushl	0x7fd389405fa0
	    #ID
	pushl	0x7fd389405f40
	call	towers
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
