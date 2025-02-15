	.file	"test.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
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
	movb	$1, -1(%rbp)
	movb	$0, -2(%rbp)
	movb	$0, -3(%rbp)
	movzbl	-1(%rbp), %eax
	andl	$1, %eax
	testb	%al, %al
	jne	.L2
	movzbl	-1(%rbp), %eax
	movb	%al, -2(%rbp)
	jmp	.L3
.L2:
	movzbl	-1(%rbp), %eax
	movb	%al, -3(%rbp)
.L3:
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-win32-seh-rev0, Built by MinGW-W64 project) 8.1.0"
