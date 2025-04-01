DATA SEGMENT
    BUF1 DW 0ABCDH      ; 定义字变量BUF1，初始值为0ABCDH
    BUF2 DB 4 dup(?)    ; 分配4个未初始化字节空间给BUF2
DATA ENDS

CODE SEGMENT
          ASSUME CS:CODE, DS:DATA    ; 设定段寄存器关联
    START:
          mov    AX, DATA            ; 将数据段地址加载到AX
          mov    DS, AX              ; 设置DS指向数据段

          mov    DX, [BUF1]          ; 将BUF1的值（ABCDH）加载到DX
          mov    AX, DX              ; 复制DX值到AX，AX=ABCDH
          AND    AX, 0F0FH           ; 屏蔽AX高四位，保留各字节低四位（AX=0B0DH）
          AND    DX, 0F0F0H          ; 屏蔽DX低四位，保留各字节高四位（DX=A0C0H）

          mov    CL, 4               ; 设置移位次数为4
          shr    DX, CL              ; 将DX右移4位，分离高四位（DX=0A0CH）
          lea    BX, [BUF2]          ; 将BUF2的地址加载到BX

          mov    [BX], AL            ; 存储AL（0DH，原低字节低四位）到BUF2[0]
          mov    1[BX], DL           ; 存储DL（0CH，原低字节高四位）到BUF2[1]
          mov    2[BX], AH           ; 存储AH（0BH，原高字节低四位）到BUF2[2]
          mov    3[BX], DH           ; 存储DH（0AH，原高字节高四位）到BUF2[3]

          mov    AH, 4CH             ; 设置DOS功能号4CH（程序终止）
          int    21H                 ; 调用DOS中断，退出程序
CODE ENDS
    END START