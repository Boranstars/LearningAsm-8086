DATA SEGMENT
    
    msg  DB 'Hello x86',10,'$'
DATA ENDS

CODE SEGMENT
          assume CS:CODE,DS:DATA

    START:
          mov    AX,DATA
          mov    DS,AX

          mov    DX,offset msg 
          mov    AH, 09H
          int    21H
          
          mov    DL, 3+'0'
          mov    AH, 02H
          int    21H
    
          mov    AH, 4CH
          int    21H
CODE ENDS
END START

