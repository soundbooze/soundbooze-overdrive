	.file	"effect.c"
	.text
	.globl	_effect_warmtube
	.type	_effect_warmtube, @function
_effect_warmtube:
.LFB6:
	pushq	%rbp
.LCFI0:
	movq	%rsp, %rbp
.LCFI1:
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L2
.L3:
	movq	-16(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdx
	addq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	salq	$3, %rax
	addq	-24(%rbp), %rax
	movsd	(%rax), %xmm2
	movq	-16(%rbp), %rax
	salq	$3, %rax
	addq	-24(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	.LC0(%rip), %xmm0
	andpd	%xmm0, %xmm1
	movsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx)
	addq	$1, -16(%rbp)
.L2:
	movq	-16(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L3
	leave
	ret
.LFE6:
	.size	_effect_warmtube, .-_effect_warmtube
	.globl	_effect_overdrive
	.type	_effect_overdrive, @function
_effect_overdrive:
.LFB7:
	pushq	%rbp
.LCFI2:
	movq	%rsp, %rbp
.LCFI3:
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L7
.L8:
	movq	-16(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdx
	addq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	salq	$3, %rax
	addq	-24(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	.LC2(%rip), %xmm0
	movapd	%xmm1, %xmm2
	mulsd	%xmm0, %xmm2
	movq	-16(%rbp), %rax
	salq	$3, %rax
	addq	-24(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	.LC3(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	salq	$3, %rax
	addq	-24(%rbp), %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	salq	$3, %rax
	addq	-24(%rbp), %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, (%rdx)
	addq	$1, -16(%rbp)
.L7:
	movq	-16(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L8
	leave
	ret
.LFE7:
	.size	_effect_overdrive, .-_effect_overdrive
	.globl	_effect_distortion
	.type	_effect_distortion, @function
_effect_distortion:
.LFB8:
	pushq	%rbp
.LCFI4:
	movq	%rsp, %rbp
.LCFI5:
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movw	$210, -10(%rbp)
	movq	$0, -24(%rbp)
	jmp	.L12
.L13:
	movq	-24(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdx
	addq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movsd	(%rax), %xmm1
	movswl	-10(%rbp),%eax
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx)
	addq	$1, -24(%rbp)
.L12:
	movq	-24(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jb	.L13
	leave
	ret
.LFE8:
	.size	_effect_distortion, .-_effect_distortion
	.globl	effect_process
	.type	effect_process, @function
effect_process:
.LFB9:
	pushq	%rbp
.LCFI6:
	movq	%rsp, %rbp
.LCFI7:
	subq	$32, %rsp
.LCFI8:
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rdi
	call	_effect_overdrive
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rdi
	call	_effect_warmtube
	leave
	ret
.LFE9:
	.size	effect_process, .-effect_process
	.section	.rodata
	.align 16
.LC0:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	3435973837
	.long	1078873292
	.align 8
.LC3:
	.long	858993459
	.long	-1075629261
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
	.long	.LCFI6-.LFB9
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE7:
