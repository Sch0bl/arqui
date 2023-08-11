.global campesino_ruso

@ unsigned int campesino_ruso(unsigned int i, unsigned int j)
@ r0 = i
@ r1 = j
campesino_ruso:
                mov r2, r0  @ r2 = i
                mov r0, #0  @ r0 = res
                cmp r1, #1  @ j > 1 
                addls r0, r2
                bxls lr 
while_loop:
                and r3, r2, #1 
                cmp r3, #1
                addeq r0, r0, r2
                subeq r1, r1, #1
                movne r2, r2, lsr #1
                movne r1, r1, lsl #1
                cmp r1, #1
                bhi while_loop
                add r0, r2
                bx lr


