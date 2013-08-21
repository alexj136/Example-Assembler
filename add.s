
movl $10, %eax
pushl %eax
movl $20, %eax
popl %ebx
addl %ebx, %eax
ret
