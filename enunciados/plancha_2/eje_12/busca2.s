.data
          cadena: .asciz "123456"

.text
.global main
main:
          movq $cadena, %rdi
          movb $'7' ,%sil    #Probar luego con diferentes valores

.global busca2
busca2:
        xorq %rax, %rax
busca_loop:
        movb (%rdi), %r10b
        cmpb %al, %r10b
        je fin
        cmpb %r10b, %sil
        je found
        incq %rdi
        jmp busca_loop
fin:
        notq %rax
        ret
found:
        movq %rdi, %rax
        ret
