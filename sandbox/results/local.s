#GLOBALS
#FUNCTION
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
	movl	$1, -4(%ebp)
	  #ASSIGNMENT DONE
	  #ASSIGNMENT
	   #INT
	    #ID
	movl	$2, -8(%ebp)
	  #ASSIGNMENT DONE
	  #ASSIGNMENT
	   #INT
	    #ID
	movl	$3, -12(%ebp)
	  #ASSIGNMENT DONE
	#CALL
	    #ID
	    #ID
	    #ID
	#OK WHAT NOW
	pushl	-4(%ebp)
	#OK WHAT NOW
	pushl	-8(%ebp)
	#OK WHAT NOW
	pushl	-12(%ebp)
	call	print
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
