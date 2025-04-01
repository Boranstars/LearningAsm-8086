DATA SEGMENT
    NUM1 DD 88242567H
    NUM2 DD 0A435C218H
    RES DD ?
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START: 
    mov AX, DATA
    mov DS, AX
    
    mov AX, WORD PTR [NUM1]
    mov DX, WORD PTR [NUM2]
    ADD AX, DX
    mov WORD PTR [RES], AX
    mov AX, WORD PTR [NUM1+2]
    mov DX, WORD PTR [NUM2+2]
    ADC AX,DX
    mov WORD PTR [RES+2], AX;此处是存在溢出的
    ; mov DX
    mov AH, 4CH
    int 21H
CODE ENDS
END START