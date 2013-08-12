
# Calls the arithmetic function in the c file 'arithmetic.c' with (5, 4, 3, 2)
# and prints the result
#
# Run this program with:
#
#	$ gcc -c arithmetic.c -o arithmetic.o
#	$ gcc arithmetic.o asm5.s -o asm5
#	$ ./asm5

.text

format_string: .asciz "%d\n"

.globl main

main:

	# Call our c function

	pushl %ebp		# Push our stack base pointer on the stack so we can restore
					# it after the function call

	movl %esp, %ebp	# Set the callee's stack base pointer as out stack pointer
					# so the callee doesn't overwrite our stack frame

	pushl $2		# Push the arguments (5, 4, 3, 2) and call the function
	pushl $3
	pushl $4
	pushl $5

	call arithmetic

	pushl %eax				# print the value of %eax which has the result of
	pushl $format_string	# the function call
	call printf

	# Exit
	movl $1, %eax
	movl $0, %ebx
	int $0x80
