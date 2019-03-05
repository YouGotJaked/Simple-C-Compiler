#GLOBALS
#FUNCTION
#here
#here
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
	pushl	0x7f85165000d0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f85165001d0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f85165002d0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f85165003e0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f85165004c0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f85165005f0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f85165006e0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f85165007c0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f85165008a0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8516500a10
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8516500b00
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8516500be0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8516500cc0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8516500da0
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8516500e80
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8516500f70
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8516501060
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8516501250
	call	putchar
	#CALL
	   #INT
	pushl	0x7f8516500990
	call	putchar
	#EPILOGUE
	movl	%ebp, %esp
	popl	%ebp
	ret
#STRINGS
