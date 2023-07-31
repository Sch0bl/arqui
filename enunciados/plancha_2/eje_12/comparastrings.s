.data
#        cadenalarga: .asciz "123456"
#        cadenacorta: .asciz "124"  #=>1 , 124 =>0, 456 => 0 
        
.text
#.global main
#main:
#        movq $cadenalarga, %rdi
#        movq $cadenacorta, %rsi
#        movl $3, %edx #debe ser la longitud de la cadena corta

.global compara
compara:
        movl %edx, %ecx
        xorq %rax, %rax
loop_comp:
        movb (%rdi), %r10b
        movb (%rsi), %r11b
        cmpb %r10b, %r11b
        jne  retorna
        incq %rdi
        incq %rsi
        loop loop_comp
        incq %rax
retorna:
        ret
        #retorna 1 si las cadenas son iguales en los primeros 
        #%edx caracteres
        #retorna 0 si son distintas
