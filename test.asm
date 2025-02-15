; simple.asm - 一个简单的DOS程序，打印 "Hello, World!" 并退出

.MODEL SMALL       ; 使用小内存模型
.STACK 100H        ; 设置堆栈大小
.DATA              ; 数据段
    msg DB 'Hello, World!$' ; 带结束符的字符串

.CODE              ; 代码段
MAIN PROC
    MOV AX, @DATA   ; 加载数据段地址到AX
    MOV DS, AX      ; 设置数据段寄存器DS

    LEA DX, msg     ; 加载字符串地址到DX
    MOV AH, 9       ; DOS功能号：输出字符串
    INT 21H         ; 调用DOS中断

    MOV AH, 4CH     ; DOS功能号：退出程序
    INT 21H         ; 调用DOS中断
MAIN ENDP
END MAIN            ; 程序入口
