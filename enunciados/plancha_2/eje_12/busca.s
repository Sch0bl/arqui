.data
#          cadena: .asciz "123456"

.text
#.global main
#main:
#          movq $cadena, %rdi
#          movb $'7' ,%sil    #Probar luego con diferentes valores
#          movb $6, %dl

.global busca
busca:
        xorq %rax, %rax
        movl %edx, %ecx
busca_loop:
        movb (%rdi), %r10b
        cmpb %r10b, %sil
        je found
        incq %rdi
        loop busca_loop
        notq %rax
        ret
found:
        movq %rdi, %rax
        ret
