
# This program makes a call to printf to print the number 1134 to the
# terminal screen.

.text

format_string: .asciz "%d\n"

.globl main

main:
	
	pushl %esi				# %edi and %esi registers are callee-saved, so we
	pushl %edi				# must push them in order to pop them back when we
							# return

	movl $1134, %eax		# put the value we want to print out on to the stack
	pushl %eax				# 

	pushl $format_string	# push the address of the format label so printf
							# knows where to look for its format string, "%d\n".

	call printf				# make the call

	popl %edi				# pop the callee save registers back into place
	popl %esi

	movl $1, %eax			# make an exit call
	movl $0, %ebx
	int $0x80
