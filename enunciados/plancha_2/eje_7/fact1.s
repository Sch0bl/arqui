.global fact1


fact1:
      xorq %rax, %rax
      cmpq %rdi, %rax
      jnz fact1_set
      ret
fact1_set:
      incq %rax
fact1_aux:
      cmpq %rdi, %rax
      jne fact1_rec
      ret
fact1_rec:
      pushq %rbx
      movq %rdi, %rbx
      decq %rdi
      call fact1_aux
      mulq %rbx
      popq %rbx
      ret

