        .data 
format: .asciz "%ld\n"
format_ex: .asciz "%X\n"
i:      .quad 0xDEADBEEF
        .text
        .global main
main:
        movq $format, %rdi
        movq $1234, %rsi
        xorq %rax, %rax
        call printf
        #El valor del registro rsp.
        movq $format, %rdi
        movq %rsp, %rsi
        xorq %rax, %rax
        call printf
        #La dirección de la cadena del formato
        movq $format, %rdi
        movq $format, %rsi
        xorq %rax, %rax
        call printf
        #La dirección de la cadena format en formato Exa
        movq $format_ex, %rdi
        movq $format, %rsi
        xorq %rax, %rax
        call printf
        #El quad del tope de la pila
        movq $format, %rdi
        movq (%rsp), %rsi
        xorq %rax, %rax
        call printf
        #El quad de rsp + 8
        movq $format, %rdi
        movq 8(%rsp), %rsi
        xorq %rax, %rax
        call printf
        #El valor i 
        movq $format, %rdi
        movq i, %rsi
        xorq %rax, %rax
        call printf
        #La dirección de i
        movq $format, %rdi
        movq $i, %rsi
        xorq %rax, %rax
        call printf
        ret
        
