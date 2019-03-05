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
	movl	0xada030, %eax
	addl	0xada080, 0xada030
	  #_left->dereference() == nullptr #2
	#HERE
	movl	%eax, 0xad9fe0
	#HERE
	  #ASSIGNMENT DONE
	#RETURN
	#ADD
	    #ID
	   #INT
	#expr != nullptr
	movl	0xada180, %ebx
	addl	0xada1d0, 0xada180
	#expr != nullptr
	movl	0xada220, %eax
