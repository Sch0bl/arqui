.global main

main:
      movq $1, %rax
      movq $1, %rbx
      shlq $31, %rbx
      shlq $15, %rax
      orq %rbx, %rax
      ret

