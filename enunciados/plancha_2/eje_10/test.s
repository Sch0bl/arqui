.global main

main:
      movq $0x00000000abcdefab, %rax
      rolq $32, %rax
      movl $64, %ecx
      xorq %rbx, %rbx
loop_count: 
      rolq $1, %rax
      adcq $0, %rbx 
      loop loop_count
      ret
#110101010
#101010101

