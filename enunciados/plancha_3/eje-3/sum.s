#void sum(float *a, float *b, int len)
.global sum

sum:
         movl %edx, %ecx 
         xorq %rdx, %rdx
loop_sum:
         movss (%rdi,%rdx,4), %xmm0
         addss (%rsi,%rdx,4), %xmm0
         movss %xmm0, (%rdi,%rdx,4)
         incl %edx
         loop loop_sum
         ret
