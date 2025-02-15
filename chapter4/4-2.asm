DATA SEGMENT
    dat  DD 0ABCDH    ; 4 bytes of ABCD
DATA ENDS

CODE SEGMENT
          assume CS:CODE,DS:DATA
    START:
          mov    AX, DATA
          mov    DS, AX

          lea    SI, dat            ; 将dat的偏移地址赋给SI
          mov    DX, [SI]           ; 将dat的值赋给DX,这里不能直接mov AX, dat，因为dat是一个地址
        
          mov    CL, 04H            ; 4 bits,移位4位
          mov    AL,DL              ; 将DL的值赋给AL
          and    al, 0FH            ; 与0FH做与运算
          shr    DX, CL             ; 将DX右移CL位
          mov    BL,DL              ; 将DL的值赋给BL
          and    BL,0FH             ; 与0FH做与运算
          shr    DX, CL             ; 将DX右移CL位
          mov    CL,DL              ; 将DL的值赋给CL
          and    CL,0FH             ; 与0FH做与运算
          mov    AH, CL             ; 将CL的值赋给AH
          mov    CL,04H             ; 4 bits,移位4位
          shr    DL,CL              ; 将DL右移CL位
          xchg   AH,CL              ; 交换AH和CL的值

       
        


          mov    AH, 4CH
          int    21H
CODE ENDS
    END START
