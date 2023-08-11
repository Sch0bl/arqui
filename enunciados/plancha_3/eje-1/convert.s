.data
flt: .long 0x3fc00000
.text
.global convert
convert:
         cvtsi2sd %edi, %xmm1
         movss flt, %xmm2
         cvtss2sd %xmm2, %xmm2
         mulsd %xmm2, %xmm0
         addsd %xmm1, %xmm0
         ret

