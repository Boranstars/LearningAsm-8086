	.file	"test.c"
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
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	movb	$0, -1(%rbp)
	jmp	.L2
.L4:
	movsbl	-1(%rbp), %eax
	cltq
	leaq	dat(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	andl	$1, %eax
	testb	%al, %al
	jne	.L3
	movzbl	num(%rip), %eax
	addl	$1, %eax
	movb	%al, num(%rip)
.L3:
	movzbl	-1(%rbp), %eax
	addl	$1, %eax
	movb	%al, -1(%rbp)
.L2:
	cmpb	$8, -1(%rbp)
	jle	.L4
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-win32-seh-rev0, Built by MinGW-W64 project) 8.1.0"
