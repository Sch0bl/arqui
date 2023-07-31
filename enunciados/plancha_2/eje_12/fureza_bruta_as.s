.data
strlong: .asciz "asdfholaasdf"
strshort: .asciz "hola"
.text
prologo:
        pushq %rcx  # unsigned ls -32
        pushq %rsi  # const char *s -24
        pushq %rdi  # const char *S -16
        pushq %rdi  # char* dir -8
        movl %edx, %r10d
        movl %ecx, %r11d
        subl %r11d, %r10d 
        pushq %r10 # usigned l 
        jmp looping
epilogo:
        popq %r11
        popq %r11
        popq %r11
        popq %r11
        popq %r11
        jmp fin
set_args_busca:
        #Seteo args bucs
        #dir
        movq 8(%rsp), %rdi
        #*s
        movq 24(%rsp), %rsi
        movb (%rsi), %sil
        #l
        movl (%rsp), %edx
        jmp sigue1
set_args_compara:
        #seteo args compara
        #s
        movq 8(%rsp), %rdi
        #dir (quedo en %rax)
        movq %rax, %rsi
        #l
        movl 32(%rsp), %edx
        jmp sigue2

.global main
main:
        movq $strlong, %rdi 
        movq $strshort, %rsi
        movl $12, %edx
        movl $4, %ecx

.global fuerza_bruta_as
fuerza_bruta_as: 
        jmp prologo
looping:
        jmp set_args_busca
sigue1:
        call busca
        #dir = busca(dir, *s, l)
        movq %rax, 8(%rsp)
        #cmp
        movq $-1, %r10
        cmpl %eax, %r10d
        je epilogo
        #l = l - ((unsigned)(dir - S))
        movq 8(%rsp), %r10
        movq 16(%rsp), %r11
        subq %r11, %r10
        movl (%rsp), %r11d
        subq %r10, %r11
        movl %r11d, (%rsp)
        #if compara
        jmp set_args_compara
sigue2:
        call compara
        #cmp
        xorq %r10, %r10
        cmpl %eax, %r10d
        jne encontre
        jmp looping
encontre:
        movl (%rsp), %eax
        jmp epilogo 
fin:
        ret
