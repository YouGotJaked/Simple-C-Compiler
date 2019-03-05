#GLOBALS
#FUNCTION
#here
#here
.globl main
	#PROLOGUE
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	    #ID
	movl		0x7f88a0500410, 0x7f88a05003b0
	  #ASSIGNMENT
	   #INT
	    #ID
	movl		0x7f88a0500500, 0x7f88a05004a0
	  #ASSIGNMENT
	   #INT
	    #ID
	movl		0x7f88a05005f0, 0x7f88a0500590
	#CALL
	    #ID
	pushl	0x7f88a0500760
	    #ID
	pushl	0x7f88a0500700
	    #ID
	pushl	0x7f88a05006a0
	call	print
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
