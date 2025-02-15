DATA SEGMENT
    dat  DB 2 dup(4)    ; 2 bytes of 4
DATA ENDS

CODE SEGMENT
    START:
          mov AX,DATA     ;将DATA的偏移地址赋给AX
          mov DS,AX       ;将AX的值赋给DS

          lea SI, dat     ;将dat的偏移地址赋给SI
          mov AX, [SI]    ; 将dat的值赋给AX,这里不能直接mov AX, dat，因为dat是一个地址
          mov BL, AH      ; 将AX的高8位赋给BL,也就是4赋给BL
          mov DL, AL      ; 将AX的低8位赋给DL,也就是4赋给DL

          mov AH, 4CH
          int 21H
CODE ENDS
END START
