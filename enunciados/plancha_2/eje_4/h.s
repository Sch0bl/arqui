.global main


main:
      movl $0x80000000, %ebx
      movl $0x80000000, %eax
      addl %ebx, %eax
      ret
