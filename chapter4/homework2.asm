DATA SEGMENT
    ARRAY  DB 1,2,3,4,5,6,7,8,9,10
    RESULT DB ?
DATA ENDS

CODE SEGMENT
            ASSUME CS:CODE, DS:DATA
    START:  
            mov    AX, DATA
            mov    DS, AX

            mov    SI,0                ;将0赋给SI,作为索引指针
            mov    CX,10                ;将10赋给CX，作为循环次数

    LOOPRESULT:
            mov    AL,ARRAY[SI]
            test   AL,1                ;直接使用test判断是否奇偶即可，偶数（ZF=1）,奇数（ZF=0）
            JNZ    ODD

    ; mov    AL,[RESULT]            ; 增加RESULT的值，或许可以使用INC RESULT？
    ; ADD    AL,1
    ; mov    [RESULT],AL
            INC    RESULT                 ; 增加RESULT的值
            

    ODD:    
            INC    SI                  ; 奇数直接跳过，增加索引指针
            LOOP   LOOPRESULT             ; 继续循环，直到CX为0

            mov    DL,RESULT              ;将RESULT的值赋给DL，然后输出
            add    DL,48               ;将DL的值加上48，转换为ASCII码
            mov    AH,02H              ;输出字符
            int    21H                 ;调用21H中断



            mov    AH, 4CH
            int    21H
CODE ENDS
END START