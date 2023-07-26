.global main


main:
      movq $-1, %rbx
      movq $1, %rax
      shlq $8, %rax
      notq %rax
      andq %rbx, %rax
      ret
