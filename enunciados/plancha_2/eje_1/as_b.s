.global main


main: 
      movb $0xfe, %al
      movb $-1,   %bl
      addb %bl, %al
      incb %bl
      ret
