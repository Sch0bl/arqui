.global fact2

fact2:
      movq %rdi, %rcx
      movq $1, %rax
fact2_loop:
      mulq %rcx
      loop fact2_loop
      ret
