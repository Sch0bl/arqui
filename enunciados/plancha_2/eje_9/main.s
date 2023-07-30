.data
length: .byte 10
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

.text

.global main
main:
      movq $list, %r8
      movzbq length, %rcx
      movq $list, %rdi
push:
      movl (%rdi), %ebx
      pushq %rbx
      addq $4, %rdi
      loop push
      movzbq length, %rcx
      movq $list, %rdi
pop:
      popq %rbx
      movl %ebx, (%rdi)
      addq $4, %rdi
      loop pop
      ret
