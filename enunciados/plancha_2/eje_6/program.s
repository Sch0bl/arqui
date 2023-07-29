.data
length: .byte 10
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

.text

suma:
      xorq %rax, %rax
      xorq %rcx, %rcx
      movq $list, %rsi
      movb length, %cl 

suma_loop:
      movl (%rsi), %ebx
      addl %ebx, %eax
      addq $4, %rsi
      loop suma_loop
      ret

maximo:
      xorq %rax, %rax
      xorq %rcx, %rcx
      movq $list, %rsi
      movl list, %eax
      movb length, %cl 

maximo_loop:
      movl (%rsi), %ebx
      cmpl %ebx, %eax
      jge maximo_sigue
      movl %ebx, %eax
maximo_sigue:
      addq $4, %rsi
      loop maximo_loop
      ret

minimo:
      xorq %rax, %rax
      xorq %rcx, %rcx
      movq $list, %rsi
      movl list, %eax
      movb length, %cl 

minimo_loop:
      movl (%rsi), %ebx
      cmpl %ebx, %eax
      jle minimo_sigue
      movl %ebx, %eax
minimo_sigue:
      addq $4, %rsi
      loop minimo_loop
      ret

promedio:
      call suma
      movzbl length, %ebx
      xorl %edx, %edx
      divl %ebx
      ret
      

.global main
main:
      #call suma
      call promedio
      ret
