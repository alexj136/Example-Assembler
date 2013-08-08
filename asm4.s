
# This program demonstrates the use of conditional move

.text

format_string: .asciz "%d\n"

.globl main

main:

	# Example usage 1

	movl $15, %ecx			# Move 15 to %ecx, we will use this to check the
							# result of our test - we must do this for each test
							# because printf clobbers %ecx

	movl $10, %eax			# We will be comparing 10 to 20
	movl $20, %ebx

	cmpl %eax, %ebx			# do the comparison
	cmove %ecx, %eax		# cmove = cmov-equal: move 15 to %eax if the
							# comparison was equal

	pushl %eax				# print the value of %eax - should be 10 because
	pushl $format_string	# 20 != 10
	call printf

	# Example usage 2

	movl $15, %ecx			# Move 15 to %ecx, we will use this to check the
							# result of our test - we must do this for each test
							# because printf clobbers %ecx

	movl $10, %eax			# This time we will be comparing 10 to 10
	movl $10, %ebx

	cmpl %eax, %ebx			# do the comparison
	cmove %ecx, %eax		# cmove = cmov-equal: move 15 to %eax if the
							# comparison was equal

	pushl %eax				# print the value of %eax - should be 15 because
	pushl $format_string	# 10 = 10
	call printf

	# Example usage 3

	movl $4, %eax			# right hand side

	push %eax

	movl $2, %eax			# left hand side, we have: 2 > 4

	pop %ebx

	movl $0, %ecx
	movl $1, %edx
	cmpl %ebx, %eax
	cmovg %edx, %ecx
	movl %ecx, %eax

	pushl %eax				# print the value of %eax - should be 0 because
	pushl $format_string	# 2 > 4 is false
	call printf

	# Example usage 4

	movl $2, %eax			# right hand side

	push %eax

	movl $4, %eax			# left hand side, we have: 4 > 2

	pop %ebx

	movl $0, %ecx
	movl $1, %edx
	cmpl %ebx, %eax
	cmovg %edx, %ecx
	movl %ecx, %eax

	pushl %eax				# print the value of %eax - should be 1 because
	pushl $format_string	# 4 > 2 is true
	call printf

	# Exit

	movl $1, %eax
	movl $0, %ebx
	int $0x80
