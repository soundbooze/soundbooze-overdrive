	.file	"feature.c"
	.text
	.globl	_find_maximum
	.type	_find_maximum, @function
_find_maximum:
.LFB6:
	pushq	%rbp
.LCFI0:
	movq	%rsp, %rbp
.LCFI1:
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$0, %eax
	movq	%rax, -16(%rbp)
	movq	$0, -24(%rbp)
	jmp	.L2
.L3:
	movq	-24(%rbp), %rax
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	.LC1(%rip), %xmm0
	andpd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	ucomisd	-16(%rbp), %xmm0
	ja	.L6
	jmp	.L4
.L6:
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
.L4:
	addq	$1, -24(%rbp)
.L2:
	movq	-24(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jb	.L3
	movq	-16(%rbp), %rax
	movq	%rax, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	leave
	ret
.LFE6:
	.size	_find_maximum, .-_find_maximum
	.globl	get_energy
	.type	get_energy, @function
get_energy:
.LFB7:
	pushq	%rbp
.LCFI2:
	movq	%rsp, %rbp
.LCFI3:
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$0, %eax
	movq	%rax, -16(%rbp)
	movq	$0, -24(%rbp)
	jmp	.L10
.L11:
	movq	-24(%rbp), %rax
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm0, %xmm0
	movapd	%xmm0, %xmm1
	movsd	-16(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	addq	$1, -24(%rbp)
.L10:
	movq	-24(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jb	.L11
	movq	-16(%rbp), %rax
	movq	%rax, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	leave
	ret
.LFE7:
	.size	get_energy, .-get_energy
	.globl	get_rms
	.type	get_rms, @function
get_rms:
.LFB8:
	pushq	%rbp
.LCFI4:
	movq	%rsp, %rbp
.LCFI5:
	subq	$80, %rsp
.LCFI6:
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$0, %eax
	movq	%rax, -16(%rbp)
	movq	$0, -24(%rbp)
	jmp	.L15
.L16:
	movq	-24(%rbp), %rax
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm0, %xmm0
	movapd	%xmm0, %xmm1
	movsd	-16(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	addq	$1, -24(%rbp)
.L15:
	movq	-24(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jb	.L16
	movq	-48(%rbp), %rax
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	js	.L18
	cvtsi2sdq	-64(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	jmp	.L19
.L18:
	movq	-64(%rbp), %rax
	shrq	%rax
	movq	-64(%rbp), %rdx
	andl	$1, %edx
	orq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movapd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, -56(%rbp)
.L19:
	movsd	-16(%rbp), %xmm0
	divsd	-56(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	sqrtsd	-16(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	movsd	-72(%rbp), %xmm1
	ucomisd	-72(%rbp), %xmm1
	jp	.L22
	je	.L20
.L22:
	movsd	-16(%rbp), %xmm0
	call	sqrt@PLT
	movsd	%xmm0, -72(%rbp)
.L20:
	movq	-72(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -80(%rbp)
	movsd	-80(%rbp), %xmm0
	leave
	ret
.LFE8:
	.size	get_rms, .-get_rms
	.globl	get_decibel
	.type	get_decibel, @function
get_decibel:
.LFB9:
	pushq	%rbp
.LCFI7:
	movq	%rsp, %rbp
.LCFI8:
	subq	$32, %rsp
.LCFI9:
	movsd	%xmm0, -24(%rbp)
	movq	%rdi, -32(%rbp)
	cvtsd2ss	-24(%rbp), %xmm0
	call	logf@PLT
	cvtss2sd	%xmm0, %xmm1
	movsd	.LC2(%rip), %xmm0
	divsd	%xmm0, %xmm1
	movsd	.LC3(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	leave
	ret
.LFE9:
	.size	get_decibel, .-get_decibel
	.section	.rodata
	.align 16
.LC1:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC2:
	.long	3149223087
	.long	1073900465
	.align 8
.LC3:
	.long	0
	.long	1077149696
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
	.long	.LFB6-.
	.long	.LFE6-.LFB6
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI0-.LFB6
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
	.long	.LFB7-.
	.long	.LFE7-.LFB7
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI2-.LFB7
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE3:
.LSFDE5:
	.long	.LEFDE5-.LASFDE5
.LASFDE5:
	.long	.LASFDE5-.Lframe1
	.long	.LFB8-.
	.long	.LFE8-.LFB8
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI4-.LFB8
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE5:
.LSFDE7:
	.long	.LEFDE7-.LASFDE7
.LASFDE7:
	.long	.LASFDE7-.Lframe1
	.long	.LFB9-.
	.long	.LFE9-.LFB9
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI7-.LFB9
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE7:
