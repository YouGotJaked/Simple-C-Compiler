#GLOBALS
#FUNCTION
.globl main
	#PROLOGUE
main:
.L0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $100
	   #END INT
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	movl	$100, -16(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #INT
	   #_operand = $30
	   #END INT
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
	movl	$30, -20(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	   #REAL
	    #ID
	    #_operand = -32(%ebp)
	    #END ID
	movsd	2, -32(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CAST
	#ADD
	#CAST
	#ADD
	    #ID
	    #_operand = -16(%ebp)
	    #END ID
	    #ID
	    #_operand = -20(%ebp)
	    #END ID
	#LOAD
	#expr != nullptr
	#expr = -16(%ebp)
	movl	-16(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	-20(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	#LOAD
	#expr != nullptr
	#expr = %eax
	movl	%eax, %ebx
	#ASSIGN
	#END ASSIGN
	#END LOAD
