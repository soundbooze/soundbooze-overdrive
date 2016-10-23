	.file	"sio.c"
	.section	.rodata
.LC0:
	.string	"close(): failed\n"
.LC1:
	.string	"sio_stop(): failed\n"
	.text
	.globl	sio_close_all
	.type	sio_close_all, @function
sio_close_all:
.LFB5:
	pushq	%rbp
.LCFI0:
	movq	%rsp, %rbp
.LCFI1:
	subq	$16, %rsp
.LCFI2:
	movq	fd@GOTPCREL(%rip), %rax
	movl	(%rax), %edi
	call	close@PLT
	cmpl	$-1, %eax
	jne	.L2
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L2:
	movq	hdl_capture@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	call	sio_stop@PLT
	testl	%eax, %eax
	jne	.L4
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L4:
	movq	hdl_play@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	call	sio_stop@PLT
	testl	%eax, %eax
	jne	.L6
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L6:
	movq	hdl_capture@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	call	sio_close@PLT
	movq	hdl_play@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	call	sio_close@PLT
	leave
	ret
.LFE5:
	.size	sio_close_all, .-sio_close_all
	.section	.rodata
.LC2:
	.string	"sio_open(): failed\n"
.LC3:
	.string	"sio_setpar(): failed\n"
.LC4:
	.string	"sio_getpar(): failed\n"
.LC5:
	.string	"sio_start(): failed\n"
	.text
	.globl	sio_init
	.type	sio_init, @function
sio_init:
.LFB6:
	pushq	%rbp
.LCFI3:
	movq	%rsp, %rbp
.LCFI4:
	subq	$48, %rsp
.LCFI5:
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	par_play@GOTPCREL(%rip), %rdi
	call	sio_initpar@PLT
	movq	par_play@GOTPCREL(%rip), %rdx
	movl	-20(%rbp), %eax
	movl	%eax, 8(%rdx)
	movq	par_play@GOTPCREL(%rip), %rax
	movl	$1, 12(%rax)
	movq	par_play@GOTPCREL(%rip), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, (%rdx)
	movq	par_play@GOTPCREL(%rip), %rdx
	movl	-28(%rbp), %eax
	movl	%eax, 24(%rdx)
	movq	par_play@GOTPCREL(%rip), %rdx
	movl	-32(%rbp), %eax
	movl	%eax, 28(%rdx)
	movq	par_play@GOTPCREL(%rip), %rax
	movl	$0, 36(%rax)
	movq	par_capture@GOTPCREL(%rip), %rdi
	call	sio_initpar@PLT
	movq	par_capture@GOTPCREL(%rip), %rdx
	movl	-20(%rbp), %eax
	movl	%eax, 8(%rdx)
	movq	par_capture@GOTPCREL(%rip), %rax
	movl	$1, 12(%rax)
	movq	par_capture@GOTPCREL(%rip), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, (%rdx)
	movq	par_capture@GOTPCREL(%rip), %rdx
	movl	-28(%rbp), %eax
	movl	%eax, 20(%rdx)
	movq	par_capture@GOTPCREL(%rip), %rdx
	movl	-32(%rbp), %eax
	movl	%eax, 28(%rdx)
	movq	par_capture@GOTPCREL(%rip), %rax
	movl	$0, 36(%rax)
	movq	-40(%rbp), %rdi
	movl	$0, %edx
	movl	$1, %esi
	call	sio_open@PLT
	movq	%rax, %rdx
	movq	hdl_play@GOTPCREL(%rip), %rax
	movq	%rdx, (%rax)
	movq	hdl_play@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L10
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L10:
	movq	-48(%rbp), %rdi
	movl	$0, %edx
	movl	$2, %esi
	call	sio_open@PLT
	movq	%rax, %rdx
	movq	hdl_capture@GOTPCREL(%rip), %rax
	movq	%rdx, (%rax)
	movq	hdl_capture@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L12
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L12:
	movq	hdl_play@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	par_play@GOTPCREL(%rip), %rsi
	call	sio_setpar@PLT
	testl	%eax, %eax
	jne	.L14
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L14:
	movq	hdl_capture@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	par_capture@GOTPCREL(%rip), %rsi
	call	sio_setpar@PLT
	testl	%eax, %eax
	jne	.L16
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L16:
	movq	hdl_play@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	par_play@GOTPCREL(%rip), %rsi
	call	sio_getpar@PLT
	testl	%eax, %eax
	jne	.L18
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L18:
	movq	hdl_capture@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	par_capture@GOTPCREL(%rip), %rsi
	call	sio_getpar@PLT
	testl	%eax, %eax
	jne	.L20
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L20:
	movq	hdl_play@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	call	sio_start@PLT
	testl	%eax, %eax
	jne	.L22
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L22:
	movq	hdl_capture@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	call	sio_start@PLT
	testl	%eax, %eax
	jne	.L26
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L26:
	leave
	ret
.LFE6:
	.size	sio_init, .-sio_init
	.section	.rodata
.LC6:
	.string	"poll(): failed\n"
.LC7:
	.string	"poll(): device disappeared\n"
	.align 16
	.type	.LSSH0, @object
	.size	.LSSH0, 16
.LSSH0:
	.string	"_sio_poll_wait_"
	.text
	.globl	_sio_poll_wait_
	.type	_sio_poll_wait_, @function
_sio_poll_wait_:
.LFB7:
	pushq	%rbp
.LCFI6:
	movq	%rsp, %rbp
.LCFI7:
	subq	$48, %rsp
.LCFI8:
	movq	%rdi, -40(%rbp)
	movq	__guard_local(%rip), %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L28:
	leaq	-24(%rbp), %rsi
	movq	-40(%rbp), %rdi
	movl	$4, %edx
	call	sio_pollfd@PLT
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jle	.L29
	movl	-12(%rbp), %esi
	leaq	-24(%rbp), %rdi
	movl	$-1, %edx
	call	poll@PLT
	testl	%eax, %eax
	jns	.L29
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L29:
	leaq	-24(%rbp), %rsi
	movq	-40(%rbp), %rdi
	call	sio_revents@PLT
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	andl	$16, %eax
	testl	%eax, %eax
	je	.L32
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L32:
	movl	-16(%rbp), %eax
	andl	$4, %eax
	testl	%eax, %eax
	je	.L28
	movq	-8(%rbp), %rax
	xorq	__guard_local(%rip), %rax
	je	.L36
	leaq	.LSSH0(%rip), %rdi
	call	__stack_smash_handler@PLT
.L36:
	leave
	ret
.LFE7:
	.size	_sio_poll_wait_, .-_sio_poll_wait_
	.section	.rodata
.LC8:
	.string	"open(): failed\n"
.LC9:
	.string	"mprotect(): failed\n"
.LC10:
	.string	"sio_read(): failed\n"
.LC11:
	.string	"sio_write(): failed\n"
.LC12:
	.string	"write(): failed\n"
	.type	.LSSH1, @object
	.size	.LSSH1, 9
.LSSH1:
	.string	"sio_main"
	.text
	.globl	sio_main
	.type	sio_main, @function
sio_main:
.LFB8:
	pushq	%rbp
.LCFI9:
	movq	%rsp, %rbp
.LCFI10:
	subq	$80, %rsp
.LCFI11:
	movq	%rdi, -56(%rbp)
	movq	__guard_local(%rip), %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	par_capture@GOTPCREL(%rip), %rax
	movl	4(%rax), %edx
	movq	par_capture@GOTPCREL(%rip), %rax
	movl	20(%rax), %eax
	imull	%eax, %edx
	movq	par_capture@GOTPCREL(%rip), %rax
	movl	40(%rax), %eax
	imull	%edx, %eax
	mov	%eax, %eax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	addq	%rax, %rax
	addq	$15, %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	subq	%rax, %rsp
	movq	%rsp, -72(%rbp)
	movq	-72(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	salq	$3, %rax
	addq	$15, %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	subq	%rax, %rsp
	movq	%rsp, -64(%rbp)
	movq	-64(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -48(%rbp)
	cmpq	$0, -56(%rbp)
	je	.L38
	movq	-56(%rbp), %rdi
	movl	$420, %edx
	movl	$1665, %esi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, %edx
	movq	fd@GOTPCREL(%rip), %rax
	movl	%edx, (%rax)
	movq	fd@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	jne	.L38
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L38:
	movq	-40(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movl	$3, %edx
	call	mprotect@PLT
	testl	%eax, %eax
	jns	.L41
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L41:
	movq	-48(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movl	$3, %edx
	call	mprotect@PLT
	testl	%eax, %eax
	jns	.L43
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L43:
	movq	-40(%rbp), %rsi
	movq	hdl_capture@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-32(%rbp), %rdx
	call	sio_read@PLT
	movq	%rax, -16(%rbp)
	movq	hdl_capture@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	call	sio_eof@PLT
	testl	%eax, %eax
	je	.L45
	leaq	.LC10(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L45:
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rdi
	movq	-16(%rbp), %rdx
	call	pcm_to_double@PLT
	movq	-48(%rbp), %rdi
	movq	-16(%rbp), %rsi
	call	effect_process@PLT
	movq	-40(%rbp), %rsi
	movq	-48(%rbp), %rdi
	movq	-16(%rbp), %rdx
	call	double_to_pcm@PLT
	movq	hdl_play@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	call	_sio_poll_wait_
	movq	-40(%rbp), %rsi
	movq	hdl_play@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-16(%rbp), %rdx
	call	sio_write@PLT
	movq	%rax, -24(%rbp)
	movq	hdl_play@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	call	sio_eof@PLT
	testl	%eax, %eax
	je	.L47
	leaq	.LC11(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.L47:
	cmpq	$0, -56(%rbp)
	je	.L38
	movq	-40(%rbp), %rsi
	movq	fd@GOTPCREL(%rip), %rax
	movl	(%rax), %edi
	movq	-16(%rbp), %rdx
	call	write@PLT
	cmpq	$-1, %rax
	jne	.L38
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	errx@PLT
.LFE8:
	.size	sio_main, .-sio_main
	.comm	hdl_play,8,8
	.comm	hdl_capture,8,8
	.comm	par_play,64,32
	.comm	par_capture,64,32
	.comm	fd,4,4
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
	.long	.LFB5-.
	.long	.LFE5-.LFB5
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI0-.LFB5
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
	.long	.LFB6-.
	.long	.LFE6-.LFB6
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI3-.LFB6
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
	.long	.LFB7-.
	.long	.LFE7-.LFB7
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI6-.LFB7
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
.LSFDE7:
	.long	.LEFDE7-.LASFDE7
.LASFDE7:
	.long	.LASFDE7-.Lframe1
	.long	.LFB8-.
	.long	.LFE8-.LFB8
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI9-.LFB8
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE7:
