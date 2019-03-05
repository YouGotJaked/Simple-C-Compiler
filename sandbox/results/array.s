#GLOBALS
	.comm	a, 40
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
	movl		0x7fd2115003c0, 0x7fd211500360
	#CALL
	    #ID
	pushl	0x7fd211500460
	call	init_array
	#CALL
	    #ID
	pushl	0x7fd211500550
	call	print_array
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
