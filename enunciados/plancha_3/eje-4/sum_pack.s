.global sum_pack

sum_pack:
          movl %edx, %eax
          xorq %rdx, %rdx
          movl $4, %r10d
          divl %r10d
          xorq %r10, %r10
          movl %eax, %ecx
loop_pack:
          movaps (%rdi, %r10, 8), %xmm0
          movaps (%rsi, %r10, 8), %xmm1
          addps %xmm1, %xmm0
          movaps %xmm0, (%rdi, %r10, 8)
          addq $2, %r10
          loop loop_pack
          cmpl $0, %edx
          je fin
loop_upack:
          leaq (%rdi, %r10, 8), %rdi
          leaq (%rsi, %r10, 8), %rsi
          call sum
fin:
          ret



