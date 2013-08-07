
# A basic assembler program that returns the long integer 11 to the caller

# Declare main as a globally accessible - the assembler will not remove the
# main label, so the label will be accessible at link-time. '.globl' is an
# assembler directive, not assembly code
.globl	main

main:

	# Put 11 in the %eax - this is where the caller expects the return value
	movl $11, %eax

	# Return to the caller
	ret
