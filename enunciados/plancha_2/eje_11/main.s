.data
correcto: .asciz "Cantidad de Numeros ingresados: %d. La suma es %d\n"
incorrecto: .asciz "No se ingresaron argumentos\n"

.text

.global main

main:
      movq $1, %r10
      subq %r10, %rdi
      jg sigue
      movq $incorrecto, %rdi
      xorq %rax, %rax
      call printf
      ret
sigue:
      movq %rdi, %rcx
      xorq %rax, %rax
      addq $8, %rsi
      pushq %rdi
sum_loop:
      pushq %rsi
      pushq %rcx
      pushq %rax
      movq (%rsi), %rdi
      call atoi
      mull %eax
      popq %rcx
      addq %rcx, %rax
      popq %rcx
      popq %rsi
      addq $8, %rsi
      loop sum_loop
      popq %rsi
      movq $correcto, %rdi
      movq %rax, %rdx
      xorq %rax, %rax
      call printf
      ret

      
