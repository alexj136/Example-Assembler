
# This program makes a call to printf

	# The name of the source file (not strictly necessary
	.file	"asm1.s"

	# The start of the text segment, where code goes
	.text

# The .ascii assembler directive tells the assembler that the data that follows
# it is an ascii string, and the LC0 label makes it accessible via indirect
# addressing to code in this file with '$LC0'
LC0:	.ascii "'sup\12\0"

.globl main

main:

	# Save the callers stack base pointer (stack base pointer is the 'bottom' of
	# the stack for a particular routine)
	pushl	%ebp

	# Set the caller's stack pointer as our base pointer - our stack now starts
	# where theirs finished. So move long has the general syntax: movl src, dest
	movl	%esp, %ebp

	# Subtract 8 from the stack pointer (the stack grows downwards, so we
	# effectively create two new spaces for 32 bit variables)
	subl	$8, %esp

	# Put zero into %eax
	movl	$0, %eax

	# Then move the contents of %eax (zero, obviously) onto the first space we
	# created on the stack
	movl	%eax, -4(%ebp)

	# Move the address of our string on to the second of the spaces on the stack
	# we created (the top of the stack)
	movl	$LC0, (%esp)
	
	#----     ????    ----#
	#----     ????    ----# <- ebp
	#----      0      ----#
	#---- addr of LC0 ----# <- esp

	# Now we actually call printf
	call	printf

	# Move zero into %eax (printf will have used %eax) as our return value, in
	# adherence with the C calling convention
	movl	$0, %eax

	# Prepare to finish the subroutine by popping everything we put on the stack
	# back off it again. We could also do this with 'movl    %ebp, %esp'.
	leave

	# Return control to the calling procedure
	ret
