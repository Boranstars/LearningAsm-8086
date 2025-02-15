	.file	"test.c"
	.intel_syntax noprefix
	.text
	.globl	dat
	.data
	.align 8
dat:
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.globl	num
	.bss
num:
	.space 1
	.def	__main;	.scl	2;	.type	32;	.endef
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	mov	BYTE PTR -1[rbp], 0
	jmp	.L2
.L4:
	movsx	eax, BYTE PTR -1[rbp]
	cdqe
	lea	rdx, dat[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	and	eax, 1
	test	al, al
	jne	.L3
	movzx	eax, BYTE PTR num[rip]
	add	eax, 1
	mov	BYTE PTR num[rip], al
.L3:
	movzx	eax, BYTE PTR -1[rbp]
	add	eax, 1
	mov	BYTE PTR -1[rbp], al
.L2:
	cmp	BYTE PTR -1[rbp], 8
	jle	.L4
	mov	eax, 0
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-win32-seh-rev0, Built by MinGW-W64 project) 8.1.0"
