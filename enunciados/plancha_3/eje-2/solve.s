# int solve(float a, float b, float c, float d, float e, float f, float *x, float *y);
.data
zero: .long 0
.text
#float det(float a, float b, float c, float d)
det:
    mulss %xmm3 , %xmm0
    mulss %xmm2 , %xmm1
    subss %xmm1 , %xmm0
    ret

.global solve
solve:
       pushq %rbp
       movq %rsp, %rbp
       subq $28, %rsp
       movss %xmm0, 24(%rsp) #a
       movss %xmm1, 20(%rsp) #b
       movss %xmm2, 16(%rsp) #c
       movss %xmm3, 12(%rsp) #d
       movss %xmm4, 8(%rsp)  #e
       movss %xmm5, 4(%rsp)  #f

       movss %xmm3, %xmm2   # d -> "c" 
       movss %xmm4, %xmm3   # e -> "d"

       call det  # det -> xmm0

       movss zero, %xmm1 
       ucomiss %xmm0, %xmm1
       je not_sol
       movss %xmm0, (%rsp) # Se guarda el det del sis en stack
       movss 16(%rsp), %xmm0 # c -> "a"
       movss 20(%rsp), %xmm1 # b -> "b"
       movss 4(%rsp), %xmm2  # f -> "c"
       movss 8(%rsp), %xmm3  # e -> "d"

       call det
       movss (%rsp), %xmm1
       divss %xmm1, %xmm0
       movss %xmm0, (%rdi)

       movss 24(%rsp), %xmm0
       movss 16(%rsp), %xmm1
       movss 12(%rsp), %xmm2
       movss 4(%rsp), %xmm3
      
       call det
       movss (%rsp), %xmm1
       divss %xmm1, %xmm0
       movss %xmm0, (%rsi)
       movq %rbp, %rsp
       popq %rbp
       xorq %rax, %rax
       ret

not_sol:
       movq %rbp, %rsp
       popq %rbp
       xorq %rax, %rax
       notq %rax
       ret
