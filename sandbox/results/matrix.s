#GLOBALS
#FUNCTION
.globl allocate
	#PROLOGUE
allocate:
.L0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	$0, -4(%ebp)
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#CAST
	#CALL
	#MULTIPLY
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	#expr != nullptr
	#expr = 8(%ebp)
	movl	8(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$16, 8(%ebp)
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%eax
	call	malloc
	#END CALL
	#END CAST
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L1:
	#LOAD
	#expr != nullptr
	#expr = 
	movl	, %ebx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	cmpl	$0, %ebx
	je	.L2
	#ASSIGN
	#END ASSIGN
	 #BLOCK
	  #ASSIGNMENT
	#CALL
	#MULTIPLY
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	#expr != nullptr
	#expr = 8(%ebp)
	movl	8(%ebp), %ebx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$4, 8(%ebp)
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%ebx
	call	malloc
	#END CALL
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#MULTIPLY
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %ecx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$16, -4(%ebp)
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	#LOAD
	#expr != nullptr
	#expr = -8(%ebp)
	movl	-8(%ebp), %edx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	%ecx, %edx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%edx), %edx
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	movl	, 
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %ecx
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	$1, %ecx
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
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
	jmp	.L1
.L2:
	#END WHILE
	#RETURN
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	#expr != nullptr
	#expr = -8(%ebp)
	movl	-8(%ebp), %eax
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
#FUNCTION
.globl initialize
	#PROLOGUE
initialize:
.L3:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	$0, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L4:
	#LOAD
	#reg->_node != expr
	movl	%eax, -4(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = 
	movl	, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	cmpl	$0, %eax
	je	.L5
	#ASSIGN
	#END ASSIGN
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	$0, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L6:
	#LOAD
	#expr != nullptr
	#expr = 
	movl	, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	cmpl	$0, %eax
	je	.L7
	#ASSIGN
	#END ASSIGN
	 #BLOCK
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	-8(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	#DEREFERENCE
	#ADD
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -8(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$16, -4(%ebp)
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	#LOAD
	#reg->_node != expr
	movl	%eax, -12(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = 8(%ebp)
	movl	8(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	-12(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%eax), %eax
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	#MULTIPLY
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	   #INT
	   #_operand = $4
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -28(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = -8(%ebp)
	movl	-8(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$4, -8(%ebp)
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	#LOAD
	#reg->_node != expr
	movl	%eax, -32(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = -28(%ebp)
	movl	-28(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	-32(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%eax), %eax
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	movl	-8(%ebp), 
	  #END ASSIGNMENT
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -36(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = -8(%ebp)
	movl	-8(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	$1, %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	, -8(%ebp)
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
	jmp	.L6
.L7:
	#END WHILE
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -40(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	$1, %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
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
	jmp	.L4
.L5:
	#END WHILE
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
#FUNCTION
.globl display
	#PROLOGUE
display:
.L8:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	$0, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L9:
	#LOAD
	#reg->_node != expr
	movl	%eax, -44(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = 
	movl	, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	cmpl	$0, %eax
	je	.L10
	#ASSIGN
	#END ASSIGN
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	$0, -8(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L11:
	#LOAD
	#expr != nullptr
	#expr = 
	movl	, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	cmpl	$0, %eax
	je	.L12
	#ASSIGN
	#END ASSIGN
	 #BLOCK
	  #ASSIGNMENT
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$16, -4(%ebp)
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	#LOAD
	#reg->_node != expr
	movl	%eax, -48(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = 8(%ebp)
	movl	8(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	-48(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%eax), %eax
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	movl	, -12(%ebp)
	  #END ASSIGNMENT
	#CALL
	#ADDRESS
	   #STRING
	#LOAD
	#reg->_node != expr
	movl	%eax, -64(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#ASSIGN
	#END ASSIGN
	leal	.L13, %eax
	#END ADDRESS
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = -12(%ebp)
	    #END ID
	#MULTIPLY
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
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
	#expr = -8(%ebp)
	movl	-8(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$4, -8(%ebp)
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	#LOAD
	#reg->_node != expr
	movl	%eax, -72(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = -12(%ebp)
	movl	-12(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	-72(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%eax), %eax
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%eax
	pushl	-68(%ebp)
	call	printf
	#END CALL
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -76(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = -8(%ebp)
	movl	-8(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	$1, %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	movl	, -8(%ebp)
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
	jmp	.L11
.L12:
	#END WHILE
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -80(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	$1, %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	#ADDRESS
	   #STRING
	#LOAD
	#reg->_node != expr
	movl	%eax, -84(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#ASSIGN
	#END ASSIGN
	leal	.L14, %eax
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
	jmp	.L9
.L10:
	#END WHILE
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
#FUNCTION
.globl deallocate
	#PROLOGUE
deallocate:
.L15:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	#BODY
	 #BLOCK
	  #ASSIGNMENT
	   #INT
	   #_operand = $0
	   #END INT
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	$0, -4(%ebp)
	  #END ASSIGNMENT
	#WHILE
.L16:
	#LOAD
	#reg->_node != expr
	movl	%eax, -88(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = 
	movl	, %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	cmpl	$0, %eax
	je	.L17
	#ASSIGN
	#END ASSIGN
	 #BLOCK
	#CALL
	#DEREFERENCE
	#ADD
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#MULTIPLY
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $16
	   #END INT
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	imull	$16, -4(%ebp)
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END MULTIPLY
	#LOAD
	#reg->_node != expr
	movl	%eax, -92(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = 8(%ebp)
	movl	8(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	-92(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	movl		(%eax), %eax
	#ASSIGN
	#END ASSIGN
	#END DEREFERENCE
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	%eax
	call	free
	#END CALL
	  #ASSIGNMENT
	#ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	   #INT
	   #_operand = $1
	   #END INT
	#LOAD
	#reg->_node != expr
	movl	%eax, -108(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#LOAD
	#expr != nullptr
	#expr = -4(%ebp)
	movl	-4(%ebp), %eax
	#ASSIGN
	#END ASSIGN
	#END LOAD
	addl	$1, %eax
	#ASSIGN
	#END ASSIGN
	#ASSIGN
	#END ASSIGN
	#END ADD
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
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
	jmp	.L16
.L17:
	#END WHILE
	#CALL
	    #ID
	    #_operand = 8(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	8(%ebp)
	call	free
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#GLOBALS
#FUNCTION
.globl main
	#PROLOGUE
main:
.L18:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	#BODY
	 #BLOCK
	#CALL
	#ADDRESS
	   #STRING
	#LOAD
	#reg->_node != expr
	movl	%eax, -112(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#ASSIGN
	#END ASSIGN
	leal	.L19, %eax
	#END ADDRESS
	#ADDRESS
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	#reg->_node != expr
	movl	%eax, -116(%ebp)
	#ASSIGN
	#END ASSIGN
	#END LOAD
	#ASSIGN
	#END ASSIGN
	leal	-8(%ebp), %eax
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
	pushl	-116(%ebp)
	call	scanf
	#END CALL
	  #ASSIGNMENT
	#CALL
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	-8(%ebp)
	call	allocate
	#END CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	movl	, -4(%ebp)
	  #END ASSIGNMENT
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	call	initialize
	#END CALL
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	call	display
	#END CALL
	#CALL
	    #ID
	    #_operand = -4(%ebp)
	    #END ID
	    #ID
	    #_operand = -8(%ebp)
	    #END ID
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	#LOAD
	#END LOAD
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	call	deallocate
	#END CALL
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
.L13:	.asciz	"%d "
.L14:	.asciz	"\n"
.L19:	.asciz	"%d"
