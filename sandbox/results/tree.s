#FUNCTION
.globl insert
	#PROLOGUE
insert:
.L0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	#IF
	#NOT
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	movl	8(%ebp), %eax
	notl		%eax
	#END NOT
	cmpl	$0, %eax
	je	.L1
	 #BLOCK
	  #ASSIGNMENT
	#CAST
	#CALL
	#MULTIPLY
	   #INT
	   #_operand = $16
	   #END INT
	   #INT
	   #_operand = $3
	   #END INT
	movl	$16, %eax
	imull	$3, $16
	#END MULTIPLY
	pushl	%eax
	call	malloc
	#END CALL
	#END CAST
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	movl	, 8(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	    #ID
	    #_operand = 12(%ebp)
	    #END ID
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	   #INT
	   #_operand = $0
	   #END INT
	   #INT
	   #_operand = $16
	   #END INT
	movl	$0, %ebx
	imull	$16, $0
	#END MULTIPLY
