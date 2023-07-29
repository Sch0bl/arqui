.global fact2
fact2:
      movq %rdi, %rcx
      movq $1, %rax
      cmpq %rax, %rcx
      jge fact2_loop
      ret
fact2_loop:
      mulq %rcx
      loop fact2_loop
      ret
