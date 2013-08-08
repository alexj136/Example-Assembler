
# This program demonstrates the use of conditional move

.text

format_string: .asciz "%d\n"

.globl main

main:

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

	#-------------

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

	movl $1, %eax			# make an exit call
	movl $0, %ebx
	int $0x80
