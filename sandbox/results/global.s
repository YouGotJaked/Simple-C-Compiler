#GLOBALS
	.comm	x, 4
#FUNCTION
.globl foo
	#PROLOGUE
foo:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	  #_left->dereference() == nullptr
	    #ID
	#ADD
	    #ID
	   #INT
	#expr != nullptr
	movl	0x7fa4075002a0, %eax
	addl	0x7fa407500300, 0x7fa4075002a0
	  #_left->dereference() == nullptr #2
	#HERE
	movl	%eax, 0x7fa407500240
	#HERE
	  #ASSIGNMENT DONE
	#RETURN
	#ADD
	    #ID
	   #INT
	#expr != nullptr
	movl	0x7fa4075003f0, %ebx
	addl	0x7fa407500450, 0x7fa4075003f0
	#expr != nullptr
	movl	0x7fa4075004c0, %eax
