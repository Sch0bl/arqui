.global main


main:
      xorq %rax, %rax
      movq $1, %rbx
      subq %rbx, %rax
      ret
