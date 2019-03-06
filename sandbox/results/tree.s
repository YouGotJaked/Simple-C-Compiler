#GLOBALS
	.comm	null, 16
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
	#END IF
	#RETURN
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#LOAD
	#expr != nullptr
	#expr = 8(%ebp)
	movl	8(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#END RETURN
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
	.comm	null, 16
#FUNCTION
.globl search
	#PROLOGUE
search:
.L1:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	#IF
	#END IF
	#IF
	#END IF
	#IF
	#END IF
	#RETURN
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -16(%ebp)
	#expr != nullptr
	#expr = $1
	movl	$1, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#END RETURN
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
	.comm	null, 16
#FUNCTION
.globl preorder
	#PROLOGUE
preorder:
.L2:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	#IF
	#END IF
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
	.comm	null, 16
#FUNCTION
.globl inorder
	#PROLOGUE
inorder:
.L3:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	#IF
	#END IF
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
	.comm	null, 16
#FUNCTION
.globl main
	#PROLOGUE
main:
.L4:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$48, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -48(%ebp)
	    #END ID
	movl	$0, -48(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L5:
	#LOAD
	#expr != nullptr
	#expr = 
	movl	, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	cmpl	$0, %eax
	je	.L6
	#ASSIGN
	#END ASSIGN
	 #BLOCK
	  #ASSIGNMENT
	    #ID
	    #_operand = -48(%ebp)
	    #END ID
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#ASSIGN
	#END ASSIGN
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	    #ID
	    #_operand = -48(%ebp)
	    #END ID
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	#expr != nullptr
	#expr = -48(%ebp)
	movl	-48(%ebp), %ebx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$4, -48(%ebp)
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	addl	%ebx, %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%eax), %eax
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	movl	-48(%ebp), 
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -48(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	#expr != nullptr
	#expr = -48(%ebp)
	movl	-48(%ebp), %ebx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	$1, %ebx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	    #ID
	    #_operand = -48(%ebp)
	    #END ID
	movl	, -48(%ebp)
	  #END ASSIGNMENT
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	jmp	.L5
.L6:
	#END WHILE
	  #ASSIGNMENT
	#CAST
	    #ID
	    #_operand = null
	    #END ID
	#END CAST
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#ASSIGN
	#END ASSIGN
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $7
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	#expr != nullptr
	#expr = $7
	movl	$7, %edx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$4, $7
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	addl	%edx, %ecx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%ecx), %ecx
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	leal	, %eax
	#END ADDRESS
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%edx
	pushl	-4(%ebp)
	call	insert
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#ASSIGN
	#END ASSIGN
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $4
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -20(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = $4
	movl	$4, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$4, $4
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	addl	%eax, %ecx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%ecx), %ecx
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	leal	, %eax
	#END ADDRESS
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%eax
	pushl	-4(%ebp)
	call	insert
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#ASSIGN
	#END ASSIGN
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $1
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -36(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = $1
	movl	$1, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$4, $1
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	addl	%eax, %ecx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%ecx), %ecx
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	leal	, %eax
	#END ADDRESS
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%eax
	pushl	-4(%ebp)
	call	insert
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#ASSIGN
	#END ASSIGN
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $0
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -52(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = $0
	movl	$0, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$4, $0
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	addl	%eax, %ecx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%ecx), %ecx
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	leal	, %eax
	#END ADDRESS
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%eax
	pushl	-4(%ebp)
	call	insert
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#ASSIGN
	#END ASSIGN
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $5
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -68(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = $5
	movl	$5, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$4, $5
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	addl	%eax, %ecx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%ecx), %ecx
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	leal	, %eax
	#END ADDRESS
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%eax
	pushl	-4(%ebp)
	call	insert
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#ASSIGN
	#END ASSIGN
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $2
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -84(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = $2
	movl	$2, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$4, $2
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	addl	%eax, %ecx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%ecx), %ecx
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	leal	, %eax
	#END ADDRESS
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%eax
	pushl	-4(%ebp)
	call	insert
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#ASSIGN
	#END ASSIGN
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $3
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -100(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = $3
	movl	$3, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$4, $3
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	addl	%eax, %ecx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%ecx), %ecx
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	leal	, %eax
	#END ADDRESS
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%eax
	pushl	-4(%ebp)
	call	insert
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	#ADDRESS
	#DEREFERENCE
	#ADD
	#ADDRESS
	    #ID
	    #_operand = -44(%ebp)
	    #END ID
	#ASSIGN
	#END ASSIGN
	leal	-44(%ebp), %eax
	#END ADDRESS
	#MULTIPLY
	   #INT
	   #_operand = $6
	   #END INT
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -116(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = $6
	movl	$6, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$4, $6
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	addl	%eax, %ecx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%ecx), %ecx
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	leal	, %eax
	#END ADDRESS
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%eax
	pushl	-4(%ebp)
	call	insert
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	#ADDRESS
	   #STRING
	#ASSIGN
	#END ASSIGN
	leal	.L7, %eax
	#END ADDRESS
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%ecx
	call	printf
	#END CALL
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	-4(%ebp)
	call	preorder
	#END CALL
	#CALL
	#ADDRESS
	   #STRING
	#LOAD
	#reg->_node != expr
	movl	%eax, -132(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#ASSIGN
	#END ASSIGN
	leal	.L8, %eax
	#END ADDRESS
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%eax
	call	printf
	#END CALL
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	-4(%ebp)
	call	inorder
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
.L7:	.asciz	"preorder traversal:\n"
.L8:	.asciz	"inorder traversal:\n"
