
.text

printf_str: .asciz "%d\n"

.globl main

main:

	# BEGIN PRINT STATEMENT 0
	# BEGIN ARITHMETIC EXPRESSION 0
	# BEGIN ARITHMETIC EXPRESSION 2
	# BEGIN TERNARY EXPRESSION 0
	# BEGIN BOOLEAN EXPRESSION 0
	movl $5, %eax
	pushl %eax
	movl $4, %eax
	popl %ebx
	movl $0, %ecx
	movl $1, %edx
	cmpl %ebx, %eax
	cmovl %edx, %ecx
	cmpl $0, %eax
	je ternary_false_0
	# BEGIN TERNARY EXPRESSION 1
	# BEGIN BOOLEAN EXPRESSION 1
	movl $9, %eax
	pushl %eax
	movl $10, %eax
	popl %ebx
	movl $0, %ecx
	movl $1, %edx
	cmpl %ebx, %eax
	cmovne %edx, %ecx
	cmpl $0, %eax
	je ternary_false_1
	movl $3, %eax
	jmp ternary_end_1
	ternary_false_1:
	movl $123, %eax
	ternary_end_1:
	# END TERNARY EXPRESSION 1
	jmp ternary_end_0
	ternary_false_0:
	movl $500, %eax
	ternary_end_0:
	# END TERNARY EXPRESSION 0
	pushl %eax
	movl $4, %eax
	popl %ebx
	addl %ebx, %eax
	# END ARITHMETIC EXPRESSION 2
	pushl %eax
	# BEGIN ARITHMETIC EXPRESSION 1
	movl $5, %eax
	pushl %eax
	movl $4, %eax
	popl %ebx
	imull %ebx
	# END ARITHMETIC EXPRESSION 1
	popl %ebx
	idivl %ebx
	movl %edx, %eax
	# END ARITHMETIC EXPRESSION 0
	pushl %eax
	pushl $printf_str
	call printf
	# END PRINT STATEMENT 0

	movl $1, %eax
	movl $0, %ebx
	int $0x80
