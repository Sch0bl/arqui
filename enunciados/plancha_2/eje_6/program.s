.data
length: .byte 10
#list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100


.global main
main:
      xorw %cx, %cx
      xorq %rax, %rax
      movl $1234, %ebx
      ret
