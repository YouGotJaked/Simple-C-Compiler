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
	pushl	0x7f8b995001d0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b995002c0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b995003c0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b995004d0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b995005b0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b995006e0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b995007d0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b995008b0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b99500990
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b99500b00
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b99500bf0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b99500cd0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b99500db0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b99500e90
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b99500f70
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b99501060
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b99501150
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b99501340
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8b99500a80
	call	putchar
	#END BODY
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
