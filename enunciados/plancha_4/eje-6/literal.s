.global main

main:
      sub r11, r12, r3, lsl #32
      add r3, r7, #1024 
      sub r3, #1
      bx lr
      
