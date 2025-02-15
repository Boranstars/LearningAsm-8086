
.\test.o:     file format pe-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 30          	sub    rsp,0x30
   8:	e8 00 00 00 00       	call   d <main+0xd>
   d:	c6 45 ff 01          	mov    BYTE PTR [rbp-0x1],0x1
  11:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  15:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
  19:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  1d:	83 e0 01             	and    eax,0x1
  20:	84 c0                	test   al,al
  22:	75 09                	jne    2d <main+0x2d>
  24:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  28:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  2b:	eb 07                	jmp    34 <main+0x34>
  2d:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  31:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
  34:	b8 00 00 00 00       	mov    eax,0x0
  39:	48 83 c4 30          	add    rsp,0x30
  3d:	5d                   	pop    rbp
  3e:	c3                   	ret    
  3f:	90                   	nop
