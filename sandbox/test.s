#FUNCTION
.globl main
	#PROLOGUE
main:
.L0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $1
	   #END INT
	    #ID
	    #_operand = a
	    #END ID
	movl	$1, a
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = b
	    #END ID
	movl	$0, b
	  #END ASSIGNMENT
	#IF
	    #ID
	    #_operand = a
	    #END ID
	    #ID
	    #_operand = b
	    #END ID
	movl	a, %eax
	cmp	b, %eax
	jle	.L1
	 #BLOCK
	#CALL
	#ADDRESS
	   #STRING
	leal	.L3, %eax
	#END ADDRESS
	    #ID
	    #_operand = a
	    #END ID
	#IDK IF THIS WORKS
	movl	a, %eax
	pushl	%eax
	pushl	%eax
	movl	$0, %eax
	call	printf
	#END CALL
.L1:
	#END IF
	#RETURN
	   #INT
	   #_operand = $0
	   #END INT
	movl	%eax, -4(%ebp)
	movl	$0, %eax
	#END RETURN
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
	.comm	a, 4
	.comm	b, 4
#STRINGS
.L3:	.asciz	"you did it %d"
