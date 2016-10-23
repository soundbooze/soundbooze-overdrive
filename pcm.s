	.file	"pcm.c"
	.text
	.globl	pcm_to_double
	.type	pcm_to_double, @function
pcm_to_double:
.LFB6:
	pushq	%rbp
.LCFI0:
	movq	%rsp, %rbp
.LCFI1:
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L2
.L3:
	movq	-16(%rbp), %rax
	addq	%rax, %rax
	addq	-40(%rbp), %rax
	movzwl	(%rax), %eax
	cwtl
	cvtsi2sd	%eax, %xmm1
	movsd	.LC0(%rip), %xmm0
	movapd	%xmm1, %xmm2
	divsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	.LC1(%rip), %xmm1
	movsd	-24(%rbp), %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L6
	jmp	.L4
.L6:
	movabsq	$4607182418800017408, %rax
	movq	%rax, -24(%rbp)
.L4:
	movsd	-24(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L9
	jmp	.L7
.L9:
	movabsq	$-4616189618054758400, %rax
	movq	%rax, -24(%rbp)
.L7:
	movq	-16(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdx
	addq	-48(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, (%rdx)
	addq	$1, -16(%rbp)
.L2:
	movq	-16(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jb	.L3
	leave
	ret
.LFE6:
	.size	pcm_to_double, .-pcm_to_double
	.globl	double_to_pcm
	.type	double_to_pcm, @function
double_to_pcm:
.LFB7:
	pushq	%rbp
.LCFI2:
	movq	%rsp, %rbp
.LCFI3:
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L13
.L14:
	movq	-16(%rbp), %rax
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movsd	(%rax), %xmm1
	movsd	.LC0(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	ucomisd	.LC0(%rip), %xmm0
	ja	.L17
	jmp	.L15
.L17:
	movabsq	$4674736413210574848, %rax
	movq	%rax, -24(%rbp)
.L15:
	movsd	-24(%rbp), %xmm1
	movsd	.LC3(%rip), %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L20
	jmp	.L18
.L20:
	movabsq	$-4548635623644200960, %rax
	movq	%rax, -24(%rbp)
.L18:
	movq	-16(%rbp), %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	addq	-48(%rbp), %rdx
	movsd	-24(%rbp), %xmm0
	cvttsd2si	%xmm0, %eax
	movw	%ax, (%rdx)
	addq	$1, -16(%rbp)
.L13:
	movq	-16(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jb	.L14
	leave
	ret
.LFE7:
	.size	double_to_pcm, .-double_to_pcm
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1088421888
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	-1074790400
	.align 8
.LC3:
	.long	0
	.long	-1059061760
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
