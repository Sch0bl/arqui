.data
a: .quad 0
b: .quad 0xfffffff
.global main

main:

      movq %rax, $a
      ret
