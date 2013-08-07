
# This program demonstrates making a system call

.globl	main

main:
	
	
	
	movl	$0,	%ebx	# Move 0 to %ebx - when making an exit system call, the
						# kernel expects the exit status code for the program in
						# %ebx.

	movl	$1,	%eax	# Move 1 to %eax - when making a system call, we tell
						# the kernel what kind of system call we want to make by
						# the value stored in %eax. 1 indicates the exit system
						# call

	int	$0x80			# Interrupt the kernel
