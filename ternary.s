.globl main
main:

# BEGIN TERNARY EXPRESSION
	
	# BEGIN BOOLEAN EXPRESSION
	movl $10, %eax # RHS EXPRESSION: 10
	pushl %eax
	movl $20, %eax # LHS EXPRESSION: 20
	popl %ebx
	movl $0, %ecx
	movl $1, %edx
	cmpl %ebx, %eax
	cmovg %edx, %ecx # GREATER-THAN: 20 > 10
	movl %ecx, %eax
	# END BOOLEAN EXPRESSION

#movl $0, %ebx
#cmpl %ebx, %eax
cmpl $0, %eax
je ternary_false
movl $3, %eax # TRUE EXPRESSION: 3
jmp ternary_end
ternary_false:
movl $7, %eax # FALSE EXPRESSION: 7
ternary_end:
# END TERNARY EXPRESSION

ret
