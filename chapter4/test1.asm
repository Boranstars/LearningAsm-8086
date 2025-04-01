DATA SEGMENT
HEXN DB 0AH 
ASCN DB ? 
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE
START:
    mov AX, DATA
    mov DS, AX

    mov AL, BYTE PTR [HEXN]
    add AL, 37H
    mov BYTE PTR [ASCN], AL

    mov DL, ASCN
    mov AH, 02H
    int 21H


    mov AH, 4CH
    int 21H
CODE ENDS
END START