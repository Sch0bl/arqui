.data
array: .byte 1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11, 12, 13 ,14 ,15 ,16
x: .quad 1
y: .quad 2
.text

.global main

main:
      ldr r0, =x
      ldr r0, [r0]
      ldr r1, =y
      ldr r1, [r1]
      ldr r0, =array
      ldrb r0, [r0, #7]
      add r0, r0, r1
      bx lr
