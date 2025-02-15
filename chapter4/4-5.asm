DATA SEGMENT
    dat  DW 1,2,3,4,5,6,7,8,9
DATA ENDS

CODE SEGMENT
          assume DS:DATA,CS:CODE
    START:
          mov    AX,DATA
          mov    DS,AX

          mov    SI, offset dat
          mov    CX, 9
    MUL2: 
          mov    AX,[SI]
          shl    AX,1
          mov    [SI],AX
          ADD    SI,2               ;16位，需要移动2位
          LOOP   MUL2

          mov    AX,4C00H
          int    21H

CODE ENDS
END START