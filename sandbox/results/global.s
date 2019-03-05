#GLOBALS
	.comm	x, 4
#FUNCTION
#here
#here
.globl foo
	#PROLOGUE
foo:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	#ADD
	    #ID
	   #INT
	movl	0x7fd3105002a0, %eax
	addl	0x7fd310500300, 0x7fd3105002a0
	    #ID
	movl		0x7fd310500370, 0x7fd310500240
	#RETURN
	#ADD
	    #ID
	   #INT
	movl	0x0, %eax, -4(%ebp)
	movl	0x7fd3105003f0, %eax
	addl	0x7fd310500450, 0x7fd3105003f0
	movl	0x7fd3105004c0, %eax
