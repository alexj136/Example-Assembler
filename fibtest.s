.text
printf_str: .asciz "%d"
error_str: .asciz "Error: reached end of function without return"

.globl main
main:

# BEGIN RETURN STATEMENT 0
# BEGIN CALL 0 TO 'fibonacci'
pushl %ebp
movl 0(%ebp), %eax    # IDENTIFIER
pushl %eax
addl $4, %esp
movl %esp, %ebp
call fibonacci
movl %ebp, %esp
popl %ebp
# END CALL 0 TO 'fibonacci'
ret
# END RETURN STATEMENT 0

# END OF FUNCTION ERROR CODE |
pushl $error_str           # |
call printf                # |
movl $0, %ebx              # |
movl $1, %eax              # |
int $0x80                  # |

.globl fibonacci
fibonacci:

# BEGIN IF STATEMENT 0
# BEGIN BOOLEAN EXPRESSION 0
movl $0, %eax    # INTEGER LITERAL
pushl %eax
movl 0(%ebp), %eax    # IDENTIFIER
popl %ebx
movl $0, %ecx
movl $1, %edx
cmpl %ebx, %eax
cmove %edx, %ecx
movl %ecx, %eax
# END BOOLEAN EXPRESSION 0
cmpl $0, %eax
je else_branch_0
# BEGIN RETURN STATEMENT 1
movl $0, %eax    # INTEGER LITERAL
ret
# END RETURN STATEMENT 1
jmp if_end_0
else_branch_0:
if_end_0:
# END IF STATEMENT 0
# BEGIN IF STATEMENT 1
# BEGIN BOOLEAN EXPRESSION 1
movl $1, %eax    # INTEGER LITERAL
pushl %eax
movl 0(%ebp), %eax    # IDENTIFIER
popl %ebx
movl $0, %ecx
movl $1, %edx
cmpl %ebx, %eax
cmove %edx, %ecx
movl %ecx, %eax
# END BOOLEAN EXPRESSION 1
cmpl $0, %eax
je else_branch_1
# BEGIN RETURN STATEMENT 2
movl $1, %eax    # INTEGER LITERAL
ret
# END RETURN STATEMENT 2
jmp if_end_1
else_branch_1:
# BEGIN RETURN STATEMENT 3
# BEGIN ARITHMETIC EXPRESSION 0
# BEGIN CALL 2 TO 'fibonacci'
pushl %ebp
# BEGIN ARITHMETIC EXPRESSION 2
movl $2, %eax    # INTEGER LITERAL
pushl %eax
movl 0(%ebp), %eax    # IDENTIFIER
popl %ebx
subl %ebx, %eax
# END ARITHMETIC EXPRESSION 2
pushl %eax
addl $4, %esp
movl %esp, %ebp
call fibonacci
movl %ebp, %esp
popl %ebp
# END CALL 2 TO 'fibonacci'
pushl %eax
# BEGIN CALL 1 TO 'fibonacci'
pushl %ebp
# BEGIN ARITHMETIC EXPRESSION 1
movl $1, %eax    # INTEGER LITERAL
pushl %eax
movl 0(%ebp), %eax    # IDENTIFIER
popl %ebx
subl %ebx, %eax
# END ARITHMETIC EXPRESSION 1
pushl %eax
addl $4, %esp
movl %esp, %ebp
call fibonacci
movl %ebp, %esp
popl %ebp
# END CALL 1 TO 'fibonacci'
popl %ebx
addl %ebx, %eax
# END ARITHMETIC EXPRESSION 0
ret
# END RETURN STATEMENT 3
if_end_1:
# END IF STATEMENT 1

# END OF FUNCTION ERROR CODE |
pushl $error_str           # |
call printf                # |
movl $0, %ebx              # |
movl $1, %eax              # |
int $0x80                  # |