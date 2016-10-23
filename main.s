	.file	"main.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"usage: soundbooze [-p playback device] [-c capture device] [-r output.pcm]\n"
	.text
	.globl	usage
	.type	usage, @function
usage:
.LFB11:
	pushq	%rbp
.LCFI0:
	movq	%rsp, %rbp
.LCFI1:
	subq	$16, %rsp
.LCFI2:
	movq	__sF@GOTPCREL(%rip), %rax
	leaq	304(%rax), %rcx
	movl	$75, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.LFE11:
	.size	usage, .-usage
	.globl	main_signal_handler
	.type	main_signal_handler, @function
main_signal_handler:
.LFB12:
	pushq	%rbp
.LCFI3:
	movq	%rsp, %rbp
.LCFI4:
	subq	$32, %rsp
.LCFI5:
	movl	%edi, -20(%rbp)
	call	sio_close_all@PLT
	leaq	pth(%rip), %rdi
	call	pthread_exit@PLT
.LFE12:
	.size	main_signal_handler, .-main_signal_handler
	.section	.rodata
.LC1:
	.string	"snd/0"
.LC2:
	.string	"rsnd/1"
.LC3:
	.string	"p:c:r:h"
	.text
	.globl	main
	.type	main, @function
main:
.LFB13:
	pushq	%rbp
.LCFI6:
	movq	%rsp, %rbp
.LCFI7:
	subq	$80, %rsp
.LCFI8:
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -24(%rbp)
	leaq	.LC2(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	$0, -40(%rbp)
	jmp	.L6
.L7:
	movl	-12(%rbp), %eax
	movl	%eax, -68(%rbp)
	cmpl	$112, -68(%rbp)
	je	.L10
	cmpl	$114, -68(%rbp)
	je	.L11
	cmpl	$99, -68(%rbp)
	je	.L9
	jmp	.L8
.L10:
	movq	optarg@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L6
.L9:
	movq	optarg@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	.L6
.L11:
	movq	optarg@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.L6
.L8:
	call	usage
.L6:
	movq	-64(%rbp), %rsi
	movl	-52(%rbp), %edi
	leaq	.LC3(%rip), %rdx
	call	getopt@PLT
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	jne	.L7
	movq	optind@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	subl	%eax, -52(%rbp)
	movq	optind@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	addq	%rax, -64(%rbp)
	leaq	main_signal_handler(%rip), %rsi
	movl	$2, %edi
	call	signal@PLT
	leaq	main_signal_handler(%rip), %rsi
	movl	$15, %edi
	call	signal@PLT
	leaq	main_signal_handler(%rip), %rsi
	movl	$3, %edi
	call	signal@PLT
	leaq	main_signal_handler(%rip), %rsi
	movl	$9, %edi
	call	signal@PLT
	leaq	main_signal_handler(%rip), %rsi
	movl	$11, %edi
	call	signal@PLT
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %r9
	movq	%rdx, %r8
	movl	$44100, %ecx
	movl	$2, %edx
	movl	$16, %esi
	movl	$1, %edi
	call	sio_init@PLT
	movq	-40(%rbp), %rcx
	movq	sio_main@GOTPCREL(%rip), %rdx
	movl	$0, %esi
	leaq	pth(%rip), %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	je	.L13
	movl	$23, %edi
	call	main_signal_handler
.L13:
	movq	pth(%rip), %rdi
	movl	$0, %esi
	call	pthread_join@PLT
	movl	$0, %eax
	leave
	ret
.LFE13:
	.size	main, .-main
	.local	pth
	.comm	pth,8,8
	.section	.eh_frame,"a",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1
.LSCIE1:
	.long	0x0
	.byte	0x1
	.string	"zR"
	.uleb128 0x1
	.sleb128 -8
	.byte	0x10
	.uleb128 0x1
	.byte	0x1b
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.byte	0x90
	.uleb128 0x1
	.align 8
.LECIE1:
.LSFDE1:
	.long	.LEFDE1-.LASFDE1
.LASFDE1:
	.long	.LASFDE1-.Lframe1
	.long	.LFB11-.
	.long	.LFE11-.LFB11
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI0-.LFB11
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE1:
.LSFDE3:
	.long	.LEFDE3-.LASFDE3
.LASFDE3:
	.long	.LASFDE3-.Lframe1
	.long	.LFB12-.
	.long	.LFE12-.LFB12
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI3-.LFB12
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE3:
.LSFDE5:
	.long	.LEFDE5-.LASFDE5
.LASFDE5:
	.long	.LASFDE5-.Lframe1
	.long	.LFB13-.
	.long	.LFE13-.LFB13
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI6-.LFB13
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE5:
