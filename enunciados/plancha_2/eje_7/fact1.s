.global fact1


#fact1_:
#      xorq %rax, %rax
#      cmpq %rdi, %rax
#      jnz fact1_set
#      incq %rax
#      ret
#fact1_set_:
#      incq %rax
#fact1_aux_:
#      cmpq %rdi, %rax
#      jne fact1_rec
#      ret
#fact1_rec_:
#      pushq %rbx
#      movq %rdi, %rbx
#      decq %rdi
#      call fact1_aux
#      mulq %rbx
#      popq %rbx
#      ret

fact1:
      movq $1, %rax
      cmpq %rax, %rdi
      jg fact1_rec
      ret
fact1_rec:
      pushq %rbx
      movq %rdi, %rbx
      decq %rdi
      call fact1
      mulq %rbx
      popq %rbx
      ret

