DATA SEGMENT
    MEM  DB 04H
    MEMA DB ?
    MEMB DB ?
DATA ENDS

CODE SEGMENT
          assume DS:DATA, CS:CODE
    START:
          mov    AX,DATA
          mov    DS,AX

          mov    AL,MEM
          and    AX,01H              ;判断奇偶
          test   AL,AL               ;判断是否为0，为0则为偶数（ZF=1）,不为0则为奇数（ZF=0）
          JNZ    ODD                 ;如果不为0则跳转到ODD

          mov    AL,MEM              ;如果为0则继续执行
          mov    MEMB,AL             ;将MEM的值赋给MEMB

          mov    AH,4CH
          int    21
    ODD:  
          mov    AL,MEM              ;如果为1则继续执行
          mov    MEMA,AL             ;将MEM的值赋给MEMA
          
          mov    AH,4CH
          int    21

CODE ENDS
    END START
