#GLOBALS
#FUNCTION
.globl main
	#PROLOGUE
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	#BODY
	 #BLOCK
	#CALL
	   #INT
	pushl	0x1da0f40
	call	putchar
	#CALL
	   #INT
	pushl	0x1da1050
	call	putchar
	#CALL
	   #INT
	pushl	0x1da1180
	call	putchar
	#CALL
	   #INT
	pushl	0x1da12c0
	call	putchar
	#CALL
	   #INT
	pushl	0x1da13b0
	call	putchar
	#CALL
	   #INT
	pushl	0x1da1510
	call	putchar
	#CALL
	   #INT
	pushl	0x1da15f0
	call	putchar
	#CALL
	   #INT
	pushl	0x1da1700
	call	putchar
	#CALL
	   #INT
	pushl	0x1da1810
	call	putchar
	#CALL
	   #INT
	pushl	0x1da14c0
	call	putchar
	#CALL
	   #INT
	pushl	0x1da1a70
	call	putchar
	#CALL
	   #INT
	pushl	0x1da1b80
	call	putchar
	#CALL
	   #INT
	pushl	0x1da1c90
	call	putchar
	#CALL
	   #INT
	pushl	0x1da1da0
	call	putchar
	#CALL
	   #INT
	pushl	0x1da1eb0
	call	putchar
	#CALL
	   #INT
	pushl	0x1da1fc0
	call	putchar
	#CALL
	   #INT
	pushl	0x1da20d0
	call	putchar
	#CALL
	   #INT
	pushl	0x1da1920
	call	putchar
	#CALL
	   #INT
	pushl	0x1da23b0
	call	putchar
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
