.data
a: .word 0x42b00000
b: .word 0x40000000
c: .word 0x40000000
d: .word 0x3fe00000

.text
.global main

main:
      ldr r1, =a         
      vldr s0, [r1]

      ldr r1, =b         
      vldr s1, [r1]

      ldr r1, =c         
      vldr s2, [r1]

      ldr r1, =d         
      vldr s3, [r1]

      bl det
      bx lr
