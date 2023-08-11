.global main

main:
    mov r0, #2
    mov r1, #2
    mov r2, #2
    mov r3, #2
    bl leaf
    bx lr
