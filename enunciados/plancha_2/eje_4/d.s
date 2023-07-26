.global main


main :
      movq $0xaa, %rax
      movq $0xaa, %rbx
      shlq $24, %rax
      orq %rbx, %rax
      ret
