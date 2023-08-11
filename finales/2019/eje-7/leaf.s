.global leaf

@ int leaf(int g, int h, int i, int j)
@ r0 <- g, r1 <- h, r2 <- i, r3 <- j

leaf:
      sub r13, #4
      add r0, r0, r1
      add r2, r2, r3
      sub r0, r0, r2
      str r0, [r13]
      add r13, #4
      bx lr
