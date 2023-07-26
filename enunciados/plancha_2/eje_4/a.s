.global main

main:
      movq $1, %rax
      shlq $31, %rax
      ret
