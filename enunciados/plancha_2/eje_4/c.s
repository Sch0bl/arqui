.global main

main:
      movq $0xffffff00, %rax
      andq $-1, %rax
      ret



