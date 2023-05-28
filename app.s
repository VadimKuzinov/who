	.file	"app.c"
	.text
	.p2align 4
	.type	stbi__refill_buffer, @function
stbi__refill_buffer:
.LFB598:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	56(%rdi), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movq	%rbp, %rsi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L2
	movl	$0, 48(%rbx)
	leaq	57(%rbx), %rax
	movb	$0, 56(%rbx)
.L3:
	movq	%rax, 200(%rbx)
	movq	%rbp, 192(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	cltq
	addq	%rbp, %rax
	jmp	.L3
	.cfi_endproc
.LFE598:
	.size	stbi__refill_buffer, .-stbi__refill_buffer
	.p2align 4
	.type	resample_row_1, @function
resample_row_1:
.LFB638:
	.cfi_startproc
	movq	%rsi, %rax
	ret
	.cfi_endproc
.LFE638:
	.size	resample_row_1, .-resample_row_1
	.p2align 4
	.type	stbi__resample_row_v_2, @function
stbi__resample_row_v_2:
.LFB639:
	.cfi_startproc
	movq	%rdx, %r8
	movl	%ecx, %eax
	testl	%ecx, %ecx
	jle	.L8
	leal	-1(%rcx), %edx
	movl	%ecx, %r9d
	cmpl	$6, %edx
	jbe	.L9
	leaq	1(%rsi), %r10
	movq	%rdi, %rcx
	subq	%r10, %rcx
	cmpq	$14, %rcx
	jbe	.L9
	leaq	1(%r8), %r10
	movq	%rdi, %rcx
	subq	%r10, %rcx
	cmpq	$14, %rcx
	jbe	.L9
	cmpl	$14, %edx
	jbe	.L17
	movl	%eax, %ecx
	movdqa	.LC1(%rip), %xmm5
	xorl	%edx, %edx
	pxor	%xmm2, %xmm2
	shrl	$4, %ecx
	movdqa	.LC2(%rip), %xmm4
	movdqa	.LC5(%rip), %xmm3
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L11:
	movdqu	(%rsi,%rdx), %xmm0
	movdqu	(%r8,%rdx), %xmm6
	movdqa	%xmm0, %xmm1
	punpckhbw	%xmm2, %xmm0
	movdqa	%xmm6, %xmm7
	punpcklbw	%xmm2, %xmm1
	pmullw	%xmm3, %xmm0
	punpcklbw	%xmm2, %xmm7
	pmullw	%xmm3, %xmm1
	punpckhbw	%xmm2, %xmm6
	paddw	%xmm6, %xmm0
	paddw	%xmm7, %xmm1
	paddw	%xmm5, %xmm0
	paddw	%xmm5, %xmm1
	psrlw	$2, %xmm0
	psrlw	$2, %xmm1
	pand	%xmm4, %xmm0
	pand	%xmm4, %xmm1
	packuswb	%xmm0, %xmm1
	movups	%xmm1, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %rcx
	jne	.L11
	movl	%eax, %edx
	andl	$-16, %edx
	movl	%edx, %ecx
	cmpl	%edx, %eax
	je	.L8
	movl	%eax, %r9d
	subl	%edx, %r9d
	leal	-1(%r9), %r10d
	cmpl	$6, %r10d
	jbe	.L13
.L10:
	movq	(%rsi,%rcx), %xmm2
	pxor	%xmm3, %xmm3
	movq	(%r8,%rcx), %xmm4
	movq	.LC3(%rip), %xmm1
	movdqa	%xmm2, %xmm6
	punpcklbw	%xmm3, %xmm2
	movdqa	%xmm4, %xmm0
	punpcklbw	%xmm3, %xmm6
	pshufd	$78, %xmm2, %xmm2
	punpcklbw	%xmm3, %xmm0
	punpcklbw	%xmm3, %xmm4
	movdqa	%xmm6, %xmm5
	movdqa	%xmm2, %xmm3
	psllw	$1, %xmm5
	pshufd	$78, %xmm4, %xmm4
	paddw	%xmm1, %xmm0
	psllw	$1, %xmm3
	paddw	%xmm6, %xmm5
	paddw	%xmm4, %xmm1
	paddw	%xmm3, %xmm2
	paddw	%xmm5, %xmm0
	paddw	%xmm2, %xmm1
	movq	.LC4(%rip), %xmm2
	psrlw	$2, %xmm0
	psrlw	$2, %xmm1
	pand	%xmm2, %xmm0
	pand	%xmm1, %xmm2
	packuswb	%xmm2, %xmm0
	pshufd	$8, %xmm0, %xmm0
	movq	%xmm0, (%rdi,%rcx)
	movl	%r9d, %ecx
	andl	$-8, %ecx
	addl	%ecx, %edx
	andl	$7, %r9d
	je	.L8
.L13:
	movslq	%edx, %rcx
	movzbl	(%rsi,%rcx), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%r8,%rcx), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%rdi,%rcx)
	leal	1(%rdx), %ecx
	cmpl	%ecx, %eax
	jle	.L8
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rcx), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%r8,%rcx), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%rdi,%rcx)
	leal	2(%rdx), %ecx
	cmpl	%ecx, %eax
	jle	.L8
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rcx), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%r8,%rcx), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%rdi,%rcx)
	leal	3(%rdx), %ecx
	cmpl	%ecx, %eax
	jle	.L8
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rcx), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%r8,%rcx), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%rdi,%rcx)
	leal	4(%rdx), %ecx
	cmpl	%ecx, %eax
	jle	.L8
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rcx), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%r8,%rcx), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%rdi,%rcx)
	leal	5(%rdx), %ecx
	cmpl	%ecx, %eax
	jle	.L8
	movslq	%ecx, %rcx
	addl	$6, %edx
	movzbl	(%rsi,%rcx), %r9d
	leal	(%r9,%r9,2), %r10d
	movzbl	(%r8,%rcx), %r9d
	leal	2(%r10,%r9), %r9d
	sarl	$2, %r9d
	movb	%r9b, (%rdi,%rcx)
	cmpl	%edx, %eax
	jle	.L8
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %eax
	leal	(%rax,%rax,2), %ecx
	movzbl	(%r8,%rdx), %eax
	leal	2(%rcx,%rax), %eax
	sarl	$2, %eax
	movb	%al, (%rdi,%rdx)
.L8:
	movq	%rdi, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	movslq	%eax, %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L15:
	movzbl	(%rsi,%rax), %edx
	leal	(%rdx,%rdx,2), %r9d
	movzbl	(%r8,%rax), %edx
	leal	2(%r9,%rdx), %edx
	sarl	$2, %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rax, %rcx
	jne	.L15
	movq	%rdi, %rax
	ret
.L17:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	jmp	.L10
	.cfi_endproc
.LFE639:
	.size	stbi__resample_row_v_2, .-stbi__resample_row_v_2
	.p2align 4
	.type	stbi__resample_row_generic, @function
stbi__resample_row_generic:
.LFB643:
	.cfi_startproc
	movq	%rdi, %r9
	testl	%ecx, %ecx
	jle	.L53
	testl	%r8d, %r8d
	jle	.L53
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%ecx, %rcx
	movl	%r8d, %edx
	movq	%rsi, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	(%rsi,%rcx), %r15
	movl	%r8d, %ecx
	shrl	$4, %edx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	andl	$15, %ecx
	movl	%r8d, %esi
	salq	$4, %rdx
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	andl	$-16, %esi
	leal	-1(%r8), %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%r8d, %rbx
	leaq	(%rdi,%rbx), %r14
	movl	%ecx, -16(%rsp)
	subl	$1, %ecx
	movl	%ecx, -12(%rsp)
	movq	%rdx, -24(%rsp)
	movq	%r14, %rdx
	movl	%esi, -28(%rsp)
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L32:
	cmpl	$6, %r13d
	jbe	.L44
	movq	%rdx, %r11
	leaq	1(%rax), %r10
	subq	%r14, %r11
	cmpq	%r10, %rdi
	jnb	.L41
	leaq	(%rbx,%rdi), %rcx
	cmpq	%rcx, %rax
	jnb	.L41
	movq	%rdi, %rcx
	.p2align 4,,10
	.p2align 3
.L38:
	movzbl	(%rax), %r11d
	addq	$1, %rcx
	movb	%r11b, -1(%rcx)
	cmpq	%rdx, %rcx
	jne	.L38
.L39:
	addq	%rbx, %rdi
	addl	%r8d, %esi
	movq	%r10, %rax
	addq	%rbx, %rdx
	cmpq	%r15, %r10
	jne	.L32
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%r9, %rax
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L41:
	.cfi_restore_state
	cmpl	$14, %r13d
	jbe	.L42
	movzbl	(%rax), %ecx
	movd	%ecx, %xmm0
	movq	-24(%rsp), %rcx
	punpcklbw	%xmm0, %xmm0
	punpcklwd	%xmm0, %xmm0
	leaq	(%rcx,%rdi), %rbp
	movq	%rdi, %rcx
	pshufd	$0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L34:
	movups	%xmm0, (%rcx)
	addq	$16, %rcx
	cmpq	%rbp, %rcx
	jne	.L34
	movl	-28(%rsp), %ecx
	cmpl	%r8d, %ecx
	je	.L39
	cmpl	$6, -12(%rsp)
	movl	-16(%rsp), %r12d
	jbe	.L36
	movl	%ecx, -32(%rsp)
	movl	%ecx, %ebp
.L33:
	movzbl	(%rax), %ecx
	addq	%r9, %r11
	movb	%cl, %ch
	movd	%ecx, %xmm1
	movl	%r12d, %ecx
	pshuflw	$0, %xmm1, %xmm0
	andl	$-8, %ecx
	movq	%xmm0, (%r11,%rbp)
	movl	-32(%rsp), %r11d
	addl	%r11d, %ecx
	andl	$7, %r12d
	je	.L39
.L36:
	movzbl	(%rax), %ebp
	leal	(%rsi,%rcx), %r11d
	movslq	%r11d, %r11
	movb	%bpl, (%r9,%r11)
	leal	1(%rcx), %r11d
	cmpl	%r11d, %r8d
	jle	.L39
	addl	%esi, %r11d
	movslq	%r11d, %r11
	movb	%bpl, (%r9,%r11)
	leal	2(%rcx), %r11d
	cmpl	%r11d, %r8d
	jle	.L39
	movzbl	(%rax), %ebp
	addl	%esi, %r11d
	movslq	%r11d, %r11
	movb	%bpl, (%r9,%r11)
	leal	3(%rcx), %r11d
	cmpl	%r11d, %r8d
	jle	.L39
	addl	%esi, %r11d
	movslq	%r11d, %r11
	movb	%bpl, (%r9,%r11)
	leal	4(%rcx), %r11d
	cmpl	%r11d, %r8d
	jle	.L39
	movzbl	(%rax), %ebp
	addl	%esi, %r11d
	movslq	%r11d, %r11
	movb	%bpl, (%r9,%r11)
	leal	5(%rcx), %r11d
	cmpl	%r11d, %r8d
	jle	.L39
	addl	%esi, %r11d
	addl	$6, %ecx
	movslq	%r11d, %r11
	movb	%bpl, (%r9,%r11)
	cmpl	%ecx, %r8d
	jle	.L39
	movzbl	(%rax), %eax
	addl	%esi, %ecx
	movslq	%ecx, %rcx
	movb	%al, (%r9,%rcx)
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L44:
	movq	%rdi, %rcx
	leaq	1(%rax), %r10
	jmp	.L38
.L42:
	movl	$0, -32(%rsp)
	movl	%r8d, %r12d
	xorl	%ebp, %ebp
	jmp	.L33
.L53:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	movq	%r9, %rax
	ret
	.cfi_endproc
.LFE643:
	.size	stbi__resample_row_generic, .-stbi__resample_row_generic
	.p2align 4
	.type	stbi__out_gif_code, @function
stbi__out_gif_code:
.LFB724:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movzwl	%si, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movswl	2100(%rdi,%rbp,4), %esi
	testw	%si, %si
	js	.L57
	call	stbi__out_gif_code
.L57:
	movl	34912(%rbx), %edx
	cmpl	34904(%rbx), %edx
	jge	.L56
	addl	34908(%rbx), %edx
	movq	24(%rbx), %rsi
	leal	3(%rdx), %eax
	movq	8(%rbx), %rcx
	cmovns	%edx, %eax
	sarl	$2, %eax
	cltq
	movb	$1, (%rsi,%rax)
	movzbl	2103(%rbx,%rbp,4), %eax
	sall	$2, %eax
	cltq
	addq	34872(%rbx), %rax
	cmpb	$-128, 3(%rax)
	jbe	.L59
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	movzbl	2(%rax), %ecx
	movb	%cl, (%rdx)
	movzbl	1(%rax), %ecx
	movb	%cl, 1(%rdx)
	movzbl	(%rax), %ecx
	movb	%cl, 2(%rdx)
	movzbl	3(%rax), %eax
	movb	%al, 3(%rdx)
.L59:
	movl	34908(%rbx), %eax
	addl	$4, %eax
	movl	%eax, 34908(%rbx)
	cmpl	34900(%rbx), %eax
	jl	.L56
	movl	34884(%rbx), %eax
	movd	34892(%rbx), %xmm0
	addl	34912(%rbx), %eax
	movl	34904(%rbx), %edx
	movd	%eax, %xmm1
	punpckldq	%xmm1, %xmm0
	movq	%xmm0, 34908(%rbx)
	cmpl	%edx, %eax
	jl	.L56
	movl	34880(%rbx), %ecx
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L62:
	movl	34916(%rbx), %eax
	sall	%cl, %eax
	subl	$1, %ecx
	movl	%eax, 34884(%rbx)
	sarl	%eax
	addl	34896(%rbx), %eax
	movl	%eax, 34912(%rbx)
	movl	%ecx, 34880(%rbx)
	cmpl	%edx, %eax
	jl	.L56
.L61:
	testl	%ecx, %ecx
	jg	.L62
.L56:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE724:
	.size	stbi__out_gif_code, .-stbi__out_gif_code
	.p2align 4
	.type	stbiw__jpg_DCT, @function
stbiw__jpg_DCT:
.LFB801:
	.cfi_startproc
	movq	16(%rsp), %r10
	movss	(%rdi), %xmm1
	movq	%rdx, %rax
	movq	%rcx, %rdx
	movq	8(%rsp), %rcx
	movss	(%rsi), %xmm3
	movss	(%r10), %xmm4
	movss	(%r8), %xmm2
	movaps	%xmm1, %xmm5
	movss	(%r9), %xmm6
	movss	(%rcx), %xmm7
	movss	(%rax), %xmm8
	movss	(%rdx), %xmm0
	subss	%xmm4, %xmm1
	addss	%xmm4, %xmm5
	movaps	%xmm3, %xmm4
	subss	%xmm7, %xmm3
	addss	%xmm7, %xmm4
	movaps	%xmm8, %xmm9
	movaps	%xmm0, %xmm7
	subss	%xmm6, %xmm8
	subss	%xmm2, %xmm0
	addss	%xmm2, %xmm7
	addss	%xmm6, %xmm9
	movaps	%xmm1, %xmm2
	addss	%xmm3, %xmm2
	movaps	%xmm5, %xmm6
	addss	%xmm8, %xmm0
	addss	%xmm8, %xmm3
	movaps	%xmm1, %xmm8
	subss	%xmm7, %xmm5
	addss	%xmm7, %xmm6
	movaps	%xmm4, %xmm7
	addss	%xmm9, %xmm7
	subss	%xmm9, %xmm4
	movss	.LC6(%rip), %xmm9
	movaps	%xmm0, %xmm10
	subss	%xmm2, %xmm10
	mulss	.LC8(%rip), %xmm0
	mulss	.LC7(%rip), %xmm10
	addss	%xmm5, %xmm4
	mulss	%xmm9, %xmm3
	mulss	.LC9(%rip), %xmm2
	mulss	%xmm9, %xmm4
	addss	%xmm10, %xmm0
	subss	%xmm3, %xmm1
	addss	%xmm3, %xmm8
	addss	%xmm10, %xmm2
	movaps	%xmm0, %xmm3
	addss	%xmm1, %xmm3
	subss	%xmm0, %xmm1
	movaps	%xmm2, %xmm0
	addss	%xmm8, %xmm0
	subss	%xmm2, %xmm8
	movss	%xmm3, (%r9)
	movss	%xmm1, (%rdx)
	movss	%xmm0, (%rsi)
	movaps	%xmm6, %xmm0
	subss	%xmm7, %xmm6
	addss	%xmm7, %xmm0
	movss	%xmm8, (%r10)
	movss	%xmm0, (%rdi)
	movaps	%xmm5, %xmm0
	subss	%xmm4, %xmm5
	addss	%xmm4, %xmm0
	movss	%xmm0, (%rax)
	movss	%xmm6, (%r8)
	movss	%xmm5, (%rcx)
	ret
	.cfi_endproc
.LFE801:
	.size	stbiw__jpg_DCT, .-stbiw__jpg_DCT
	.p2align 4
	.type	stbi__stdio_eof, @function
stbi__stdio_eof:
.LFB548:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	feof@PLT
	movl	%eax, %edx
	movl	$1, %eax
	testl	%edx, %edx
	je	.L70
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L70:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	ferror@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE548:
	.size	stbi__stdio_eof, .-stbi__stdio_eof
	.p2align 4
	.type	stbi__stdio_skip, @function
stbi__stdio_skip:
.LFB547:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%esi, %rsi
	movq	%rdi, %rbx
	movl	$1, %edx
	call	fseek@PLT
	movq	%rbx, %rdi
	call	fgetc@PLT
	cmpl	$-1, %eax
	jne	.L74
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L74:
	.cfi_restore_state
	movq	%rbx, %rsi
	movl	%eax, %edi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	ungetc@PLT
	.cfi_endproc
.LFE547:
	.size	stbi__stdio_skip, .-stbi__stdio_skip
	.p2align 4
	.type	stbi__stdio_read, @function
stbi__stdio_read:
.LFB546:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rcx
	movslq	%edx, %rdx
	movq	%rsi, %rdi
	movl	$1, %esi
	call	fread@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE546:
	.size	stbi__stdio_read, .-stbi__stdio_read
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC10:
	.string	"stb_image_write.h"
.LC11:
	.string	"0"
	.text
	.p2align 4
	.type	stbiw__writefv, @function
stbiw__writefv:
.LFB765:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movzbl	(%rsi), %eax
	testb	%al, %al
	je	.L77
	movq	%rdi, %r12
	movq	%rsi, %rbx
	leaq	4(%rsp), %r13
	movq	%rdx, %rbp
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L101:
	cmpb	$32, %al
	je	.L81
	cmpb	$49, %al
	jne	.L83
	movl	0(%rbp), %eax
	cmpl	$47, %eax
	ja	.L85
	movl	%eax, %edx
	addl	$8, %eax
	addq	16(%rbp), %rdx
	movl	%eax, 0(%rbp)
.L86:
	movl	(%rdx), %eax
	movq	8(%r12), %rdi
	leaq	3(%rsp), %rsi
	movl	$1, %edx
	movb	%al, 3(%rsp)
	call	*(%r12)
.L81:
	movzbl	(%rbx), %eax
	testb	%al, %al
	je	.L77
.L91:
	addq	$1, %rbx
	cmpb	$50, %al
	je	.L79
	jle	.L101
	cmpb	$52, %al
	jne	.L83
	movl	0(%rbp), %eax
	cmpl	$47, %eax
	ja	.L89
	movl	%eax, %edx
	addl	$8, %eax
	addq	16(%rbp), %rdx
	movl	%eax, 0(%rbp)
.L90:
	movl	(%rdx), %eax
	movq	8(%r12), %rdi
	movl	$4, %edx
	movq	%r13, %rsi
	movl	%eax, 4(%rsp)
	call	*(%r12)
	movzbl	(%rbx), %eax
	testb	%al, %al
	jne	.L91
.L77:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L102
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L79:
	.cfi_restore_state
	movl	0(%rbp), %eax
	cmpl	$47, %eax
	ja	.L87
	movl	%eax, %edx
	addl	$8, %eax
	addq	16(%rbp), %rdx
	movl	%eax, 0(%rbp)
.L88:
	movzwl	(%rdx), %eax
	movq	8(%r12), %rdi
	movl	$2, %edx
	movq	%r13, %rsi
	movw	%ax, 4(%rsp)
	call	*(%r12)
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L89:
	movq	8(%rbp), %rdx
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rbp)
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L87:
	movq	8(%rbp), %rdx
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rbp)
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L85:
	movq	8(%rbp), %rdx
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rbp)
	jmp	.L86
.L83:
	leaq	__PRETTY_FUNCTION__.30(%rip), %rcx
	movl	$372, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	call	__assert_fail@PLT
.L102:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE765:
	.size	stbiw__writefv, .-stbiw__writefv
	.section	.rodata.str1.1
.LC12:
	.string	"bad code lengths"
.LC13:
	.string	"bad size list"
	.text
	.p2align 4
	.type	stbi__build_huffman, @function
stbi__build_huffman:
.LFB613:
	.cfi_startproc
	movq	%rdi, %r8
	xorl	%edx, %edx
	movl	$1, %edi
.L104:
	movl	-4(%rsi,%rdi,4), %r9d
	testl	%r9d, %r9d
	jle	.L109
	leal	1(%rdx), %eax
	movslq	%edx, %rdx
	movl	%edi, %ecx
	movb	%dil, 1280(%r8,%rdx)
	cmpl	$256, %eax
	jg	.L110
	cltq
	leal	-1(%r9), %edx
	addq	%rax, %rdx
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L107:
	movb	%cl, 1280(%r8,%rax)
	addq	$1, %rax
	cmpl	$257, %eax
	je	.L110
.L105:
	cmpq	%rax, %rdx
	jne	.L107
.L109:
	addq	$1, %rdi
	cmpq	$17, %rdi
	jne	.L104
	movslq	%edx, %rdx
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	xorl	%esi, %esi
	movb	$0, 1280(%r8,%rdx)
	movl	$16, %r11d
	movl	$1, %edx
	jmp	.L114
	.p2align 4,,10
	.p2align 3
.L112:
	movl	%r11d, %ecx
	movl	%eax, %ebx
	addl	%eax, %eax
	subl	%r10d, %ecx
	sall	%cl, %ebx
	movl	%ebx, 1540(%r8,%rdx,4)
	addq	$1, %rdx
	cmpq	$17, %rdx
	je	.L142
.L114:
	movl	%esi, %ecx
	movl	%edx, %r10d
	movl	%edx, %r9d
	subl	%eax, %ecx
	movl	%ecx, 1612(%r8,%rdx,4)
	movslq	%esi, %rcx
	movzbl	1280(%r8,%rcx), %ecx
	cmpl	%edx, %ecx
	jne	.L112
	leal	1(%rsi), %ecx
	movslq	%ecx, %rcx
	.p2align 4,,10
	.p2align 3
.L113:
	movl	%eax, %ebx
	addl	$1, %eax
	leal	-1(%rax), %esi
	movw	%si, 510(%r8,%rcx,2)
	movq	%rcx, %rsi
	movzbl	1280(%r8,%rcx), %edi
	addq	$1, %rcx
	cmpl	%r9d, %edi
	je	.L113
	movl	%edx, %ecx
	shrl	%cl, %ebx
	testl	%ebx, %ebx
	je	.L112
	leaq	.LC12(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L110:
	.cfi_restore 3
	leaq	.LC13(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	ret
.L142:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	8(%r8), %rdi
	movq	%r8, %rcx
	movq	$-1, %rax
	xorl	%edx, %edx
	andq	$-8, %rdi
	movslq	%esi, %r9
	movl	$-1, 1608(%r8)
	movl	$9, %ebx
	subq	%rdi, %rcx
	movq	$-1, (%r8)
	movl	$1, %r11d
	movabsq	$72340172838076673, %r10
	addl	$512, %ecx
	movq	$-1, 504(%r8)
	shrl	$3, %ecx
	rep stosq
	testl	%esi, %esi
	jne	.L118
	jmp	.L119
	.p2align 4,,10
	.p2align 3
.L124:
	addq	$1, %rdx
	cmpq	%rdx, %r9
	je	.L119
.L118:
	movzbl	1280(%r8,%rdx), %eax
	cmpl	$9, %eax
	jg	.L124
	movl	%ebx, %ecx
	movl	%r11d, %esi
	subl	%eax, %ecx
	movzwl	512(%r8,%rdx,2), %eax
	sall	%cl, %esi
	sall	%cl, %eax
	movslq	%eax, %rcx
	movzbl	%dl, %eax
	imulq	%r10, %rax
	addq	%r8, %rcx
	cmpl	$8, %esi
	jnb	.L120
	testb	$4, %sil
	jne	.L143
	testl	%esi, %esi
	je	.L124
	movb	%al, (%rcx)
	testb	$2, %sil
	je	.L124
	movw	%ax, -2(%rcx,%rsi)
	jmp	.L124
	.p2align 4,,10
	.p2align 3
.L120:
	movl	%esi, %edi
	movq	%rax, (%rcx)
	movq	%rax, -8(%rcx,%rdi)
	leaq	8(%rcx), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rcx
	addl	%ecx, %esi
	shrl	$3, %esi
	movl	%esi, %ecx
	rep stosq
	jmp	.L124
.L119:
	movl	$1, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L143:
	.cfi_restore_state
	movl	%eax, (%rcx)
	movl	%eax, -4(%rcx,%rsi)
	jmp	.L124
	.cfi_endproc
.LFE613:
	.size	stbi__build_huffman, .-stbi__build_huffman
	.p2align 4
	.type	stbi__getn, @function
stbi__getn:
.LFB602:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movslq	%edx, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	cmpq	$0, 16(%rbp)
	movq	200(%rbp), %rax
	movq	192(%rbp), %rsi
	je	.L145
	movq	%rax, %r12
	subq	%rsi, %r12
	cmpl	%ebx, %r12d
	jl	.L149
.L145:
	leaq	(%rsi,%rbx), %rcx
	xorl	%edx, %edx
	cmpq	%rcx, %rax
	jnb	.L150
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L150:
	.cfi_restore_state
	movq	%rbx, %rdx
	call	memcpy@PLT
	addq	%rbx, 192(%rbp)
	movl	$1, %edx
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	movl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L149:
	.cfi_restore_state
	movslq	%r12d, %r13
	subl	%r12d, %ebx
	movq	%r13, %rdx
	call	memcpy@PLT
	movl	%ebx, %edx
	movq	40(%rbp), %rdi
	leaq	(%rax,%r13), %rsi
	call	*16(%rbp)
	xorl	%edx, %edx
	cmpl	%eax, %ebx
	movq	200(%rbp), %rax
	sete	%dl
	movq	%rax, 192(%rbp)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE602:
	.size	stbi__getn, .-stbi__getn
	.p2align 4
	.type	stbi__vertical_flip, @function
stbi__vertical_flip:
.LFB570:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movslq	%ecx, %rcx
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%edx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	sarl	%r13d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movslq	%esi, %rbx
	imulq	%rcx, %rbx
	subq	$2064, %rsp
	.cfi_def_cfa_offset 2112
	movq	%fs:40, %rax
	movq	%rax, 2056(%rsp)
	xorl	%eax, %eax
	testl	%r13d, %r13d
	jle	.L151
	testq	%rbx, %rbx
	je	.L151
	movslq	%edx, %r11
	movq	%rdi, %rbp
	xorl	%r12d, %r12d
	movq	%rsp, %r10
	subq	$1, %r11
	imulq	%rbx, %r11
	addq	%rdi, %r11
	.p2align 4,,10
	.p2align 3
.L166:
	movq	%rbp, %r8
	movq	%r11, %rdx
	movq	%rbx, %r9
	jmp	.L165
	.p2align 4,,10
	.p2align 3
.L194:
	testb	$4, %al
	jne	.L189
	testl	%eax, %eax
	je	.L162
	movzbl	(%r10), %ecx
	movb	%cl, (%rdx)
	testb	$2, %al
	jne	.L190
.L162:
	addq	%rax, %r8
	addq	%rax, %rdx
	subq	%rax, %r9
	je	.L191
.L165:
	movl	$2048, %eax
	movq	%r10, %rdi
	movq	%r8, %rsi
	cmpq	%rax, %r9
	cmovbe	%r9, %rax
	cmpl	$8, %eax
	jb	.L153
	movl	%eax, %ecx
	shrl	$3, %ecx
	rep movsq
.L153:
	xorl	%ecx, %ecx
	testb	$4, %al
	je	.L154
	movl	(%rsi), %ecx
	movl	%ecx, (%rdi)
	movl	$4, %ecx
.L154:
	testb	$2, %al
	je	.L155
	movzwl	(%rsi,%rcx), %r14d
	movw	%r14w, (%rdi,%rcx)
	addq	$2, %rcx
.L155:
	testb	$1, %al
	je	.L156
	movzbl	(%rsi,%rcx), %esi
	movb	%sil, (%rdi,%rcx)
.L156:
	cmpl	$8, %eax
	jnb	.L157
	testb	$4, %al
	jne	.L192
	testl	%eax, %eax
	je	.L158
	movzbl	(%rdx), %ecx
	movb	%cl, (%r8)
	testb	$2, %al
	jne	.L193
.L158:
	cmpl	$8, %eax
	jb	.L194
	movq	(%r10), %rcx
	leaq	8(%rdx), %rdi
	addq	%rax, %r8
	andq	$-8, %rdi
	movq	%rcx, (%rdx)
	movl	%eax, %ecx
	movq	-8(%r10,%rcx), %rsi
	movq	%rsi, -8(%rdx,%rcx)
	movq	%rdx, %rcx
	movq	%r10, %rsi
	addq	%rax, %rdx
	subq	%rdi, %rcx
	subq	%rcx, %rsi
	addl	%eax, %ecx
	shrl	$3, %ecx
	rep movsq
	subq	%rax, %r9
	jne	.L165
.L191:
	addl	$1, %r12d
	addq	%rbx, %rbp
	subq	%rbx, %r11
	cmpl	%r13d, %r12d
	jne	.L166
.L151:
	movq	2056(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L195
	addq	$2064, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L157:
	.cfi_restore_state
	movq	(%rdx), %rcx
	leaq	8(%r8), %rdi
	andq	$-8, %rdi
	movq	%rcx, (%r8)
	movl	%eax, %ecx
	movq	-8(%rdx,%rcx), %rsi
	movq	%rsi, -8(%r8,%rcx)
	movq	%r8, %rcx
	movq	%rdx, %rsi
	subq	%rdi, %rcx
	subq	%rcx, %rsi
	addl	%eax, %ecx
	shrl	$3, %ecx
	rep movsq
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L189:
	movl	(%r10), %ecx
	movl	%ecx, (%rdx)
	movl	%eax, %ecx
	movl	-4(%r10,%rcx), %esi
	movl	%esi, -4(%rdx,%rcx)
	jmp	.L162
	.p2align 4,,10
	.p2align 3
.L192:
	movl	(%rdx), %ecx
	movl	%ecx, (%r8)
	movl	%eax, %ecx
	movl	-4(%rdx,%rcx), %esi
	movl	%esi, -4(%r8,%rcx)
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L190:
	movl	%eax, %ecx
	movzwl	-2(%r10,%rcx), %esi
	movw	%si, -2(%rdx,%rcx)
	jmp	.L162
	.p2align 4,,10
	.p2align 3
.L193:
	movl	%eax, %ecx
	movzwl	-2(%rdx,%rcx), %esi
	movw	%si, -2(%r8,%rcx)
	jmp	.L158
.L195:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE570:
	.size	stbi__vertical_flip, .-stbi__vertical_flip
	.p2align 4
	.type	stbiw__encode_png_line, @function
stbiw__encode_png_line:
.LFB796:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%ecx, %eax
	testl	%r8d, %r8d
	leaq	firstmap.19(%rip), %rcx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r11
	movl	%esi, %r10d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebx
	leaq	mapping.20(%rip), %rdx
	movq	64(%rsp), %rdi
	cmove	%rcx, %rdx
	movslq	56(%rsp), %rcx
	movl	(%rdx,%rcx,4), %r12d
	movl	stbi__flip_vertically_on_write(%rip), %edx
	testl	%edx, %edx
	je	.L198
	subl	$1, %eax
	negl	%r10d
	subl	%r8d, %eax
	imull	%esi, %eax
	cltq
	leaq	(%r11,%rax), %rsi
	testl	%r12d, %r12d
	je	.L200
.L386:
	testl	%r9d, %r9d
	jle	.L202
	movl	%r10d, %r11d
	movslq	%r9d, %rax
	movq	%rsi, %r8
	movq	%rdi, %rcx
	negl	%r11d
	addq	%rdi, %rax
	leaq	.L205(%rip), %rbp
	movl	%r12d, %r13d
	.p2align 4,,10
	.p2align 3
.L211:
	cmpl	$6, %r12d
	ja	.L203
	movslq	0(%rbp,%r13,4), %rdx
	addq	%rbp, %rdx
	jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L205:
	.long	.L203-.L205
	.long	.L204-.L205
	.long	.L207-.L205
	.long	.L208-.L205
	.long	.L207-.L205
	.long	.L204-.L205
	.long	.L204-.L205
	.text
	.p2align 4,,10
	.p2align 3
.L204:
	movzbl	(%r8), %edx
	movb	%dl, (%rcx)
.L203:
	addq	$1, %rcx
	addq	$1, %r8
	addl	$1, %r11d
	cmpq	%rcx, %rax
	jne	.L211
.L202:
	cmpl	$6, %r12d
	ja	.L196
	leaq	.L214(%rip), %rdx
	movl	%r12d, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L214:
	.long	.L196-.L214
	.long	.L219-.L214
	.long	.L218-.L214
	.long	.L217-.L214
	.long	.L216-.L214
	.long	.L215-.L214
	.long	.L213-.L214
	.text
	.p2align 4,,10
	.p2align 3
.L207:
	movslq	%r11d, %r14
	movzbl	(%r8), %edx
	subb	(%rsi,%r14), %dl
	movb	%dl, (%rcx)
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L208:
	movslq	%r11d, %rdx
	movzbl	(%rsi,%rdx), %r14d
	movzbl	(%r8), %edx
	shrb	%r14b
	subl	%r14d, %edx
	movb	%dl, (%rcx)
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L213:
	imull	%r9d, %ebx
	cmpl	%ebx, %r9d
	jge	.L196
	movl	%ebx, %ecx
	movslq	%r9d, %rax
	subl	%r9d, %ecx
	leal	-1(%rcx), %edx
	cmpl	$6, %edx
	jbe	.L265
	leaq	(%rdi,%rax), %r8
	leaq	1(%rsi,%rax), %r11
	movq	%r8, %r10
	subq	%r11, %r10
	cmpq	$14, %r10
	jbe	.L265
	leaq	1(%rsi), %r11
	movq	%r8, %r10
	subq	%r11, %r10
	cmpq	$14, %r10
	ja	.L385
.L265:
	movq	%rsi, %rcx
	subq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L272:
	movzbl	(%rsi,%rax), %edx
	subb	(%rcx,%rax), %dl
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L272
.L196:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L198:
	.cfi_restore_state
	imull	%esi, %r8d
	movslq	%r8d, %r8
	leaq	(%r11,%r8), %rsi
	testl	%r12d, %r12d
	jne	.L386
.L200:
	imull	%ebx, %r9d
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	movslq	%r9d, %rdx
	jmp	memcpy@PLT
	.p2align 4,,10
	.p2align 3
.L219:
	.cfi_restore_state
	imull	%r9d, %ebx
	cmpl	%r9d, %ebx
	jle	.L196
	movl	%ebx, %ecx
	movslq	%r9d, %rax
	subl	%r9d, %ecx
	leal	-1(%rcx), %edx
	cmpl	$6, %edx
	jbe	.L226
	leaq	(%rdi,%rax), %r8
	leaq	1(%rsi,%rax), %r11
	movq	%r8, %r10
	subq	%r11, %r10
	cmpq	$14, %r10
	jbe	.L226
	leaq	1(%rsi), %r11
	movq	%r8, %r10
	subq	%r11, %r10
	cmpq	$14, %r10
	jbe	.L226
	cmpl	$14, %edx
	jbe	.L278
	movl	%ecx, %r10d
	leaq	(%rsi,%rax), %r11
	xorl	%edx, %edx
	shrl	$4, %r10d
	salq	$4, %r10
	.p2align 4,,10
	.p2align 3
.L228:
	movdqu	(%r11,%rdx), %xmm0
	movdqu	(%rsi,%rdx), %xmm5
	psubb	%xmm5, %xmm0
	movups	%xmm0, (%r8,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %r10
	jne	.L228
.L384:
	movl	%ecx, %r8d
	andl	$-16, %r8d
	leal	(%r8,%r9), %edx
	testb	$15, %cl
	je	.L196
	subl	%r8d, %ecx
	leal	-1(%rcx), %r10d
	cmpl	$6, %r10d
	jbe	.L270
.L266:
	addq	%r8, %rax
	movq	(%rsi,%r8), %xmm1
	movq	(%rsi,%rax), %xmm0
	psubb	%xmm1, %xmm0
	movq	%xmm0, (%rdi,%rax)
	movl	%ecx, %eax
	andl	$-8, %eax
	addl	%eax, %edx
	andl	$7, %ecx
	je	.L196
.L270:
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r9d, %ecx
	movzbl	(%rsi,%r8), %eax
	movslq	%ecx, %rcx
	subb	(%rsi,%rcx), %al
	movb	%al, (%rdi,%r8)
	leal	1(%rdx), %eax
	cmpl	%eax, %ebx
	jle	.L196
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%r8), %ecx
	subb	(%rsi,%rax), %cl
	leal	2(%rdx), %eax
	movb	%cl, (%rdi,%r8)
	cmpl	%eax, %ebx
	jle	.L196
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%r8), %ecx
	subb	(%rsi,%rax), %cl
	leal	3(%rdx), %eax
	movb	%cl, (%rdi,%r8)
	cmpl	%eax, %ebx
	jle	.L196
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%r8), %ecx
	subb	(%rsi,%rax), %cl
	leal	4(%rdx), %eax
	movb	%cl, (%rdi,%r8)
	cmpl	%eax, %ebx
	jle	.L196
	movslq	%eax, %r8
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%r8), %ecx
	subb	(%rsi,%rax), %cl
	leal	5(%rdx), %eax
	movb	%cl, (%rdi,%r8)
	cmpl	%eax, %ebx
	jle	.L196
	movslq	%eax, %r8
	subl	%r9d, %eax
	addl	$6, %edx
	cltq
	movzbl	(%rsi,%r8), %ecx
	subb	(%rsi,%rax), %cl
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %rcx
	subl	%r9d, %edx
	movslq	%edx, %rax
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	movb	%dl, (%rdi,%rcx)
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L218:
	imull	%r9d, %ebx
	cmpl	%ebx, %r9d
	jge	.L196
	movl	%ebx, %r8d
	movslq	%r9d, %rax
	movslq	%r10d, %rcx
	subl	%r9d, %r8d
	leal	-1(%r8), %edx
	cmpl	$6, %edx
	jbe	.L235
	leaq	(%rdi,%rax), %r11
	leaq	1(%rsi,%rax), %r13
	movslq	%r10d, %rcx
	movq	%rax, %rbp
	movq	%r11, %r12
	subq	%rcx, %rbp
	subq	%r13, %r12
	cmpq	$14, %r12
	jbe	.L235
	leaq	1(%rsi,%rbp), %r13
	movq	%r11, %r12
	subq	%r13, %r12
	cmpq	$14, %r12
	jbe	.L235
	cmpl	$14, %edx
	jbe	.L276
	leaq	(%rsi,%rbp), %rcx
	movl	%r8d, %ebp
	leaq	(%rsi,%rax), %r12
	xorl	%edx, %edx
	shrl	$4, %ebp
	salq	$4, %rbp
	.p2align 4,,10
	.p2align 3
.L237:
	movdqu	(%r12,%rdx), %xmm0
	movdqu	(%rcx,%rdx), %xmm5
	psubb	%xmm5, %xmm0
	movups	%xmm0, (%r11,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %rbp
	jne	.L237
	movl	%r8d, %edx
	andl	$-16, %edx
	addl	%edx, %r9d
	testb	$15, %r8b
	je	.L196
	subl	%edx, %r8d
	leal	-1(%r8), %r11d
	cmpl	$6, %r11d
	jbe	.L240
.L236:
	addq	%rdx, %rax
	movq	(%rcx,%rdx), %xmm1
	movq	(%rsi,%rax), %xmm0
	psubb	%xmm1, %xmm0
	movq	%xmm0, (%rdi,%rax)
	movl	%r8d, %eax
	andl	$-8, %eax
	addl	%eax, %r9d
	andl	$7, %r8d
	je	.L196
.L240:
	movl	%r9d, %edx
	movslq	%r9d, %rcx
	subl	%r10d, %edx
	movzbl	(%rsi,%rcx), %eax
	movslq	%edx, %rdx
	subb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rcx)
	leal	1(%r9), %eax
	cmpl	%ebx, %eax
	jge	.L196
	movslq	%eax, %rcx
	subl	%r10d, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	2(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%ebx, %eax
	jge	.L196
	movslq	%eax, %rcx
	subl	%r10d, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	3(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %ebx
	jle	.L196
	movslq	%eax, %rcx
	subl	%r10d, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	4(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%ebx, %eax
	jge	.L196
	movslq	%eax, %rcx
	subl	%r10d, %eax
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	leal	5(%r9), %eax
	movb	%dl, (%rdi,%rcx)
	cmpl	%eax, %ebx
	jle	.L196
	movslq	%eax, %rcx
	subl	%r10d, %eax
	addl	$6, %r9d
	cltq
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	movb	%dl, (%rdi,%rcx)
	cmpl	%r9d, %ebx
	jle	.L196
	movslq	%r9d, %rcx
	subl	%r10d, %r9d
	movslq	%r9d, %rax
	movzbl	(%rsi,%rcx), %edx
	subb	(%rsi,%rax), %dl
	movb	%dl, (%rdi,%rcx)
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L216:
	imull	%r9d, %ebx
	movl	%ebx, -92(%rsp)
	cmpl	%r9d, %ebx
	jle	.L196
	subl	%r9d, %ebx
	movslq	%r10d, %rcx
	leal	-1(%rbx), %eax
	cmpl	$14, %eax
	movslq	%r9d, %rax
	jbe	.L250
	leaq	(%rdi,%rax), %r11
	leaq	1(%rsi,%rax), %rbp
	movslq	%r10d, %rcx
	movq	%rax, %rdx
	movq	%r11, %r8
	movl	%r10d, %r13d
	leaq	1(%rsi), %r12
	subq	%rcx, %rdx
	subq	%rbp, %r8
	negl	%r13d
	movq	%r11, %rbp
	cmpq	$14, %r8
	movslq	%r13d, %r13
	seta	%r8b
	subq	%r12, %rbp
	leaq	1(%rsi,%rdx), %r12
	cmpq	$14, %rbp
	seta	%bpl
	andl	%ebp, %r8d
	movq	%r11, %rbp
	subq	%r12, %rbp
	cmpq	$14, %rbp
	seta	%bpl
	testb	%bpl, %r8b
	je	.L250
	leaq	1(%rsi,%r13), %rbp
	movq	%r11, %r8
	subq	%rbp, %r8
	cmpq	$14, %r8
	jbe	.L250
	movl	%ebx, %r8d
	leaq	(%rsi,%rdx), %r10
	leaq	(%rsi,%rax), %rbp
	addq	%rsi, %r13
	shrl	$4, %r8d
	pxor	%xmm14, %xmm14
	pxor	%xmm13, %xmm13
	xorl	%edx, %edx
	salq	$4, %r8
.L251:
	movdqu	0(%r13,%rdx), %xmm0
	pxor	%xmm6, %xmm6
	movdqu	(%rsi,%rdx), %xmm7
	movdqu	0(%r13,%rdx), %xmm1
	movdqu	(%r10,%rdx), %xmm4
	movdqa	%xmm6, %xmm3
	punpckhbw	%xmm6, %xmm0
	punpcklbw	%xmm6, %xmm7
	movdqa	%xmm0, %xmm5
	punpcklbw	%xmm6, %xmm1
	punpckhbw	%xmm6, %xmm4
	punpckhwd	%xmm14, %xmm5
	movdqa	%xmm7, %xmm15
	movdqa	%xmm1, %xmm9
	movaps	%xmm5, -56(%rsp)
	movdqu	(%r10,%rdx), %xmm5
	punpcklwd	%xmm14, %xmm15
	punpcklwd	%xmm14, %xmm9
	movdqa	%xmm0, %xmm8
	punpckhwd	%xmm14, %xmm7
	punpckhwd	%xmm14, %xmm1
	punpcklbw	%xmm6, %xmm5
	movdqu	(%rsi,%rdx), %xmm6
	punpcklwd	%xmm14, %xmm8
	movdqa	%xmm7, %xmm2
	movdqa	%xmm5, %xmm11
	movaps	%xmm8, -72(%rsp)
	punpckhwd	%xmm14, %xmm5
	movdqa	%xmm4, %xmm10
	punpcklwd	%xmm14, %xmm11
	punpckhbw	%xmm3, %xmm6
	movdqa	%xmm15, %xmm3
	movaps	%xmm1, -88(%rsp)
	paddd	%xmm11, %xmm3
	paddd	%xmm5, %xmm2
	movdqa	%xmm6, %xmm12
	psubd	%xmm9, %xmm3
	psubd	-88(%rsp), %xmm2
	punpcklwd	%xmm14, %xmm12
	movdqa	%xmm3, %xmm8
	punpcklwd	%xmm14, %xmm10
	movdqa	%xmm12, %xmm1
	psubd	%xmm15, %xmm8
	paddd	%xmm10, %xmm1
	punpckhwd	%xmm14, %xmm6
	movdqa	%xmm8, %xmm15
	psubd	-72(%rsp), %xmm1
	punpckhwd	%xmm14, %xmm4
	psrad	$31, %xmm15
	movdqa	%xmm6, %xmm0
	pxor	%xmm15, %xmm8
	paddd	%xmm4, %xmm0
	psubd	-56(%rsp), %xmm0
	psubd	%xmm15, %xmm8
	movdqa	%xmm2, %xmm15
	psubd	%xmm7, %xmm15
	movaps	%xmm8, -40(%rsp)
	movdqa	%xmm15, %xmm7
	movdqa	%xmm15, %xmm8
	psrad	$31, %xmm7
	pxor	%xmm7, %xmm8
	movdqa	%xmm8, %xmm15
	psubd	%xmm7, %xmm15
	movdqa	%xmm1, %xmm7
	psubd	%xmm12, %xmm7
	movdqa	%xmm7, %xmm12
	psrad	$31, %xmm12
	pxor	%xmm12, %xmm7
	psubd	%xmm12, %xmm7
	movdqa	%xmm7, %xmm12
	movdqa	%xmm0, %xmm7
	psubd	%xmm6, %xmm7
	movdqa	%xmm7, %xmm6
	psrad	$31, %xmm6
	pxor	%xmm6, %xmm7
	psubd	%xmm6, %xmm7
	movdqa	%xmm3, %xmm6
	psubd	%xmm9, %xmm3
	psubd	%xmm11, %xmm6
	movdqa	%xmm0, %xmm11
	movaps	%xmm7, -24(%rsp)
	psubd	-56(%rsp), %xmm0
	psubd	%xmm4, %xmm11
	movdqa	%xmm6, %xmm7
	psrad	$31, %xmm7
	movdqa	%xmm11, %xmm4
	movdqa	%xmm11, %xmm8
	psrad	$31, %xmm4
	pxor	%xmm7, %xmm6
	psubd	%xmm7, %xmm6
	pxor	%xmm4, %xmm8
	movdqa	%xmm2, %xmm7
	psubd	%xmm4, %xmm8
	psubd	%xmm5, %xmm7
	movdqa	%xmm3, %xmm4
	psrad	$31, %xmm4
	psubd	-88(%rsp), %xmm2
	movdqa	%xmm7, %xmm5
	psrad	$31, %xmm5
	pxor	%xmm4, %xmm3
	psubd	%xmm4, %xmm3
	pxor	%xmm5, %xmm7
	movdqa	%xmm2, %xmm4
	psubd	%xmm5, %xmm7
	psrad	$31, %xmm4
	movdqa	%xmm1, %xmm5
	psubd	-72(%rsp), %xmm1
	pxor	%xmm4, %xmm2
	psubd	%xmm10, %xmm5
	psubd	%xmm4, %xmm2
	movdqa	%xmm5, %xmm10
	movdqa	%xmm1, %xmm4
	psrad	$31, %xmm10
	psrad	$31, %xmm4
	pxor	%xmm10, %xmm5
	pxor	%xmm4, %xmm1
	psubd	%xmm10, %xmm5
	psubd	%xmm4, %xmm1
	movdqa	%xmm0, %xmm4
	psrad	$31, %xmm4
	pxor	%xmm4, %xmm0
	psubd	%xmm4, %xmm0
	movdqa	%xmm6, %xmm4
	pcmpgtd	%xmm3, %xmm4
	movdqa	%xmm4, %xmm9
	pand	%xmm4, %xmm3
	pandn	%xmm6, %xmm9
	por	%xmm9, %xmm3
	movdqa	%xmm7, %xmm9
	pcmpgtd	%xmm2, %xmm9
	movdqa	%xmm9, %xmm6
	pand	%xmm9, %xmm2
	movdqa	%xmm9, %xmm11
	pandn	%xmm7, %xmm6
	pcmpeqd	%xmm13, %xmm11
	por	%xmm6, %xmm2
	movdqa	%xmm5, %xmm6
	pcmpgtd	%xmm1, %xmm6
	movdqa	%xmm6, %xmm7
	pand	%xmm6, %xmm1
	pandn	%xmm5, %xmm7
	movdqa	%xmm8, %xmm5
	pcmpgtd	%xmm0, %xmm5
	por	%xmm7, %xmm1
	movdqa	%xmm5, %xmm7
	pand	%xmm5, %xmm0
	movdqa	%xmm5, %xmm10
	pandn	%xmm8, %xmm7
	movdqa	-24(%rsp), %xmm8
	pcmpeqd	%xmm13, %xmm10
	por	%xmm0, %xmm7
	movdqa	-40(%rsp), %xmm0
	pcmpgtd	%xmm7, %xmm8
	movdqa	%xmm6, %xmm7
	pcmpgtd	%xmm3, %xmm0
	pcmpeqd	%xmm13, %xmm7
	movdqa	%xmm15, %xmm3
	pcmpgtd	%xmm2, %xmm3
	movdqa	%xmm12, %xmm2
	pcmpgtd	%xmm1, %xmm2
	movdqa	%xmm4, %xmm1
	pand	%xmm8, %xmm10
	pcmpeqd	%xmm13, %xmm1
	pand	%xmm0, %xmm4
	pand	%xmm8, %xmm5
	pand	%xmm3, %xmm11
	pcmpeqd	%xmm13, %xmm8
	pand	%xmm3, %xmm9
	pcmpeqd	%xmm13, %xmm3
	pand	%xmm2, %xmm7
	pand	%xmm2, %xmm6
	pand	%xmm0, %xmm1
	pcmpeqd	%xmm13, %xmm0
	pcmpeqd	%xmm13, %xmm2
	movdqa	%xmm0, %xmm12
	punpcklwd	%xmm3, %xmm0
	punpckhwd	%xmm3, %xmm12
	movdqa	%xmm0, %xmm3
	punpckhwd	%xmm12, %xmm3
	punpcklwd	%xmm12, %xmm0
	punpcklwd	%xmm3, %xmm0
	movdqa	%xmm2, %xmm3
	punpcklwd	%xmm8, %xmm2
	punpckhwd	%xmm8, %xmm3
	movdqa	%xmm2, %xmm8
	pand	.LC2(%rip), %xmm0
	punpckhwd	%xmm3, %xmm8
	punpcklwd	%xmm3, %xmm2
	movdqu	(%r10,%rdx), %xmm3
	punpcklwd	%xmm8, %xmm2
	pand	.LC2(%rip), %xmm2
	packuswb	%xmm2, %xmm0
	movdqu	(%rsi,%rdx), %xmm2
	pand	%xmm0, %xmm2
	pandn	%xmm3, %xmm0
	por	%xmm2, %xmm0
	movdqa	%xmm1, %xmm2
	punpcklwd	%xmm11, %xmm1
	punpckhwd	%xmm11, %xmm2
	movdqa	%xmm1, %xmm3
	punpckhwd	%xmm2, %xmm3
	punpcklwd	%xmm2, %xmm1
	movdqa	%xmm7, %xmm2
	punpcklwd	%xmm10, %xmm7
	punpckhwd	%xmm10, %xmm2
	punpcklwd	%xmm3, %xmm1
	movdqa	%xmm7, %xmm3
	punpcklwd	%xmm2, %xmm7
	pand	.LC2(%rip), %xmm1
	punpckhwd	%xmm2, %xmm3
	movdqu	(%r10,%rdx), %xmm2
	punpcklwd	%xmm3, %xmm7
	pand	.LC2(%rip), %xmm7
	packuswb	%xmm7, %xmm1
	pand	%xmm1, %xmm2
	pandn	%xmm0, %xmm1
	movdqa	%xmm4, %xmm0
	punpcklwd	%xmm9, %xmm4
	punpckhwd	%xmm9, %xmm0
	por	%xmm2, %xmm1
	movdqa	%xmm4, %xmm2
	punpcklwd	%xmm0, %xmm4
	punpckhwd	%xmm0, %xmm2
	movdqa	%xmm6, %xmm0
	punpcklwd	%xmm5, %xmm6
	punpckhwd	%xmm5, %xmm0
	punpcklwd	%xmm2, %xmm4
	movdqa	%xmm6, %xmm2
	punpckhwd	%xmm0, %xmm2
	punpcklwd	%xmm0, %xmm6
	pand	.LC2(%rip), %xmm4
	movdqu	0(%r13,%rdx), %xmm0
	punpcklwd	%xmm2, %xmm6
	pand	.LC2(%rip), %xmm6
	packuswb	%xmm6, %xmm4
	pand	%xmm4, %xmm0
	pandn	%xmm1, %xmm4
	por	%xmm0, %xmm4
	movdqu	0(%rbp,%rdx), %xmm0
	psubb	%xmm4, %xmm0
	movups	%xmm0, (%r11,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %r8
	jne	.L251
	movl	%ebx, %edx
	andl	$-16, %edx
	addl	%edx, %r9d
	andl	$15, %ebx
	je	.L196
	leaq	(%rax,%rcx), %rdx
	movq	%rsi, %r15
	movq	%rsi, %r14
	movslq	%r9d, %r9
	subq	%rdx, %r15
	subq	%rax, %r14
	jmp	.L255
	.p2align 4,,10
	.p2align 3
.L254:
	cmpl	%edx, %ecx
	cmovle	%ebp, %r8d
.L256:
	subl	%r8d, %r10d
	movb	%r10b, (%rdi,%r9)
	addq	$1, %r9
	cmpl	%r9d, -92(%rsp)
	jle	.L196
.L255:
	movzbl	0(%r13,%r9), %ecx
	movzbl	(%r14,%r9), %ebx
	movzbl	(%r15,%r9), %edx
	movzbl	(%rsi,%r9), %r10d
	leal	(%rcx,%rbx), %eax
	movl	%ecx, %ebp
	subl	%edx, %eax
	movl	%edx, %r8d
	movl	%eax, %r11d
	subl	%ecx, %r11d
	movl	%r11d, %ecx
	negl	%ecx
	cmovs	%r11d, %ecx
	movl	%eax, %r11d
	subl	%edx, %r11d
	movl	%r11d, %edx
	negl	%edx
	cmovs	%r11d, %edx
	subl	%ebx, %eax
	movl	%eax, %r11d
	negl	%r11d
	cmovns	%r11d, %eax
	cmpl	%edx, %ecx
	movl	%edx, %r11d
	cmovle	%ecx, %r11d
	cmpl	%r11d, %eax
	jg	.L254
	movl	%ebx, %r8d
	jmp	.L256
	.p2align 4,,10
	.p2align 3
.L217:
	imull	%r9d, %ebx
	cmpl	%r9d, %ebx
	jle	.L196
	movl	%ebx, %ebp
	movslq	%r10d, %rcx
	subl	%r9d, %ebp
	leal	-1(%rbp), %eax
	cmpl	$14, %eax
	movslq	%r9d, %rax
	jbe	.L244
	leaq	(%rdi,%rax), %r8
	leaq	1(%rsi,%rax), %r12
	movslq	%r10d, %rcx
	movq	%rax, %rdx
	movq	%r8, %r11
	subq	%rcx, %rdx
	leaq	1(%rsi), %r13
	subq	%r12, %r11
	cmpq	$14, %r11
	movq	%r8, %r11
	seta	%r12b
	subq	%r13, %r11
	cmpq	$14, %r11
	seta	%r11b
	testb	%r11b, %r12b
	je	.L244
	leaq	1(%rsi,%rdx), %r12
	movq	%r8, %r11
	subq	%r12, %r11
	cmpq	$14, %r11
	jbe	.L244
	movl	%ebp, %r11d
	movdqa	.LC14(%rip), %xmm4
	leaq	(%rsi,%rdx), %rcx
	addq	%rsi, %rax
	shrl	$4, %r11d
	movdqa	.LC15(%rip), %xmm3
	xorl	%edx, %edx
	salq	$4, %r11
	.p2align 4,,10
	.p2align 3
.L245:
	movdqu	(%rsi,%rdx), %xmm0
	movdqu	(%rcx,%rdx), %xmm5
	movdqu	(%rax,%rdx), %xmm2
	movdqu	(%rcx,%rdx), %xmm1
	pand	%xmm5, %xmm0
	pand	%xmm4, %xmm0
	psrlw	$1, %xmm1
	psubb	%xmm0, %xmm2
	movdqu	(%rsi,%rdx), %xmm0
	pand	%xmm3, %xmm1
	psrlw	$1, %xmm0
	pand	%xmm3, %xmm0
	paddb	%xmm1, %xmm0
	movdqa	%xmm2, %xmm1
	psubb	%xmm0, %xmm1
	movups	%xmm1, (%r8,%rdx)
	addq	$16, %rdx
	cmpq	%r11, %rdx
	jne	.L245
	movl	%ebp, %ecx
	andl	$-16, %ecx
	andl	$15, %ebp
	leal	(%r9,%rcx), %eax
	je	.L196
	movl	%eax, %edx
	movslq	%ecx, %rcx
	movslq	%eax, %r8
	subl	%r10d, %edx
	movzbl	(%rsi,%rcx), %ecx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %edx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	1(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r10d, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	2(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r9d, %edx
	subl	%r10d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	3(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r9d, %edx
	subl	%r10d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	4(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r9d, %edx
	subl	%r10d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	5(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r10d, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	6(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r10d, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	7(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r10d, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	8(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r10d, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	9(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r10d, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	10(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r10d, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	11(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r10d, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	12(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r10d, %edx
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	leal	13(%rax), %edx
	movb	%cl, (%rdi,%r8)
	cmpl	%edx, %ebx
	jle	.L196
	movl	%edx, %ecx
	movslq	%edx, %r8
	subl	%r10d, %edx
	addl	$14, %eax
	subl	%r9d, %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rdx), %edx
	movzbl	(%rsi,%rcx), %ecx
	addl	%ecx, %edx
	movzbl	(%rsi,%r8), %ecx
	sarl	%edx
	subl	%edx, %ecx
	movb	%cl, (%rdi,%r8)
	cmpl	%eax, %ebx
	jle	.L196
	movl	%eax, %edx
	movslq	%eax, %rcx
	subl	%r10d, %eax
	subl	%r9d, %edx
	cltq
	movslq	%edx, %rdx
	movzbl	(%rsi,%rax), %eax
	movzbl	(%rsi,%rdx), %edx
	addl	%edx, %eax
	movzbl	(%rsi,%rcx), %edx
	sarl	%eax
	subl	%eax, %edx
	movb	%dl, (%rdi,%rcx)
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L215:
	imull	%r9d, %ebx
	cmpl	%ebx, %r9d
	jge	.L196
	movl	%ebx, %r10d
	subl	%r9d, %r10d
	leal	-1(%r10), %eax
	cmpl	$14, %eax
	movslq	%r9d, %rax
	jbe	.L259
	leaq	(%rdi,%rax), %rcx
	leaq	1(%rsi,%rax), %r8
	movq	%rcx, %rdx
	subq	%r8, %rdx
	cmpq	$14, %rdx
	jbe	.L259
	leaq	1(%rsi), %r8
	movq	%rcx, %rdx
	subq	%r8, %rdx
	cmpq	$14, %rdx
	jbe	.L259
	movl	%r10d, %r8d
	movdqa	.LC15(%rip), %xmm3
	addq	%rsi, %rax
	xorl	%edx, %edx
	shrl	$4, %r8d
	salq	$4, %r8
	.p2align 4,,10
	.p2align 3
.L260:
	movdqu	(%rsi,%rdx), %xmm0
	movdqu	(%rax,%rdx), %xmm1
	psrlw	$1, %xmm0
	pand	%xmm3, %xmm0
	psubb	%xmm0, %xmm1
	movups	%xmm1, (%rcx,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %r8
	jne	.L260
	movl	%r10d, %edx
	andl	$-16, %edx
	andl	$15, %r10d
	leal	(%r9,%rdx), %eax
	je	.L196
	movslq	%edx, %rdx
	movslq	%eax, %r8
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	1(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	2(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	3(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	4(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	5(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	6(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	7(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	8(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	9(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	10(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	11(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	12(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	leal	13(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L196
	movslq	%edx, %r8
	subl	%r9d, %edx
	addl	$14, %eax
	movslq	%edx, %rdx
	movzbl	(%rsi,%rdx), %ecx
	movzbl	(%rsi,%r8), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%r8)
	cmpl	%eax, %ebx
	jle	.L196
	movslq	%eax, %rcx
	subl	%r9d, %eax
	cltq
	movzbl	(%rsi,%rax), %edx
	movzbl	(%rsi,%rcx), %eax
	shrb	%dl
	subl	%edx, %eax
	movb	%al, (%rdi,%rcx)
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L250:
	negl	%r10d
	movq	%rsi, %r14
	movq	%rsi, %r15
	movslq	%r10d, %rdx
	subq	%rcx, %r14
	subq	%rax, %r15
	subq	%rax, %rdx
	addq	%rsi, %rdx
	jmp	.L258
	.p2align 4,,10
	.p2align 3
.L387:
	cmpl	%r8d, %r9d
	cmovge	%ebp, %r10d
.L257:
	subl	%r10d, %r11d
	movb	%r11b, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, -92(%rsp)
	jle	.L196
.L258:
	movzbl	(%r14,%rax), %r8d
	movzbl	(%r15,%rax), %ebx
	movzbl	(%rdx,%rax), %r9d
	movzbl	(%rsi,%rax), %r11d
	leal	(%rbx,%r8), %ecx
	movl	%r8d, %ebp
	movl	%ebx, %r12d
	subl	%r9d, %ecx
	movl	%r9d, %r10d
	movl	%ecx, %r13d
	subl	%r8d, %r13d
	movl	%r13d, %r8d
	negl	%r8d
	cmovs	%r13d, %r8d
	movl	%ecx, %r13d
	subl	%r9d, %r13d
	movl	%r13d, %r9d
	negl	%r9d
	cmovs	%r13d, %r9d
	movl	%r8d, %r13d
	cmpl	%r8d, %r9d
	cmovle	%r9d, %r13d
	subl	%ebx, %ecx
	movl	%ecx, %ebx
	negl	%ebx
	cmovs	%ecx, %ebx
	cmpl	%ebx, %r13d
	jl	.L387
	movl	%r12d, %r10d
	jmp	.L257
	.p2align 4,,10
	.p2align 3
.L259:
	movq	%rsi, %r8
	subq	%rax, %r8
	.p2align 4,,10
	.p2align 3
.L263:
	movzbl	(%r8,%rax), %ecx
	movzbl	(%rsi,%rax), %edx
	shrb	%cl
	subl	%ecx, %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L263
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L226:
	movq	%rsi, %rcx
	subq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L233:
	movzbl	(%rsi,%rax), %edx
	subb	(%rcx,%rax), %dl
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L233
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L235:
	movq	%rsi, %r8
	subq	%rcx, %r8
	.p2align 4,,10
	.p2align 3
.L242:
	movzbl	(%rsi,%rax), %edx
	subb	(%r8,%rax), %dl
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L242
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L244:
	movq	%rsi, %r9
	movq	%rsi, %r8
	subq	%rax, %r9
	subq	%rcx, %r8
	.p2align 4,,10
	.p2align 3
.L248:
	movzbl	(%r8,%rax), %ecx
	movzbl	(%r9,%rax), %edx
	addl	%ecx, %edx
	movzbl	(%rsi,%rax), %ecx
	sarl	%edx
	subl	%edx, %ecx
	movb	%cl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L248
	jmp	.L196
.L385:
	cmpl	$14, %edx
	jbe	.L278
	movl	%ecx, %r10d
	leaq	(%rsi,%rax), %r11
	xorl	%edx, %edx
	shrl	$4, %r10d
	salq	$4, %r10
	.p2align 4,,10
	.p2align 3
.L267:
	movdqu	(%r11,%rdx), %xmm0
	movdqu	(%rsi,%rdx), %xmm5
	psubb	%xmm5, %xmm0
	movups	%xmm0, (%r8,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %r10
	jne	.L267
	jmp	.L384
.L278:
	movl	%r9d, %edx
	xorl	%r8d, %r8d
	jmp	.L266
.L276:
	xorl	%edx, %edx
	leaq	(%rsi,%rbp), %rcx
	jmp	.L236
	.cfi_endproc
.LFE796:
	.size	stbiw__encode_png_line, .-stbiw__encode_png_line
	.section	.rodata.str1.1
.LC16:
	.string	"stb_image.h"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC17:
	.string	"req_comp >= 1 && req_comp <= 4"
	.section	.rodata.str1.1
.LC18:
	.string	"outofmem"
	.text
	.p2align 4
	.type	stbi__convert_format16, @function
stbi__convert_format16:
.LFB610:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$328, %rsp
	.cfi_def_cfa_offset 384
	movl	%r8d, 8(%rsp)
	cmpl	%esi, %edx
	je	.L475
	leal	-1(%rdx), %eax
	cmpl	$3, %eax
	ja	.L621
	movl	%r8d, %eax
	movl	%edx, 12(%rsp)
	movl	%esi, %ebp
	movl	%ecx, %r12d
	imull	%ecx, %eax
	movl	%r8d, %ebx
	imull	%edx, %eax
	leal	(%rax,%rax), %edi
	call	malloc@PLT
	movq	%rax, 80(%rsp)
	testq	%rax, %rax
	je	.L391
	testl	%ebx, %ebx
	movl	12(%rsp), %r9d
	jle	.L412
	movl	%ebp, %eax
	leal	-1(%r12), %ebx
	movl	$1, %r11d
	movl	$0, 12(%rsp)
	imull	%r12d, %eax
	movl	%ebx, %ecx
	movl	%ebx, %esi
	movl	%ebx, 36(%rsp)
	leal	-10(%r9,%rbp,8), %r10d
	movl	$0, 16(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r9d, %eax
	imull	%r12d, %eax
	movl	%eax, 20(%rsp)
	leal	-2(%r12), %eax
	cmpl	$-1, %eax
	cmovge	%r12d, %r11d
	setl	%dil
	cmpl	$1, %ebx
	setbe	%al
	leal	-1(%r11), %r13d
	orl	%edi, %eax
	movl	%r11d, %edx
	movl	%r11d, 40(%rsp)
	movb	%al, 211(%rsp)
	movl	%r13d, %eax
	movl	%r13d, %ebp
	shrl	%eax
	salq	$4, %rax
	movq	%rax, 176(%rsp)
	movl	%r13d, %eax
	andl	$-2, %eax
	subl	%eax, %ecx
	movl	%ecx, 212(%rsp)
	leaq	0(,%rax,8), %rcx
	leaq	(%rax,%rax,2), %rax
	addq	%rax, %rax
	cmpl	$6, %ebx
	movq	%rcx, 216(%rsp)
	movq	%rax, 224(%rsp)
	setbe	%al
	shrl	$3, %edx
	orl	%edi, %eax
	movb	%al, 75(%rsp)
	movq	%rdx, %rax
	salq	$6, %rax
	movq	%rax, 88(%rsp)
	movl	%r11d, %eax
	andl	$-8, %eax
	leaq	0(,%rax,8), %rcx
	subl	%eax, %esi
	cmpl	$7, %ebx
	movl	%eax, 44(%rsp)
	movq	%rcx, 48(%rsp)
	leaq	0(,%rax,4), %rcx
	movq	%rcx, 56(%rsp)
	setbe	%cl
	orl	%edi, %ecx
	movl	%esi, 76(%rsp)
	movl	%ebx, %esi
	movb	%cl, 99(%rsp)
	movl	%r13d, %ecx
	shrl	$3, %ecx
	movq	%rcx, %rbx
	salq	$6, %rbx
	movq	%rbx, 200(%rsp)
	movl	%r13d, %ebx
	andl	$-8, %ebx
	subl	%ebx, %esi
	movl	%esi, 100(%rsp)
	movl	%ebx, %esi
	leaq	0(,%rsi,8), %r8
	movq	%r8, 184(%rsp)
	leaq	(%rsi,%rsi), %r8
	movq	%r8, 104(%rsp)
	leaq	(%rax,%rax), %r8
	addq	%r8, %rax
	movq	%r8, 232(%rsp)
	addq	%rax, %rax
	movq	%rax, 240(%rsp)
	movq	%rdx, %rax
	salq	$5, %rax
	cmpl	$1, %r12d
	movq	%rax, 192(%rsp)
	sete	%al
	salq	$4, %rdx
	xorl	%r14d, %r14d
	orl	%edi, %eax
	movq	%rdx, %r13
	movb	%al, 299(%rsp)
	movl	%r11d, %eax
	shrl	%eax
	leaq	0(,%rax,8), %rdi
	salq	$2, %rax
	movq	%rdi, 168(%rsp)
	movl	%r11d, %edi
	andl	$-2, %edi
	movq	%rax, 272(%rsp)
	movl	%r10d, %eax
	leaq	0(,%rdi,4), %r11
	movq	%r11, 248(%rsp)
	leaq	(%rdi,%rdi), %r11
	addq	%r11, %rdi
	movq	%r11, 256(%rsp)
	movl	%ebx, %r11d
	addq	%rdi, %rdi
	movq	%rdi, 120(%rsp)
	movq	%rcx, %rdi
	leaq	0(,%rsi,4), %rcx
	movq	%rcx, 160(%rsp)
	salq	$4, %rdi
	movq	%r10, %rcx
	movq	%r15, 24(%rsp)
	movq	80(%rsp), %r15
	movq	%rdi, %r12
.L474:
	movl	16(%rsp), %r10d
	movq	24(%rsp), %rbx
	leaq	(%rbx,%r10,2), %rbx
	movq	%rbx, 112(%rsp)
	movl	12(%rsp), %ebx
	leaq	(%rbx,%rbx), %rsi
	leaq	(%r15,%rsi), %r9
	cmpl	$25, %eax
	ja	.L393
	leaq	.L395(%rip), %rdi
	movslq	(%rdi,%rcx,4), %rdx
	addq	%rdi, %rdx
	jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L395:
	.long	.L525-.L395
	.long	.L526-.L395
	.long	.L580-.L395
	.long	.L393-.L395
	.long	.L393-.L395
	.long	.L393-.L395
	.long	.L393-.L395
	.long	.L581-.L395
	.long	.L393-.L395
	.long	.L529-.L395
	.long	.L530-.L395
	.long	.L393-.L395
	.long	.L393-.L395
	.long	.L393-.L395
	.long	.L393-.L395
	.long	.L582-.L395
	.long	.L583-.L395
	.long	.L393-.L395
	.long	.L533-.L395
	.long	.L393-.L395
	.long	.L393-.L395
	.long	.L393-.L395
	.long	.L393-.L395
	.long	.L534-.L395
	.long	.L535-.L395
	.long	.L584-.L395
	.text
	.p2align 4,,10
	.p2align 3
.L593:
	movl	%r8d, 12(%rsp)
	movq	64(%rsp), %r12
	movl	%esi, %ebp
	movl	%r10d, 16(%rsp)
	movq	112(%rsp), %r13
	movl	128(%rsp), %r11d
	movl	136(%rsp), %eax
	.p2align 4,,10
	.p2align 3
.L407:
	movl	8(%rsp), %ebx
	addl	$1, %r14d
	movl	32(%rsp), %edi
	addl	%edi, 16(%rsp)
	movl	20(%rsp), %edi
	addl	%edi, 12(%rsp)
	cmpl	%ebx, %r14d
	jne	.L474
.L611:
	movq	24(%rsp), %r15
.L412:
	movq	%r15, %rdi
	call	free@PLT
.L388:
	movq	80(%rsp), %rax
	addq	$328, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L475:
	.cfi_restore_state
	movq	%rdi, 80(%rsp)
	jmp	.L388
	.p2align 4,,10
	.p2align 3
.L393:
	leaq	__PRETTY_FUNCTION__.42(%rip), %rcx
	movl	$1847, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	call	__assert_fail@PLT
.L535:
	movq	%r13, 128(%rsp)
	movl	40(%rsp), %r8d
	pxor	%xmm8, %xmm8
	movl	36(%rsp), %r13d
	movl	%r11d, 136(%rsp)
	movl	%ebp, 144(%rsp)
	movl	12(%rsp), %edi
	andl	$7, %r8d
	movl	%eax, 152(%rsp)
	movdqa	.LC20(%rip), %xmm7
	movq	112(%rsp), %rax
	movq	%r12, 64(%rsp)
	movl	16(%rsp), %r11d
	movq	24(%rsp), %rbp
	movq	%rcx, 112(%rsp)
	movdqa	.LC21(%rip), %xmm6
	movdqa	.LC22(%rip), %xmm5
	testl	%r13d, %r13d
	js	.L595
	.p2align 4,,10
	.p2align 3
.L622:
	cmpb	$0, 75(%rsp)
	jne	.L481
	movq	88(%rsp), %rsi
	movq	%rax, %rdx
	movq	%r9, %rcx
	addq	%rax, %rsi
	.p2align 4,,10
	.p2align 3
.L461:
	movdqu	(%rdx), %xmm9
	movdqu	16(%rdx), %xmm3
	addq	$64, %rdx
	addq	$32, %rcx
	movdqu	-32(%rdx), %xmm0
	movdqu	-16(%rdx), %xmm4
	movdqa	%xmm9, %xmm2
	movdqa	%xmm9, %xmm1
	punpcklwd	%xmm3, %xmm9
	punpcklwd	%xmm3, %xmm2
	punpckhwd	%xmm3, %xmm1
	movdqa	%xmm0, %xmm3
	movdqa	%xmm2, %xmm10
	punpcklwd	%xmm1, %xmm9
	punpcklwd	%xmm1, %xmm2
	punpckhwd	%xmm1, %xmm10
	movdqa	%xmm0, %xmm1
	punpckhwd	%xmm4, %xmm3
	punpcklwd	%xmm4, %xmm1
	punpcklwd	%xmm10, %xmm2
	punpckhwd	%xmm10, %xmm9
	movdqa	%xmm1, %xmm10
	punpcklwd	%xmm3, %xmm1
	punpcklwd	%xmm4, %xmm0
	punpckhwd	%xmm3, %xmm10
	movdqa	%xmm2, %xmm4
	punpcklwd	%xmm3, %xmm0
	punpcklwd	%xmm10, %xmm1
	movdqa	%xmm2, %xmm3
	punpckhwd	%xmm10, %xmm0
	punpcklwd	%xmm1, %xmm4
	punpckhwd	%xmm1, %xmm3
	punpcklwd	%xmm1, %xmm2
	movdqa	%xmm4, %xmm10
	punpcklwd	%xmm3, %xmm2
	punpcklwd	%xmm3, %xmm4
	punpckhwd	%xmm3, %xmm10
	movdqa	%xmm9, %xmm3
	movdqa	%xmm9, %xmm1
	punpcklwd	%xmm0, %xmm3
	punpckhwd	%xmm0, %xmm1
	punpcklwd	%xmm10, %xmm4
	punpckhwd	%xmm10, %xmm2
	movdqa	%xmm3, %xmm10
	punpcklwd	%xmm0, %xmm9
	punpckhwd	%xmm1, %xmm10
	punpcklwd	%xmm1, %xmm3
	punpcklwd	%xmm1, %xmm9
	punpcklwd	%xmm10, %xmm3
	punpckhwd	%xmm10, %xmm9
	movdqa	%xmm4, %xmm10
	pmullw	%xmm7, %xmm10
	pmulhuw	%xmm7, %xmm4
	movdqa	%xmm3, %xmm1
	pmullw	%xmm6, %xmm1
	pmulhuw	%xmm6, %xmm3
	movdqa	%xmm10, %xmm11
	punpckhwd	%xmm4, %xmm10
	movdqa	%xmm1, %xmm0
	punpcklwd	%xmm4, %xmm11
	punpckhwd	%xmm3, %xmm1
	punpcklwd	%xmm3, %xmm0
	paddd	%xmm10, %xmm1
	paddd	%xmm11, %xmm0
	movdqa	%xmm2, %xmm11
	pmullw	%xmm5, %xmm11
	pmulhuw	%xmm5, %xmm2
	movdqa	%xmm11, %xmm12
	punpckhwd	%xmm2, %xmm11
	punpcklwd	%xmm2, %xmm12
	paddd	%xmm11, %xmm1
	paddd	%xmm12, %xmm0
	psrad	$8, %xmm1
	psrad	$8, %xmm0
	movdqa	%xmm0, %xmm2
	punpcklwd	%xmm1, %xmm0
	punpckhwd	%xmm1, %xmm2
	movdqa	%xmm0, %xmm1
	punpckhwd	%xmm2, %xmm1
	punpcklwd	%xmm2, %xmm0
	punpcklwd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	punpckhwd	%xmm9, %xmm0
	punpcklwd	%xmm9, %xmm1
	movups	%xmm0, -16(%rcx)
	movups	%xmm1, -32(%rcx)
	cmpq	%rdx, %rsi
	jne	.L461
	movq	48(%rsp), %rcx
	addq	%rcx, %rax
	movq	56(%rsp), %rcx
	addq	%rcx, %r9
	testl	%r8d, %r8d
	je	.L464
	movl	44(%rsp), %ecx
	movl	76(%rsp), %esi
.L460:
	movl	40(%rsp), %edx
	subl	%ecx, %edx
	leal	-1(%rdx), %r12d
	cmpl	$2, %r12d
	jbe	.L465
	leaq	(%r10,%rcx,4), %r10
	leaq	(%rbx,%rcx,2), %rcx
	leaq	0(%rbp,%r10,2), %r10
	leaq	(%r15,%rcx,2), %rcx
	movq	(%r10), %xmm2
	movq	8(%r10), %xmm1
	movq	16(%r10), %xmm0
	movq	24(%r10), %xmm4
	movdqa	%xmm2, %xmm9
	movdqa	%xmm2, %xmm3
	punpcklwd	%xmm1, %xmm2
	punpcklwd	%xmm1, %xmm9
	punpcklwd	%xmm1, %xmm3
	movdqa	%xmm0, %xmm1
	pshufd	$78, %xmm9, %xmm9
	punpcklwd	%xmm4, %xmm1
	punpcklwd	%xmm9, %xmm3
	punpcklwd	%xmm9, %xmm2
	movdqa	%xmm0, %xmm9
	punpcklwd	%xmm4, %xmm9
	punpcklwd	%xmm4, %xmm0
	movdqa	%xmm3, %xmm4
	pshufd	$78, %xmm9, %xmm9
	pshufd	$78, %xmm2, %xmm2
	punpcklwd	%xmm9, %xmm1
	punpcklwd	%xmm9, %xmm0
	movdqa	%xmm3, %xmm9
	punpcklwd	%xmm1, %xmm4
	pshufd	$78, %xmm0, %xmm0
	punpcklwd	%xmm1, %xmm9
	pshufd	$78, %xmm4, %xmm4
	punpcklwd	%xmm1, %xmm3
	movdqa	%xmm2, %xmm1
	punpcklwd	%xmm4, %xmm9
	punpcklwd	%xmm4, %xmm3
	punpcklwd	%xmm0, %xmm1
	movdqa	%xmm2, %xmm4
	pshufd	$78, %xmm1, %xmm1
	movdqa	%xmm9, %xmm11
	punpcklwd	%xmm0, %xmm4
	punpcklwd	%xmm8, %xmm11
	punpcklwd	%xmm0, %xmm2
	punpcklwd	%xmm1, %xmm4
	pshufd	$78, %xmm3, %xmm3
	punpcklwd	%xmm1, %xmm2
	movdqa	%xmm4, %xmm12
	punpcklwd	%xmm8, %xmm4
	movdqa	%xmm3, %xmm1
	pshufd	$78, %xmm4, %xmm4
	punpcklwd	%xmm8, %xmm12
	punpcklwd	%xmm8, %xmm1
	movdqa	%xmm4, %xmm0
	pslld	$2, %xmm4
	movdqa	%xmm12, %xmm10
	paddd	%xmm0, %xmm4
	movdqa	%xmm11, %xmm0
	punpcklwd	%xmm8, %xmm9
	pslld	$2, %xmm0
	pslld	$2, %xmm10
	pshufd	$78, %xmm9, %xmm9
	paddd	%xmm11, %xmm0
	paddd	%xmm12, %xmm10
	punpcklwd	%xmm8, %xmm3
	pshufd	$78, %xmm3, %xmm3
	pshufd	$78, %xmm2, %xmm2
	pslld	$2, %xmm0
	psubd	%xmm11, %xmm0
	pslld	$2, %xmm0
	paddd	%xmm11, %xmm0
	movdqa	%xmm10, %xmm11
	pslld	$4, %xmm11
	psubd	%xmm10, %xmm11
	movdqa	%xmm1, %xmm10
	pslld	$3, %xmm10
	psubd	%xmm1, %xmm10
	pslld	$1, %xmm11
	paddd	%xmm11, %xmm0
	pslld	$2, %xmm10
	paddd	%xmm10, %xmm1
	paddd	%xmm1, %xmm0
	movdqa	%xmm9, %xmm1
	pslld	$2, %xmm1
	paddd	%xmm9, %xmm1
	psrad	$8, %xmm0
	pslld	$2, %xmm1
	psubd	%xmm9, %xmm1
	pslld	$2, %xmm1
	paddd	%xmm9, %xmm1
	movdqa	%xmm4, %xmm9
	pslld	$4, %xmm9
	psubd	%xmm4, %xmm9
	movdqa	%xmm3, %xmm4
	pslld	$3, %xmm4
	psubd	%xmm3, %xmm4
	pslld	$1, %xmm9
	paddd	%xmm9, %xmm1
	pslld	$2, %xmm4
	paddd	%xmm4, %xmm3
	paddd	%xmm3, %xmm1
	movdqa	%xmm0, %xmm3
	psrad	$8, %xmm1
	punpcklwd	%xmm1, %xmm3
	punpcklwd	%xmm1, %xmm0
	pshufd	$78, %xmm3, %xmm3
	punpcklwd	%xmm3, %xmm0
	movdqa	%xmm0, %xmm1
	punpcklwd	%xmm2, %xmm0
	punpcklwd	%xmm2, %xmm1
	pshufd	$78, %xmm0, %xmm0
	movq	%xmm1, (%rcx)
	movq	%xmm0, 8(%rcx)
	testb	$3, %dl
	je	.L464
	andl	$-4, %edx
	subl	%edx, %esi
	leaq	(%rax,%rdx,8), %rax
	leaq	(%r9,%rdx,4), %r9
.L465:
	movzwl	(%rax), %edx
	movzwl	2(%rax), %ecx
	imull	$77, %edx, %edx
	imull	$150, %ecx, %ecx
	addl	%ecx, %edx
	movzwl	4(%rax), %ecx
	imull	$29, %ecx, %ecx
	addl	%ecx, %edx
	sarl	$8, %edx
	movw	%dx, (%r9)
	movzwl	6(%rax), %edx
	movw	%dx, 2(%r9)
	testl	%esi, %esi
	je	.L464
	movzwl	10(%rax), %edx
	movzwl	8(%rax), %ecx
	imull	$150, %edx, %edx
	imull	$77, %ecx, %ecx
	addl	%ecx, %edx
	movzwl	12(%rax), %ecx
	imull	$29, %ecx, %ecx
	addl	%ecx, %edx
	movzwl	14(%rax), %ecx
	sarl	$8, %edx
	movzwl	%dx, %edx
	sall	$16, %ecx
	orl	%edx, %ecx
	movl	%ecx, 4(%r9)
	cmpl	$1, %esi
	je	.L464
	movzwl	16(%rax), %edx
	movzwl	18(%rax), %ecx
	imull	$77, %edx, %edx
	imull	$150, %ecx, %ecx
	addl	%ecx, %edx
	movzwl	20(%rax), %ecx
	movzwl	22(%rax), %eax
	imull	$29, %ecx, %ecx
	sall	$16, %eax
	addl	%ecx, %edx
	sarl	$8, %edx
	movzwl	%dx, %edx
	orl	%edx, %eax
	movl	%eax, 8(%r9)
.L464:
	movl	32(%rsp), %eax
	addl	$1, %r14d
	addl	%eax, %r11d
	movl	20(%rsp), %eax
	addl	%eax, %edi
	cmpl	%r14d, 8(%rsp)
	je	.L612
	movl	%r11d, %r10d
	movl	%edi, %ebx
	leaq	0(%rbp,%r10,2), %rax
	leaq	(%r15,%rbx,2), %r9
	testl	%r13d, %r13d
	jns	.L622
.L595:
	movq	64(%rsp), %r12
	movl	%r11d, 16(%rsp)
	movl	144(%rsp), %ebp
	movl	%edi, 12(%rsp)
	movq	128(%rsp), %r13
	movl	136(%rsp), %r11d
	movl	152(%rsp), %eax
	movq	112(%rsp), %rcx
	jmp	.L407
.L533:
	movl	40(%rsp), %edi
	movl	%ebp, 304(%rsp)
	movl	36(%rsp), %ebp
	movl	%r11d, 300(%rsp)
	movq	%r10, %r11
	andl	$7, %edi
	movl	%r14d, 64(%rsp)
	movq	112(%rsp), %r8
	movl	%edi, 264(%rsp)
	movq	%r12, 280(%rsp)
	movq	%r13, 288(%rsp)
	movl	%eax, 308(%rsp)
	movq	%rcx, 312(%rsp)
	testl	%ebp, %ebp
	js	.L591
	.p2align 4,,10
	.p2align 3
.L623:
	cmpb	$0, 75(%rsp)
	jne	.L479
	movq	88(%rsp), %rdi
	movq	%r9, 112(%rsp)
	movq	%r8, %rdx
	movq	%r9, %rax
	movq	%r8, 128(%rsp)
	leaq	6(%r15,%rsi), %rcx
	movq	%r11, 136(%rsp)
	leaq	(%rdi,%r9), %r14
	movq	%rbx, 144(%rsp)
	movq	%r15, 152(%rsp)
	.p2align 4,,10
	.p2align 3
.L443:
	movzwl	32(%rdx), %esi
	movzwl	30(%rdx), %edi
	addq	$64, %rax
	addq	$48, %rdx
	movzwl	-38(%rdx), %r12d
	movzwl	-44(%rdx), %r13d
	addq	$64, %rcx
	movzwl	-2(%rdx), %r8d
	movzwl	-8(%rdx), %r9d
	sall	$16, %esi
	movzwl	-14(%rdx), %r10d
	movl	-48(%rdx), %r15d
	orl	%edi, %esi
	movl	$-1, %edi
	movd	-42(%rdx), %xmm5
	movd	-36(%rdx), %xmm4
	movzwl	-20(%rdx), %r11d
	movd	-24(%rdx), %xmm2
	movzwl	-26(%rdx), %ebx
	movd	-30(%rdx), %xmm3
	movzwl	-32(%rdx), %ebp
	movd	-6(%rdx), %xmm0
	movd	-12(%rdx), %xmm1
	movl	%r15d, -64(%rax)
	movl	$-1, %r15d
	movw	%r13w, -60(%rax)
	movl	$-1, %r13d
	movw	%r12w, -52(%rax)
	movl	$-1, %r12d
	movl	%esi, -24(%rax)
	movl	$-1, %esi
	movw	%r10w, -20(%rax)
	movl	$-1, %r10d
	movw	%r9w, -12(%rax)
	movl	$-1, %r9d
	movd	%xmm5, -56(%rax)
	movd	%xmm4, -48(%rax)
	movw	%bp, -44(%rax)
	movd	%xmm3, -40(%rax)
	movw	%bx, -36(%rax)
	movd	%xmm2, -32(%rax)
	movw	%r11w, -28(%rax)
	movd	%xmm1, -16(%rax)
	movd	%xmm0, -8(%rax)
	movw	%r8w, -4(%rax)
	movl	$-1, %r8d
	movw	%r12w, -64(%rcx)
	movw	%r13w, -56(%rcx)
	movw	%r15w, -48(%rcx)
	movw	%si, -40(%rcx)
	movw	%di, -32(%rcx)
	movw	%r8w, -24(%rcx)
	movw	%r9w, -16(%rcx)
	movw	%r10w, -8(%rcx)
	cmpq	%r14, %rax
	jne	.L443
	movq	240(%rsp), %rax
	movq	128(%rsp), %r8
	movq	112(%rsp), %r9
	movl	264(%rsp), %ebp
	addq	%rax, %r8
	movq	48(%rsp), %rax
	movq	136(%rsp), %r11
	movq	144(%rsp), %rbx
	movq	152(%rsp), %r15
	addq	%rax, %r9
	testl	%ebp, %ebp
	je	.L446
	movl	44(%rsp), %eax
	movl	76(%rsp), %edi
.L442:
	movl	40(%rsp), %ecx
	subl	%eax, %ecx
	leal	-1(%rcx), %edx
	cmpl	$2, %edx
	jbe	.L447
	movq	24(%rsp), %rsi
	leaq	(%rax,%rax,2), %rdx
	addq	%r11, %rdx
	leaq	(%rsi,%rdx,2), %rdx
	leaq	(%rbx,%rax,4), %rsi
	movzwl	22(%rdx), %r10d
	movzwl	4(%rdx), %r14d
	addq	%rsi, %rsi
	movzwl	10(%rdx), %r12d
	movl	6(%rdx), %r13d
	leaq	(%r15,%rsi), %rax
	leaq	6(%r15,%rsi), %rsi
	movl	18(%rdx), %r11d
	movzwl	16(%rdx), %ebx
	movl	12(%rdx), %ebp
	movl	(%rdx), %edx
	movw	%r10w, 28(%rax)
	movl	$-1, %r10d
	movw	%r14w, 4(%rax)
	movl	%edx, (%rax)
	movl	$-1, %edx
	movl	%r13d, 8(%rax)
	movw	%r12w, 12(%rax)
	movl	%ebp, 16(%rax)
	movw	%bx, 20(%rax)
	movl	%r11d, 24(%rax)
	movl	$-1, %eax
	movw	%ax, (%rsi)
	movl	$-1, %eax
	movw	%ax, 8(%rsi)
	movw	%dx, 16(%rsi)
	movw	%r10w, 24(%rsi)
	testb	$3, %cl
	je	.L446
	andl	$-4, %ecx
	leaq	(%rcx,%rcx,2), %rax
	subl	%ecx, %edi
	leaq	(%r9,%rcx,8), %r9
	leaq	(%r8,%rax,2), %r8
.L447:
	movzwl	(%r8), %eax
	movw	%ax, (%r9)
	movzwl	2(%r8), %eax
	movw	%ax, 2(%r9)
	movzwl	4(%r8), %eax
	movw	%ax, 4(%r9)
	movl	$-1, %eax
	movw	%ax, 6(%r9)
	testl	%edi, %edi
	je	.L446
	movl	6(%r8), %eax
	movl	%eax, 8(%r9)
	movzwl	10(%r8), %eax
	movw	%ax, 12(%r9)
	movl	$-1, %eax
	movw	%ax, 14(%r9)
	cmpl	$1, %edi
	je	.L446
	movl	12(%r8), %eax
	movl	%eax, 16(%r9)
	movzwl	16(%r8), %eax
	movw	%ax, 20(%r9)
	movl	$-1, %eax
	movw	%ax, 22(%r9)
.L446:
	movl	32(%rsp), %edi
	addl	$1, 64(%rsp)
	addl	%edi, 16(%rsp)
	movl	64(%rsp), %eax
	movl	20(%rsp), %edi
	addl	%edi, 12(%rsp)
	cmpl	%eax, 8(%rsp)
	je	.L611
	movl	12(%rsp), %ebx
	movl	16(%rsp), %r11d
	movq	24(%rsp), %rax
	movl	36(%rsp), %ebp
	leaq	(%rbx,%rbx), %rsi
	leaq	(%rax,%r11,2), %r8
	leaq	(%r15,%rsi), %r9
	testl	%ebp, %ebp
	jns	.L623
.L591:
	movl	64(%rsp), %r14d
	movq	280(%rsp), %r12
	movq	288(%rsp), %r13
	movl	300(%rsp), %r11d
	movl	304(%rsp), %ebp
	movl	308(%rsp), %eax
	movq	312(%rsp), %rcx
	jmp	.L407
.L529:
	movl	40(%rsp), %r8d
	movl	36(%rsp), %ebx
	movq	%r12, 64(%rsp)
	movl	%r11d, 128(%rsp)
	movq	112(%rsp), %rsi
	movl	%ebp, 136(%rsp)
	movl	12(%rsp), %r10d
	andl	$1, %r8d
	movl	20(%rsp), %r12d
	movl	16(%rsp), %r11d
	movq	%r13, 112(%rsp)
	movl	%eax, 144(%rsp)
	movl	32(%rsp), %r13d
	movq	%rcx, 152(%rsp)
	movzbl	299(%rsp), %ebp
	testl	%ebx, %ebx
	js	.L589
	.p2align 4,,10
	.p2align 3
.L624:
	testb	%bpl, %bpl
	jne	.L430
	movq	168(%rsp), %rdi
	movq	%rsi, %rdx
	movq	%r9, %rax
	addq	%rsi, %rdi
	.p2align 4,,10
	.p2align 3
.L431:
	movzwl	(%rdx), %ecx
	addq	$8, %rdx
	addq	$12, %rax
	movd	%ecx, %xmm0
	movzwl	-4(%rdx), %ecx
	pshuflw	$224, %xmm0, %xmm1
	movd	%ecx, %xmm5
	pinsrw	$1, %ecx, %xmm0
	movd	%xmm1, -12(%rax)
	movd	%xmm0, -8(%rax)
	pshuflw	$0, %xmm5, %xmm0
	movd	%xmm0, -4(%rax)
	cmpq	%rdx, %rdi
	jne	.L431
	testl	%r8d, %r8d
	je	.L434
	movq	248(%rsp), %rax
	addq	%rax, %rsi
	movq	120(%rsp), %rax
	addq	%rax, %r9
.L430:
	movzwl	(%rsi), %eax
	movd	%eax, %xmm6
	movw	%ax, 4(%r9)
	pshuflw	$0, %xmm6, %xmm0
	movd	%xmm0, (%r9)
.L434:
	addl	$1, %r14d
	addl	%r13d, %r11d
	addl	%r12d, %r10d
	cmpl	%r14d, 8(%rsp)
	je	.L611
	movq	24(%rsp), %rcx
	movl	%r11d, %eax
	leaq	(%rcx,%rax,2), %rsi
	movl	%r10d, %eax
	leaq	(%r15,%rax,2), %r9
	testl	%ebx, %ebx
	jns	.L624
.L589:
	movq	64(%rsp), %r12
	movq	112(%rsp), %r13
	movl	%r11d, 16(%rsp)
	movl	%r10d, 12(%rsp)
	movl	128(%rsp), %r11d
	movl	136(%rsp), %ebp
	movl	144(%rsp), %eax
	movq	152(%rsp), %rcx
	jmp	.L407
.L582:
	movl	%eax, 136(%rsp)
	movq	112(%rsp), %rdx
	movl	%ebp, %esi
	movl	12(%rsp), %r8d
	movl	16(%rsp), %r10d
	movq	%r12, 64(%rsp)
	movl	20(%rsp), %ebx
	movl	32(%rsp), %ebp
	movq	%r13, 112(%rsp)
	movl	%r11d, 128(%rsp)
	movq	24(%rsp), %r13
	movl	36(%rsp), %r11d
	movl	8(%rsp), %r12d
	.p2align 4,,10
	.p2align 3
.L400:
	testl	%r11d, %r11d
	js	.L593
	movl	%r14d, 12(%rsp)
	movl	%r11d, %edi
	.p2align 4,,10
	.p2align 3
.L449:
	movzwl	(%rdx), %eax
	movzwl	2(%rdx), %r14d
	subl	$1, %edi
	addq	$6, %rdx
	addq	$2, %r9
	imull	$150, %r14d, %r14d
	imull	$77, %eax, %eax
	addl	%r14d, %eax
	movzwl	-2(%rdx), %r14d
	imull	$29, %r14d, %r14d
	addl	%r14d, %eax
	sarl	$8, %eax
	movw	%ax, -2(%r9)
	cmpl	$-1, %edi
	jne	.L449
	movl	12(%rsp), %r14d
	addl	%ebp, %r10d
	addl	%ebx, %r8d
	addl	$1, %r14d
	cmpl	%r12d, %r14d
	je	.L606
	movl	%r10d, %eax
	leaq	0(%r13,%rax,2), %rdx
	movl	%r8d, %eax
	leaq	(%r15,%rax,2), %r9
	jmp	.L400
.L530:
	movq	%r12, 64(%rsp)
	movl	40(%rsp), %r8d
	movl	36(%rsp), %r12d
	movq	%r13, 128(%rsp)
	movl	%r11d, 136(%rsp)
	movl	12(%rsp), %edi
	andl	$7, %r8d
	movl	%ebp, 144(%rsp)
	movl	16(%rsp), %r11d
	movq	%rcx, 264(%rsp)
	movzbl	75(%rsp), %r13d
	movl	%eax, 152(%rsp)
	movq	24(%rsp), %rbp
	movq	112(%rsp), %rcx
	testl	%r12d, %r12d
	js	.L590
	.p2align 4,,10
	.p2align 3
.L625:
	testb	%r13b, %r13b
	jne	.L478
	movq	192(%rsp), %rsi
	movq	%rcx, %rdx
	movq	%r9, %rax
	addq	%rcx, %rsi
	.p2align 4,,10
	.p2align 3
.L436:
	movdqu	(%rdx), %xmm1
	movdqu	16(%rdx), %xmm3
	addq	$32, %rdx
	addq	$64, %rax
	movdqa	%xmm1, %xmm0
	movdqa	%xmm1, %xmm2
	punpcklwd	%xmm3, %xmm1
	punpcklwd	%xmm3, %xmm0
	punpckhwd	%xmm3, %xmm2
	movdqa	%xmm0, %xmm4
	punpcklwd	%xmm2, %xmm0
	punpcklwd	%xmm2, %xmm1
	punpckhwd	%xmm2, %xmm4
	punpcklwd	%xmm4, %xmm0
	punpckhwd	%xmm4, %xmm1
	movdqa	%xmm0, %xmm3
	movdqa	%xmm0, %xmm2
	movdqa	%xmm0, %xmm4
	punpcklwd	%xmm0, %xmm3
	punpckhwd	%xmm0, %xmm2
	punpcklwd	%xmm1, %xmm4
	punpckhwd	%xmm1, %xmm0
	movdqa	%xmm3, %xmm1
	punpckhwd	%xmm4, %xmm3
	punpcklwd	%xmm4, %xmm1
	movups	%xmm3, -48(%rax)
	movups	%xmm1, -64(%rax)
	movdqa	%xmm2, %xmm1
	punpckhwd	%xmm0, %xmm2
	punpcklwd	%xmm0, %xmm1
	movups	%xmm2, -16(%rax)
	movups	%xmm1, -32(%rax)
	cmpq	%rsi, %rdx
	jne	.L436
	movq	56(%rsp), %rax
	addq	%rax, %rcx
	movq	48(%rsp), %rax
	addq	%rax, %r9
	testl	%r8d, %r8d
	je	.L439
	movl	44(%rsp), %edx
.L435:
	movl	40(%rsp), %esi
	subl	%edx, %esi
	cmpl	$1, %esi
	je	.L440
	leaq	(%r10,%rdx,2), %r10
	leaq	(%rbx,%rdx,4), %rdx
	leaq	0(%rbp,%r10,2), %r10
	leaq	(%r15,%rdx,2), %rdx
	movq	(%r10), %xmm0
	leal	-1(%rsi), %eax
	pshuflw	$64, %xmm0, %xmm0
	movq	%xmm0, (%rdx)
	cmpl	$2, %esi
	je	.L441
	movq	4(%r10), %xmm0
	pshuflw	$64, %xmm0, %xmm0
	movq	%xmm0, 8(%rdx)
	cmpl	$2, %eax
	je	.L441
	movq	8(%r10), %xmm0
	pshuflw	$64, %xmm0, %xmm0
	movq	%xmm0, 16(%rdx)
	cmpl	$3, %eax
	je	.L441
	movq	12(%r10), %xmm0
	pshuflw	$64, %xmm0, %xmm0
	movq	%xmm0, 24(%rdx)
	cmpl	$4, %eax
	je	.L441
	movq	16(%r10), %xmm0
	pshuflw	$64, %xmm0, %xmm0
	movq	%xmm0, 32(%rdx)
	cmpl	$5, %eax
	je	.L441
	movq	20(%r10), %xmm0
	pshuflw	$64, %xmm0, %xmm0
	movq	%xmm0, 40(%rdx)
.L441:
	leaq	(%rcx,%rax,4), %rcx
	leaq	(%r9,%rax,8), %r9
.L440:
	movzwl	(%rcx), %eax
	movw	%ax, 4(%r9)
	movw	%ax, 2(%r9)
	movw	%ax, (%r9)
	movzwl	2(%rcx), %eax
	movw	%ax, 6(%r9)
.L439:
	movl	32(%rsp), %eax
	addl	$1, %r14d
	addl	%eax, %r11d
	movl	20(%rsp), %eax
	addl	%eax, %edi
	cmpl	%r14d, 8(%rsp)
	je	.L612
	movl	%r11d, %r10d
	movl	%edi, %ebx
	leaq	0(%rbp,%r10,2), %rcx
	leaq	(%r15,%rbx,2), %r9
	testl	%r12d, %r12d
	jns	.L625
.L590:
	movl	%edi, 12(%rsp)
	movl	%r11d, 16(%rsp)
.L620:
	movq	64(%rsp), %r12
	movq	128(%rsp), %r13
	movl	136(%rsp), %r11d
	movl	144(%rsp), %ebp
	movl	152(%rsp), %eax
	movq	264(%rsp), %rcx
	jmp	.L407
.L526:
	movl	%r11d, 136(%rsp)
	movl	40(%rsp), %edi
	movl	36(%rsp), %r11d
	movq	%r12, 64(%rsp)
	movq	%r13, 128(%rsp)
	movl	12(%rsp), %r8d
	andl	$1, %edi
	movl	%ebp, 144(%rsp)
	movl	16(%rsp), %r10d
	movq	%rcx, 264(%rsp)
	movzbl	299(%rsp), %ebx
	movl	32(%rsp), %r12d
	movl	20(%rsp), %ebp
	movl	%eax, 152(%rsp)
	movq	272(%rsp), %r13
	movq	112(%rsp), %rcx
	testl	%r11d, %r11d
	js	.L586
	.p2align 4,,10
	.p2align 3
.L626:
	testb	%bl, %bl
	jne	.L416
	movq	%rcx, %rdx
	movq	%r9, %rax
	leaq	0(%r13,%rcx), %rsi
	.p2align 4,,10
	.p2align 3
.L417:
	movd	(%rdx), %xmm0
	addq	$4, %rdx
	addq	$12, %rax
	pshuflw	$224, %xmm0, %xmm1
	movd	%xmm0, -8(%rax)
	movd	%xmm1, -12(%rax)
	pshuflw	$225, %xmm0, %xmm1
	punpcklwd	%xmm0, %xmm1
	pshuflw	$236, %xmm1, %xmm1
	movd	%xmm1, -4(%rax)
	cmpq	%rdx, %rsi
	jne	.L417
	testl	%edi, %edi
	je	.L420
	movq	256(%rsp), %rax
	addq	%rax, %rcx
	movq	120(%rsp), %rax
	addq	%rax, %r9
.L416:
	movzwl	(%rcx), %eax
	movd	%eax, %xmm6
	movw	%ax, 4(%r9)
	pshuflw	$0, %xmm6, %xmm0
	movd	%xmm0, (%r9)
.L420:
	addl	$1, %r14d
	addl	%r12d, %r10d
	addl	%ebp, %r8d
	cmpl	%r14d, 8(%rsp)
	je	.L611
	movq	24(%rsp), %rcx
	movl	%r10d, %eax
	leaq	(%rcx,%rax,2), %rcx
	movl	%r8d, %eax
	leaq	(%r15,%rax,2), %r9
	testl	%r11d, %r11d
	jns	.L626
.L586:
	movl	%r8d, 12(%rsp)
	movl	%r10d, 16(%rsp)
	jmp	.L620
.L525:
	movl	40(%rsp), %r8d
	movl	12(%rsp), %edi
	movl	%r11d, 128(%rsp)
	pcmpeqd	%xmm1, %xmm1
	movl	%ebp, 136(%rsp)
	movl	16(%rsp), %r11d
	andl	$7, %r8d
	movl	%eax, 144(%rsp)
	movq	.LC19(%rip), %xmm3
	movq	112(%rsp), %rax
	movq	24(%rsp), %rbp
	movl	%r8d, 12(%rsp)
	movl	36(%rsp), %r8d
	movq	%r12, 64(%rsp)
	movq	%rcx, 112(%rsp)
	testl	%r8d, %r8d
	js	.L585
	.p2align 4,,10
	.p2align 3
.L627:
	cmpb	$0, 75(%rsp)
	jne	.L476
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L409:
	movdqu	(%rax,%rdx), %xmm0
	movdqa	%xmm0, %xmm2
	punpckhwd	%xmm1, %xmm0
	punpcklwd	%xmm1, %xmm2
	movups	%xmm0, 16(%r9,%rdx,2)
	movups	%xmm2, (%r9,%rdx,2)
	addq	$16, %rdx
	cmpq	%rdx, %r13
	jne	.L409
	movq	232(%rsp), %rcx
	movl	12(%rsp), %r12d
	addq	%rcx, %rax
	movq	56(%rsp), %rcx
	addq	%rcx, %r9
	testl	%r12d, %r12d
	je	.L413
	movl	44(%rsp), %ecx
	movl	76(%rsp), %esi
.L408:
	movl	40(%rsp), %edx
	subl	%ecx, %edx
	leal	-1(%rdx), %r12d
	cmpl	$2, %r12d
	jbe	.L414
	leaq	(%rbx,%rcx,2), %rbx
	addq	%r10, %rcx
	movq	0(%rbp,%rcx,2), %xmm0
	leaq	(%r15,%rbx,2), %rbx
	movdqa	%xmm0, %xmm2
	punpcklwd	%xmm3, %xmm0
	punpcklwd	%xmm3, %xmm2
	pshufd	$78, %xmm0, %xmm0
	movq	%xmm2, (%rbx)
	movq	%xmm0, 8(%rbx)
	testb	$3, %dl
	je	.L413
	andl	$-4, %edx
	subl	%edx, %esi
	leaq	(%rax,%rdx,2), %rax
	leaq	(%r9,%rdx,4), %r9
.L414:
	movzwl	(%rax), %edx
	movl	$-1, %ebx
	movw	%bx, 2(%r9)
	movw	%dx, (%r9)
	testl	%esi, %esi
	je	.L413
	movzwl	2(%rax), %edx
	movl	$-1, %r10d
	movw	%r10w, 6(%r9)
	movw	%dx, 4(%r9)
	cmpl	$1, %esi
	je	.L413
	movzwl	4(%rax), %eax
	movl	$-1, %ecx
	movw	%cx, 10(%r9)
	movw	%ax, 8(%r9)
.L413:
	movl	32(%rsp), %eax
	addl	$1, %r14d
	addl	%eax, %r11d
	movl	20(%rsp), %eax
	addl	%eax, %edi
	movl	8(%rsp), %eax
	cmpl	%eax, %r14d
	je	.L612
	movl	%r11d, %r10d
	movl	%edi, %ebx
	leaq	0(%rbp,%r10,2), %rax
	leaq	(%r15,%rbx,2), %r9
	testl	%r8d, %r8d
	jns	.L627
.L585:
	movq	64(%rsp), %r12
	movl	%r11d, 16(%rsp)
	movl	136(%rsp), %ebp
	movl	144(%rsp), %eax
	movl	%edi, 12(%rsp)
	movl	128(%rsp), %r11d
	movq	112(%rsp), %rcx
	jmp	.L407
.L580:
	movq	112(%rsp), %rdi
	movl	12(%rsp), %r8d
	movq	%r12, 64(%rsp)
	movl	16(%rsp), %r10d
	movl	20(%rsp), %ebx
	movq	%r13, 112(%rsp)
	movl	%r11d, 128(%rsp)
	movl	36(%rsp), %r11d
	movl	%ebp, 136(%rsp)
	movq	24(%rsp), %r13
	movl	32(%rsp), %ebp
	movl	8(%rsp), %r12d
	testl	%r11d, %r11d
	js	.L587
	.p2align 4,,10
	.p2align 3
.L628:
	movl	%r11d, %esi
	.p2align 4,,10
	.p2align 3
.L421:
	movzwl	(%rdi), %edx
	subl	$1, %esi
	addq	$2, %rdi
	addq	$8, %r9
	movd	%edx, %xmm7
	movw	%dx, -4(%r9)
	movl	$-1, %edx
	pshuflw	$0, %xmm7, %xmm0
	movw	%dx, -2(%r9)
	movd	%xmm0, -8(%r9)
	cmpl	$-1, %esi
	jne	.L421
	addl	$1, %r14d
	addl	%ebp, %r10d
	addl	%ebx, %r8d
	cmpl	%r14d, %r12d
	je	.L606
	movl	%r10d, %edx
	leaq	0(%r13,%rdx,2), %rdi
	movl	%r8d, %edx
	leaq	(%r15,%rdx,2), %r9
	testl	%r11d, %r11d
	jns	.L628
.L587:
	movq	64(%rsp), %r12
	movq	112(%rsp), %r13
	movl	%r8d, 12(%rsp)
	movl	%r10d, 16(%rsp)
	movl	128(%rsp), %r11d
	movl	136(%rsp), %ebp
	jmp	.L407
.L583:
	movl	%eax, 136(%rsp)
	movq	112(%rsp), %rdx
	movl	%ebp, %esi
	movl	12(%rsp), %r8d
	movl	16(%rsp), %r10d
	movq	%r12, 64(%rsp)
	movl	20(%rsp), %ebx
	movl	32(%rsp), %ebp
	movq	%r13, 112(%rsp)
	movl	%r11d, 128(%rsp)
	movq	24(%rsp), %r13
	movl	36(%rsp), %r11d
	movl	8(%rsp), %r12d
	.p2align 4,,10
	.p2align 3
.L399:
	testl	%r11d, %r11d
	js	.L593
	movl	%r14d, 12(%rsp)
	movl	%r11d, %edi
	.p2align 4,,10
	.p2align 3
.L451:
	movzwl	(%rdx), %eax
	movzwl	2(%rdx), %r14d
	subl	$1, %edi
	addq	$6, %rdx
	addq	$4, %r9
	imull	$150, %r14d, %r14d
	imull	$77, %eax, %eax
	addl	%r14d, %eax
	movzwl	-2(%rdx), %r14d
	imull	$29, %r14d, %r14d
	addl	%r14d, %eax
	movl	$-1, %r14d
	sarl	$8, %eax
	movw	%r14w, -2(%r9)
	movw	%ax, -4(%r9)
	cmpl	$-1, %edi
	jne	.L451
	movl	12(%rsp), %r14d
	addl	%ebp, %r10d
	addl	%ebx, %r8d
	addl	$1, %r14d
	cmpl	%r14d, %r12d
	je	.L606
	movl	%r10d, %eax
	leaq	0(%r13,%rax,2), %rdx
	movl	%r8d, %eax
	leaq	(%r15,%rax,2), %r9
	jmp	.L399
.L584:
	movl	36(%rsp), %edx
	movl	12(%rsp), %r10d
	movq	112(%rsp), %rdi
	movl	16(%rsp), %ebx
	testl	%edx, %edx
	js	.L596
	.p2align 4,,10
	.p2align 3
.L629:
	cmpb	$0, 211(%rsp)
	jne	.L482
	movq	176(%rsp), %r8
	movq	%rdi, %rdx
	movq	%r9, %rsi
	addq	%rdi, %r8
	.p2align 4,,10
	.p2align 3
.L468:
	movd	8(%rdx), %xmm0
	movd	12(%rdx), %xmm2
	addq	$16, %rdx
	addq	$12, %rsi
	movd	-12(%rdx), %xmm1
	punpcklwd	%xmm0, %xmm1
	punpcklwd	%xmm2, %xmm0
	movd	-16(%rdx), %xmm2
	pshuflw	$230, %xmm0, %xmm0
	movd	%xmm1, -8(%rsi)
	movd	%xmm2, -12(%rsi)
	movd	%xmm0, -4(%rsi)
	cmpq	%rdx, %r8
	jne	.L468
	movq	216(%rsp), %rsi
	movl	212(%rsp), %edx
	addq	%rsi, %rdi
	movq	224(%rsp), %rsi
	addq	%rsi, %r9
.L467:
	movzwl	(%rdi), %esi
	movw	%si, (%r9)
	movzwl	2(%rdi), %esi
	movw	%si, 2(%r9)
	movzwl	4(%rdi), %esi
	movw	%si, 4(%r9)
	testl	%edx, %edx
	je	.L469
	movl	8(%rdi), %edx
	movl	%edx, 6(%r9)
	movzwl	12(%rdi), %edx
	movw	%dx, 10(%r9)
.L469:
	movl	32(%rsp), %edi
	addl	$1, %r14d
	addl	%edi, %ebx
	movl	20(%rsp), %edi
	addl	%edi, %r10d
	cmpl	%r14d, 8(%rsp)
	je	.L611
	movq	24(%rsp), %rdi
	movl	%ebx, %edx
	leaq	(%rdi,%rdx,2), %rdi
	movl	%r10d, %edx
	leaq	(%r15,%rdx,2), %r9
	movl	36(%rsp), %edx
	testl	%edx, %edx
	jns	.L629
.L596:
	movl	%r10d, 12(%rsp)
	movl	%ebx, 16(%rsp)
	jmp	.L407
.L534:
	movl	%eax, 64(%rsp)
	movq	112(%rsp), %rsi
	pxor	%xmm8, %xmm8
	movdqa	.LC20(%rip), %xmm15
	movq	24(%rsp), %rax
	movdqa	.LC21(%rip), %xmm14
	movdqa	.LC22(%rip), %xmm13
	.p2align 4,,10
	.p2align 3
.L397:
	movl	36(%rsp), %edi
	testl	%edi, %edi
	js	.L594
.L630:
	cmpb	$0, 99(%rsp)
	jne	.L480
	movq	200(%rsp), %r8
	movq	%rsi, %rdx
	movq	%r9, %rdi
	addq	%rsi, %r8
	.p2align 4,,10
	.p2align 3
.L454:
	movdqu	(%rdx), %xmm0
	movdqu	32(%rdx), %xmm3
	addq	$64, %rdx
	addq	$16, %rdi
	movdqu	-48(%rdx), %xmm5
	movdqu	-16(%rdx), %xmm6
	movdqa	%xmm0, %xmm1
	movdqa	%xmm0, %xmm7
	movdqa	%xmm3, %xmm4
	punpcklwd	%xmm5, %xmm1
	punpckhwd	%xmm5, %xmm7
	punpcklwd	%xmm6, %xmm4
	movdqa	%xmm1, %xmm11
	movdqa	%xmm3, %xmm5
	punpcklwd	%xmm7, %xmm1
	punpckhwd	%xmm6, %xmm5
	punpckhwd	%xmm7, %xmm11
	movdqa	%xmm4, %xmm10
	punpcklwd	%xmm11, %xmm1
	punpckhwd	%xmm5, %xmm10
	punpcklwd	%xmm5, %xmm4
	punpcklwd	%xmm10, %xmm4
	movdqa	%xmm1, %xmm9
	movdqa	%xmm1, %xmm2
	punpckhwd	%xmm4, %xmm9
	punpcklwd	%xmm4, %xmm2
	punpcklwd	%xmm4, %xmm1
	movdqu	-48(%rdx), %xmm4
	punpcklwd	%xmm6, %xmm3
	movdqa	%xmm2, %xmm12
	punpcklwd	%xmm9, %xmm2
	punpcklwd	%xmm4, %xmm0
	punpcklwd	%xmm5, %xmm3
	punpckhwd	%xmm9, %xmm12
	punpcklwd	%xmm7, %xmm0
	punpckhwd	%xmm10, %xmm3
	punpcklwd	%xmm12, %xmm2
	punpckhwd	%xmm11, %xmm0
	movdqa	%xmm2, %xmm5
	movdqa	%xmm2, %xmm6
	movdqa	%xmm0, %xmm4
	punpcklwd	%xmm3, %xmm0
	punpcklwd	%xmm9, %xmm1
	punpckhwd	%xmm3, %xmm4
	movdqa	%xmm0, %xmm3
	punpckhwd	%xmm12, %xmm1
	punpckhwd	%xmm4, %xmm3
	pmullw	%xmm15, %xmm5
	punpcklwd	%xmm4, %xmm0
	punpcklwd	%xmm3, %xmm0
	pmulhuw	%xmm15, %xmm6
	movdqa	%xmm0, %xmm2
	pmulhuw	%xmm14, %xmm0
	pmullw	%xmm14, %xmm2
	movdqa	%xmm5, %xmm4
	punpcklwd	%xmm6, %xmm4
	punpckhwd	%xmm6, %xmm5
	movdqa	%xmm2, %xmm3
	punpckhwd	%xmm0, %xmm2
	punpcklwd	%xmm0, %xmm3
	movdqa	%xmm2, %xmm0
	paddd	%xmm4, %xmm3
	movdqa	%xmm1, %xmm4
	paddd	%xmm5, %xmm0
	pmullw	%xmm13, %xmm4
	pmulhuw	%xmm13, %xmm1
	movdqa	%xmm4, %xmm7
	punpckhwd	%xmm1, %xmm4
	punpcklwd	%xmm1, %xmm7
	paddd	%xmm4, %xmm0
	paddd	%xmm7, %xmm3
	psrad	$8, %xmm0
	psrad	$8, %xmm3
	movdqa	%xmm3, %xmm1
	movdqa	%xmm3, %xmm2
	punpcklwd	%xmm0, %xmm1
	punpckhwd	%xmm0, %xmm2
	movdqa	%xmm1, %xmm0
	punpcklwd	%xmm2, %xmm1
	punpckhwd	%xmm2, %xmm0
	punpcklwd	%xmm0, %xmm1
	movups	%xmm1, -16(%rdi)
	cmpq	%r8, %rdx
	jne	.L454
	movq	184(%rsp), %rdi
	movl	100(%rsp), %r8d
	addq	%rdi, %rsi
	movq	104(%rsp), %rdi
	addq	%rdi, %r9
	movl	%r11d, %edi
.L453:
	movl	%ebp, %edx
	subl	%edi, %edx
	cmpl	$3, %edx
	jbe	.L455
	leaq	(%r10,%rdi,4), %r10
	andl	$-4, %edx
	addq	%rbx, %rdi
	leaq	(%rax,%r10,2), %r10
	subl	%edx, %r8d
	leaq	(%rsi,%rdx,8), %rsi
	movq	(%r10), %xmm1
	movq	8(%r10), %xmm6
	leaq	(%r9,%rdx,2), %r9
	movq	16(%r10), %xmm0
	movq	24(%r10), %xmm5
	movdqa	%xmm1, %xmm9
	movdqa	%xmm1, %xmm2
	punpcklwd	%xmm6, %xmm1
	punpcklwd	%xmm6, %xmm9
	movdqa	%xmm0, %xmm7
	punpcklwd	%xmm6, %xmm2
	pshufd	$78, %xmm9, %xmm9
	punpcklwd	%xmm5, %xmm7
	movdqa	%xmm0, %xmm4
	punpcklwd	%xmm9, %xmm2
	pshufd	$78, %xmm7, %xmm7
	punpcklwd	%xmm5, %xmm4
	punpcklwd	%xmm5, %xmm0
	punpcklwd	%xmm9, %xmm1
	punpcklwd	%xmm7, %xmm4
	movdqa	%xmm2, %xmm10
	movdqa	%xmm2, %xmm3
	pshufd	$78, %xmm1, %xmm1
	punpcklwd	%xmm7, %xmm0
	punpcklwd	%xmm4, %xmm10
	punpcklwd	%xmm4, %xmm3
	pshufd	$78, %xmm0, %xmm0
	punpcklwd	%xmm4, %xmm2
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm0, %xmm4
	punpcklwd	%xmm0, %xmm1
	pshufd	$78, %xmm10, %xmm10
	pshufd	$78, %xmm4, %xmm4
	punpcklwd	%xmm10, %xmm3
	punpcklwd	%xmm10, %xmm2
	punpcklwd	%xmm4, %xmm1
	movdqa	%xmm3, %xmm7
	pshufd	$78, %xmm2, %xmm2
	movdqa	%xmm1, %xmm0
	punpcklwd	%xmm8, %xmm7
	punpcklwd	%xmm8, %xmm1
	punpcklwd	%xmm8, %xmm0
	pshufd	$78, %xmm1, %xmm1
	movdqa	%xmm2, %xmm5
	movdqa	%xmm0, %xmm6
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm8, %xmm5
	pslld	$2, %xmm6
	pslld	$2, %xmm4
	punpcklwd	%xmm8, %xmm3
	paddd	%xmm0, %xmm6
	movdqa	%xmm7, %xmm0
	paddd	%xmm1, %xmm4
	pslld	$2, %xmm0
	pshufd	$78, %xmm3, %xmm3
	punpcklwd	%xmm8, %xmm2
	paddd	%xmm7, %xmm0
	pshufd	$78, %xmm2, %xmm2
	movdqa	%xmm6, %xmm1
	pslld	$4, %xmm1
	pslld	$2, %xmm0
	psubd	%xmm6, %xmm1
	psubd	%xmm7, %xmm0
	pslld	$1, %xmm1
	pslld	$2, %xmm0
	paddd	%xmm7, %xmm0
	paddd	%xmm1, %xmm0
	movdqa	%xmm5, %xmm1
	pslld	$3, %xmm1
	psubd	%xmm5, %xmm1
	pslld	$2, %xmm1
	paddd	%xmm5, %xmm1
	paddd	%xmm1, %xmm0
	movdqa	%xmm3, %xmm1
	pslld	$2, %xmm1
	paddd	%xmm3, %xmm1
	psrad	$8, %xmm0
	pslld	$2, %xmm1
	psubd	%xmm3, %xmm1
	pslld	$2, %xmm1
	paddd	%xmm3, %xmm1
	movdqa	%xmm4, %xmm3
	pslld	$4, %xmm3
	psubd	%xmm4, %xmm3
	pslld	$1, %xmm3
	paddd	%xmm3, %xmm1
	movdqa	%xmm2, %xmm3
	pslld	$3, %xmm3
	psubd	%xmm2, %xmm3
	pslld	$2, %xmm3
	paddd	%xmm3, %xmm2
	paddd	%xmm2, %xmm1
	movdqa	%xmm0, %xmm2
	psrad	$8, %xmm1
	punpcklwd	%xmm1, %xmm2
	punpcklwd	%xmm1, %xmm0
	pshufd	$78, %xmm2, %xmm2
	punpcklwd	%xmm2, %xmm0
	movq	%xmm0, (%r15,%rdi,2)
.L455:
	movzwl	2(%rsi), %edx
	movzwl	(%rsi), %edi
	imull	$150, %edx, %edx
	imull	$77, %edi, %edi
	addl	%edi, %edx
	movzwl	4(%rsi), %edi
	imull	$29, %edi, %edi
	addl	%edi, %edx
	sarl	$8, %edx
	movw	%dx, (%r9)
	testl	%r8d, %r8d
	je	.L456
	movzwl	10(%rsi), %edx
	movzwl	8(%rsi), %edi
	imull	$150, %edx, %edx
	imull	$77, %edi, %edi
	addl	%edi, %edx
	movzwl	12(%rsi), %edi
	imull	$29, %edi, %edi
	addl	%edi, %edx
	sarl	$8, %edx
	movw	%dx, 2(%r9)
	cmpl	$1, %r8d
	je	.L456
	movzwl	16(%rsi), %edx
	movzwl	18(%rsi), %edi
	imull	$77, %edx, %edx
	imull	$150, %edi, %edi
	addl	%edi, %edx
	movzwl	20(%rsi), %edi
	imull	$29, %edi, %edi
	addl	%edi, %edx
	sarl	$8, %edx
	movw	%dx, 4(%r9)
	cmpl	$2, %r8d
	je	.L456
	movzwl	24(%rsi), %edi
	movzwl	26(%rsi), %edx
	addl	$1, %r14d
	movzwl	28(%rsi), %esi
	imull	$77, %edi, %edi
	imull	$150, %edx, %edx
	imull	$29, %esi, %esi
	addl	%edi, %edx
	movl	32(%rsp), %edi
	addl	%edi, 16(%rsp)
	addl	%esi, %edx
	movl	20(%rsp), %edi
	addl	%edi, 12(%rsp)
	sarl	$8, %edx
	movw	%dx, 6(%r9)
	cmpl	%r14d, 8(%rsp)
	je	.L613
	movl	16(%rsp), %r10d
	movl	12(%rsp), %ebx
	movl	36(%rsp), %edi
	leaq	(%rax,%r10,2), %rsi
	leaq	(%r15,%rbx,2), %r9
	testl	%edi, %edi
	jns	.L630
.L594:
	movl	64(%rsp), %eax
	jmp	.L407
.L581:
	movl	%eax, 64(%rsp)
	movq	112(%rsp), %rdx
	movq	24(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L403:
	movl	36(%rsp), %esi
	testl	%esi, %esi
	js	.L594
	cmpb	$0, 99(%rsp)
	jne	.L477
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L424:
	movdqu	(%rdx,%rsi,2), %xmm0
	movdqu	16(%rdx,%rsi,2), %xmm6
	movdqa	%xmm0, %xmm1
	punpcklwd	%xmm6, %xmm0
	punpckhwd	%xmm6, %xmm1
	movdqa	%xmm0, %xmm2
	punpckhwd	%xmm1, %xmm2
	punpcklwd	%xmm1, %xmm0
	punpcklwd	%xmm2, %xmm0
	movups	%xmm0, (%r9,%rsi)
	addq	$16, %rsi
	cmpq	%rsi, %r12
	jne	.L424
	movq	160(%rsp), %rdi
	movl	100(%rsp), %r8d
	addq	%rdi, %rdx
	movq	104(%rsp), %rdi
	addq	%rdi, %r9
	movl	%r11d, %edi
.L423:
	movl	%ebp, %esi
	subl	%edi, %esi
	cmpl	$3, %esi
	jbe	.L425
	leaq	(%r10,%rdi,2), %r10
	andl	$-4, %esi
	addq	%rbx, %rdi
	leaq	(%rax,%r10,2), %r10
	subl	%esi, %r8d
	leaq	(%rdx,%rsi,4), %rdx
	movq	(%r10), %xmm0
	movq	8(%r10), %xmm1
	leaq	(%r9,%rsi,2), %r9
	movdqa	%xmm0, %xmm2
	punpcklwd	%xmm1, %xmm0
	punpcklwd	%xmm1, %xmm2
	pshufd	$78, %xmm2, %xmm2
	punpcklwd	%xmm2, %xmm0
	movq	%xmm0, (%r15,%rdi,2)
.L425:
	movzwl	(%rdx), %esi
	movw	%si, (%r9)
	testl	%r8d, %r8d
	je	.L426
	movzwl	4(%rdx), %esi
	movw	%si, 2(%r9)
	cmpl	$1, %r8d
	je	.L426
	movzwl	8(%rdx), %esi
	movw	%si, 4(%r9)
	cmpl	$2, %r8d
	je	.L426
	movzwl	12(%rdx), %edx
	movl	32(%rsp), %edi
	addl	$1, %r14d
	addl	%edi, 16(%rsp)
	movl	20(%rsp), %edi
	movw	%dx, 6(%r9)
	addl	%edi, 12(%rsp)
	cmpl	%r14d, 8(%rsp)
	je	.L613
	movl	16(%rsp), %r10d
	movl	12(%rsp), %ebx
	leaq	(%rax,%r10,2), %rdx
	leaq	(%r15,%rbx,2), %r9
	jmp	.L403
	.p2align 4,,10
	.p2align 3
.L456:
	movl	32(%rsp), %edi
	movl	20(%rsp), %esi
	addl	$1, %r14d
	addl	%edi, 16(%rsp)
	movl	16(%rsp), %ebx
	addl	%esi, 12(%rsp)
	movl	12(%rsp), %edi
	cmpl	%r14d, 8(%rsp)
	je	.L613
	movl	%ebx, %r10d
	movl	%edi, %ebx
	leaq	(%rax,%r10,2), %rsi
	leaq	(%r15,%rbx,2), %r9
	jmp	.L397
	.p2align 4,,10
	.p2align 3
.L426:
	movl	32(%rsp), %edi
	movl	20(%rsp), %esi
	addl	$1, %r14d
	addl	%edi, 16(%rsp)
	movl	16(%rsp), %ebx
	addl	%esi, 12(%rsp)
	movl	12(%rsp), %edi
	cmpl	%r14d, 8(%rsp)
	je	.L613
	movl	%ebx, %r10d
	movl	%edi, %ebx
	leaq	(%rax,%r10,2), %rdx
	leaq	(%r15,%rbx,2), %r9
	jmp	.L403
	.p2align 4,,10
	.p2align 3
.L606:
	movq	%r13, %r15
	jmp	.L412
	.p2align 4,,10
	.p2align 3
.L612:
	movq	%rbp, %r15
	jmp	.L412
.L613:
	movq	%rax, %r15
	jmp	.L412
.L476:
	movl	%r8d, %esi
	xorl	%ecx, %ecx
	jmp	.L408
.L479:
	movl	36(%rsp), %edi
	xorl	%eax, %eax
	jmp	.L442
.L481:
	movl	%r13d, %esi
	xorl	%ecx, %ecx
	jmp	.L460
.L480:
	movl	36(%rsp), %r8d
	xorl	%edi, %edi
	jmp	.L453
.L478:
	xorl	%edx, %edx
	jmp	.L435
.L477:
	movl	36(%rsp), %r8d
	xorl	%edi, %edi
	jmp	.L423
.L482:
	movl	36(%rsp), %edx
	jmp	.L467
.L391:
	movq	%r15, %rdi
	call	free@PLT
	leaq	.LC18(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L388
.L621:
	leaq	__PRETTY_FUNCTION__.42(%rip), %rcx
	movl	$1818, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC17(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE610:
	.size	stbi__convert_format16, .-stbi__convert_format16
	.p2align 4
	.type	stbi__resample_row_hv_2_simd, @function
stbi__resample_row_hv_2_simd:
.LFB642:
	.cfi_startproc
	movzbl	(%rsi), %eax
	movl	%ecx, %r10d
	movq	%rdi, %r8
	movq	%rdx, %rdi
	leal	(%rax,%rax,2), %ecx
	movzbl	(%rdx), %eax
	addl	%eax, %ecx
	cmpl	$1, %r10d
	je	.L641
	leal	-1(%r10), %r9d
	andl	$-8, %r9d
	jle	.L638
	movdqa	.LC23(%rip), %xmm5
	xorl	%eax, %eax
	pxor	%xmm4, %xmm4
	.p2align 4,,10
	.p2align 3
.L635:
	movq	(%rsi,%rax), %xmm2
	movq	(%rdi,%rax), %xmm0
	movzbl	8(%rsi,%rax), %edx
	punpcklbw	%xmm4, %xmm2
	punpcklbw	%xmm4, %xmm0
	movdqa	%xmm2, %xmm6
	leal	(%rdx,%rdx,2), %edx
	psllw	$2, %xmm6
	paddw	%xmm0, %xmm6
	movdqa	%xmm6, %xmm3
	psubw	%xmm2, %xmm3
	psubw	%xmm6, %xmm2
	movdqa	%xmm3, %xmm0
	movdqa	%xmm3, %xmm1
	pslldq	$2, %xmm0
	psllw	$2, %xmm3
	pinsrw	$0, %ecx, %xmm0
	movzbl	8(%rdi,%rax), %ecx
	paddw	%xmm5, %xmm3
	psrldq	$2, %xmm1
	paddw	%xmm3, %xmm0
	addl	%ecx, %edx
	paddw	%xmm2, %xmm0
	pinsrw	$7, %edx, %xmm1
	paddw	%xmm3, %xmm1
	paddw	%xmm2, %xmm1
	movdqa	%xmm0, %xmm2
	punpcklwd	%xmm1, %xmm2
	punpckhwd	%xmm1, %xmm0
	psrlw	$4, %xmm2
	psrlw	$4, %xmm0
	movdqa	%xmm2, %xmm1
	packuswb	%xmm0, %xmm1
	movups	%xmm1, (%r8,%rax,2)
	movzbl	7(%rsi,%rax), %edx
	leal	(%rdx,%rdx,2), %ecx
	movzbl	7(%rdi,%rax), %edx
	addq	$8, %rax
	addl	%edx, %ecx
	cmpl	%eax, %r9d
	jg	.L635
	subl	$1, %r9d
	shrl	$3, %r9d
	addl	$1, %r9d
	leal	0(,%r9,8), %edx
	sall	$4, %r9d
	movslq	%edx, %r11
	movslq	%r9d, %r9
	addl	$1, %edx
	movzbl	(%rsi,%r11), %eax
	movzbl	(%rdi,%r11), %r11d
	addq	%r8, %r9
	leal	(%rax,%rax,2), %eax
	addl	%r11d, %eax
.L634:
	leal	(%rax,%rax,2), %r11d
	leal	8(%rcx,%r11), %ecx
	sarl	$4, %ecx
	movb	%cl, (%r9)
	cmpl	%edx, %r10d
	jle	.L636
	movslq	%edx, %rdx
	.p2align 4,,10
	.p2align 3
.L637:
	movl	%eax, %ecx
	movzbl	(%rsi,%rdx), %eax
	movzbl	(%rdi,%rdx), %r9d
	leal	(%rax,%rax,2), %eax
	addl	%r9d, %eax
	leal	(%rcx,%rcx,2), %r9d
	leal	8(%rax,%r9), %r9d
	sarl	$4, %r9d
	movb	%r9b, -1(%r8,%rdx,2)
	leal	(%rax,%rax,2), %r9d
	leal	8(%rcx,%r9), %ecx
	sarl	$4, %ecx
	movb	%cl, (%r8,%rdx,2)
	addq	$1, %rdx
	cmpl	%edx, %r10d
	jg	.L637
.L636:
	addl	%r10d, %r10d
	addl	$2, %eax
	sarl	$2, %eax
	movslq	%r10d, %r10
	movb	%al, -1(%r8,%r10)
	movq	%r8, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L641:
	addl	$2, %ecx
	sarl	$2, %ecx
	movzbl	%cl, %eax
	movb	%cl, %ah
	movw	%ax, (%r8)
	movq	%r8, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L638:
	movq	%r8, %r9
	movl	%ecx, %eax
	movl	$1, %edx
	jmp	.L634
	.cfi_endproc
.LFE642:
	.size	stbi__resample_row_hv_2_simd, .-stbi__resample_row_hv_2_simd
	.p2align 4
	.type	stbi__YCbCr_to_RGB_simd, @function
stbi__YCbCr_to_RGB_simd:
.LFB645:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdx, %r10
	movq	%rcx, %r11
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	cmpl	$4, %r9d
	je	.L643
.L655:
	xorl	%eax, %eax
.L645:
	movslq	%r9d, %r9
	movslq	%eax, %rcx
	cmpl	%eax, %r8d
	jle	.L642
	.p2align 4,,10
	.p2align 3
.L653:
	movzbl	(%r11,%rcx), %r12d
	movzbl	(%r10,%rcx), %edx
	movzbl	(%rsi,%rcx), %r13d
	addl	$-128, %edx
	addl	$-128, %r12d
	imull	$1470208, %r12d, %ebp
	sall	$20, %r13d
	imull	$-360960, %edx, %ebx
	addl	$524288, %r13d
	imull	$-748800, %r12d, %r12d
	imull	$1858048, %edx, %eax
	addl	%r13d, %ebp
	xorw	%bx, %bx
	addl	%r13d, %r12d
	addl	%r12d, %ebx
	movl	%ebp, %r12d
	addl	%r13d, %eax
	sarl	$20, %ebx
	sarl	$20, %r12d
	movl	%ebx, %edx
	sarl	$20, %eax
	movl	%r12d, %ebx
	cmpl	$268435455, %ebp
	jbe	.L648
	movl	%r12d, %ebx
	notl	%ebx
	sarl	$31, %ebx
.L648:
	cmpl	$255, %edx
	jbe	.L650
	notl	%edx
	sarl	$31, %edx
.L650:
	cmpl	$255, %eax
	jbe	.L652
	notl	%eax
	sarl	$31, %eax
.L652:
	addq	$1, %rcx
	movb	%bl, (%rdi)
	movb	%dl, 1(%rdi)
	movb	%al, 2(%rdi)
	movb	$-1, 3(%rdi)
	addq	%r9, %rdi
	cmpl	%ecx, %r8d
	jg	.L653
.L642:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L643:
	.cfi_restore_state
	cmpl	$7, %r8d
	jle	.L655
	leal	-8(%r8), %eax
	pxor	%xmm2, %xmm2
	movdqa	.LC24(%rip), %xmm9
	movdqa	.LC25(%rip), %xmm3
	shrl	$3, %eax
	movdqa	.LC27(%rip), %xmm7
	movdqa	.LC26(%rip), %xmm8
	leal	1(%rax), %ebx
	movdqa	.LC28(%rip), %xmm6
	xorl	%eax, %eax
	movdqa	.LC29(%rip), %xmm5
	movdqa	.LC2(%rip), %xmm4
	movq	%rbx, %rdx
	leaq	0(,%rbx,8), %rcx
	.p2align 4,,10
	.p2align 3
.L646:
	movq	(%rsi,%rax), %xmm0
	movdqa	%xmm9, %xmm11
	movdqa	%xmm2, %xmm12
	movdqa	%xmm2, %xmm10
	movdqa	%xmm8, %xmm1
	punpcklbw	%xmm0, %xmm11
	movq	(%r11,%rax), %xmm0
	psrlw	$4, %xmm11
	pxor	%xmm3, %xmm0
	punpcklbw	%xmm0, %xmm12
	movq	(%r10,%rax), %xmm0
	pmulhw	%xmm12, %xmm1
	pmulhw	%xmm5, %xmm12
	pxor	%xmm3, %xmm0
	punpcklbw	%xmm0, %xmm10
	movdqa	%xmm7, %xmm0
	pmulhw	%xmm10, %xmm0
	pmulhw	%xmm6, %xmm10
	paddw	%xmm11, %xmm1
	psraw	$4, %xmm1
	paddw	%xmm11, %xmm10
	paddw	%xmm11, %xmm0
	psraw	$4, %xmm10
	paddw	%xmm12, %xmm0
	packuswb	%xmm10, %xmm1
	psraw	$4, %xmm0
	packuswb	%xmm4, %xmm0
	movdqa	%xmm1, %xmm10
	punpcklbw	%xmm0, %xmm10
	punpckhbw	%xmm0, %xmm1
	movdqa	%xmm10, %xmm0
	punpckhwd	%xmm1, %xmm10
	punpcklwd	%xmm1, %xmm0
	movups	%xmm10, 16(%rdi,%rax,4)
	movups	%xmm0, (%rdi,%rax,4)
	addq	$8, %rax
	cmpq	%rax, %rcx
	jne	.L646
	salq	$5, %rbx
	leal	0(,%rdx,8), %eax
	addq	%rbx, %rdi
	jmp	.L645
	.cfi_endproc
.LFE645:
	.size	stbi__YCbCr_to_RGB_simd, .-stbi__YCbCr_to_RGB_simd
	.p2align 4
	.type	stbi__idct_simd, @function
stbi__idct_simd:
.LFB625:
	.cfi_startproc
	movdqa	32(%rdx), %xmm0
	movdqa	(%rdx), %xmm3
	movslq	%esi, %rsi
	movdqa	80(%rdx), %xmm13
	movdqa	112(%rdx), %xmm8
	leaq	(%rdi,%rsi), %rax
	movdqa	%xmm0, %xmm1
	punpcklwd	96(%rdx), %xmm1
	punpckhwd	96(%rdx), %xmm0
	movdqa	%xmm3, %xmm2
	movdqa	16(%rdx), %xmm7
	movdqa	48(%rdx), %xmm9
	movdqa	%xmm8, %xmm10
	movdqa	%xmm1, %xmm15
	movdqa	%xmm1, %xmm6
	movdqa	64(%rdx), %xmm1
	movdqa	%xmm0, %xmm5
	pmaddwd	.LC30(%rip), %xmm15
	pmaddwd	.LC31(%rip), %xmm6
	movdqa	%xmm0, %xmm4
	pxor	%xmm0, %xmm0
	paddw	%xmm1, %xmm2
	psubw	%xmm1, %xmm3
	movaps	%xmm15, -40(%rsp)
	movdqa	%xmm6, %xmm15
	movdqa	%xmm0, %xmm6
	movdqa	%xmm0, %xmm1
	pmaddwd	.LC30(%rip), %xmm5
	punpcklwd	%xmm2, %xmm6
	punpcklwd	%xmm3, %xmm1
	movdqa	%xmm0, %xmm12
	psrad	$4, %xmm6
	punpckhwd	%xmm9, %xmm10
	punpckhwd	%xmm2, %xmm12
	movdqa	%xmm0, %xmm2
	movaps	%xmm5, -120(%rsp)
	pmaddwd	.LC31(%rip), %xmm4
	movaps	%xmm6, -88(%rsp)
	punpckhwd	%xmm3, %xmm2
	movdqa	%xmm13, %xmm5
	movdqa	%xmm8, %xmm3
	movdqa	%xmm13, %xmm6
	punpcklwd	%xmm9, %xmm3
	punpcklwd	%xmm7, %xmm5
	movaps	%xmm4, -104(%rsp)
	punpckhwd	%xmm7, %xmm6
	paddw	%xmm8, %xmm7
	paddw	%xmm13, %xmm9
	movdqa	%xmm10, %xmm4
	movdqa	%xmm12, %xmm14
	movdqa	%xmm3, %xmm10
	movdqa	%xmm7, %xmm8
	psrad	$4, %xmm14
	punpckhwd	%xmm9, %xmm7
	punpcklwd	%xmm9, %xmm8
	movdqa	%xmm5, %xmm11
	movdqa	%xmm6, %xmm12
	movaps	%xmm14, -72(%rsp)
	movdqa	%xmm8, %xmm13
	psrad	$4, %xmm1
	movdqa	%xmm7, %xmm9
	pmaddwd	.LC32(%rip), %xmm10
	pmaddwd	.LC33(%rip), %xmm3
	psrad	$4, %xmm2
	pmaddwd	.LC34(%rip), %xmm11
	movdqa	%xmm10, %xmm14
	movdqa	%xmm4, %xmm10
	pmaddwd	.LC33(%rip), %xmm4
	pmaddwd	.LC32(%rip), %xmm10
	pmaddwd	.LC34(%rip), %xmm12
	movaps	%xmm15, -24(%rsp)
	pmaddwd	.LC35(%rip), %xmm6
	pmaddwd	.LC37(%rip), %xmm7
	pmaddwd	.LC36(%rip), %xmm13
	pmaddwd	.LC35(%rip), %xmm5
	pmaddwd	.LC36(%rip), %xmm9
	paddd	%xmm7, %xmm12
	paddd	%xmm13, %xmm14
	paddd	%xmm7, %xmm4
	movdqa	.LC38(%rip), %xmm7
	paddd	%xmm9, %xmm10
	paddd	%xmm9, %xmm6
	movdqa	-88(%rsp), %xmm9
	movaps	%xmm14, -56(%rsp)
	pmaddwd	.LC37(%rip), %xmm8
	movdqa	-72(%rsp), %xmm14
	paddd	%xmm13, %xmm5
	paddd	-104(%rsp), %xmm14
	paddd	%xmm15, %xmm9
	paddd	%xmm8, %xmm11
	paddd	%xmm8, %xmm3
	paddd	%xmm7, %xmm9
	movdqa	%xmm14, %xmm8
	paddd	%xmm7, %xmm8
	movdqa	%xmm9, %xmm14
	psubd	%xmm5, %xmm9
	movdqa	%xmm8, %xmm13
	paddd	%xmm5, %xmm14
	psubd	%xmm6, %xmm8
	paddd	%xmm6, %xmm13
	psrad	$10, %xmm14
	psrad	$10, %xmm13
	movdqa	%xmm14, %xmm15
	packssdw	%xmm13, %xmm15
	psrad	$10, %xmm9
	movdqa	%xmm15, %xmm14
	psrad	$10, %xmm8
	movdqa	-40(%rsp), %xmm15
	movdqa	%xmm9, %xmm6
	packssdw	%xmm8, %xmm6
	movdqa	-120(%rsp), %xmm8
	movdqa	%xmm6, %xmm13
	movdqa	%xmm15, %xmm6
	paddd	%xmm1, %xmm6
	paddd	%xmm2, %xmm8
	paddd	%xmm7, %xmm6
	paddd	%xmm7, %xmm2
	psubd	-120(%rsp), %xmm2
	movdqa	%xmm6, %xmm5
	paddd	%xmm7, %xmm8
	paddd	%xmm3, %xmm5
	psubd	%xmm3, %xmm6
	movdqa	%xmm8, %xmm9
	paddd	%xmm7, %xmm1
	movdqa	%xmm2, %xmm3
	paddd	%xmm4, %xmm9
	psubd	%xmm15, %xmm1
	paddd	%xmm12, %xmm3
	psrad	$10, %xmm6
	psubd	%xmm4, %xmm8
	psubd	%xmm12, %xmm2
	movdqa	%xmm3, %xmm4
	movdqa	%xmm1, %xmm3
	psubd	%xmm11, %xmm1
	movdqa	%xmm0, %xmm15
	psrad	$10, %xmm2
	psrad	$10, %xmm1
	paddd	%xmm11, %xmm3
	movdqa	-56(%rsp), %xmm11
	psrad	$10, %xmm4
	psrad	$10, %xmm3
	packssdw	%xmm2, %xmm1
	movdqa	-88(%rsp), %xmm2
	psrad	$10, %xmm8
	psrad	$10, %xmm9
	packssdw	%xmm4, %xmm3
	paddd	%xmm7, %xmm2
	paddd	-72(%rsp), %xmm7
	movdqa	%xmm11, %xmm4
	psubd	-24(%rsp), %xmm2
	psubd	-104(%rsp), %xmm7
	packssdw	%xmm8, %xmm6
	psrad	$10, %xmm5
	movdqa	%xmm7, %xmm8
	paddd	%xmm2, %xmm4
	psubd	%xmm10, %xmm7
	psubd	%xmm11, %xmm2
	paddd	%xmm10, %xmm8
	psrad	$10, %xmm7
	psrad	$10, %xmm2
	psrad	$10, %xmm8
	packssdw	%xmm9, %xmm5
	packssdw	%xmm7, %xmm2
	psrad	$10, %xmm4
	movdqa	%xmm14, %xmm7
	packssdw	%xmm8, %xmm4
	punpcklwd	%xmm2, %xmm14
	punpckhwd	%xmm2, %xmm7
	movdqa	%xmm3, %xmm8
	movdqa	%xmm5, %xmm2
	movdqa	%xmm7, %xmm9
	punpcklwd	%xmm1, %xmm2
	punpcklwd	%xmm6, %xmm8
	punpckhwd	%xmm1, %xmm5
	movdqa	%xmm4, %xmm7
	movdqa	%xmm14, %xmm1
	punpckhwd	%xmm6, %xmm3
	punpcklwd	%xmm13, %xmm7
	punpcklwd	%xmm8, %xmm1
	punpckhwd	%xmm8, %xmm14
	movdqa	%xmm2, %xmm6
	movdqa	%xmm2, %xmm8
	movdqa	%xmm9, %xmm2
	punpckhwd	%xmm13, %xmm4
	punpcklwd	%xmm7, %xmm8
	punpckhwd	%xmm7, %xmm6
	punpcklwd	%xmm3, %xmm2
	punpckhwd	%xmm3, %xmm9
	movdqa	%xmm5, %xmm7
	movdqa	%xmm14, %xmm3
	punpcklwd	%xmm4, %xmm7
	punpckhwd	%xmm6, %xmm14
	punpcklwd	%xmm6, %xmm3
	movdqa	%xmm2, %xmm6
	punpckhwd	%xmm4, %xmm5
	punpcklwd	%xmm7, %xmm6
	punpckhwd	%xmm7, %xmm2
	movdqa	%xmm9, %xmm7
	punpcklwd	%xmm5, %xmm7
	punpckhwd	%xmm5, %xmm9
	movdqa	%xmm1, %xmm4
	movdqa	%xmm3, %xmm5
	punpcklwd	%xmm8, %xmm4
	punpckhwd	%xmm7, %xmm3
	punpcklwd	%xmm7, %xmm5
	punpckhwd	%xmm8, %xmm1
	movdqa	%xmm9, %xmm8
	movdqa	%xmm5, %xmm7
	movdqa	%xmm5, %xmm11
	movdqa	%xmm4, %xmm5
	paddw	%xmm6, %xmm5
	psubw	%xmm6, %xmm4
	movdqa	%xmm9, %xmm6
	punpcklwd	%xmm14, %xmm8
	punpckhwd	%xmm14, %xmm6
	movdqa	%xmm3, %xmm10
	pmaddwd	.LC30(%rip), %xmm7
	movdqa	%xmm3, %xmm12
	movdqa	%xmm0, %xmm3
	punpckhwd	%xmm5, %xmm15
	punpcklwd	%xmm5, %xmm3
	movdqa	%xmm4, %xmm5
	movaps	%xmm7, -120(%rsp)
	movdqa	%xmm6, %xmm7
	movdqa	%xmm8, %xmm6
	pmaddwd	.LC30(%rip), %xmm10
	movdqa	%xmm0, %xmm4
	movdqa	%xmm15, %xmm13
	punpckhwd	%xmm5, %xmm0
	movaps	%xmm10, -104(%rsp)
	punpcklwd	%xmm5, %xmm4
	pmaddwd	.LC32(%rip), %xmm6
	pmaddwd	.LC31(%rip), %xmm11
	psrad	$4, %xmm13
	movdqa	%xmm2, %xmm5
	pmaddwd	.LC31(%rip), %xmm12
	movdqa	%xmm6, %xmm10
	movdqa	%xmm7, %xmm6
	punpckhwd	%xmm1, %xmm5
	movaps	%xmm11, -88(%rsp)
	movaps	%xmm12, -72(%rsp)
	psrad	$4, %xmm3
	pmaddwd	.LC32(%rip), %xmm6
	pmaddwd	.LC33(%rip), %xmm8
	movaps	%xmm13, -56(%rsp)
	psrad	$4, %xmm4
	psrad	$4, %xmm0
	movdqa	.LC34(%rip), %xmm13
	movdqa	%xmm6, %xmm11
	movdqa	%xmm2, %xmm6
	paddw	%xmm14, %xmm2
	punpcklwd	%xmm1, %xmm6
	paddw	%xmm9, %xmm1
	pmaddwd	%xmm5, %xmm13
	movdqa	%xmm6, %xmm15
	pmaddwd	.LC35(%rip), %xmm5
	pmaddwd	.LC34(%rip), %xmm15
	pmaddwd	.LC35(%rip), %xmm6
	pmaddwd	.LC33(%rip), %xmm7
	movdqa	%xmm15, %xmm12
	movdqa	%xmm1, %xmm15
	punpckhwd	%xmm2, %xmm1
	punpcklwd	%xmm2, %xmm15
	movdqa	%xmm15, %xmm14
	movdqa	%xmm15, %xmm2
	pmaddwd	.LC36(%rip), %xmm14
	pmaddwd	.LC37(%rip), %xmm2
	movdqa	%xmm14, %xmm9
	movdqa	%xmm1, %xmm14
	pmaddwd	.LC36(%rip), %xmm14
	pmaddwd	.LC37(%rip), %xmm1
	paddd	%xmm2, %xmm8
	paddd	%xmm14, %xmm11
	paddd	%xmm5, %xmm14
	movdqa	-88(%rsp), %xmm5
	paddd	%xmm9, %xmm10
	paddd	%xmm2, %xmm12
	movdqa	-56(%rsp), %xmm2
	paddd	%xmm6, %xmm9
	movdqa	.LC39(%rip), %xmm6
	paddd	-72(%rsp), %xmm2
	paddd	%xmm3, %xmm5
	paddd	%xmm1, %xmm7
	paddd	%xmm6, %xmm5
	paddd	%xmm6, %xmm2
	paddd	%xmm1, %xmm13
	movdqa	%xmm2, %xmm15
	movdqa	%xmm5, %xmm1
	psubd	%xmm14, %xmm2
	psubd	%xmm9, %xmm5
	psrad	$17, %xmm2
	psrad	$17, %xmm5
	paddd	%xmm9, %xmm1
	movdqa	-104(%rsp), %xmm9
	packssdw	%xmm2, %xmm5
	movdqa	-120(%rsp), %xmm2
	paddd	%xmm14, %xmm15
	paddd	%xmm6, %xmm3
	paddd	%xmm0, %xmm9
	psrad	$17, %xmm15
	paddd	%xmm6, %xmm0
	paddd	%xmm4, %xmm2
	paddd	%xmm6, %xmm9
	psrad	$17, %xmm1
	paddd	%xmm6, %xmm2
	psubd	-104(%rsp), %xmm0
	packssdw	%xmm15, %xmm1
	paddd	%xmm6, %xmm4
	movdqa	%xmm9, %xmm15
	psubd	-120(%rsp), %xmm4
	movdqa	%xmm2, %xmm14
	paddd	%xmm7, %xmm15
	psubd	%xmm7, %xmm9
	paddd	%xmm8, %xmm14
	psubd	%xmm8, %xmm2
	movdqa	%xmm4, %xmm7
	movdqa	%xmm0, %xmm8
	psubd	%xmm12, %xmm4
	psubd	%xmm13, %xmm0
	psrad	$17, %xmm0
	psrad	$17, %xmm4
	psubd	-88(%rsp), %xmm3
	packssdw	%xmm0, %xmm4
	paddd	%xmm13, %xmm8
	movdqa	-56(%rsp), %xmm0
	paddd	%xmm12, %xmm7
	psrad	$17, %xmm8
	psrad	$17, %xmm7
	paddd	%xmm6, %xmm0
	psubd	-72(%rsp), %xmm0
	movdqa	%xmm3, %xmm6
	packssdw	%xmm8, %xmm7
	psrad	$17, %xmm15
	paddd	%xmm10, %xmm6
	movdqa	%xmm0, %xmm8
	psrad	$17, %xmm14
	psubd	%xmm11, %xmm0
	paddd	%xmm11, %xmm8
	psubd	%xmm10, %xmm3
	psrad	$17, %xmm0
	psrad	$17, %xmm8
	psrad	$17, %xmm6
	packssdw	%xmm15, %xmm14
	psrad	$17, %xmm3
	packuswb	%xmm14, %xmm1
	packssdw	%xmm8, %xmm6
	packssdw	%xmm0, %xmm3
	psrad	$17, %xmm9
	packuswb	%xmm6, %xmm7
	psrad	$17, %xmm2
	packuswb	%xmm4, %xmm3
	movdqa	%xmm1, %xmm0
	packssdw	%xmm9, %xmm2
	punpcklbw	%xmm3, %xmm0
	punpckhbw	%xmm3, %xmm1
	packuswb	%xmm5, %xmm2
	movdqa	%xmm7, %xmm3
	punpcklbw	%xmm2, %xmm3
	punpckhbw	%xmm2, %xmm7
	movdqa	%xmm0, %xmm2
	punpcklbw	%xmm3, %xmm2
	punpckhbw	%xmm3, %xmm0
	movdqa	%xmm1, %xmm3
	punpcklbw	%xmm7, %xmm3
	movdqa	%xmm2, %xmm4
	punpckhbw	%xmm7, %xmm1
	punpcklbw	%xmm3, %xmm4
	punpckhbw	%xmm3, %xmm2
	movdqa	%xmm0, %xmm3
	movq	%xmm4, (%rdi)
	pshufd	$78, %xmm4, %xmm4
	punpcklbw	%xmm1, %xmm3
	punpckhbw	%xmm1, %xmm0
	movq	%xmm4, (%rax)
	addq	%rsi, %rax
	movq	%xmm2, (%rax)
	addq	%rsi, %rax
	pshufd	$78, %xmm2, %xmm2
	movq	%xmm2, (%rax)
	addq	%rsi, %rax
	movq	%xmm3, (%rax)
	addq	%rsi, %rax
	pshufd	$78, %xmm3, %xmm3
	movq	%xmm3, (%rax)
	addq	%rsi, %rax
	movq	%xmm0, (%rax)
	pshufd	$78, %xmm0, %xmm0
	movq	%xmm0, (%rax,%rsi)
	ret
	.cfi_endproc
.LFE625:
	.size	stbi__idct_simd, .-stbi__idct_simd
	.p2align 4
	.type	stbi__hdr_convert, @function
stbi__hdr_convert:
.LFB734:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	movzbl	3(%rsi), %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edx, %ebx
	testb	%dil, %dil
	jne	.L679
	cmpl	$3, %edx
	je	.L668
	jg	.L669
	cmpl	$1, %edx
	je	.L670
	cmpl	$2, %edx
	jne	.L661
	movl	$0x3f800000, 4(%r12)
.L670:
	movl	$0x00000000, (%r12)
.L661:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L669:
	.cfi_restore_state
	cmpl	$4, %edx
	jne	.L661
	movl	$0x3f800000, 12(%r12)
.L668:
	movl	$0x00000000, 8(%r12)
	movq	$0, (%r12)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L679:
	.cfi_restore_state
	movsd	.LC40(%rip), %xmm0
	subl	$136, %edi
	movq	%rsi, %rbp
	call	ldexp@PLT
	movzbl	0(%rbp), %eax
	cvtsd2ss	%xmm0, %xmm0
	cmpl	$2, %ebx
	jg	.L663
	movzbl	1(%rbp), %edx
	pxor	%xmm1, %xmm1
	addl	%edx, %eax
	movzbl	2(%rbp), %edx
	addl	%edx, %eax
	cvtsi2ssl	%eax, %xmm1
	mulss	%xmm0, %xmm1
	divss	.LC41(%rip), %xmm1
	movss	%xmm1, (%r12)
	cmpl	$2, %ebx
	jne	.L661
	movl	$0x3f800000, 4(%r12)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L663:
	.cfi_restore_state
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	mulss	%xmm0, %xmm1
	movss	%xmm1, (%r12)
	movzbl	1(%rbp), %eax
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	mulss	%xmm0, %xmm1
	movss	%xmm1, 4(%r12)
	movzbl	2(%rbp), %eax
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	mulss	%xmm0, %xmm1
	movss	%xmm1, 8(%r12)
	cmpl	$4, %ebx
	jne	.L661
	movl	$0x3f800000, 12(%r12)
	jmp	.L661
	.cfi_endproc
.LFE734:
	.size	stbi__hdr_convert, .-stbi__hdr_convert
	.p2align 4
	.type	stbi__stdio_write, @function
stbi__stdio_write:
.LFB761:
	.cfi_startproc
	movq	%rdi, %rcx
	movslq	%edx, %rdx
	movq	%rsi, %rdi
	movl	$1, %esi
	jmp	fwrite@PLT
	.cfi_endproc
.LFE761:
	.size	stbi__stdio_write, .-stbi__stdio_write
	.p2align 4
	.type	stbi__skip.part.0, @function
stbi__skip.part.0:
.LFB811:
	.cfi_startproc
	cmpq	$0, 16(%rdi)
	movq	192(%rdi), %rax
	je	.L682
	movq	200(%rdi), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	%esi, %edx
	jl	.L683
.L682:
	movslq	%esi, %rsi
	addq	%rsi, %rax
	movq	%rax, 192(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L683:
	subl	%edx, %esi
	movq	40(%rdi), %rdx
	movq	%rcx, 192(%rdi)
	movq	24(%rdi), %rax
	movq	%rdx, %rdi
	jmp	*%rax
	.cfi_endproc
.LFE811:
	.size	stbi__skip.part.0, .-stbi__skip.part.0
	.p2align 4
	.type	stbi__resample_row_h_2, @function
stbi__resample_row_h_2:
.LFB640:
	.cfi_startproc
	movzbl	(%rsi), %eax
	cmpl	$1, %ecx
	je	.L715
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%ecx, %r8d
	leal	(%rax,%rax,2), %ecx
	movq	%rsi, %rdx
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leal	-1(%r8), %r9d
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movb	%al, (%rdi)
	movzbl	1(%rsi), %eax
	leal	2(%rcx,%rax), %eax
	sarl	$2, %eax
	movb	%al, 1(%rdi)
	cmpl	$2, %r8d
	jle	.L698
	leal	-3(%r8), %esi
	cmpl	$6, %esi
	jbe	.L688
	movl	%r9d, %eax
	leaq	2(%rdi), %rcx
	leaq	(%rdi,%rax,2), %rax
	cmpq	%rax, %rdx
	jnb	.L699
	movl	%r8d, %eax
	addq	%rdx, %rax
	cmpq	%rax, %rcx
	jnb	.L699
.L688:
	movl	%r9d, %r10d
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L695:
	movzbl	(%rdx,%rax), %ecx
	leal	2(%rcx,%rcx,2), %esi
	movzbl	-1(%rdx,%rax), %ecx
	addl	%esi, %ecx
	sarl	$2, %ecx
	movb	%cl, (%rdi,%rax,2)
	movzbl	1(%rdx,%rax), %ecx
	addl	%esi, %ecx
	sarl	$2, %ecx
	movb	%cl, 1(%rdi,%rax,2)
	addq	$1, %rax
	cmpq	%rax, %r10
	jne	.L695
.L696:
	addl	%r9d, %r9d
	movslq	%r9d, %r9
	leaq	1(%r9), %rsi
.L687:
	movslq	%r8d, %r8
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movzbl	-2(%rdx,%r8), %eax
	leaq	-1(%rdx,%r8), %rcx
	popq	%r12
	.cfi_def_cfa_offset 8
	leal	(%rax,%rax,2), %edx
	movzbl	(%rcx), %eax
	leal	2(%rdx,%rax), %eax
	sarl	$2, %eax
	movb	%al, (%rdi,%r9)
	movzbl	(%rcx), %eax
	movb	%al, (%rdi,%rsi)
	movq	%rdi, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L699:
	.cfi_restore_state
	cmpl	$14, %esi
	jbe	.L690
	leal	-2(%r8), %r11d
	movq	%rdx, %rax
	pxor	%xmm4, %xmm4
	movdqa	.LC1(%rip), %xmm7
	movl	%r11d, %esi
	movdqa	.LC2(%rip), %xmm5
	movdqa	.LC5(%rip), %xmm6
	shrl	$4, %esi
	salq	$4, %rsi
	addq	%rdx, %rsi
	.p2align 4,,10
	.p2align 3
.L691:
	movdqu	1(%rax), %xmm2
	movdqu	(%rax), %xmm3
	addq	$16, %rax
	addq	$32, %rcx
	movdqa	%xmm2, %xmm1
	punpckhbw	%xmm4, %xmm2
	movdqa	%xmm3, %xmm0
	punpcklbw	%xmm4, %xmm1
	pmullw	%xmm6, %xmm2
	punpcklbw	%xmm4, %xmm0
	pmullw	%xmm6, %xmm1
	punpckhbw	%xmm4, %xmm3
	paddw	%xmm7, %xmm2
	paddw	%xmm7, %xmm1
	paddw	%xmm2, %xmm3
	paddw	%xmm1, %xmm0
	psrlw	$2, %xmm3
	psrlw	$2, %xmm0
	pand	%xmm5, %xmm3
	pand	%xmm5, %xmm0
	packuswb	%xmm3, %xmm0
	movdqu	-14(%rax), %xmm3
	movdqa	%xmm3, %xmm8
	punpckhbw	%xmm4, %xmm3
	punpcklbw	%xmm4, %xmm8
	paddw	%xmm3, %xmm2
	paddw	%xmm8, %xmm1
	psrlw	$2, %xmm2
	psrlw	$2, %xmm1
	pand	%xmm5, %xmm2
	pand	%xmm5, %xmm1
	packuswb	%xmm2, %xmm1
	movdqa	%xmm0, %xmm2
	punpcklbw	%xmm1, %xmm2
	punpckhbw	%xmm1, %xmm0
	movups	%xmm2, -32(%rcx)
	movups	%xmm0, -16(%rcx)
	cmpq	%rsi, %rax
	jne	.L691
	movl	%r11d, %r10d
	andl	$-16, %r10d
	andl	$15, %r11d
	leal	1(%r10), %eax
	je	.L696
	movl	%r8d, %ecx
	subl	%r10d, %ecx
	leal	-2(%rcx), %esi
	subl	$3, %ecx
	cmpl	$6, %ecx
	jbe	.L693
.L697:
	movq	1(%rdx,%r10), %xmm1
	pxor	%xmm5, %xmm5
	movq	.LC3(%rip), %xmm3
	leaq	2(%rdi,%r10,2), %rcx
	movq	.LC4(%rip), %xmm4
	movdqa	%xmm1, %xmm2
	punpcklbw	%xmm5, %xmm1
	punpcklbw	%xmm5, %xmm2
	pshufd	$78, %xmm1, %xmm1
	movdqa	%xmm2, %xmm0
	psllw	$1, %xmm0
	paddw	%xmm2, %xmm0
	movdqa	%xmm1, %xmm2
	psllw	$1, %xmm2
	paddw	%xmm1, %xmm2
	paddw	%xmm3, %xmm0
	paddw	%xmm3, %xmm2
	movq	(%rdx,%r10), %xmm3
	movdqa	%xmm3, %xmm1
	punpcklbw	%xmm5, %xmm3
	punpcklbw	%xmm5, %xmm1
	pshufd	$78, %xmm3, %xmm3
	paddw	%xmm0, %xmm1
	paddw	%xmm2, %xmm3
	psrlw	$2, %xmm1
	psrlw	$2, %xmm3
	pand	%xmm4, %xmm3
	pand	%xmm4, %xmm1
	packuswb	%xmm3, %xmm1
	movq	2(%rdx,%r10), %xmm3
	pshufd	$8, %xmm1, %xmm1
	movdqa	%xmm3, %xmm6
	punpcklbw	%xmm5, %xmm3
	punpcklbw	%xmm5, %xmm6
	pshufd	$78, %xmm3, %xmm3
	paddw	%xmm6, %xmm0
	paddw	%xmm3, %xmm2
	psrlw	$2, %xmm0
	psrlw	$2, %xmm2
	pand	%xmm4, %xmm0
	pand	%xmm2, %xmm4
	movdqa	%xmm1, %xmm2
	packuswb	%xmm4, %xmm0
	pshufd	$8, %xmm0, %xmm0
	punpcklbw	%xmm0, %xmm1
	punpcklbw	%xmm0, %xmm2
	pshufd	$78, %xmm1, %xmm1
	movq	%xmm2, (%rcx)
	movq	%xmm1, 8(%rcx)
	movl	%esi, %ecx
	andl	$-8, %ecx
	addl	%ecx, %eax
	andl	$7, %esi
	je	.L696
.L693:
	movslq	%eax, %r10
	leaq	(%rdx,%r10), %rbx
	movzbl	-1(%rdx,%r10), %esi
	leaq	1(%rdx,%r10), %rbp
	movzbl	(%rbx), %ecx
	leal	2(%rcx,%rcx,2), %r12d
	leal	(%rax,%rax), %ecx
	addl	%r12d, %esi
	movslq	%ecx, %r11
	sarl	$2, %esi
	movb	%sil, (%rdi,%r11)
	movzbl	0(%rbp), %esi
	addl	%r12d, %esi
	sarl	$2, %esi
	movb	%sil, 1(%rdi,%r11)
	leal	1(%rax), %esi
	cmpl	%esi, %r9d
	jle	.L696
	movzbl	0(%rbp), %esi
	leal	2(%rcx), %r11d
	movslq	%r11d, %r11
	leal	2(%rsi,%rsi,2), %r12d
	movzbl	(%rbx), %esi
	addl	%r12d, %esi
	sarl	$2, %esi
	movb	%sil, (%rdi,%r11)
	movzbl	2(%rdx,%r10), %esi
	addl	%r12d, %esi
	sarl	$2, %esi
	movb	%sil, 1(%rdi,%r11)
	leal	2(%rax), %esi
	cmpl	%esi, %r9d
	jle	.L696
	movslq	%esi, %rsi
	leal	4(%rcx), %r11d
	movzbl	(%rdx,%rsi), %r10d
	movslq	%r11d, %r11
	leal	2(%r10,%r10,2), %ebx
	movzbl	0(%rbp), %r10d
	addl	%ebx, %r10d
	sarl	$2, %r10d
	movb	%r10b, (%rdi,%r11)
	movzbl	1(%rdx,%rsi), %esi
	addl	%ebx, %esi
	sarl	$2, %esi
	movb	%sil, 1(%rdi,%r11)
	leal	3(%rax), %esi
	cmpl	%esi, %r9d
	jle	.L696
	movslq	%esi, %rsi
	leal	6(%rcx), %r11d
	movzbl	(%rdx,%rsi), %r10d
	movslq	%r11d, %r11
	leal	2(%r10,%r10,2), %ebx
	movzbl	-1(%rdx,%rsi), %r10d
	addl	%ebx, %r10d
	sarl	$2, %r10d
	movb	%r10b, (%rdi,%r11)
	movzbl	1(%rdx,%rsi), %esi
	addl	%ebx, %esi
	sarl	$2, %esi
	movb	%sil, 1(%rdi,%r11)
	leal	4(%rax), %esi
	cmpl	%esi, %r9d
	jle	.L696
	movslq	%esi, %rsi
	leal	8(%rcx), %r11d
	movzbl	(%rdx,%rsi), %r10d
	movslq	%r11d, %r11
	leal	2(%r10,%r10,2), %ebx
	movzbl	-1(%rdx,%rsi), %r10d
	addl	%ebx, %r10d
	sarl	$2, %r10d
	movb	%r10b, (%rdi,%r11)
	movzbl	1(%rdx,%rsi), %esi
	addl	%ebx, %esi
	sarl	$2, %esi
	movb	%sil, 1(%rdi,%r11)
	leal	5(%rax), %esi
	cmpl	%esi, %r9d
	jle	.L696
	movslq	%esi, %rsi
	leal	10(%rcx), %r11d
	addl	$6, %eax
	movzbl	(%rdx,%rsi), %r10d
	movslq	%r11d, %r11
	leal	2(%r10,%r10,2), %ebx
	movzbl	-1(%rdx,%rsi), %r10d
	addl	%ebx, %r10d
	sarl	$2, %r10d
	movb	%r10b, (%rdi,%r11)
	movzbl	1(%rdx,%rsi), %esi
	addl	%ebx, %esi
	sarl	$2, %esi
	movb	%sil, 1(%rdi,%r11)
	cmpl	%eax, %r9d
	jle	.L696
	cltq
	addl	$12, %ecx
	movzbl	(%rdx,%rax), %esi
	movslq	%ecx, %rcx
	leal	2(%rsi,%rsi,2), %r10d
	movzbl	-1(%rdx,%rax), %esi
	addl	%r10d, %esi
	sarl	$2, %esi
	movb	%sil, (%rdi,%rcx)
	movzbl	1(%rdx,%rax), %eax
	addl	%r10d, %eax
	sarl	$2, %eax
	movb	%al, 1(%rdi,%rcx)
	jmp	.L696
	.p2align 4,,10
	.p2align 3
.L715:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	movzbl	%al, %edx
	movb	%al, %dh
	movq	%rdi, %rax
	movw	%dx, (%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L698:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	movl	$3, %esi
	movl	$2, %r9d
	jmp	.L687
.L690:
	leal	-2(%r8), %esi
	xorl	%r10d, %r10d
	movl	$1, %eax
	jmp	.L697
	.cfi_endproc
.LFE640:
	.size	stbi__resample_row_h_2, .-stbi__resample_row_h_2
	.section	.rodata.str1.1
.LC44:
	.string	"p"
	.text
	.p2align 4
	.type	stbiw__sbgrowf.part.0, @function
stbiw__sbgrowf.part.0:
.LFB819:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	__PRETTY_FUNCTION__.22(%rip), %rcx
	movl	$844, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC44(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE819:
	.size	stbiw__sbgrowf.part.0, .-stbiw__sbgrowf.part.0
	.section	.rodata.str1.1
.LC45:
	.string	"111 221 2222 11"
	.text
	.p2align 4
	.type	stbiw__writef.constprop.0, @function
stbiw__writef.constprop.0:
.LFB830:
	.cfi_startproc
	subq	$216, %rsp
	.cfi_def_cfa_offset 224
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 64(%rsp)
	movq	%r9, 72(%rsp)
	testb	%al, %al
	je	.L719
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm1, 96(%rsp)
	movaps	%xmm2, 112(%rsp)
	movaps	%xmm3, 128(%rsp)
	movaps	%xmm4, 144(%rsp)
	movaps	%xmm5, 160(%rsp)
	movaps	%xmm6, 176(%rsp)
	movaps	%xmm7, 192(%rsp)
.L719:
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	224(%rsp), %rax
	movq	%rsp, %rdx
	leaq	.LC45(%rip), %rsi
	movq	%rax, 8(%rsp)
	leaq	32(%rsp), %rax
	movq	%rax, 16(%rsp)
	movl	$16, (%rsp)
	movl	$48, 4(%rsp)
	call	stbiw__writefv
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L722
	addq	$216, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L722:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE830:
	.size	stbiw__writef.constprop.0, .-stbiw__writef.constprop.0
	.p2align 4
	.type	stbi__free_jpeg_components.constprop.0, @function
stbi__free_jpeg_components.constprop.0:
.LFB831:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L740
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%esi, %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	(%rsi,%rsi,2), %rbp
	movq	%rdi, %rbx
	salq	$5, %rbp
	addq	%rdi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
.L728:
	movq	18136(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L725
	call	free@PLT
	pxor	%xmm0, %xmm0
	movups	%xmm0, 18128(%rbx)
.L725:
	movq	18144(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L726
	call	free@PLT
	movq	$0, 18144(%rbx)
	movq	$0, 18160(%rbx)
.L726:
	movq	18152(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L727
	call	free@PLT
	movq	$0, 18152(%rbx)
.L727:
	addq	$96, %rbx
	cmpq	%rbp, %rbx
	jne	.L728
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L740:
	.cfi_restore 3
	.cfi_restore 6
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE831:
	.size	stbi__free_jpeg_components.constprop.0, .-stbi__free_jpeg_components.constprop.0
	.section	.rodata.str1.8
	.align 8
.LC46:
	.string	"EXPOSURE=          1.0000000000000\n\n-Y %d +X %d\n"
	.text
	.p2align 4
	.type	stbi_write_hdr_core.part.0, @function
stbi_write_hdr_core.part.0:
.LFB821:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movslq	%ecx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	leal	0(,%rsi,4), %edi
	movslq	%edi, %rdi
	subq	$360, %rsp
	.cfi_def_cfa_offset 416
	movq	%r8, 64(%rsp)
	leaq	208(%rsp), %r12
	movl	%edx, 36(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 344(%rsp)
	xorl	%eax, %eax
	movl	%esi, (%rsp)
	call	malloc@PLT
	movl	$10, %ecx
	movdqa	.LC49(%rip), %xmm0
	movq	8(%rbx), %rdi
	movq	%rax, 48(%rsp)
	leaq	128(%rsp), %rsi
	movl	$65, %edx
	movaps	%xmm0, 128(%rsp)
	movdqa	.LC50(%rip), %xmm0
	movw	%cx, 192(%rsp)
	movaps	%xmm0, 144(%rsp)
	movdqa	.LC51(%rip), %xmm0
	movaps	%xmm0, 160(%rsp)
	movdqa	.LC52(%rip), %xmm0
	movaps	%xmm0, 176(%rsp)
	call	*(%rbx)
	movl	(%rsp), %ecx
	movl	%r14d, %edx
	leaq	.LC46(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	sprintf@PLT
	movq	8(%rbx), %rdi
	movq	%r12, %rsi
	movl	%eax, %edx
	call	*(%rbx)
	testl	%r14d, %r14d
	movl	(%rsp), %r11d
	jle	.L750
	movl	%r11d, %eax
	movl	$1, 32(%rsp)
	movl	32(%rsp), %ecx
	movl	%r11d, %r9d
	imull	%ebp, %eax
	leaq	0(,%rbp,4), %r14
	movl	%eax, 60(%rsp)
	leal	-8(%r11), %eax
	movl	%eax, 72(%rsp)
	leal	-3(%rbp), %eax
	movl	%eax, 28(%rsp)
	leal	(%r11,%r11), %eax
	movl	%eax, 76(%rsp)
	addl	%r11d, %eax
	movl	%eax, 104(%rsp)
.L749:
	movl	36(%rsp), %eax
	movl	stbi__flip_vertically_on_write(%rip), %edx
	subl	%ecx, %eax
	testl	%edx, %edx
	jne	.L746
	leal	-1(%rcx), %eax
.L746:
	movl	60(%rsp), %ecx
	movl	$514, 124(%rsp)
	imull	%ecx, %eax
	movq	64(%rsp), %rcx
	cltq
	leaq	(%rcx,%rax,4), %rbp
	movl	%r9d, %eax
	rolw	$8, %ax
	cmpl	$32759, 72(%rsp)
	movw	%ax, 126(%rsp)
	jbe	.L747
	testl	%r9d, %r9d
	jle	.L757
	movq	%rbp, %r12
	xorl	%r15d, %r15d
	leaq	120(%rsp), %rbp
	movl	%r9d, %r13d
	jmp	.L758
.L785:
	movss	.LC47(%rip), %xmm5
	movaps	%xmm1, %xmm2
	movaps	%xmm1, %xmm4
	movaps	%xmm1, %xmm3
	comiss	%xmm2, %xmm5
	jbe	.L804
.L814:
	movl	$0, 120(%rsp)
.L812:
	addl	$1, %r15d
	movq	8(%rbx), %rdi
	movl	$4, %edx
	movq	%rbp, %rsi
	call	*(%rbx)
	addq	%r14, %r12
	cmpl	%r15d, %r13d
	je	.L813
.L758:
	cmpl	$1, 28(%rsp)
	movss	(%r12), %xmm1
	ja	.L785
	movss	4(%r12), %xmm3
	movss	8(%r12), %xmm4
	movaps	%xmm1, %xmm7
	movss	.LC47(%rip), %xmm5
	movaps	%xmm3, %xmm2
	maxss	%xmm4, %xmm2
	maxss	%xmm2, %xmm7
	movaps	%xmm7, %xmm2
	comiss	%xmm2, %xmm5
	ja	.L814
.L804:
	leaq	116(%rsp), %rdi
	pxor	%xmm0, %xmm0
	movss	%xmm1, 24(%rsp)
	movss	%xmm3, 16(%rsp)
	cvtss2sd	%xmm2, %xmm0
	movss	%xmm4, 8(%rsp)
	movss	%xmm2, (%rsp)
	call	frexp@PLT
	movss	(%rsp), %xmm2
	movzbl	116(%rsp), %eax
	cvtsd2ss	%xmm0, %xmm0
	mulss	.LC48(%rip), %xmm0
	movss	24(%rsp), %xmm1
	movss	16(%rsp), %xmm3
	movss	8(%rsp), %xmm4
	addl	$-128, %eax
	movzbl	%al, %eax
	sall	$8, %eax
	divss	%xmm2, %xmm0
	mulss	%xmm0, %xmm1
	mulss	%xmm0, %xmm3
	mulss	%xmm4, %xmm0
	cvttss2sil	%xmm1, %edx
	cvttss2sil	%xmm3, %ecx
	cvttss2sil	%xmm0, %esi
	movzbl	%dl, %edx
	movzbl	%cl, %ecx
	movzbl	%sil, %esi
	orl	%esi, %eax
	sall	$8, %eax
	orl	%ecx, %eax
	sall	$8, %eax
	orl	%edx, %eax
	movl	%eax, 120(%rsp)
	jmp	.L812
.L813:
	movl	%r13d, %r9d
.L757:
	movl	32(%rsp), %ecx
	leal	1(%rcx), %eax
	cmpl	%ecx, 36(%rsp)
	je	.L750
.L784:
	movl	%eax, 32(%rsp)
	movl	%eax, %ecx
	jmp	.L749
.L747:
	movq	48(%rsp), %r15
	movslq	%r9d, %rax
	movl	104(%rsp), %r8d
	movq	%rbx, 96(%rsp)
	movq	%rax, 80(%rsp)
	movl	28(%rsp), %ebx
	movq	%rax, %r12
	leaq	(%rax,%r15), %rcx
	movq	%r8, %r13
	movq	%r15, 88(%rsp)
	movq	%rcx, (%rsp)
	movl	76(%rsp), %ecx
	movl	%r9d, 108(%rsp)
	movq	%rcx, %r8
	jmp	.L763
.L787:
	movss	.LC47(%rip), %xmm6
	movaps	%xmm1, %xmm2
	movaps	%xmm1, %xmm3
	movaps	%xmm1, %xmm4
	comiss	%xmm2, %xmm6
	jbe	.L815
.L789:
	xorl	%eax, %eax
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	xorl	%edi, %edi
.L762:
	movb	%dil, (%r15)
	addq	%r14, %rbp
	addq	$1, %r15
	movb	%sil, -1(%r15,%r12)
	movl	%eax, 120(%rsp)
	movb	%cl, -1(%r15,%r8)
	movb	%dl, -1(%r15,%r13)
	cmpq	%r15, (%rsp)
	je	.L816
.L763:
	movss	0(%rbp), %xmm1
	cmpl	$1, %ebx
	ja	.L787
	movss	4(%rbp), %xmm3
	movss	8(%rbp), %xmm4
	movaps	%xmm1, %xmm7
	movss	.LC47(%rip), %xmm6
	movaps	%xmm3, %xmm2
	maxss	%xmm4, %xmm2
	maxss	%xmm2, %xmm7
	movaps	%xmm7, %xmm2
	comiss	%xmm2, %xmm6
	ja	.L789
.L815:
	leaq	116(%rsp), %rdi
	pxor	%xmm0, %xmm0
	movq	%r8, 40(%rsp)
	movss	%xmm1, 56(%rsp)
	cvtss2sd	%xmm2, %xmm0
	movss	%xmm3, 24(%rsp)
	movss	%xmm4, 16(%rsp)
	movss	%xmm2, 8(%rsp)
	call	frexp@PLT
	movss	8(%rsp), %xmm2
	movzbl	116(%rsp), %eax
	cvtsd2ss	%xmm0, %xmm0
	mulss	.LC48(%rip), %xmm0
	movss	56(%rsp), %xmm1
	movss	24(%rsp), %xmm3
	movss	16(%rsp), %xmm4
	leal	-128(%rax), %edx
	movzbl	%dl, %eax
	movq	40(%rsp), %r8
	sall	$8, %eax
	divss	%xmm2, %xmm0
	mulss	%xmm0, %xmm1
	mulss	%xmm0, %xmm3
	mulss	%xmm4, %xmm0
	cvttss2sil	%xmm1, %r9d
	cvttss2sil	%xmm3, %r10d
	cvttss2sil	%xmm0, %r11d
	movl	%r9d, %edi
	movzbl	%r9b, %r9d
	movl	%r10d, %esi
	movzbl	%r10b, %r10d
	movl	%r11d, %ecx
	movzbl	%r11b, %r11d
	orl	%r11d, %eax
	sall	$8, %eax
	orl	%r10d, %eax
	sall	$8, %eax
	orl	%r9d, %eax
	jmp	.L762
.L816:
	movq	96(%rsp), %rbx
	movl	108(%rsp), %r9d
	leaq	124(%rsp), %rsi
	movl	$4, %edx
	movq	88(%rsp), %r12
	movl	$4, %r13d
	movl	%r9d, 8(%rsp)
	movq	8(%rbx), %rdi
	call	*(%rbx)
	leaq	116(%rsp), %rax
	movl	%r13d, 56(%rsp)
	movl	8(%rsp), %r9d
	movq	%rax, (%rsp)
	movq	%r14, 40(%rsp)
	movq	%rbx, %r14
	movq	80(%rsp), %rbx
.L782:
	xorl	%r15d, %r15d
	movq	%r14, %r13
	movl	%r9d, %eax
	movl	%r15d, %r14d
	movq	%rbx, %r15
	.p2align 4,,10
	.p2align 3
.L773:
	cmpl	%r14d, %eax
	jle	.L780
.L818:
	movslq	%r14d, %rbx
	leal	2(%r14), %edx
	movl	%r14d, %ebp
	leaq	(%r12,%rbx), %rsi
	cmpl	%edx, %eax
	jg	.L767
	jmp	.L768
	.p2align 4,,10
	.p2align 3
.L765:
	addl	$1, %edx
	addl	$1, %ebp
	addq	$1, %rsi
	cmpl	%edx, %eax
	je	.L768
.L767:
	movzbl	(%rsi), %ecx
	cmpb	1(%rsi), %cl
	jne	.L765
	cmpb	2(%rsi), %cl
	jne	.L765
	cmpl	%edx, %eax
	jle	.L768
	leal	2(%rbp), %edx
	cmpl	%ebp, %r14d
	jge	.L771
.L807:
	movq	%r13, %rcx
	movl	%edx, 8(%rsp)
	movl	%r14d, %r13d
	movq	%r15, 16(%rsp)
	movq	%rcx, %r14
	movl	%eax, 24(%rsp)
	jmp	.L770
	.p2align 4,,10
	.p2align 3
.L817:
	movslq	%r13d, %rbx
.L770:
	movl	%ebp, %r15d
	movl	$128, %edx
	movq	8(%r14), %rdi
	movq	(%rsp), %rsi
	subl	%r13d, %r15d
	cmpl	%edx, %r15d
	cmovg	%edx, %r15d
	addq	%r12, %rbx
	movl	$1, %edx
	addl	%r15d, %r13d
	movb	%r15b, 116(%rsp)
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	%r15d, %edx
	movq	%rbx, %rsi
	call	*(%r14)
	cmpl	%ebp, %r13d
	jl	.L817
	movq	%r14, %rcx
	movl	8(%rsp), %edx
	movq	16(%rsp), %r15
	movl	%r13d, %r14d
	movl	24(%rsp), %eax
	movq	%rcx, %r13
.L771:
	cmpl	%edx, %eax
	jle	.L773
	cmpl	%ebp, %eax
	jle	.L775
	movslq	%r14d, %rbx
	movslq	%ebp, %rdx
	movzbl	(%r12,%rbx), %esi
	addq	%r12, %rdx
	jmp	.L776
	.p2align 4,,10
	.p2align 3
.L779:
	addl	$1, %ebp
	addq	$1, %rdx
	cmpl	%ebp, %eax
	je	.L775
.L776:
	cmpb	%sil, (%rdx)
	je	.L779
.L775:
	leaq	115(%rsp), %rsi
	cmpl	%r14d, %ebp
	jle	.L773
	movl	%eax, 16(%rsp)
	movq	%r15, 8(%rsp)
	movq	%r12, %r15
	movq	%rsi, %r12
	.p2align 4,,10
	.p2align 3
.L777:
	movl	%ebp, %ebx
	movl	$127, %edx
	movq	8(%r13), %rdi
	movq	(%rsp), %rsi
	subl	%r14d, %ebx
	cmpl	%edx, %ebx
	cmovg	%edx, %ebx
	movslq	%r14d, %rdx
	movzbl	(%r15,%rdx), %edx
	addl	%ebx, %r14d
	movb	%dl, 115(%rsp)
	leal	-128(%rbx), %edx
	movb	%dl, 116(%rsp)
	movl	$1, %edx
	call	*0(%r13)
	movq	8(%r13), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	call	*0(%r13)
	cmpl	%ebp, %r14d
	jl	.L777
	movl	16(%rsp), %eax
	movq	%r15, %r12
	movq	8(%rsp), %r15
	cmpl	%r14d, %eax
	jg	.L818
.L780:
	addq	%r15, %r12
	subl	$1, 56(%rsp)
	movq	%r15, %rbx
	movq	%r13, %r14
	movl	%eax, %r9d
	jne	.L782
	movl	32(%rsp), %ecx
	movq	40(%rsp), %r14
	movq	%r13, %rbx
	leal	1(%rcx), %eax
	cmpl	%ecx, 36(%rsp)
	jne	.L784
.L750:
	movq	48(%rsp), %rdi
	call	free@PLT
	movq	344(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L819
	addq	$360, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L768:
	.cfi_restore_state
	leal	2(%rax), %edx
	movl	%eax, %ebp
	jmp	.L807
.L819:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE821:
	.size	stbi_write_hdr_core.part.0, .-stbi_write_hdr_core.part.0
	.p2align 4
	.type	stbiw__outfile.constprop.0, @function
stbiw__outfile.constprop.0:
.LFB833:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r9d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$280, %rsp
	.cfi_def_cfa_offset 336
	movl	%ecx, (%rsp)
	movq	344(%rsp), %rcx
	movl	%r8d, 12(%rsp)
	movq	368(%rsp), %rsi
	movq	%rcx, 24(%rsp)
	testb	%al, %al
	je	.L821
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm1, 160(%rsp)
	movaps	%xmm2, 176(%rsp)
	movaps	%xmm3, 192(%rsp)
	movaps	%xmm4, 208(%rsp)
	movaps	%xmm5, 224(%rsp)
	movaps	%xmm6, 240(%rsp)
	movaps	%xmm7, 256(%rsp)
.L821:
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movl	12(%rsp), %ecx
	orl	(%rsp), %ecx
	jns	.L860
.L820:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L861
	addq	$280, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L860:
	.cfi_restore_state
	leaq	376(%rsp), %rax
	movq	%rbx, %rdi
	leaq	64(%rsp), %rdx
	movl	$48, 64(%rsp)
	movq	%rax, 72(%rsp)
	leaq	96(%rsp), %rax
	movl	$48, 68(%rsp)
	movq	%rax, 80(%rsp)
	call	stbiw__writefv
	movl	12(%rsp), %edi
	movl	$0, 60(%rsp)
	testl	%edi, %edi
	je	.L848
	movl	stbi__flip_vertically_on_write(%rip), %esi
	testl	%esi, %esi
	jne	.L852
	movl	12(%rsp), %r15d
	movl	$-1, 32(%rsp)
	movl	$-1, 12(%rsp)
	subl	$1, %r15d
.L824:
	movl	(%rsp), %eax
	movl	32(%rsp), %ecx
	imull	%r12d, %eax
	imull	%eax, %ecx
	imull	%r15d, %eax
	movl	%ecx, 36(%rsp)
	movl	%eax, 16(%rsp)
	leaq	60(%rsp), %rax
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L849:
	movl	(%rsp), %eax
	movl	80(%rbx), %edx
	testl	%eax, %eax
	jle	.L847
	movslq	16(%rsp), %rbp
	movq	24(%rsp), %rax
	movslq	%r12d, %r14
	xorl	%r13d, %r13d
	movl	%r15d, 20(%rsp)
	movq	%r14, %r15
	movl	352(%rsp), %r14d
	addq	%rax, %rbp
	jmp	.L842
	.p2align 4,,10
	.p2align 3
.L864:
	leal	-1(%r12), %esi
	cmpl	$1, %esi
	ja	.L827
	movl	336(%rsp), %ecx
	movzbl	0(%rbp), %r8d
	movslq	%edx, %rsi
	testl	%ecx, %ecx
	jne	.L862
	addq	$1, %rsi
	cmpq	$64, %rsi
	ja	.L833
	movslq	%edx, %rsi
	addl	$1, %edx
.L834:
	movl	%edx, 80(%rbx)
	movb	%r8b, 16(%rbx,%rsi)
	.p2align 4,,10
	.p2align 3
.L827:
	cmpl	$1, %r14d
	jne	.L837
	movslq	%edx, %rsi
	movzbl	-1(%rbp,%r15), %r8d
	addq	$1, %rsi
	cmpq	$64, %rsi
	ja	.L840
	movslq	%edx, %rsi
	addl	$1, %edx
.L841:
	movl	%edx, 80(%rbx)
	movb	%r8b, 16(%rbx,%rsi)
.L837:
	addl	$1, %r13d
	addq	%r15, %rbp
	cmpl	%r13d, (%rsp)
	je	.L863
.L842:
	movq	(%rbx), %r10
	movq	8(%rbx), %rdi
	cmpl	$3, %r12d
	je	.L825
	jle	.L864
	cmpl	$4, %r12d
	jne	.L827
	testl	%r14d, %r14d
	jne	.L825
	movzbl	0(%rbp), %esi
	movzbl	3(%rbp), %r9d
	movl	$2155905153, %eax
	movzbl	1(%rbp), %r11d
	subl	$255, %esi
	imull	%r9d, %esi
	movslq	%esi, %r8
	imulq	$-2139062143, %r8, %r8
	shrq	$32, %r8
	addl	%esi, %r8d
	sarl	$31, %esi
	sarl	$7, %r8d
	cmpb	$1, %sil
	movzbl	2(%rbp), %esi
	sbbb	$0, %r8b
	imull	%r9d, %r11d
	subl	$255, %esi
	imull	%r9d, %esi
	imulq	%rax, %r11
	movslq	%esi, %r9
	imulq	$-2139062143, %r9, %r9
	shrq	$39, %r11
	shrq	$32, %r9
	addl	%esi, %r9d
	sarl	$31, %esi
	sarl	$7, %r9d
	cmpb	$1, %sil
	movslq	%edx, %rsi
	sbbb	$0, %r9b
	addq	$3, %rsi
	cmpq	$64, %rsi
	ja	.L835
	leal	1(%rdx), %edi
	leal	2(%rdx), %esi
	movslq	%edx, %r10
	addl	$3, %edx
.L836:
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	movl	%edx, 80(%rbx)
	addl	$1, %r13d
	movb	%r9b, 16(%rbx,%r10)
	addq	%r15, %rbp
	movb	%r11b, 16(%rbx,%rdi)
	movb	%r8b, 16(%rbx,%rsi)
	cmpl	%r13d, (%rsp)
	jne	.L842
	.p2align 4,,10
	.p2align 3
.L863:
	movl	20(%rsp), %r15d
.L847:
	testl	%edx, %edx
	je	.L843
	movq	8(%rbx), %rdi
	leaq	16(%rbx), %rsi
	call	*(%rbx)
	movl	$0, 80(%rbx)
	movq	8(%rbx), %rdi
	movl	360(%rsp), %edx
	movq	40(%rsp), %rsi
	call	*(%rbx)
	movl	32(%rsp), %eax
	movl	36(%rsp), %ecx
	addl	%ecx, 16(%rsp)
	addl	%eax, %r15d
	cmpl	%r15d, 12(%rsp)
	jne	.L849
.L848:
	movl	$1, %eax
	jmp	.L820
.L852:
	movl	$1, 32(%rsp)
	xorl	%r15d, %r15d
	jmp	.L824
	.p2align 4,,10
	.p2align 3
.L825:
	movslq	%edx, %rsi
	movzbl	0(%rbp), %r8d
	movzbl	1(%rbp), %r9d
	addq	$3, %rsi
	movzbl	2(%rbp), %r11d
	cmpq	$64, %rsi
	ja	.L838
	leal	1(%rdx), %edi
	leal	2(%rdx), %esi
	movslq	%edx, %r10
	addl	$3, %edx
.L839:
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	movl	%edx, 80(%rbx)
	movb	%r11b, 16(%rbx,%r10)
	movb	%r9b, 16(%rbx,%rdi)
	movb	%r8b, 16(%rbx,%rsi)
	jmp	.L827
	.p2align 4,,10
	.p2align 3
.L840:
	movb	%r8b, 6(%rsp)
	leaq	16(%rbx), %rsi
	movq	8(%rbx), %rdi
	call	*(%rbx)
	movzbl	6(%rsp), %r8d
	movl	$1, %edx
	xorl	%esi, %esi
	jmp	.L841
	.p2align 4,,10
	.p2align 3
.L838:
	movb	%r11b, 8(%rsp)
	leaq	16(%rbx), %rsi
	movb	%r9b, 7(%rsp)
	movb	%r8b, 6(%rsp)
	call	*%r10
	movl	$2, %esi
	movl	$1, %edi
	xorl	%r10d, %r10d
	movzbl	8(%rsp), %r11d
	movzbl	7(%rsp), %r9d
	movl	$3, %edx
	movzbl	6(%rsp), %r8d
	jmp	.L839
	.p2align 4,,10
	.p2align 3
.L833:
	movb	%r8b, 6(%rsp)
	leaq	16(%rbx), %rsi
	call	*%r10
	movzbl	6(%rsp), %r8d
	xorl	%esi, %esi
	movl	$1, %edx
	jmp	.L834
	.p2align 4,,10
	.p2align 3
.L862:
	addq	$3, %rsi
	cmpq	$64, %rsi
	ja	.L831
	leal	1(%rdx), %edi
	leal	2(%rdx), %esi
	movslq	%edx, %r9
	addl	$3, %edx
.L832:
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	movl	%edx, 80(%rbx)
	movb	%r8b, 16(%rbx,%r9)
	movb	%r8b, 16(%rbx,%rdi)
	movb	%r8b, 16(%rbx,%rsi)
	jmp	.L827
	.p2align 4,,10
	.p2align 3
.L835:
	movl	%r11d, 8(%rsp)
	leaq	16(%rbx), %rsi
	movb	%r9b, 7(%rsp)
	movb	%r8b, 6(%rsp)
	call	*%r10
	movl	8(%rsp), %r11d
	xorl	%r10d, %r10d
	movl	$2, %esi
	movzbl	7(%rsp), %r9d
	movzbl	6(%rsp), %r8d
	movl	$1, %edi
	movl	$3, %edx
	jmp	.L836
	.p2align 4,,10
	.p2align 3
.L843:
	movq	8(%rbx), %rdi
	movl	360(%rsp), %edx
	movq	40(%rsp), %rsi
	call	*(%rbx)
	movl	32(%rsp), %eax
	movl	36(%rsp), %ecx
	addl	%ecx, 16(%rsp)
	addl	%eax, %r15d
	movl	12(%rsp), %eax
	cmpl	%eax, %r15d
	jne	.L849
	movl	$1, %eax
	jmp	.L820
	.p2align 4,,10
	.p2align 3
.L831:
	movb	%r8b, 6(%rsp)
	leaq	16(%rbx), %rsi
	call	*%r10
	movl	$2, %esi
	movl	$3, %edx
	xorl	%r9d, %r9d
	movl	336(%rsp), %edi
	movzbl	6(%rsp), %r8d
	jmp	.L832
.L861:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE833:
	.size	stbiw__outfile.constprop.0, .-stbiw__outfile.constprop.0
	.p2align 4
	.type	stbiw__zlib_flushf, @function
stbiw__zlib_flushf:
.LFB788:
	.cfi_startproc
	cmpl	$7, (%rdx)
	movq	%rdi, %rax
	jle	.L879
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	testq	%rdi, %rdi
	je	.L867
	.p2align 4,,10
	.p2align 3
.L873:
	movslq	-4(%rax), %rdx
	movl	-8(%rax), %ecx
	leal	1(%rdx), %esi
	cmpl	%ecx, %esi
	jl	.L869
	leal	1(%rcx,%rcx), %r12d
	leaq	-8(%rax), %rdi
	movslq	%r12d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L871
	movslq	4(%rax), %rdx
	leal	1(%rdx), %esi
.L872:
	movl	%r12d, (%rcx)
	leaq	8(%rcx), %rax
.L869:
	movl	(%rbx), %ecx
	movl	%esi, -4(%rax)
	movb	%cl, (%rax,%rdx)
	shrl	$8, (%rbx)
	movl	0(%rbp), %edi
	leal	-8(%rdi), %edx
	movl	%edx, 0(%rbp)
	cmpl	$7, %edx
	jg	.L873
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L867:
	.cfi_restore_state
	movl	$10, %edi
	call	malloc@PLT
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L871
	movl	$0, 4(%rax)
	xorl	%edx, %edx
	movl	$1, %esi
	movl	$2, %r12d
	jmp	.L872
	.p2align 4,,10
	.p2align 3
.L879:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
.L871:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	leaq	__PRETTY_FUNCTION__.22(%rip), %rcx
	movl	$844, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC44(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE788:
	.size	stbiw__zlib_flushf, .-stbiw__zlib_flushf
	.p2align 4
	.type	stbi__malloc_mad3, @function
stbi__malloc_mad3:
.LFB560:
	.cfi_startproc
	movl	%esi, %r8d
	movl	%edi, %eax
	movl	%edx, %esi
	orl	%r8d, %eax
	js	.L882
	testl	%r8d, %r8d
	je	.L895
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%r8d
	cmpl	%eax, %edi
	jg	.L882
	testl	%esi, %esi
	js	.L882
	imull	%edi, %r8d
	testl	%esi, %esi
	je	.L885
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%esi
	cmpl	%eax, %r8d
	jle	.L896
.L882:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L895:
	testl	%edx, %edx
	js	.L882
.L885:
	imull	%r8d, %esi
	leal	(%rsi,%rcx), %edi
	movslq	%edi, %rdi
	jmp	malloc@PLT
.L896:
	movl	%esi, %edx
	movl	$2147483647, %eax
	imull	%r8d, %edx
	subl	%ecx, %eax
	cmpl	%eax, %edx
	jg	.L882
	jmp	.L885
	.cfi_endproc
.LFE560:
	.size	stbi__malloc_mad3, .-stbi__malloc_mad3
	.p2align 4
	.type	stbi_write_tga_core, @function
stbi_write_tga_core:
.LFB777:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leal	-2(%rcx), %eax
	movl	%ecx, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	andl	$-3, %eax
	movl	%edx, %r14d
	movl	%ecx, %edx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%eax, %ebx
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	cmpl	$1, %eax
	sbbl	$0, %edx
	movl	%eax, 12(%rsp)
	cmpl	$2, %edx
	movl	%esi, 36(%rsp)
	setl	%al
	setl	%r8b
	xorl	%ecx, %ecx
	movzbl	%r8b, %r8d
	movzbl	%al, %eax
	addl	$10, %r8d
	addl	$2, %eax
	orl	%r14d, %esi
	js	.L897
	xorl	%ecx, %ecx
	testl	%ebx, %ebx
	movl	stbi_write_tga_with_rle(%rip), %r10d
	movq	%rdi, %rbp
	sete	%cl
	addl	%ecx, %edx
	leal	0(,%rcx,8), %esi
	sall	$3, %edx
	testl	%r10d, %r10d
	je	.L1000
	pushq	%rsi
	.cfi_def_cfa_offset 152
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	leaq	.LC45(%rip), %rsi
	pushq	%rdx
	.cfi_def_cfa_offset 160
	xorl	%edx, %edx
	pushq	%r14
	.cfi_def_cfa_offset 168
	movl	60(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 176
	xorl	%eax, %eax
	pushq	$0
	.cfi_def_cfa_offset 184
	pushq	$0
	.cfi_def_cfa_offset 192
	pushq	$0
	.cfi_def_cfa_offset 200
	pushq	$0
	.cfi_def_cfa_offset 208
	call	stbiw__writef.constprop.0
	movl	stbi__flip_vertically_on_write(%rip), %r9d
	addq	$64, %rsp
	.cfi_def_cfa_offset 144
	testl	%r9d, %r9d
	jne	.L962
	leal	-1(%r14), %r13d
	movl	$-1, %edx
	movl	$-1, %r14d
.L902:
	movl	80(%rbp), %ebx
	cmpl	%r14d, %r13d
	je	.L955
	movl	36(%rsp), %ecx
	movl	%edx, 72(%rsp)
	movl	%r14d, 76(%rsp)
	movl	%ecx, %eax
	movl	%r15d, 32(%rsp)
	imull	%edx, %eax
	imull	%r15d, %eax
	cltq
	movq	%rax, 64(%rsp)
	movl	%ecx, %eax
	imull	%r13d, %eax
	imull	%r15d, %eax
	cltq
	leaq	(%r12,%rax), %r10
	movq	%r10, %r11
	.p2align 4,,10
	.p2align 3
.L954:
	movl	36(%rsp), %eax
	testl	%eax, %eax
	jle	.L903
	subl	$1, %eax
	movl	%r13d, 60(%rsp)
	movslq	32(%rsp), %r12
	xorl	%r8d, %r8d
	movl	%eax, 52(%rsp)
	movq	%r11, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L953:
	movl	32(%rsp), %eax
	movq	16(%rsp), %rcx
	movl	%eax, %r9d
	imull	%r8d, %r9d
	movslq	%r9d, %r13
	addq	%rcx, %r13
	cmpl	%r8d, 52(%rsp)
	jle	.L904
	leal	(%r9,%rax), %r15d
	movq	%r12, %rdx
	movq	%r13, %rdi
	movl	%r8d, 24(%rsp)
	movslq	%r15d, %rsi
	addq	%rcx, %rsi
	call	memcmp@PLT
	movl	24(%rsp), %r8d
	movl	%eax, %r14d
	leal	2(%r8), %eax
	testl	%r14d, %r14d
	je	.L905
	movl	36(%rsp), %edx
	cmpl	%eax, %edx
	jle	.L963
	movl	32(%rsp), %eax
	movq	16(%rsp), %rcx
	movq	%r13, %rdi
	movl	%ebx, 48(%rsp)
	movq	%r13, 24(%rsp)
	movl	%r8d, %r14d
	movl	%edx, %ebx
	leal	(%r15,%rax), %esi
	movl	$2, %r15d
	movq	%rbp, 40(%rsp)
	movslq	%esi, %rsi
	movl	%r15d, %ebp
	movq	%r12, %r15
	movq	%rdi, %r12
	addq	%rcx, %rsi
	movq	%rsi, %r13
	jmp	.L908
	.p2align 4,,10
	.p2align 3
.L1001:
	addl	$1, %ebp
	addq	%r15, %r12
	addq	%r15, %r13
	leal	(%r14,%rbp), %eax
	cmpl	%eax, %ebx
	jle	.L994
	cmpl	$127, %ebp
	jg	.L994
.L908:
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L1001
	movq	%r15, %r12
	movl	%ebp, %r15d
	movl	%r14d, %r8d
	movq	24(%rsp), %r13
	subl	$1, %r15d
	movl	48(%rsp), %ebx
	movq	40(%rsp), %rbp
	leal	-1(%r15), %eax
	addl	%r15d, %r8d
.L906:
	movslq	%ebx, %rdx
	leaq	1(%rdx), %rsi
	cmpq	$64, %rsi
	jbe	.L915
.L1005:
	movl	%r8d, 48(%rsp)
	movl	%ebx, %edx
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movb	%al, 24(%rsp)
	movl	$1, %ebx
	call	*0(%rbp)
	movzbl	24(%rsp), %eax
	movl	$1, 80(%rbp)
	movl	48(%rsp), %r8d
	movb	%al, 16(%rbp)
.L916:
	xorl	%eax, %eax
	movl	%ebx, %edx
	movl	%r8d, 56(%rsp)
	movq	%r12, %rbx
	movl	32(%rsp), %r14d
	movl	%eax, %r12d
	jmp	.L931
	.p2align 4,,10
	.p2align 3
.L1003:
	leal	-1(%r14), %eax
	cmpl	$1, %eax
	ja	.L919
	movslq	%edx, %rax
	movzbl	0(%r13), %r9d
	addq	$1, %rax
	cmpq	$64, %rax
	ja	.L922
	movslq	%edx, %rax
	addl	$1, %edx
.L923:
	movl	%edx, 80(%rbp)
	movb	%r9b, 16(%rbp,%rax)
	.p2align 4,,10
	.p2align 3
.L919:
	movl	12(%rsp), %edi
	testl	%edi, %edi
	jne	.L926
	movslq	%edx, %rax
	movzbl	-1(%r13,%rbx), %r9d
	addq	$1, %rax
	cmpq	$64, %rax
	ja	.L929
	movslq	%edx, %rax
	addl	$1, %edx
.L930:
	movl	%edx, 80(%rbp)
	movb	%r9b, 16(%rbp,%rax)
.L926:
	addl	$1, %r12d
	addq	%rbx, %r13
	cmpl	%r12d, %r15d
	je	.L1002
.L931:
	cmpl	$3, %r14d
	je	.L917
	jle	.L1003
	cmpl	$4, %r14d
	jne	.L919
	movl	12(%rsp), %r8d
	testl	%r8d, %r8d
	je	.L917
	movzbl	0(%r13), %esi
	movzbl	3(%r13), %edi
	movl	$2155905153, %ecx
	movzbl	1(%r13), %r10d
	subl	$255, %esi
	imull	%edi, %esi
	movslq	%esi, %rax
	imulq	$-2139062143, %rax, %rax
	shrq	$32, %rax
	addl	%esi, %eax
	sarl	$31, %esi
	sarl	$7, %eax
	cmpb	$1, %sil
	movzbl	2(%r13), %esi
	sbbb	$0, %al
	imull	%edi, %r10d
	subl	$255, %esi
	imull	%edi, %esi
	imulq	%rcx, %r10
	movslq	%esi, %r9
	imulq	$-2139062143, %r9, %r9
	shrq	$39, %r10
	shrq	$32, %r9
	addl	%esi, %r9d
	sarl	$31, %esi
	sarl	$7, %r9d
	cmpb	$1, %sil
	movslq	%edx, %rsi
	sbbb	$0, %r9b
	addq	$3, %rsi
	cmpq	$64, %rsi
	ja	.L924
	leal	1(%rdx), %edi
	leal	2(%rdx), %esi
	movslq	%edx, %r11
	addl	$3, %edx
.L925:
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	addl	$1, %r12d
	movl	%edx, 80(%rbp)
	addq	%rbx, %r13
	movb	%r9b, 16(%rbp,%r11)
	movb	%r10b, 16(%rbp,%rdi)
	movb	%al, 16(%rbp,%rsi)
	cmpl	%r12d, %r15d
	jne	.L931
	.p2align 4,,10
	.p2align 3
.L1002:
	movl	56(%rsp), %r8d
	movq	%rbx, %r12
	movl	%edx, %ebx
.L932:
	cmpl	%r8d, 36(%rsp)
	jg	.L953
	movl	60(%rsp), %r13d
	movq	16(%rsp), %r11
.L903:
	movl	72(%rsp), %eax
	addl	%eax, %r13d
	movq	64(%rsp), %rax
	addq	%rax, %r11
	movl	76(%rsp), %eax
	cmpl	%eax, %r13d
	jne	.L954
.L955:
	testl	%ebx, %ebx
	je	.L958
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movl	%ebx, %edx
	call	*0(%rbp)
	movl	$0, 80(%rbp)
.L958:
	movl	$1, %ecx
.L897:
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ecx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L1000:
	.cfi_restore_state
	subq	$8, %rsp
	.cfi_def_cfa_offset 152
	movl	%r15d, %r9d
	movl	%r14d, %r8d
	pushq	%rsi
	.cfi_def_cfa_offset 160
	movl	$-1, %esi
	pushq	%rdx
	.cfi_def_cfa_offset 168
	movl	$-1, %edx
	pushq	%r14
	.cfi_def_cfa_offset 176
	movl	68(%rsp), %ebx
	pushq	%rbx
	.cfi_def_cfa_offset 184
	pushq	$0
	.cfi_def_cfa_offset 192
	pushq	$0
	.cfi_def_cfa_offset 200
	pushq	$0
	.cfi_def_cfa_offset 208
	pushq	$0
	.cfi_def_cfa_offset 216
	pushq	$0
	.cfi_def_cfa_offset 224
	pushq	%rax
	.cfi_def_cfa_offset 232
	leaq	.LC45(%rip), %rax
	pushq	$0
	.cfi_def_cfa_offset 240
	pushq	$0
	.cfi_def_cfa_offset 248
	pushq	%rax
	.cfi_def_cfa_offset 256
	xorl	%eax, %eax
	pushq	$0
	.cfi_def_cfa_offset 264
	pushq	%rcx
	.cfi_def_cfa_offset 272
	movl	%ebx, %ecx
	pushq	%r12
	.cfi_def_cfa_offset 280
	pushq	$0
	.cfi_def_cfa_offset 288
	call	stbiw__outfile.constprop.0
	addq	$144, %rsp
	.cfi_def_cfa_offset 144
	movl	%eax, %ecx
	jmp	.L897
	.p2align 4,,10
	.p2align 3
.L917:
	movslq	%edx, %rsi
	movzbl	0(%r13), %eax
	movzbl	1(%r13), %r9d
	addq	$3, %rsi
	movzbl	2(%r13), %r10d
	cmpq	$64, %rsi
	ja	.L927
	leal	1(%rdx), %edi
	leal	2(%rdx), %esi
	movslq	%edx, %r11
	addl	$3, %edx
.L928:
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	movl	%edx, 80(%rbp)
	movb	%r10b, 16(%rbp,%r11)
	movb	%r9b, 16(%rbp,%rdi)
	movb	%al, 16(%rbp,%rsi)
	jmp	.L919
	.p2align 4,,10
	.p2align 3
.L929:
	movb	%r9b, 24(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	call	*0(%rbp)
	movzbl	24(%rsp), %r9d
	movl	$1, %edx
	xorl	%eax, %eax
	jmp	.L930
	.p2align 4,,10
	.p2align 3
.L927:
	movb	%r10b, 40(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movb	%r9b, 48(%rsp)
	movb	%al, 24(%rsp)
	call	*0(%rbp)
	movzbl	24(%rsp), %eax
	movl	$2, %esi
	xorl	%r11d, %r11d
	movzbl	40(%rsp), %r10d
	movzbl	48(%rsp), %r9d
	movl	$1, %edi
	movl	$3, %edx
	jmp	.L928
	.p2align 4,,10
	.p2align 3
.L922:
	movb	%r9b, 24(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	call	*0(%rbp)
	movzbl	24(%rsp), %r9d
	movl	$1, %edx
	xorl	%eax, %eax
	jmp	.L923
	.p2align 4,,10
	.p2align 3
.L905:
	movl	36(%rsp), %ecx
	cmpl	%eax, %ecx
	jle	.L964
	movl	32(%rsp), %eax
	movl	%r14d, 24(%rsp)
	movl	%ebx, 48(%rsp)
	movl	%r8d, %ebx
	leal	(%r15,%rax), %r9d
	movq	16(%rsp), %rax
	movl	$2, %r15d
	movq	%rbp, 40(%rsp)
	movslq	%r9d, %r9
	movl	%r15d, %ebp
	movl	%ecx, %r15d
	addq	%rax, %r9
	movq	%r9, %r14
	jmp	.L913
	.p2align 4,,10
	.p2align 3
.L991:
	addl	$1, %ebp
	addq	%r12, %r14
	leal	0(%rbp,%rbx), %eax
	cmpl	%eax, %r15d
	jle	.L995
	cmpl	$127, %ebp
	jg	.L995
.L913:
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	je	.L991
	movl	%ebp, %r15d
	movl	%ebx, %r8d
	movl	24(%rsp), %r14d
	movl	48(%rsp), %ebx
	movq	40(%rsp), %rbp
	leal	(%r15,%r8), %eax
.L912:
	movl	%eax, %r8d
	leal	127(%r15), %r10d
.L911:
	movslq	%ebx, %rsi
	leaq	1(%rsi), %rax
	cmpq	$64, %rax
	jbe	.L933
	movl	%r8d, 48(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movl	%ebx, %edx
	movb	%r10b, 24(%rsp)
	call	*0(%rbp)
	movl	32(%rsp), %eax
	movzbl	24(%rsp), %r10d
	movl	$1, 80(%rbp)
	movl	48(%rsp), %r8d
	cmpl	$3, %eax
	movb	%r10b, 16(%rbp)
	je	.L934
	jg	.L935
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L999
	movzbl	0(%r13), %r15d
	movl	$2, %edx
	movl	$1, %esi
.L945:
	movl	%edx, 80(%rbp)
	movb	%r15b, 16(%rbp,%rsi)
.L941:
	movl	12(%rsp), %eax
	movl	%edx, %ebx
	testl	%eax, %eax
	jne	.L932
	leal	1(%rdx), %eax
	movzbl	-1(%r13,%r12), %r13d
	cltq
	cmpq	$64, %rax
	jbe	.L1004
	movl	%r8d, 24(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movl	$1, %ebx
	call	*0(%rbp)
	movl	24(%rsp), %r8d
.L952:
	movslq	%r14d, %r15
	movl	%ebx, 80(%rbp)
	movb	%r13b, 16(%rbp,%r15)
	jmp	.L932
	.p2align 4,,10
	.p2align 3
.L904:
	movslq	%ebx, %rdx
	addl	$1, %r8d
	xorl	%eax, %eax
	movl	$1, %r15d
	leaq	1(%rdx), %rsi
	cmpq	$64, %rsi
	ja	.L1005
.L915:
	addl	$1, %ebx
	movl	%ebx, 80(%rbp)
	movb	%al, 16(%rbp,%rdx)
	jmp	.L916
	.p2align 4,,10
	.p2align 3
.L935:
	cmpl	$4, 32(%rsp)
	movl	$4, %esi
	movl	$1, %edx
	jne	.L999
.L938:
	movl	12(%rsp), %ecx
	movzbl	0(%r13), %ebx
	movzbl	1(%r13), %eax
	movzbl	2(%r13), %r9d
	testl	%ecx, %ecx
	je	.L943
	movzbl	3(%r13), %edi
	movzbl	%bl, %r10d
	movzbl	%al, %r13d
	subl	$255, %r10d
	movl	%r13d, %eax
	imull	%edi, %r10d
	movslq	%r10d, %r15
	imulq	$-2139062143, %r15, %r15
	shrq	$32, %r15
	addl	%r10d, %r15d
	sarl	$31, %r10d
	sarl	$7, %r15d
	cmpb	$1, %r10b
	sbbb	$0, %r15b
	imull	%edi, %eax
	movl	%eax, %r13d
	movl	$2155905153, %eax
	imulq	%rax, %r13
	leal	-255(%r9), %eax
	imull	%eax, %edi
	shrq	$39, %r13
	movslq	%edi, %rax
	imulq	$-2139062143, %rax, %rax
	shrq	$32, %rax
	addl	%edi, %eax
	sarl	$31, %edi
	sarl	$7, %eax
	cmpb	$1, %dil
	sbbb	$0, %al
	cmpq	$64, %rsi
	ja	.L946
	leal	3(%rdx), %ebx
	leal	1(%rdx), %edi
	leal	2(%rdx), %esi
.L947:
	movslq	%edx, %rdx
	movl	%ebx, 80(%rbp)
	movb	%al, 16(%rbp,%rdx)
	movslq	%edi, %rax
	movb	%r13b, 16(%rbp,%rax)
	movslq	%esi, %rax
	movb	%r15b, 16(%rbp,%rax)
	jmp	.L932
	.p2align 4,,10
	.p2align 3
.L933:
	movl	32(%rsp), %eax
	leal	1(%rbx), %edx
	movl	%edx, 80(%rbp)
	movb	%r10b, 16(%rbp,%rsi)
	cmpl	$3, %eax
	je	.L939
	jg	.L940
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L941
	movzbl	0(%r13), %r15d
	cmpq	$63, %rsi
	jne	.L1006
	movl	%r8d, 24(%rsp)
	leaq	16(%rbp), %rsi
	movq	8(%rbp), %rdi
	call	*0(%rbp)
	movl	24(%rsp), %r8d
	xorl	%esi, %esi
	movl	$1, %edx
	jmp	.L945
	.p2align 4,,10
	.p2align 3
.L940:
	addq	$4, %rsi
	cmpl	$4, 32(%rsp)
	je	.L938
	jmp	.L941
	.p2align 4,,10
	.p2align 3
.L924:
	movl	%r10d, 40(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movb	%al, 48(%rsp)
	movb	%r9b, 24(%rsp)
	call	*0(%rbp)
	movl	40(%rsp), %r10d
	movzbl	48(%rsp), %eax
	xorl	%r11d, %r11d
	movzbl	24(%rsp), %r9d
	movl	$2, %esi
	movl	$1, %edi
	movl	$3, %edx
	jmp	.L925
	.p2align 4,,10
	.p2align 3
.L999:
	movl	12(%rsp), %esi
	movl	$1, %ebx
	testl	%esi, %esi
	jne	.L932
	movzbl	-1(%r13,%r12), %r13d
	movl	$1, %r14d
.L937:
	leal	1(%r14), %ebx
	jmp	.L952
	.p2align 4,,10
	.p2align 3
.L994:
	movq	%r15, %r12
	movl	%ebp, %r15d
	movl	%eax, %r8d
	movq	24(%rsp), %r13
	movl	48(%rsp), %ebx
	movq	40(%rsp), %rbp
	leal	-1(%r15), %eax
	jmp	.L906
	.p2align 4,,10
	.p2align 3
.L995:
	movl	%ebp, %r15d
	movl	24(%rsp), %r14d
	movl	48(%rsp), %ebx
	movq	40(%rsp), %rbp
	jmp	.L912
	.p2align 4,,10
	.p2align 3
.L939:
	movzbl	0(%r13), %ebx
	movzbl	1(%r13), %eax
	addq	$4, %rsi
	movzbl	2(%r13), %r9d
.L943:
	movl	%eax, %r15d
	cmpq	$64, %rsi
	jbe	.L1007
	movl	%r8d, 48(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movb	%r9b, 24(%rsp)
	call	*0(%rbp)
	movl	48(%rsp), %r8d
	movzbl	24(%rsp), %r9d
	xorl	%esi, %esi
	movl	$2, %edi
	movl	$1, %r10d
	movl	$3, %edx
.L950:
	movslq	%r10d, %r10
	movslq	%edi, %rdi
	movl	%edx, 80(%rbp)
	movb	%r9b, 16(%rbp,%rsi)
	movb	%r15b, 16(%rbp,%r10)
	movb	%bl, 16(%rbp,%rdi)
	jmp	.L941
	.p2align 4,,10
	.p2align 3
.L934:
	movzbl	0(%r13), %ebx
	movzbl	1(%r13), %r15d
	movl	$1, %esi
	movzbl	2(%r13), %r9d
.L948:
	leal	3(%rsi), %edx
	leal	1(%rsi), %r10d
	leal	2(%rsi), %edi
	jmp	.L950
.L946:
	movl	%r8d, 48(%rsp)
	movq	8(%rbp), %rdi
	leaq	16(%rbp), %rsi
	movl	$3, %ebx
	movb	%al, 24(%rsp)
	call	*0(%rbp)
	movl	48(%rsp), %r8d
	movzbl	24(%rsp), %eax
	xorl	%edx, %edx
	movl	$2, %esi
	movl	$1, %edi
	jmp	.L947
.L1007:
	movslq	%edx, %rsi
	jmp	.L948
.L964:
	movl	%eax, %r8d
	movl	$-127, %r10d
	jmp	.L911
.L963:
	movl	%eax, %r8d
	movl	$2, %r15d
	movl	$1, %eax
	jmp	.L906
.L962:
	movl	$1, %edx
	xorl	%r13d, %r13d
	jmp	.L902
.L1004:
	movl	%edx, %r14d
	jmp	.L937
.L1006:
	movslq	%edx, %rsi
	leal	2(%rbx), %edx
	jmp	.L945
	.cfi_endproc
.LFE777:
	.size	stbi_write_tga_core, .-stbi_write_tga_core
	.section	.rodata.str1.1
.LC53:
	.string	"bad codelengths"
.LC54:
	.string	"bad sizes"
	.text
	.p2align 4
	.type	stbi__zbuild_huffman, @function
stbi__zbuild_huffman:
.LFB656:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pxor	%xmm0, %xmm0
	movq	%rdi, %r8
	leaq	8(%rdi), %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%r8, %rcx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	movaps	%xmm0, 96(%rsp)
	movl	$0, 160(%rsp)
	movaps	%xmm0, 112(%rsp)
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm0, 144(%rsp)
	movq	$0, -8(%rdi)
	movq	$0, 1008(%rdi)
	andq	$-8, %rdi
	subq	%rdi, %rcx
	addl	$1024, %ecx
	shrl	$3, %ecx
	rep stosq
	movslq	%edx, %rdi
	movq	%rsi, %rax
	leaq	(%rdi,%rsi), %rcx
	.p2align 4,,10
	.p2align 3
.L1009:
	movzbl	(%rax), %edx
	addq	$1, %rax
	addl	$1, 96(%rsp,%rdx,4)
	cmpq	%rax, %rcx
	jne	.L1009
	movl	100(%rsp), %ecx
	movl	$0, 96(%rsp)
	cmpl	$2, %ecx
	jg	.L1046
	movl	104(%rsp), %edx
	cmpl	$4, %edx
	jg	.L1046
	movl	108(%rsp), %r9d
	cmpl	$8, %r9d
	jg	.L1046
	movl	112(%rsp), %r10d
	cmpl	$16, %r10d
	jg	.L1046
	movl	116(%rsp), %r11d
	cmpl	$32, %r11d
	jg	.L1046
	movl	120(%rsp), %ebx
	cmpl	$64, %ebx
	jg	.L1046
	movl	124(%rsp), %ebp
	cmpl	$128, %ebp
	jg	.L1046
	movl	128(%rsp), %r12d
	cmpl	$256, %r12d
	jg	.L1046
	movl	132(%rsp), %r13d
	cmpl	$512, %r13d
	jg	.L1046
	movl	136(%rsp), %r14d
	cmpl	$1024, %r14d
	jg	.L1046
	movl	140(%rsp), %eax
	movl	%eax, 12(%rsp)
	cmpl	$2048, %eax
	jg	.L1046
	movl	144(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$4096, %eax
	jg	.L1046
	movl	148(%rsp), %eax
	movl	%eax, 20(%rsp)
	cmpl	$8192, %eax
	jg	.L1046
	movl	152(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$16384, %eax
	jg	.L1046
	movl	156(%rsp), %eax
	movl	%eax, 28(%rsp)
	cmpl	$32768, %eax
	jg	.L1046
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	movl	$0, 36(%rsp)
	movw	%ax, 1026(%r8)
	movl	%ecx, %eax
	sall	$15, %eax
	movw	%r15w, 1126(%r8)
	movl	%eax, 1060(%r8)
	leal	(%rcx,%rcx), %eax
	movl	%eax, 40(%rsp)
	movw	%ax, 1028(%r8)
	addl	%edx, %eax
	movw	%cx, 1128(%r8)
	testl	%edx, %edx
	je	.L1011
	cmpl	$4, %eax
	jg	.L1012
.L1011:
	movl	%eax, %r15d
	addl	%ecx, %edx
	addl	%eax, %eax
	sall	$14, %r15d
	movl	%eax, 44(%rsp)
	movw	%ax, 1030(%r8)
	addl	%r9d, %eax
	movl	%r15d, 1064(%r8)
	movw	%dx, 1130(%r8)
	testl	%r9d, %r9d
	je	.L1013
	cmpl	$8, %eax
	jg	.L1012
.L1013:
	movl	%eax, %ecx
	addl	%r9d, %edx
	addl	%eax, %eax
	sall	$13, %ecx
	movl	%eax, 48(%rsp)
	movw	%ax, 1032(%r8)
	addl	%r10d, %eax
	movl	%ecx, 1068(%r8)
	movw	%dx, 1132(%r8)
	testl	%r10d, %r10d
	je	.L1014
	cmpl	$16, %eax
	jg	.L1012
.L1014:
	movl	%eax, %ecx
	addl	%r10d, %edx
	addl	%eax, %eax
	sall	$12, %ecx
	movl	%eax, 52(%rsp)
	movw	%ax, 1034(%r8)
	addl	%r11d, %eax
	movl	%ecx, 1072(%r8)
	movw	%dx, 1134(%r8)
	testl	%r11d, %r11d
	je	.L1015
	cmpl	$32, %eax
	jg	.L1012
.L1015:
	movl	%eax, %ecx
	addl	%r11d, %edx
	addl	%eax, %eax
	sall	$11, %ecx
	movl	%eax, 56(%rsp)
	movw	%ax, 1036(%r8)
	addl	%ebx, %eax
	movl	%ecx, 1076(%r8)
	movw	%dx, 1136(%r8)
	testl	%ebx, %ebx
	je	.L1016
	cmpl	$64, %eax
	jg	.L1012
.L1016:
	movl	%eax, %ecx
	addl	%ebx, %edx
	addl	%eax, %eax
	sall	$10, %ecx
	movl	%eax, 60(%rsp)
	movw	%ax, 1038(%r8)
	addl	%ebp, %eax
	movl	%ecx, 1080(%r8)
	movw	%dx, 1138(%r8)
	testl	%ebp, %ebp
	je	.L1017
	cmpl	$128, %eax
	jg	.L1012
.L1017:
	movl	%eax, %ecx
	addl	%ebp, %edx
	addl	%eax, %eax
	sall	$9, %ecx
	movl	%eax, 64(%rsp)
	movw	%ax, 1040(%r8)
	addl	%r12d, %eax
	movl	%ecx, 1084(%r8)
	movw	%dx, 1140(%r8)
	testl	%r12d, %r12d
	je	.L1018
	cmpl	$256, %eax
	jg	.L1012
.L1018:
	movl	%eax, %ecx
	addl	%r12d, %edx
	addl	%eax, %eax
	sall	$8, %ecx
	movl	%eax, 68(%rsp)
	movw	%ax, 1042(%r8)
	addl	%r13d, %eax
	movl	%ecx, 1088(%r8)
	movw	%dx, 1142(%r8)
	testl	%r13d, %r13d
	je	.L1019
	cmpl	$512, %eax
	jg	.L1012
.L1019:
	movl	%eax, %ecx
	addl	%r13d, %edx
	addl	%eax, %eax
	sall	$7, %ecx
	movl	%eax, 72(%rsp)
	movw	%ax, 1044(%r8)
	addl	%r14d, %eax
	movl	%ecx, 1092(%r8)
	movw	%dx, 1144(%r8)
	testl	%r14d, %r14d
	je	.L1020
	cmpl	$1024, %eax
	jg	.L1012
.L1020:
	movl	%eax, %ecx
	movl	12(%rsp), %ebx
	addl	%eax, %eax
	addl	%r14d, %edx
	sall	$6, %ecx
	movl	%eax, 76(%rsp)
	movw	%ax, 1046(%r8)
	addl	%ebx, %eax
	movl	%ecx, 1096(%r8)
	movw	%dx, 1146(%r8)
	testl	%ebx, %ebx
	je	.L1021
	cmpl	$2048, %eax
	jg	.L1012
.L1021:
	movl	12(%rsp), %ebx
	movl	%eax, %ecx
	addl	%eax, %eax
	sall	$5, %ecx
	movl	%eax, 80(%rsp)
	addl	%ebx, %edx
	movl	16(%rsp), %ebx
	movw	%ax, 1048(%r8)
	movl	%ecx, 1100(%r8)
	movw	%dx, 1148(%r8)
	addl	%ebx, %eax
	testl	%ebx, %ebx
	je	.L1022
	cmpl	$4096, %eax
	jg	.L1012
.L1022:
	movl	16(%rsp), %ebx
	movl	%eax, %ecx
	addl	%eax, %eax
	sall	$4, %ecx
	movl	%eax, 84(%rsp)
	addl	%ebx, %edx
	movl	20(%rsp), %ebx
	movw	%ax, 1050(%r8)
	movl	%ecx, 1104(%r8)
	movw	%dx, 1150(%r8)
	addl	%ebx, %eax
	testl	%ebx, %ebx
	je	.L1023
	cmpl	$8192, %eax
	jg	.L1012
.L1023:
	movl	20(%rsp), %ebx
	leal	0(,%rax,8), %ecx
	addl	%eax, %eax
	movl	%eax, 88(%rsp)
	addl	%ebx, %edx
	movl	24(%rsp), %ebx
	movw	%ax, 1052(%r8)
	movl	%ecx, 1108(%r8)
	movw	%dx, 1152(%r8)
	addl	%ebx, %eax
	testl	%ebx, %ebx
	je	.L1024
	cmpl	$16384, %eax
	jg	.L1012
.L1024:
	movl	24(%rsp), %ebx
	leal	0(,%rax,4), %ecx
	addl	%eax, %eax
	movl	%eax, 92(%rsp)
	addl	%ebx, %edx
	movl	28(%rsp), %ebx
	movw	%ax, 1054(%r8)
	movl	%ecx, 1112(%r8)
	movw	%dx, 1154(%r8)
	addl	%ebx, %eax
	testl	%ebx, %ebx
	jne	.L1096
.L1025:
	addl	%eax, %eax
	xorl	%edx, %edx
	movl	$1, %ebp
	movl	$16, %ebx
	movl	%eax, 1116(%r8)
	movl	$65536, 1120(%r8)
	jmp	.L1030
	.p2align 4,,10
	.p2align 3
.L1028:
	addl	$1, %r9d
	movl	%r9d, 32(%rsp,%r10,4)
.L1027:
	addq	$1, %rdx
	cmpq	%rdx, %rdi
	je	.L1097
.L1030:
	movzbl	(%rsi,%rdx), %r13d
	movl	%r13d, %ecx
	testl	%r13d, %r13d
	je	.L1027
	movslq	%r13d, %r10
	movzwl	1024(%r8,%r10,2), %r11d
	movl	32(%rsp,%r10,4), %r9d
	movl	%r9d, %eax
	subl	%r11d, %eax
	movzwl	1124(%r8,%r10,2), %r11d
	addl	%r11d, %eax
	cltq
	movb	%r13b, 1156(%r8,%rax)
	movw	%dx, 1444(%r8,%rax,2)
	cmpl	$9, %r13d
	jg	.L1028
	movl	%r9d, %r11d
	leal	(%r9,%r9), %eax
	movl	%r13d, %r12d
	sarl	%r11d
	andl	$43690, %eax
	sall	$9, %r12d
	andl	$21845, %r11d
	orl	%edx, %r12d
	orl	%eax, %r11d
	movl	%r11d, %eax
	sall	$2, %r11d
	sarl	$2, %eax
	andl	$52428, %r11d
	andl	$13107, %eax
	orl	%r11d, %eax
	movl	%eax, %r11d
	sall	$4, %eax
	sarl	$4, %r11d
	andl	$61680, %eax
	andl	$3855, %r11d
	orl	%eax, %r11d
	movl	%r11d, %eax
	sall	$8, %r11d
	movzwl	%r11w, %r14d
	movl	%ebp, %r11d
	sarl	$8, %eax
	sall	%cl, %r11d
	movl	%ebx, %ecx
	orl	%r14d, %eax
	subl	%r13d, %ecx
	movslq	%r11d, %r11
	sarl	%cl, %eax
	cltq
	.p2align 4,,10
	.p2align 3
.L1029:
	movw	%r12w, (%r8,%rax,2)
	addq	%r11, %rax
	cmpl	$511, %eax
	jle	.L1029
	jmp	.L1028
	.p2align 4,,10
	.p2align 3
.L1046:
	leaq	.LC54(%rip), %rax
.L1010:
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L1008:
	movq	168(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L1098
	addq	$184, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1097:
	.cfi_restore_state
	movl	$1, %eax
	jmp	.L1008
	.p2align 4,,10
	.p2align 3
.L1096:
	cmpl	$32768, %eax
	jle	.L1025
	.p2align 4,,10
	.p2align 3
.L1012:
	leaq	.LC53(%rip), %rax
	jmp	.L1010
.L1098:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE656:
	.size	stbi__zbuild_huffman, .-stbi__zbuild_huffman
	.p2align 4
	.type	stbi__zhuffman_decode, @function
stbi__zhuffman_decode:
.LFB662:
	.cfi_startproc
	movl	16(%rdi), %edx
	movq	%rsi, %r8
	cmpl	$15, %edx
	jg	.L1100
	movq	8(%rdi), %r9
	cmpq	%r9, (%rdi)
	jnb	.L1111
	movl	20(%rdi), %esi
	jmp	.L1107
	.p2align 4,,10
	.p2align 3
.L1103:
	movq	(%rdi), %rax
	cmpq	%r9, %rax
	jnb	.L1105
	leaq	1(%rax), %rcx
	movq	%rcx, (%rdi)
	movzbl	(%rax), %eax
	movl	%edx, %ecx
	sall	%cl, %eax
	orl	%eax, %esi
.L1105:
	addl	$8, %edx
	movl	%esi, 20(%rdi)
	movl	%edx, 16(%rdi)
	cmpl	$24, %edx
	jg	.L1104
.L1107:
	movl	%esi, %eax
	movl	%edx, %ecx
	shrl	%cl, %eax
	testl	%eax, %eax
	je	.L1103
	movq	%r9, (%rdi)
	jmp	.L1104
	.p2align 4,,10
	.p2align 3
.L1100:
	movl	20(%rdi), %esi
.L1104:
	movl	%esi, %eax
	andl	$511, %eax
	movzwl	(%r8,%rax,2), %ecx
	movl	%ecx, %eax
	testl	%ecx, %ecx
	je	.L1108
	sarl	$9, %ecx
	andl	$511, %eax
	shrl	%cl, %esi
	subl	%ecx, %edx
	movl	%esi, 20(%rdi)
	movl	%edx, 16(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L1108:
	movl	%esi, %ecx
	leal	(%rsi,%rsi), %eax
	sarl	%ecx
	andl	$43690, %eax
	andl	$21845, %ecx
	orl	%eax, %ecx
	movl	%ecx, %eax
	sall	$2, %ecx
	sarl	$2, %eax
	andl	$52428, %ecx
	andl	$13107, %eax
	orl	%ecx, %eax
	movl	%eax, %ecx
	sall	$4, %eax
	sarl	$4, %ecx
	andl	$61680, %eax
	andl	$3855, %ecx
	orl	%eax, %ecx
	movl	%ecx, %eax
	sall	$8, %ecx
	sarl	$8, %eax
	movzwl	%cx, %ecx
	orl	%ecx, %eax
	cmpl	1096(%r8), %eax
	jl	.L1112
	cmpl	1100(%r8), %eax
	jl	.L1113
	cmpl	1104(%r8), %eax
	jl	.L1114
	cmpl	1108(%r8), %eax
	jl	.L1115
	cmpl	1112(%r8), %eax
	jl	.L1116
	movl	$15, %r9d
	cmpl	1116(%r8), %eax
	jl	.L1110
.L1111:
	movl	$-1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L1113:
	movl	$11, %r9d
.L1110:
	movl	$16, %ecx
	subl	%r9d, %ecx
.L1109:
	sarl	%cl, %eax
	movslq	%r9d, %rcx
	movzwl	1024(%r8,%rcx,2), %r10d
	movzwl	1124(%r8,%rcx,2), %ecx
	subl	%r10d, %eax
	addl	%ecx, %eax
	cmpl	$287, %eax
	jg	.L1111
	cltq
	movzbl	1156(%r8,%rax), %ecx
	cmpl	%r9d, %ecx
	jne	.L1111
	movzwl	1444(%r8,%rax,2), %eax
	movl	%r9d, %ecx
	subl	%r9d, %edx
	shrl	%cl, %esi
	movl	%edx, 16(%rdi)
	movl	%esi, 20(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L1112:
	movl	$6, %ecx
	movl	$10, %r9d
	jmp	.L1109
	.p2align 4,,10
	.p2align 3
.L1114:
	movl	$12, %r9d
	jmp	.L1110
.L1115:
	movl	$13, %r9d
	jmp	.L1110
.L1116:
	movl	$14, %r9d
	jmp	.L1110
	.cfi_endproc
.LFE662:
	.size	stbi__zhuffman_decode, .-stbi__zhuffman_decode
	.p2align 4
	.type	stbi__convert_format, @function
stbi__convert_format:
.LFB608:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$328, %rsp
	.cfi_def_cfa_offset 384
	movq	%rdi, 88(%rsp)
	movl	%ecx, 124(%rsp)
	movl	%r8d, 104(%rsp)
	cmpl	%esi, %edx
	je	.L1207
	leal	-1(%rdx), %eax
	movl	%edx, %ebx
	cmpl	$3, %eax
	ja	.L1431
	movl	124(%rsp), %r13d
	testl	%r13d, %r13d
	js	.L1120
	movl	%esi, %ebp
	je	.L1432
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	124(%rsp)
	cmpl	%eax, %ebx
	jg	.L1120
	movl	104(%rsp), %r11d
	testl	%r11d, %r11d
	js	.L1120
	je	.L1433
	movl	$2147483647, %eax
	imull	%ebx, %ecx
	xorl	%edx, %edx
	idivl	104(%rsp)
	cmpl	%eax, %ecx
	jle	.L1434
	.p2align 4,,10
	.p2align 3
.L1120:
	movq	88(%rsp), %rdi
	call	free@PLT
	leaq	.LC18(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movq	$0, 96(%rsp)
.L1117:
	movq	96(%rsp), %rax
	addq	$328, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1207:
	.cfi_restore_state
	movq	%rdi, 96(%rsp)
	jmp	.L1117
	.p2align 4,,10
	.p2align 3
.L1432:
	movl	104(%rsp), %r12d
	testl	%r12d, %r12d
	js	.L1120
	xorl	%edi, %edi
	call	malloc@PLT
	movq	%rax, 96(%rsp)
	testq	%rax, %rax
	je	.L1120
	movl	104(%rsp), %r10d
	testl	%r10d, %r10d
	je	.L1124
.L1126:
	movl	124(%rsp), %esi
	movl	$0, 16(%rsp)
	pxor	%xmm5, %xmm5
	movl	$0, 12(%rsp)
	movl	%esi, %eax
	leal	-1(%rsi), %r9d
	movl	$0, 76(%rsp)
	imull	%ebp, %eax
	movl	%r9d, %edx
	leal	-10(%rbx,%rbp,8), %ebp
	movl	%r9d, 240(%rsp)
	movl	%ebp, 152(%rsp)
	movq	%rbp, 168(%rsp)
	movl	%eax, 120(%rsp)
	movl	%esi, %eax
	imull	%ebx, %eax
	movl	%eax, 108(%rsp)
	movl	%r9d, %eax
	leaq	1(%rax), %r8
	leaq	0(,%r8,4), %rax
	movq	%r8, 264(%rsp)
	movq	%rax, 272(%rsp)
	movl	%esi, %eax
	shrl	$4, %eax
	movq	%rax, %rdi
	salq	$6, %rdi
	movq	%rdi, 160(%rsp)
	movl	%esi, %edi
	andl	$15, %esi
	andl	$-16, %edi
	movl	%esi, 244(%rsp)
	subl	%edi, %edx
	movl	%edi, %ecx
	movl	%edi, 136(%rsp)
	movl	%edx, 140(%rsp)
	movl	%r9d, %edx
	leaq	(%rcx,%rcx), %r13
	leaq	0(,%rcx,4), %rdi
	shrl	$4, %edx
	movq	%rdi, 144(%rsp)
	movq	%rdx, %rdi
	movq	%rcx, 208(%rsp)
	salq	$4, %rdx
	salq	$6, %rdi
	movq	%rdx, %r15
	movq	%r13, 248(%rsp)
	movq	%rdi, 216(%rsp)
	movl	%r9d, %edi
	andl	$15, %r9d
	movq	%r15, %r14
	andl	$-16, %edi
	movl	%r9d, 156(%rsp)
	movl	%edi, %r12d
	leaq	0(,%r12,4), %rdi
	leaq	(%r12,%r12), %rdx
	movq	%r12, %r9
	movq	%r12, %rbp
	movq	%rdi, 200(%rsp)
	leaq	0(%r13,%rcx), %rdi
	movq	%rdi, 232(%rsp)
	leaq	(%r8,%r8), %rdi
	leaq	(%rdi,%r8), %rcx
	movq	%rdx, 192(%rsp)
	movq	%rcx, 256(%rsp)
	movq	%rax, %rcx
	salq	$4, %rax
	salq	$5, %rcx
	movq	%rdi, 280(%rsp)
	movq	%rax, %r15
	movq	%rcx, 224(%rsp)
.L1206:
	movl	12(%rsp), %eax
	movq	88(%rsp), %rdi
	movl	16(%rsp), %r8d
	movq	96(%rsp), %rbx
	movq	%rax, %rsi
	addq	%rdi, %rax
	cmpl	$25, 152(%rsp)
	leaq	(%rbx,%r8), %rdi
	movq	%rax, 112(%rsp)
	movq	%rdi, 80(%rsp)
	ja	.L1128
	movq	168(%rsp), %rdi
	leaq	.L1130(%rip), %rbx
	movslq	(%rbx,%rdi,4), %rdx
	addq	%rbx, %rdx
	jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L1130:
	.long	.L1308-.L1130
	.long	.L1390-.L1130
	.long	.L1391-.L1130
	.long	.L1128-.L1130
	.long	.L1128-.L1130
	.long	.L1128-.L1130
	.long	.L1128-.L1130
	.long	.L1311-.L1130
	.long	.L1128-.L1130
	.long	.L1392-.L1130
	.long	.L1313-.L1130
	.long	.L1128-.L1130
	.long	.L1128-.L1130
	.long	.L1128-.L1130
	.long	.L1128-.L1130
	.long	.L1393-.L1130
	.long	.L1394-.L1130
	.long	.L1128-.L1130
	.long	.L1316-.L1130
	.long	.L1128-.L1130
	.long	.L1128-.L1130
	.long	.L1128-.L1130
	.long	.L1128-.L1130
	.long	.L1317-.L1130
	.long	.L1318-.L1130
	.long	.L1395-.L1130
	.text
	.p2align 4,,10
	.p2align 3
.L1400:
	movq	24(%rsp), %rbp
	movq	32(%rsp), %r14
	movl	%r8d, 16(%rsp)
	movl	%edi, 76(%rsp)
	movq	40(%rsp), %r15
	movl	%r9d, 12(%rsp)
	movl	20(%rsp), %r9d
.L1142:
	addl	$1, 76(%rsp)
	movl	120(%rsp), %edi
	movl	108(%rsp), %ebx
	addl	%edi, 12(%rsp)
	addl	%ebx, 16(%rsp)
	movl	76(%rsp), %eax
	cmpl	%eax, 104(%rsp)
	jne	.L1206
	.p2align 4,,10
	.p2align 3
.L1124:
	movq	88(%rsp), %rdi
	call	free@PLT
	jmp	.L1117
	.p2align 4,,10
	.p2align 3
.L1128:
	leaq	__PRETTY_FUNCTION__.43(%rip), %rcx
	movl	$1790, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	call	__assert_fail@PLT
.L1395:
	movl	%r9d, 20(%rsp)
	movl	240(%rsp), %r9d
	movl	16(%rsp), %edi
	movl	76(%rsp), %esi
	movq	%rbp, 24(%rsp)
	movq	80(%rsp), %rdx
	movq	112(%rsp), %rax
	movq	%r14, 32(%rsp)
	movl	12(%rsp), %r8d
	movl	108(%rsp), %r10d
	movq	%r15, 40(%rsp)
	movl	120(%rsp), %ebp
	movq	272(%rsp), %r12
	movq	96(%rsp), %r14
	movq	88(%rsp), %r15
	movl	104(%rsp), %r13d
	cmpl	$-1, %r9d
	je	.L1407
	.p2align 4,,10
	.p2align 3
.L1435:
	movl	%esi, 12(%rsp)
	leaq	(%rax,%r12), %rcx
	.p2align 4,,10
	.p2align 3
.L1202:
	movzwl	(%rax), %esi
	addq	$4, %rax
	addq	$3, %rdx
	movw	%si, -3(%rdx)
	movzbl	-2(%rax), %esi
	movb	%sil, -1(%rdx)
	cmpq	%rcx, %rax
	jne	.L1202
	movl	12(%rsp), %esi
	addl	%ebp, %r8d
	addl	%r10d, %edi
	addl	$1, %esi
	cmpl	%esi, %r13d
	je	.L1124
	movl	%r8d, %eax
	movl	%edi, %edx
	addq	%r15, %rax
	addq	%r14, %rdx
	cmpl	$-1, %r9d
	jne	.L1435
.L1407:
	movl	20(%rsp), %r9d
	movq	24(%rsp), %rbp
	movl	%edi, 16(%rsp)
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movl	%esi, 76(%rsp)
	movl	%r8d, 12(%rsp)
	jmp	.L1142
.L1318:
	movq	%r14, 32(%rsp)
	movl	16(%rsp), %r11d
	pxor	%xmm4, %xmm4
	movl	240(%rsp), %r14d
	movl	%r9d, 20(%rsp)
	movq	%rsi, %r9
	movq	%rbp, 24(%rsp)
	movl	76(%rsp), %r10d
	movq	%r15, 40(%rsp)
	movdqa	.LC2(%rip), %xmm3
	movq	.LC4(%rip), %xmm6
	movq	80(%rsp), %rdx
	movq	.LC59(%rip), %xmm10
	movdqa	.LC62(%rip), %xmm7
	movdqa	.LC60(%rip), %xmm9
	movq	112(%rsp), %rax
	movdqa	.LC61(%rip), %xmm8
	movq	248(%rsp), %r13
	movq	96(%rsp), %rbp
	movq	88(%rsp), %r12
	cmpl	$-1, %r14d
	je	.L1406
	.p2align 4,,10
	.p2align 3
.L1436:
	cmpl	$14, %r14d
	jbe	.L1213
	movq	160(%rsp), %rbx
	movq	%rax, %rcx
	movq	%rdx, %rsi
	leaq	(%rbx,%rax), %rdi
	movl	12(%rsp), %ebx
	.p2align 4,,10
	.p2align 3
.L1196:
	movdqu	(%rcx), %xmm11
	movdqu	16(%rcx), %xmm0
	movdqa	%xmm3, %xmm13
	addq	$64, %rcx
	movdqu	-64(%rcx), %xmm2
	movdqu	-32(%rcx), %xmm12
	addq	$32, %rsi
	pand	%xmm3, %xmm0
	pand	%xmm3, %xmm11
	movdqu	-16(%rcx), %xmm1
	packuswb	%xmm0, %xmm11
	movdqu	-48(%rcx), %xmm0
	psrlw	$8, %xmm2
	pand	%xmm3, %xmm12
	psrlw	$8, %xmm1
	psrlw	$8, %xmm0
	packuswb	%xmm0, %xmm2
	movdqu	-16(%rcx), %xmm0
	pand	%xmm3, %xmm0
	packuswb	%xmm0, %xmm12
	movdqu	-32(%rcx), %xmm0
	pand	%xmm12, %xmm13
	psrlw	$8, %xmm12
	psrlw	$8, %xmm0
	packuswb	%xmm1, %xmm0
	movdqa	%xmm3, %xmm1
	pand	%xmm11, %xmm1
	psrlw	$8, %xmm11
	packuswb	%xmm13, %xmm1
	packuswb	%xmm12, %xmm11
	movdqa	%xmm3, %xmm13
	movdqa	%xmm3, %xmm12
	pand	%xmm0, %xmm13
	pand	%xmm2, %xmm12
	psrlw	$8, %xmm0
	packuswb	%xmm13, %xmm12
	psrlw	$8, %xmm2
	packuswb	%xmm0, %xmm2
	movdqa	%xmm12, %xmm13
	movdqa	%xmm1, %xmm0
	punpcklbw	%xmm4, %xmm0
	punpcklbw	%xmm4, %xmm13
	punpckhbw	%xmm4, %xmm1
	pmullw	%xmm8, %xmm13
	pmullw	%xmm9, %xmm0
	punpckhbw	%xmm4, %xmm12
	pmullw	%xmm9, %xmm1
	pmullw	%xmm8, %xmm12
	paddw	%xmm13, %xmm0
	movdqa	%xmm11, %xmm13
	punpckhbw	%xmm4, %xmm11
	punpcklbw	%xmm4, %xmm13
	pmullw	%xmm7, %xmm11
	paddw	%xmm12, %xmm1
	pmullw	%xmm7, %xmm13
	paddw	%xmm11, %xmm1
	paddw	%xmm13, %xmm0
	psrlw	$8, %xmm1
	psrlw	$8, %xmm0
	pand	%xmm3, %xmm1
	pand	%xmm3, %xmm0
	packuswb	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	punpckhbw	%xmm2, %xmm0
	punpcklbw	%xmm2, %xmm1
	movups	%xmm0, -16(%rsi)
	movups	%xmm1, -32(%rsi)
	cmpq	%rcx, %rdi
	jne	.L1196
	movl	%ebx, 12(%rsp)
	movl	244(%rsp), %ecx
	addq	%r13, %rdx
	movq	144(%rsp), %rbx
	addq	%rbx, %rax
	testl	%ecx, %ecx
	je	.L1199
	movl	136(%rsp), %ecx
	movl	140(%rsp), %esi
.L1195:
	movl	124(%rsp), %edi
	subl	%ecx, %edi
	leal	-1(%rdi), %r15d
	cmpl	$6, %r15d
	jbe	.L1200
	leaq	(%r9,%rcx,4), %r9
	movdqa	%xmm6, %xmm11
	movdqa	%xmm6, %xmm13
	addq	%r12, %r9
	leaq	(%r8,%rcx,2), %rcx
	movq	(%r9), %xmm2
	movq	8(%r9), %xmm12
	addq	%rbp, %rcx
	movq	16(%r9), %xmm1
	movq	24(%r9), %xmm0
	pand	%xmm12, %xmm13
	psrlw	$8, %xmm12
	pand	%xmm2, %xmm11
	psrlw	$8, %xmm2
	packuswb	%xmm13, %xmm11
	movdqa	%xmm6, %xmm13
	packuswb	%xmm12, %xmm2
	movdqa	%xmm6, %xmm12
	pand	%xmm0, %xmm13
	pand	%xmm1, %xmm12
	psrlw	$8, %xmm0
	pshufd	$8, %xmm11, %xmm11
	packuswb	%xmm13, %xmm12
	psrlw	$8, %xmm1
	movdqa	%xmm6, %xmm13
	pshufd	$8, %xmm12, %xmm12
	packuswb	%xmm0, %xmm1
	movdqa	%xmm6, %xmm0
	pand	%xmm12, %xmm13
	pand	%xmm11, %xmm0
	pshufd	$8, %xmm2, %xmm2
	psrlw	$8, %xmm12
	psrlw	$8, %xmm11
	pshufd	$8, %xmm1, %xmm1
	packuswb	%xmm13, %xmm0
	packuswb	%xmm12, %xmm11
	movdqa	%xmm6, %xmm13
	movdqa	%xmm6, %xmm12
	pand	%xmm1, %xmm13
	pshufd	$8, %xmm0, %xmm0
	pand	%xmm2, %xmm12
	psrlw	$8, %xmm1
	pshufd	$8, %xmm11, %xmm11
	packuswb	%xmm13, %xmm12
	psrlw	$8, %xmm2
	pshufd	$8, %xmm12, %xmm12
	packuswb	%xmm1, %xmm2
	movdqa	%xmm0, %xmm1
	movdqa	%xmm12, %xmm13
	punpcklbw	%xmm5, %xmm1
	punpcklbw	%xmm5, %xmm12
	punpcklbw	%xmm5, %xmm13
	pshufd	$78, %xmm12, %xmm12
	punpcklbw	%xmm5, %xmm0
	movdqa	%xmm13, %xmm14
	pshufd	$78, %xmm0, %xmm0
	pshufd	$8, %xmm2, %xmm2
	pmullw	%xmm10, %xmm1
	psllw	$2, %xmm14
	paddw	%xmm13, %xmm14
	pmullw	%xmm10, %xmm0
	movdqa	%xmm14, %xmm13
	psllw	$4, %xmm13
	psubw	%xmm14, %xmm13
	movdqa	%xmm11, %xmm14
	punpcklbw	%xmm5, %xmm11
	punpcklbw	%xmm5, %xmm14
	pshufd	$78, %xmm11, %xmm11
	psllw	$1, %xmm13
	paddw	%xmm13, %xmm1
	movdqa	%xmm14, %xmm13
	psllw	$3, %xmm13
	psubw	%xmm14, %xmm13
	psllw	$2, %xmm13
	paddw	%xmm14, %xmm13
	paddw	%xmm13, %xmm1
	movdqa	%xmm12, %xmm13
	psllw	$2, %xmm13
	paddw	%xmm12, %xmm13
	psrlw	$8, %xmm1
	pand	%xmm6, %xmm1
	movdqa	%xmm13, %xmm12
	psllw	$4, %xmm12
	psubw	%xmm13, %xmm12
	psllw	$1, %xmm12
	paddw	%xmm12, %xmm0
	movdqa	%xmm11, %xmm12
	psllw	$3, %xmm11
	psubw	%xmm12, %xmm11
	psllw	$2, %xmm11
	paddw	%xmm12, %xmm11
	paddw	%xmm11, %xmm0
	psrlw	$8, %xmm0
	pand	%xmm6, %xmm0
	packuswb	%xmm0, %xmm1
	pshufd	$8, %xmm1, %xmm1
	movdqa	%xmm1, %xmm0
	punpcklbw	%xmm2, %xmm1
	punpcklbw	%xmm2, %xmm0
	pshufd	$78, %xmm1, %xmm1
	movq	%xmm0, (%rcx)
	movq	%xmm1, 8(%rcx)
	movl	%edi, %ecx
	andl	$-8, %ecx
	subl	%ecx, %esi
	leaq	(%rax,%rcx,4), %rax
	leaq	(%rdx,%rcx,2), %rdx
	andl	$7, %edi
	je	.L1199
.L1200:
	movzbl	1(%rax), %ecx
	movzbl	(%rax), %edi
	imull	$150, %ecx, %ecx
	imull	$77, %edi, %edi
	addl	%edi, %ecx
	movzbl	2(%rax), %edi
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	movb	%ch, (%rdx)
	movzbl	3(%rax), %ecx
	movb	%cl, 1(%rdx)
	testl	%esi, %esi
	je	.L1199
	movzbl	4(%rax), %ecx
	movzbl	5(%rax), %r8d
	xorl	%edi, %edi
	imull	$150, %r8d, %r8d
	imull	$77, %ecx, %ecx
	addl	%r8d, %ecx
	movzbl	6(%rax), %r8d
	imull	$29, %r8d, %r8d
	addl	%r8d, %ecx
	sarl	$8, %ecx
	movb	%cl, %dil
	movl	%edi, %ecx
	movb	7(%rax), %ch
	movw	%cx, 2(%rdx)
	cmpl	$1, %esi
	je	.L1199
	movzbl	9(%rax), %ecx
	movzbl	8(%rax), %r8d
	xorl	%edi, %edi
	imull	$77, %r8d, %r8d
	imull	$150, %ecx, %ecx
	addl	%r8d, %ecx
	movzbl	10(%rax), %r8d
	imull	$29, %r8d, %r8d
	addl	%r8d, %ecx
	sarl	$8, %ecx
	movb	%cl, %dil
	movl	%edi, %ecx
	movb	11(%rax), %ch
	movw	%cx, 4(%rdx)
	cmpl	$2, %esi
	je	.L1199
	movzbl	12(%rax), %ecx
	movzbl	13(%rax), %r8d
	xorl	%edi, %edi
	imull	$150, %r8d, %r8d
	imull	$77, %ecx, %ecx
	addl	%r8d, %ecx
	movzbl	14(%rax), %r8d
	imull	$29, %r8d, %r8d
	addl	%r8d, %ecx
	sarl	$8, %ecx
	movb	%cl, %dil
	movl	%edi, %ecx
	movb	15(%rax), %ch
	movw	%cx, 6(%rdx)
	cmpl	$3, %esi
	je	.L1199
	movzbl	16(%rax), %ecx
	movzbl	17(%rax), %r8d
	xorl	%edi, %edi
	imull	$150, %r8d, %r8d
	imull	$77, %ecx, %ecx
	addl	%r8d, %ecx
	movzbl	18(%rax), %r8d
	imull	$29, %r8d, %r8d
	addl	%r8d, %ecx
	sarl	$8, %ecx
	movb	%cl, %dil
	movl	%edi, %ecx
	movb	19(%rax), %ch
	movw	%cx, 8(%rdx)
	cmpl	$4, %esi
	je	.L1199
	movzbl	20(%rax), %ecx
	movzbl	21(%rax), %r8d
	xorl	%edi, %edi
	imull	$150, %r8d, %r8d
	imull	$77, %ecx, %ecx
	addl	%r8d, %ecx
	movzbl	22(%rax), %r8d
	imull	$29, %r8d, %r8d
	addl	%r8d, %ecx
	sarl	$8, %ecx
	movb	%cl, %dil
	movl	%edi, %ebx
	movb	23(%rax), %bh
	movw	%bx, 10(%rdx)
	cmpl	$5, %esi
	je	.L1199
	movzbl	24(%rax), %ecx
	movzbl	25(%rax), %edi
	xorl	%esi, %esi
	imull	$150, %edi, %edi
	imull	$77, %ecx, %ecx
	addl	%edi, %ecx
	movzbl	26(%rax), %edi
	imull	$29, %edi, %edi
	addl	%edi, %ecx
	sarl	$8, %ecx
	movb	%cl, %sil
	movl	%esi, %ebx
	movb	27(%rax), %bh
	movw	%bx, 12(%rdx)
.L1199:
	movl	120(%rsp), %eax
	addl	%eax, 12(%rsp)
	addl	$1, %r10d
	movl	108(%rsp), %eax
	addl	%eax, %r11d
	cmpl	%r10d, 104(%rsp)
	je	.L1124
	movl	12(%rsp), %r9d
	movl	%r11d, %r8d
	leaq	0(%rbp,%r8), %rdx
	leaq	(%r12,%r9), %rax
	cmpl	$-1, %r14d
	jne	.L1436
.L1406:
	movl	20(%rsp), %r9d
	movq	24(%rsp), %rbp
	movl	%r11d, 16(%rsp)
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movl	%r10d, 76(%rsp)
	jmp	.L1142
.L1316:
	movl	124(%rsp), %eax
	movl	%r9d, 292(%rsp)
	movq	%rsi, %rdx
	movq	%rbp, 296(%rsp)
	andl	$15, %eax
	movq	%r14, 304(%rsp)
	movl	%eax, 288(%rsp)
	movl	240(%rsp), %eax
	movq	%r15, 312(%rsp)
	cmpl	$-1, %eax
	je	.L1402
	.p2align 4,,10
	.p2align 3
.L1437:
	cmpl	$14, %eax
	jbe	.L1211
	movq	96(%rsp), %rbx
	movq	80(%rsp), %rax
	movq	%rdx, 176(%rsp)
	movq	%r8, 184(%rsp)
	movq	112(%rsp), %r10
	leaq	3(%rbx,%r8), %r9
	movq	160(%rsp), %rbx
	movq	%rax, %rcx
	addq	%rbx, %rax
	movq	%rax, 128(%rsp)
	.p2align 4,,10
	.p2align 3
.L1174:
	movzwl	3(%r10), %ebx
	movzbl	15(%r10), %edi
	addq	$64, %rcx
	addq	$48, %r10
	movzbl	-34(%r10), %esi
	movzwl	-36(%r10), %edx
	addq	$64, %r9
	movzbl	-19(%r10), %ebp
	movzbl	-43(%r10), %eax
	movw	%bx, 56(%rsp)
	movzbl	-37(%r10), %r11d
	movzwl	-18(%r10), %r8d
	movb	%dil, 40(%rsp)
	movzwl	-21(%r10), %ebx
	movzbl	-22(%r10), %edi
	movb	%sil, 32(%rsp)
	movzwl	-24(%r10), %esi
	movzbl	-46(%r10), %r15d
	movw	%dx, 58(%rsp)
	movzbl	-25(%r10), %edx
	movzwl	-39(%r10), %r12d
	movb	%bpl, 52(%rsp)
	movzwl	-27(%r10), %ebp
	movzbl	-40(%r10), %r13d
	movb	%al, 20(%rsp)
	movzwl	-42(%r10), %r14d
	movb	%r11b, 24(%rsp)
	movw	%r8w, 66(%rsp)
	movzwl	-30(%r10), %r11d
	movzbl	-28(%r10), %r8d
	movb	%dil, 51(%rsp)
	movw	%si, 62(%rsp)
	movb	%dl, 50(%rsp)
	movw	%bp, 60(%rsp)
	movw	%bx, 64(%rsp)
	movzbl	-31(%r10), %ebx
	movzbl	-32(%r10), %edi
	movzwl	-6(%r10), %eax
	movzwl	-3(%r10), %edx
	movzwl	-15(%r10), %esi
	movb	%dil, 48(%rsp)
	movzbl	-4(%r10), %edi
	movw	%ax, 72(%rsp)
	movzbl	-13(%r10), %eax
	movb	%dil, 55(%rsp)
	movzwl	-9(%r10), %edi
	movw	%dx, 74(%rsp)
	movzbl	-7(%r10), %edx
	movw	%di, 70(%rsp)
	movzwl	-12(%r10), %edi
	movb	%al, 11(%rsp)
	movzwl	-48(%r10), %eax
	movzbl	-1(%r10), %ebp
	movb	%dl, 54(%rsp)
	movw	%di, 68(%rsp)
	movzbl	-10(%r10), %edx
	movzbl	-16(%r10), %edi
	movw	%ax, -64(%rcx)
	movb	%r15b, -62(%rcx)
	movzbl	20(%rsp), %eax
	movzwl	56(%rsp), %r15d
	movw	%r14w, -56(%rcx)
	movb	%al, -58(%rcx)
	movw	%r15w, -60(%rcx)
	movw	%r12w, -52(%rcx)
	movb	%dl, 53(%rsp)
	movb	%r13b, -54(%rcx)
	movzbl	24(%rsp), %r13d
	movzbl	40(%rsp), %r12d
	movzwl	48(%rsp), %edx
	movb	%bl, -42(%rcx)
	movzwl	58(%rsp), %r15d
	movzbl	32(%rsp), %r14d
	movb	%r13b, -50(%rcx)
	movl	%r12d, %eax
	movzwl	64(%rsp), %ebx
	movw	%r11w, -40(%rcx)
	movb	%dl, %ah
	movw	%r15w, -48(%rcx)
	movzwl	60(%rsp), %r13d
	movzbl	50(%rsp), %r11d
	movzwl	62(%rsp), %r15d
	movw	%ax, -44(%rcx)
	movzbl	52(%rsp), %eax
	movb	%r14b, -46(%rcx)
	movb	%r8b, -38(%rcx)
	movzbl	51(%rsp), %r14d
	movb	%al, -26(%rcx)
	movzbl	11(%rsp), %eax
	movzwl	66(%rsp), %r8d
	movw	%bx, -28(%rcx)
	movb	%al, -18(%rcx)
	movzwl	68(%rsp), %eax
	movb	%dil, -22(%rcx)
	movw	%si, -20(%rcx)
	movw	%ax, -16(%rcx)
	movw	%r13w, -36(%rcx)
	movb	%r11b, -34(%rcx)
	movw	%r15w, -32(%rcx)
	movb	%r14b, -30(%rcx)
	movw	%r8w, -24(%rcx)
	movzbl	53(%rsp), %r14d
	movzwl	70(%rsp), %esi
	movzbl	54(%rsp), %ebx
	movb	%bpl, -2(%rcx)
	movzwl	72(%rsp), %eax
	movzbl	55(%rsp), %edi
	movb	%r14b, -14(%rcx)
	movzwl	74(%rsp), %edx
	movw	%si, -12(%rcx)
	movb	%bl, -10(%rcx)
	movw	%ax, -8(%rcx)
	movb	%dil, -6(%rcx)
	movw	%dx, -4(%rcx)
	movb	$-1, -64(%r9)
	movb	$-1, -60(%r9)
	movb	$-1, -56(%r9)
	movb	$-1, -52(%r9)
	movb	$-1, -48(%r9)
	movb	$-1, -44(%r9)
	movb	$-1, -40(%r9)
	movb	$-1, -36(%r9)
	movb	$-1, -32(%r9)
	movb	$-1, -28(%r9)
	movb	$-1, -24(%r9)
	movb	$-1, -20(%r9)
	movb	$-1, -16(%r9)
	movb	$-1, -12(%r9)
	movb	$-1, -8(%r9)
	movb	$-1, -4(%r9)
	cmpq	%rcx, 128(%rsp)
	jne	.L1174
	movl	288(%rsp), %esi
	movq	232(%rsp), %rbx
	movq	176(%rsp), %rdx
	addq	%rbx, 112(%rsp)
	movq	184(%rsp), %r8
	movq	144(%rsp), %rbx
	addq	%rbx, 80(%rsp)
	testl	%esi, %esi
	je	.L1177
	movl	136(%rsp), %ecx
	movl	140(%rsp), %r10d
.L1173:
	movl	124(%rsp), %r11d
	subl	%ecx, %r11d
	leal	-1(%r11), %eax
	cmpl	$6, %eax
	jbe	.L1178
	movq	88(%rsp), %rdi
	leaq	(%rcx,%rcx,2), %rax
	movq	96(%rsp), %rbx
	leaq	(%r8,%rcx,4), %rcx
	addq	%rdx, %rax
	addq	%rdi, %rax
	leaq	(%rbx,%rcx), %rdx
	leaq	3(%rbx,%rcx), %rcx
	movzwl	12(%rax), %edi
	movzbl	14(%rax), %ebx
	movzbl	11(%rax), %esi
	movzbl	23(%rax), %r8d
	movzwl	21(%rax), %r9d
	movzbl	2(%rax), %r15d
	movb	%bl, 40(%rsp)
	movzbl	5(%rax), %r13d
	movzwl	9(%rax), %ebx
	movb	%sil, 32(%rsp)
	movzwl	3(%rax), %r14d
	movzbl	20(%rax), %esi
	movw	%di, 20(%rsp)
	movzbl	8(%rax), %ebp
	movzwl	18(%rax), %edi
	movb	%r8b, 48(%rsp)
	movzwl	6(%rax), %r12d
	movzbl	17(%rax), %r8d
	movw	%r9w, 24(%rsp)
	movzwl	15(%rax), %r9d
	movzwl	(%rax), %eax
	movb	%r15b, 2(%rdx)
	movzbl	32(%rsp), %r15d
	movw	%bx, 12(%rdx)
	movw	%ax, (%rdx)
	movw	%r14w, 4(%rdx)
	movb	%r13b, 6(%rdx)
	movw	%r12w, 8(%rdx)
	movb	%bpl, 10(%rdx)
	movb	%r15b, 14(%rdx)
	movzwl	20(%rsp), %eax
	movw	%r9w, 20(%rdx)
	movzbl	40(%rsp), %ebx
	movw	%ax, 16(%rdx)
	movzwl	24(%rsp), %r9d
	movl	%r11d, %eax
	movb	%r8b, 22(%rdx)
	movzbl	48(%rsp), %r8d
	andl	$-8, %eax
	movw	%di, 24(%rdx)
	movq	80(%rsp), %rdi
	subl	%eax, %r10d
	movb	%bl, 18(%rdx)
	movb	%sil, 26(%rdx)
	movw	%r9w, 28(%rdx)
	movb	%r8b, 30(%rdx)
	leaq	(%rax,%rax,2), %rdx
	leaq	(%rdi,%rax,4), %rax
	addq	%rdx, 112(%rsp)
	andl	$7, %r11d
	movb	$-1, (%rcx)
	movb	$-1, 4(%rcx)
	movb	$-1, 8(%rcx)
	movb	$-1, 12(%rcx)
	movb	$-1, 16(%rcx)
	movb	$-1, 20(%rcx)
	movb	$-1, 24(%rcx)
	movb	$-1, 28(%rcx)
	movq	%rax, 80(%rsp)
	je	.L1177
.L1178:
	movq	112(%rsp), %rbx
	movq	80(%rsp), %rdi
	movzbl	(%rbx), %eax
	movb	%al, (%rdi)
	movzbl	1(%rbx), %eax
	movb	%al, 1(%rdi)
	movzbl	2(%rbx), %eax
	movb	$-1, 3(%rdi)
	movb	%al, 2(%rdi)
	testl	%r10d, %r10d
	je	.L1177
	movzwl	3(%rbx), %eax
	movw	%ax, 4(%rdi)
	movzbl	5(%rbx), %eax
	movb	$-1, 7(%rdi)
	movb	%al, 6(%rdi)
	cmpl	$1, %r10d
	je	.L1177
	movzwl	6(%rbx), %eax
	movw	%ax, 8(%rdi)
	movzbl	8(%rbx), %eax
	movb	$-1, 11(%rdi)
	movb	%al, 10(%rdi)
	cmpl	$2, %r10d
	je	.L1177
	movzwl	9(%rbx), %eax
	movw	%ax, 12(%rdi)
	movzbl	11(%rbx), %eax
	movb	$-1, 15(%rdi)
	movb	%al, 14(%rdi)
	cmpl	$3, %r10d
	je	.L1177
	movzwl	12(%rbx), %eax
	movw	%ax, 16(%rdi)
	movzbl	14(%rbx), %eax
	movb	$-1, 19(%rdi)
	movb	%al, 18(%rdi)
	cmpl	$4, %r10d
	je	.L1177
	movzwl	15(%rbx), %eax
	movw	%ax, 20(%rdi)
	movzbl	17(%rbx), %eax
	movb	$-1, 23(%rdi)
	movb	%al, 22(%rdi)
	cmpl	$5, %r10d
	je	.L1177
	movzwl	18(%rbx), %eax
	movw	%ax, 24(%rdi)
	movzbl	20(%rbx), %eax
	movb	$-1, 27(%rdi)
	movb	%al, 26(%rdi)
.L1177:
	addl	$1, 76(%rsp)
	movl	120(%rsp), %edi
	movl	108(%rsp), %ebx
	addl	%edi, 12(%rsp)
	addl	%ebx, 16(%rsp)
	movl	76(%rsp), %eax
	cmpl	%eax, 104(%rsp)
	je	.L1124
	movl	12(%rsp), %edx
	movq	88(%rsp), %rax
	movl	16(%rsp), %r8d
	addq	%rdx, %rax
	movq	%rax, 112(%rsp)
	movq	96(%rsp), %rax
	addq	%r8, %rax
	movq	%rax, 80(%rsp)
	movl	240(%rsp), %eax
	cmpl	$-1, %eax
	jne	.L1437
.L1402:
	movl	292(%rsp), %r9d
	movq	296(%rsp), %rbp
	movq	304(%rsp), %r14
	movq	312(%rsp), %r15
	jmp	.L1142
.L1394:
	movl	240(%rsp), %ebx
	movl	%r9d, 20(%rsp)
	movl	16(%rsp), %r10d
	movq	80(%rsp), %rcx
	movq	%rbp, 24(%rsp)
	movq	112(%rsp), %rdx
	movl	12(%rsp), %r11d
	movq	%r14, 32(%rsp)
	movl	76(%rsp), %r9d
	movl	108(%rsp), %ebp
	movq	%r15, 40(%rsp)
	movl	120(%rsp), %r12d
	movq	96(%rsp), %r14
	movq	88(%rsp), %r15
	movl	104(%rsp), %r13d
	movq	256(%rsp), %rdi
	cmpl	$-1, %ebx
	je	.L1404
	.p2align 4,,10
	.p2align 3
.L1438:
	movl	%r10d, 12(%rsp)
	leaq	(%rdx,%rdi), %r8
	.p2align 4,,10
	.p2align 3
.L1182:
	movzbl	(%rdx), %eax
	movzbl	1(%rdx), %r10d
	addq	$3, %rdx
	movb	$-1, 1(%rcx)
	addq	$2, %rcx
	imull	$150, %r10d, %r10d
	imull	$77, %eax, %eax
	addl	%r10d, %eax
	movzbl	-1(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %eax
	movb	%ah, -2(%rcx)
	cmpq	%r8, %rdx
	jne	.L1182
	movl	12(%rsp), %r10d
	addl	$1, %r9d
	addl	%r12d, %r11d
	addl	%ebp, %r10d
	cmpl	%r9d, %r13d
	je	.L1124
	movl	%r11d, %edx
	movl	%r10d, %ecx
	addq	%r15, %rdx
	addq	%r14, %rcx
	cmpl	$-1, %ebx
	jne	.L1438
.L1404:
	movq	24(%rsp), %rbp
	movq	32(%rsp), %r14
	movl	%r9d, 76(%rsp)
	movq	40(%rsp), %r15
	movl	20(%rsp), %r9d
	movl	%r10d, 16(%rsp)
	movl	%r11d, 12(%rsp)
	jmp	.L1142
.L1393:
	movl	%r9d, 20(%rsp)
	movl	16(%rsp), %r10d
	movq	%rbp, 24(%rsp)
	movl	240(%rsp), %ebx
	movq	80(%rsp), %rsi
	movq	112(%rsp), %rdx
	movq	%r14, 32(%rsp)
	movl	12(%rsp), %r11d
	movl	76(%rsp), %r9d
	movq	%r15, 40(%rsp)
	movl	108(%rsp), %ebp
	movl	120(%rsp), %r12d
	movq	96(%rsp), %r14
	movq	88(%rsp), %r15
	movl	104(%rsp), %r13d
	movq	256(%rsp), %rdi
	.p2align 4,,10
	.p2align 3
.L1135:
	cmpl	$-1, %ebx
	je	.L1404
	movl	%r10d, 12(%rsp)
	leaq	(%rdx,%rdi), %r8
	.p2align 4,,10
	.p2align 3
.L1180:
	movzbl	(%rdx), %eax
	movzbl	1(%rdx), %r10d
	addq	$3, %rdx
	addq	$1, %rsi
	imull	$150, %r10d, %r10d
	imull	$77, %eax, %eax
	addl	%r10d, %eax
	movzbl	-1(%rdx), %r10d
	imull	$29, %r10d, %r10d
	addl	%r10d, %eax
	movb	%ah, -1(%rsi)
	cmpq	%r8, %rdx
	jne	.L1180
	movl	12(%rsp), %r10d
	addl	$1, %r9d
	addl	%r12d, %r11d
	addl	%ebp, %r10d
	cmpl	%r9d, %r13d
	je	.L1124
	movl	%r11d, %edx
	movl	%r10d, %esi
	addq	%r15, %rdx
	addq	%r14, %rsi
	jmp	.L1135
.L1313:
	movl	124(%rsp), %ecx
	movl	12(%rsp), %ebx
	movq	%r14, 32(%rsp)
	movl	240(%rsp), %r14d
	movl	%r9d, 20(%rsp)
	movq	%rsi, %r9
	andl	$15, %ecx
	movq	%rbp, 24(%rsp)
	movq	.LC4(%rip), %xmm6
	movl	16(%rsp), %r11d
	movl	76(%rsp), %r10d
	movq	%r15, 40(%rsp)
	movq	80(%rsp), %rdx
	movq	112(%rsp), %rax
	movl	%ecx, 12(%rsp)
	movdqa	.LC2(%rip), %xmm4
	movq	248(%rsp), %r13
	movq	96(%rsp), %rbp
	movq	88(%rsp), %r12
	cmpl	$-1, %r14d
	je	.L1401
	.p2align 4,,10
	.p2align 3
.L1439:
	cmpl	$14, %r14d
	jbe	.L1210
	movq	224(%rsp), %rdi
	movq	%rax, %rsi
	movq	%rdx, %rcx
	addq	%rax, %rdi
	.p2align 4,,10
	.p2align 3
.L1167:
	movdqu	(%rsi), %xmm0
	movdqu	16(%rsi), %xmm1
	addq	$32, %rsi
	addq	$64, %rcx
	movdqu	-16(%rsi), %xmm2
	pand	%xmm4, %xmm1
	pand	%xmm4, %xmm0
	packuswb	%xmm1, %xmm0
	movdqu	-32(%rsi), %xmm1
	psrlw	$8, %xmm2
	movdqa	%xmm0, %xmm3
	movdqa	%xmm0, %xmm7
	psrlw	$8, %xmm1
	punpcklbw	%xmm0, %xmm3
	packuswb	%xmm2, %xmm1
	movdqa	%xmm0, %xmm2
	punpckhbw	%xmm0, %xmm2
	punpcklbw	%xmm1, %xmm7
	punpckhbw	%xmm1, %xmm0
	movdqa	%xmm3, %xmm1
	punpckhbw	%xmm7, %xmm3
	punpcklbw	%xmm7, %xmm1
	movups	%xmm3, -48(%rcx)
	movups	%xmm1, -64(%rcx)
	movdqa	%xmm2, %xmm1
	punpckhbw	%xmm0, %xmm2
	punpcklbw	%xmm0, %xmm1
	movups	%xmm2, -16(%rcx)
	movups	%xmm1, -32(%rcx)
	cmpq	%rsi, %rdi
	jne	.L1167
	movq	144(%rsp), %rdi
	addq	%r13, %rax
	addq	%rdi, %rdx
	movl	12(%rsp), %edi
	testl	%edi, %edi
	je	.L1170
	movl	136(%rsp), %ecx
	movl	140(%rsp), %esi
.L1166:
	movl	124(%rsp), %edi
	subl	%ecx, %edi
	leal	-1(%rdi), %r15d
	cmpl	$6, %r15d
	jbe	.L1171
	leaq	(%r9,%rcx,2), %r9
	movdqa	%xmm6, %xmm0
	movdqa	%xmm6, %xmm3
	addq	%r12, %r9
	leaq	(%r8,%rcx,4), %rcx
	movq	(%r9), %xmm1
	movq	8(%r9), %xmm2
	addq	%rbp, %rcx
	pand	%xmm2, %xmm3
	psrlw	$8, %xmm2
	pand	%xmm1, %xmm0
	packuswb	%xmm3, %xmm0
	psrlw	$8, %xmm1
	pshufd	$8, %xmm0, %xmm0
	packuswb	%xmm2, %xmm1
	movdqa	%xmm0, %xmm3
	pshufd	$8, %xmm1, %xmm1
	movdqa	%xmm0, %xmm2
	punpcklbw	%xmm0, %xmm3
	movdqa	%xmm0, %xmm7
	punpcklbw	%xmm0, %xmm2
	punpcklbw	%xmm1, %xmm7
	punpcklbw	%xmm1, %xmm0
	movdqa	%xmm3, %xmm1
	pshufd	$78, %xmm2, %xmm2
	pshufd	$78, %xmm0, %xmm0
	punpcklbw	%xmm7, %xmm1
	movq	%xmm1, (%rcx)
	punpcklbw	%xmm7, %xmm3
	movdqa	%xmm2, %xmm1
	punpcklbw	%xmm0, %xmm2
	pshufd	$78, %xmm3, %xmm3
	punpcklbw	%xmm0, %xmm1
	pshufd	$78, %xmm2, %xmm2
	movq	%xmm3, 8(%rcx)
	movq	%xmm1, 16(%rcx)
	movq	%xmm2, 24(%rcx)
	movl	%edi, %ecx
	andl	$-8, %ecx
	subl	%ecx, %esi
	leaq	(%rax,%rcx,2), %rax
	leaq	(%rdx,%rcx,4), %rdx
	andl	$7, %edi
	je	.L1170
.L1171:
	movzbl	(%rax), %ecx
	movb	%cl, 2(%rdx)
	movb	%cl, 1(%rdx)
	movb	%cl, (%rdx)
	movzbl	1(%rax), %ecx
	movb	%cl, 3(%rdx)
	testl	%esi, %esi
	je	.L1170
	movzbl	3(%rax), %ecx
	movzbl	2(%rax), %edi
	sall	$8, %ecx
	orl	%edi, %ecx
	sall	$8, %ecx
	orl	%edi, %ecx
	sall	$8, %ecx
	orl	%edi, %ecx
	movl	%ecx, 4(%rdx)
	cmpl	$1, %esi
	je	.L1170
	movzbl	5(%rax), %ecx
	movzbl	4(%rax), %edi
	sall	$8, %ecx
	orl	%edi, %ecx
	sall	$8, %ecx
	orl	%edi, %ecx
	sall	$8, %ecx
	orl	%edi, %ecx
	movl	%ecx, 8(%rdx)
	cmpl	$2, %esi
	je	.L1170
	movzbl	7(%rax), %ecx
	movzbl	6(%rax), %edi
	sall	$8, %ecx
	orl	%edi, %ecx
	sall	$8, %ecx
	orl	%edi, %ecx
	sall	$8, %ecx
	orl	%edi, %ecx
	movl	%ecx, 12(%rdx)
	cmpl	$3, %esi
	je	.L1170
	movzbl	9(%rax), %ecx
	movzbl	8(%rax), %edi
	sall	$8, %ecx
	orl	%edi, %ecx
	sall	$8, %ecx
	orl	%edi, %ecx
	sall	$8, %ecx
	orl	%edi, %ecx
	movl	%ecx, 16(%rdx)
	cmpl	$4, %esi
	je	.L1170
	movzbl	11(%rax), %ecx
	movzbl	10(%rax), %edi
	sall	$8, %ecx
	orl	%edi, %ecx
	sall	$8, %ecx
	orl	%edi, %ecx
	sall	$8, %ecx
	orl	%edi, %ecx
	movl	%ecx, 20(%rdx)
	cmpl	$5, %esi
	je	.L1170
	movzbl	13(%rax), %ecx
	movzbl	12(%rax), %eax
	sall	$8, %ecx
	orl	%eax, %ecx
	sall	$8, %ecx
	orl	%eax, %ecx
	sall	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 24(%rdx)
.L1170:
	movl	120(%rsp), %eax
	addl	$1, %r10d
	addl	%eax, %ebx
	movl	108(%rsp), %eax
	addl	%eax, %r11d
	cmpl	%r10d, 104(%rsp)
	je	.L1124
	movl	%ebx, %r9d
	movl	%r11d, %r8d
	leaq	(%r12,%r9), %rax
	leaq	0(%rbp,%r8), %rdx
	cmpl	$-1, %r14d
	jne	.L1439
.L1401:
	movl	20(%rsp), %r9d
	movq	24(%rsp), %rbp
	movl	%r11d, 16(%rsp)
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movl	%r10d, 76(%rsp)
	movl	%ebx, 12(%rsp)
	jmp	.L1142
.L1392:
	movq	%r15, 40(%rsp)
	movl	16(%rsp), %r8d
	movl	%r9d, 20(%rsp)
	movl	240(%rsp), %r11d
	movl	76(%rsp), %edi
	movq	80(%rsp), %rdx
	movq	%rbp, 24(%rsp)
	movq	112(%rsp), %rax
	movl	12(%rsp), %r9d
	movq	%r14, 32(%rsp)
	movl	108(%rsp), %ebx
	movl	120(%rsp), %ebp
	movq	96(%rsp), %r13
	movq	88(%rsp), %r14
	movl	104(%rsp), %r12d
	movq	280(%rsp), %r10
	.p2align 4,,10
	.p2align 3
.L1137:
	cmpl	$-1, %r11d
	je	.L1400
	movl	%r8d, 12(%rsp)
	leaq	(%rax,%r10), %rsi
	movl	%ebx, %r8d
	.p2align 4,,10
	.p2align 3
.L1164:
	movzbl	(%rax), %ebx
	addq	$2, %rax
	addq	$3, %rdx
	movzbl	%bl, %ecx
	movb	%bl, -1(%rdx)
	movb	%bl, %ch
	movw	%cx, -3(%rdx)
	cmpq	%rsi, %rax
	jne	.L1164
	movl	%r8d, %ebx
	movl	12(%rsp), %r8d
	addl	$1, %edi
	addl	%ebp, %r9d
	addl	%ebx, %r8d
	cmpl	%edi, %r12d
	je	.L1124
	movl	%r9d, %eax
	movl	%r8d, %edx
	addq	%r14, %rax
	addq	%r13, %rdx
	jmp	.L1137
.L1391:
	movq	%r15, 40(%rsp)
	movl	16(%rsp), %r8d
	movl	%r9d, 20(%rsp)
	movl	240(%rsp), %r10d
	movl	76(%rsp), %edi
	movq	80(%rsp), %rax
	movq	%rbp, 24(%rsp)
	movq	112(%rsp), %rdx
	movl	12(%rsp), %r9d
	movq	%r14, 32(%rsp)
	movl	108(%rsp), %r11d
	movl	120(%rsp), %ebx
	movq	264(%rsp), %r12
	movq	96(%rsp), %r13
	movq	88(%rsp), %r14
	movl	104(%rsp), %ebp
	.p2align 4,,10
	.p2align 3
.L1139:
	cmpl	$-1, %r10d
	je	.L1400
	movl	%r8d, 12(%rsp)
	leaq	(%rdx,%r12), %rsi
	movl	%ebx, %r8d
	.p2align 4,,10
	.p2align 3
.L1150:
	movzbl	(%rdx), %ebx
	addq	$1, %rdx
	movb	$-1, 3(%rax)
	addq	$4, %rax
	movzbl	%bl, %ecx
	movb	%bl, -2(%rax)
	movb	%bl, %ch
	movw	%cx, -4(%rax)
	cmpq	%rsi, %rdx
	jne	.L1150
	movl	%r8d, %ebx
	movl	12(%rsp), %r8d
	addl	$1, %edi
	addl	%ebx, %r9d
	addl	%r11d, %r8d
	cmpl	%edi, %ebp
	je	.L1124
	movl	%r9d, %edx
	movl	%r8d, %eax
	addq	%r14, %rdx
	addq	%r13, %rax
	jmp	.L1139
.L1390:
	movq	%r15, 40(%rsp)
	movl	16(%rsp), %r8d
	movl	%r9d, 20(%rsp)
	movl	240(%rsp), %r10d
	movl	76(%rsp), %edi
	movq	80(%rsp), %rdx
	movq	%rbp, 24(%rsp)
	movq	112(%rsp), %rax
	movl	12(%rsp), %r9d
	movq	%r14, 32(%rsp)
	movl	108(%rsp), %r11d
	movl	120(%rsp), %ebx
	movq	264(%rsp), %r12
	movq	96(%rsp), %r13
	movq	88(%rsp), %r14
	movl	104(%rsp), %ebp
	.p2align 4,,10
	.p2align 3
.L1140:
	cmpl	$-1, %r10d
	je	.L1400
	movl	%r8d, 12(%rsp)
	leaq	(%rax,%r12), %rsi
	movl	%ebx, %r8d
	.p2align 4,,10
	.p2align 3
.L1148:
	movzbl	(%rax), %ebx
	addq	$1, %rax
	addq	$3, %rdx
	movzbl	%bl, %ecx
	movb	%bl, -1(%rdx)
	movb	%bl, %ch
	movw	%cx, -3(%rdx)
	cmpq	%rsi, %rax
	jne	.L1148
	movl	%r8d, %ebx
	movl	12(%rsp), %r8d
	addl	$1, %edi
	addl	%ebx, %r9d
	addl	%r11d, %r8d
	cmpl	%edi, %ebp
	je	.L1124
	movl	%r9d, %eax
	movl	%r8d, %edx
	addq	%r14, %rax
	addq	%r13, %rdx
	jmp	.L1140
.L1308:
	movl	124(%rsp), %ecx
	movl	240(%rsp), %r12d
	movq	%rbp, 24(%rsp)
	pcmpeqd	%xmm1, %xmm1
	movl	12(%rsp), %ebx
	movl	%r9d, 20(%rsp)
	andl	$15, %ecx
	movq	%r14, 32(%rsp)
	movl	16(%rsp), %r11d
	movl	76(%rsp), %r10d
	movq	80(%rsp), %rdx
	movl	%ecx, 12(%rsp)
	movq	.LC55(%rip), %xmm3
	movq	248(%rsp), %r13
	movq	96(%rsp), %rbp
	movq	112(%rsp), %rcx
	cmpl	$-1, %r12d
	je	.L1396
	.p2align 4,,10
	.p2align 3
.L1440:
	cmpl	$14, %r12d
	jbe	.L1208
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L1144:
	movdqu	(%rax,%rcx), %xmm0
	movdqa	%xmm0, %xmm2
	punpckhbw	%xmm1, %xmm0
	punpcklbw	%xmm1, %xmm2
	movups	%xmm0, 16(%rdx,%rcx,2)
	movups	%xmm2, (%rdx,%rcx,2)
	addq	$16, %rcx
	cmpq	%rcx, %r15
	jne	.L1144
	movq	208(%rsp), %rdi
	movl	12(%rsp), %r9d
	addq	%r13, %rdx
	leaq	(%rax,%rdi), %rcx
	testl	%r9d, %r9d
	je	.L1145
	movl	136(%rsp), %esi
	movl	140(%rsp), %edi
.L1143:
	movl	124(%rsp), %r9d
	subl	%esi, %r9d
	leal	-1(%r9), %r14d
	cmpl	$6, %r14d
	jbe	.L1146
	movq	(%rax,%rsi), %xmm0
	movl	%r9d, %eax
	leaq	(%r8,%rsi,2), %r8
	andl	$-8, %eax
	addq	%rbp, %r8
	movdqa	%xmm0, %xmm2
	punpcklbw	%xmm3, %xmm0
	subl	%eax, %edi
	addq	%rax, %rcx
	punpcklbw	%xmm3, %xmm2
	pshufd	$78, %xmm0, %xmm0
	leaq	(%rdx,%rax,2), %rdx
	andl	$7, %r9d
	movq	%xmm2, (%r8)
	movq	%xmm0, 8(%r8)
	je	.L1145
.L1146:
	movzbl	(%rcx), %eax
	movb	$-1, 1(%rdx)
	movb	%al, (%rdx)
	testl	%edi, %edi
	je	.L1145
	movzbl	1(%rcx), %eax
	movb	$-1, 3(%rdx)
	movb	%al, 2(%rdx)
	cmpl	$1, %edi
	je	.L1145
	movzbl	2(%rcx), %eax
	movb	$-1, 5(%rdx)
	movb	%al, 4(%rdx)
	cmpl	$2, %edi
	je	.L1145
	movzbl	3(%rcx), %eax
	movb	$-1, 7(%rdx)
	movb	%al, 6(%rdx)
	cmpl	$3, %edi
	je	.L1145
	movzbl	4(%rcx), %eax
	movb	$-1, 9(%rdx)
	movb	%al, 8(%rdx)
	cmpl	$4, %edi
	je	.L1145
	movzbl	5(%rcx), %eax
	movb	$-1, 11(%rdx)
	movb	%al, 10(%rdx)
	cmpl	$5, %edi
	je	.L1145
	movzbl	6(%rcx), %eax
	movb	$-1, 13(%rdx)
	movb	%al, 12(%rdx)
.L1145:
	movl	120(%rsp), %eax
	addl	$1, %r10d
	addl	%eax, %ebx
	movl	108(%rsp), %eax
	addl	%eax, %r11d
	cmpl	%r10d, 104(%rsp)
	je	.L1124
	movq	88(%rsp), %rsi
	movl	%ebx, %eax
	movl	%r11d, %r8d
	leaq	0(%rbp,%r8), %rdx
	addq	%rsi, %rax
	movq	%rax, %rcx
	cmpl	$-1, %r12d
	jne	.L1440
.L1396:
	movl	20(%rsp), %r9d
	movq	24(%rsp), %rbp
	movl	%r11d, 16(%rsp)
	movl	%r10d, 76(%rsp)
	movq	32(%rsp), %r14
	movl	%ebx, 12(%rsp)
	jmp	.L1142
.L1434:
	imull	%r8d, %ecx
	movslq	%ecx, %rdi
	call	malloc@PLT
	movq	%rax, 96(%rsp)
	testq	%rax, %rax
	jne	.L1126
	jmp	.L1120
	.p2align 4,,10
	.p2align 3
.L1311:
	movdqa	.LC2(%rip), %xmm2
	movl	240(%rsp), %edi
	movq	%rsi, %r13
	movq	.LC4(%rip), %xmm3
	movl	76(%rsp), %r10d
	movq	80(%rsp), %rdx
	movq	112(%rsp), %rax
	movq	96(%rsp), %r11
	movq	88(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L1138:
	cmpl	$-1, %edi
	je	.L1405
.L1441:
	cmpl	$15, %edi
	jbe	.L1209
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L1153:
	movdqu	(%rax,%rcx,2), %xmm0
	movdqu	16(%rax,%rcx,2), %xmm1
	pand	%xmm2, %xmm0
	pand	%xmm2, %xmm1
	packuswb	%xmm1, %xmm0
	movups	%xmm0, (%rdx,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %r14
	jne	.L1153
	movq	192(%rsp), %rsi
	movl	156(%rsp), %r12d
	addq	%rbp, %rdx
	addq	%rsi, %rax
	movl	%r9d, %esi
.L1152:
	movl	%edi, %ecx
	subl	%esi, %ecx
	cmpl	$7, %ecx
	jbe	.L1154
	leaq	0(%r13,%rsi,2), %r13
	andl	$-8, %ecx
	addq	%r11, %rsi
	addq	%rbx, %r13
	subl	%ecx, %r12d
	leaq	(%rax,%rcx,2), %rax
	addq	%rcx, %rdx
	movq	0(%r13), %xmm0
	movq	8(%r13), %xmm1
	pand	%xmm3, %xmm0
	pand	%xmm3, %xmm1
	packuswb	%xmm1, %xmm0
	pshufd	$8, %xmm0, %xmm0
	movq	%xmm0, (%rsi,%r8)
.L1154:
	movzbl	(%rax), %ecx
	movb	%cl, (%rdx)
	testl	%r12d, %r12d
	je	.L1155
	movzbl	2(%rax), %ecx
	movb	%cl, 1(%rdx)
	cmpl	$1, %r12d
	je	.L1155
	movzbl	4(%rax), %ecx
	movb	%cl, 2(%rdx)
	cmpl	$2, %r12d
	je	.L1155
	movzbl	6(%rax), %ecx
	movb	%cl, 3(%rdx)
	cmpl	$3, %r12d
	je	.L1155
	movzbl	8(%rax), %ecx
	movb	%cl, 4(%rdx)
	cmpl	$4, %r12d
	je	.L1155
	movzbl	10(%rax), %ecx
	movb	%cl, 5(%rdx)
	cmpl	$5, %r12d
	je	.L1155
	movzbl	12(%rax), %ecx
	movb	%cl, 6(%rdx)
	cmpl	$6, %r12d
	je	.L1155
	movzbl	14(%rax), %eax
	movl	120(%rsp), %esi
	addl	$1, %r10d
	addl	%esi, 12(%rsp)
	movl	108(%rsp), %esi
	movb	%al, 7(%rdx)
	addl	%esi, 16(%rsp)
	cmpl	%r10d, 104(%rsp)
	je	.L1124
	movl	12(%rsp), %r13d
	movl	16(%rsp), %r8d
	leaq	(%rbx,%r13), %rax
	leaq	(%r11,%r8), %rdx
	cmpl	$-1, %edi
	jne	.L1441
	.p2align 4,,10
	.p2align 3
.L1405:
	movl	%r10d, 76(%rsp)
	jmp	.L1142
.L1317:
	movq	%rsi, %r12
	movdqa	.LC2(%rip), %xmm2
	movdqa	.LC60(%rip), %xmm8
	pxor	%xmm3, %xmm3
	movdqa	.LC61(%rip), %xmm7
	movl	240(%rsp), %edi
	movdqa	.LC62(%rip), %xmm6
	movl	76(%rsp), %r10d
	movq	.LC4(%rip), %xmm4
	movq	80(%rsp), %rsi
	movq	.LC59(%rip), %xmm9
	movq	112(%rsp), %rdx
	movq	96(%rsp), %r11
	movq	88(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L1132:
	cmpl	$-1, %edi
	je	.L1405
	cmpl	$15, %edi
	jbe	.L1212
	movq	216(%rsp), %r13
	movq	%rdx, %rax
	movq	%rsi, %rcx
	addq	%rdx, %r13
	.p2align 4,,10
	.p2align 3
.L1185:
	movdqu	(%rax), %xmm11
	movdqu	16(%rax), %xmm0
	movdqa	%xmm2, %xmm10
	addq	$64, %rax
	movdqu	-16(%rax), %xmm1
	movdqu	-16(%rax), %xmm12
	addq	$16, %rcx
	pand	%xmm2, %xmm0
	pand	%xmm2, %xmm11
	packuswb	%xmm0, %xmm11
	movdqu	-32(%rax), %xmm0
	pand	%xmm2, %xmm1
	psrlw	$8, %xmm12
	pand	%xmm2, %xmm0
	packuswb	%xmm1, %xmm0
	movdqa	%xmm2, %xmm1
	pand	%xmm0, %xmm10
	psrlw	$8, %xmm0
	pand	%xmm11, %xmm1
	psrlw	$8, %xmm11
	packuswb	%xmm10, %xmm1
	movdqu	-48(%rax), %xmm10
	packuswb	%xmm0, %xmm11
	movdqu	-64(%rax), %xmm0
	psrlw	$8, %xmm10
	psrlw	$8, %xmm0
	packuswb	%xmm10, %xmm0
	movdqu	-32(%rax), %xmm10
	pand	%xmm2, %xmm0
	psrlw	$8, %xmm10
	packuswb	%xmm12, %xmm10
	pand	%xmm2, %xmm10
	packuswb	%xmm10, %xmm0
	movdqa	%xmm1, %xmm10
	punpckhbw	%xmm3, %xmm1
	movdqa	%xmm0, %xmm12
	punpcklbw	%xmm3, %xmm10
	punpckhbw	%xmm3, %xmm0
	pmullw	%xmm8, %xmm10
	pmullw	%xmm8, %xmm1
	punpcklbw	%xmm3, %xmm12
	pmullw	%xmm7, %xmm12
	pmullw	%xmm7, %xmm0
	paddw	%xmm12, %xmm10
	movdqa	%xmm11, %xmm12
	punpckhbw	%xmm3, %xmm11
	punpcklbw	%xmm3, %xmm12
	pmullw	%xmm6, %xmm11
	paddw	%xmm1, %xmm0
	pmullw	%xmm6, %xmm12
	paddw	%xmm11, %xmm0
	paddw	%xmm12, %xmm10
	psrlw	$8, %xmm0
	psrlw	$8, %xmm10
	pand	%xmm2, %xmm0
	pand	%xmm2, %xmm10
	packuswb	%xmm0, %xmm10
	movups	%xmm10, -16(%rcx)
	cmpq	%rax, %r13
	jne	.L1185
	movq	200(%rsp), %rax
	movl	156(%rsp), %r13d
	addq	%rbp, %rsi
	movl	%r9d, %ecx
	addq	%rax, %rdx
.L1184:
	movl	%edi, %eax
	subl	%ecx, %eax
	cmpl	$7, %eax
	jbe	.L1186
	leaq	(%r12,%rcx,4), %r12
	movdqa	%xmm4, %xmm11
	movdqa	%xmm4, %xmm0
	andl	$-8, %eax
	addq	%rbx, %r12
	movdqa	%xmm4, %xmm12
	movdqa	%xmm4, %xmm15
	addq	%r11, %rcx
	movq	(%r12), %xmm10
	subl	%eax, %r13d
	leaq	(%rdx,%rax,4), %rdx
	addq	%rax, %rsi
	movq	8(%r12), %xmm14
	movq	16(%r12), %xmm1
	movq	24(%r12), %xmm13
	pand	%xmm10, %xmm11
	psrlw	$8, %xmm10
	pand	%xmm14, %xmm0
	psrlw	$8, %xmm14
	pand	%xmm1, %xmm12
	packuswb	%xmm0, %xmm11
	movdqa	%xmm4, %xmm0
	packuswb	%xmm14, %xmm10
	pand	%xmm13, %xmm0
	psrlw	$8, %xmm1
	pshufd	$8, %xmm10, %xmm10
	psrlw	$8, %xmm13
	pand	%xmm4, %xmm10
	packuswb	%xmm0, %xmm12
	packuswb	%xmm13, %xmm1
	pshufd	$8, %xmm11, %xmm11
	pshufd	$8, %xmm12, %xmm12
	pshufd	$8, %xmm1, %xmm1
	movdqa	%xmm4, %xmm0
	pand	%xmm12, %xmm15
	pand	%xmm4, %xmm1
	psrlw	$8, %xmm12
	pand	%xmm11, %xmm0
	packuswb	%xmm1, %xmm10
	psrlw	$8, %xmm11
	packuswb	%xmm15, %xmm0
	pshufd	$8, %xmm10, %xmm10
	packuswb	%xmm12, %xmm11
	pshufd	$8, %xmm0, %xmm0
	movdqa	%xmm10, %xmm1
	movdqa	%xmm0, %xmm13
	pshufd	$8, %xmm11, %xmm11
	punpcklbw	%xmm5, %xmm1
	punpcklbw	%xmm5, %xmm13
	punpcklbw	%xmm5, %xmm10
	movdqa	%xmm1, %xmm12
	pshufd	$78, %xmm10, %xmm10
	punpcklbw	%xmm5, %xmm0
	pmullw	%xmm9, %xmm13
	psllw	$2, %xmm12
	pshufd	$78, %xmm0, %xmm0
	paddw	%xmm1, %xmm12
	pmullw	%xmm9, %xmm0
	movdqa	%xmm12, %xmm1
	psllw	$4, %xmm1
	psubw	%xmm12, %xmm1
	psllw	$1, %xmm1
	paddw	%xmm13, %xmm1
	movdqa	%xmm11, %xmm13
	punpcklbw	%xmm5, %xmm13
	movdqa	%xmm13, %xmm12
	psllw	$3, %xmm12
	psubw	%xmm13, %xmm12
	psllw	$2, %xmm12
	paddw	%xmm13, %xmm12
	paddw	%xmm12, %xmm1
	movdqa	%xmm10, %xmm12
	psllw	$2, %xmm12
	paddw	%xmm10, %xmm12
	psrlw	$8, %xmm1
	pand	%xmm4, %xmm1
	movdqa	%xmm12, %xmm10
	psllw	$4, %xmm10
	psubw	%xmm12, %xmm10
	psllw	$1, %xmm10
	paddw	%xmm10, %xmm0
	movdqa	%xmm11, %xmm10
	punpcklbw	%xmm5, %xmm10
	pshufd	$78, %xmm10, %xmm10
	movdqa	%xmm10, %xmm11
	psllw	$3, %xmm11
	psubw	%xmm10, %xmm11
	psllw	$2, %xmm11
	paddw	%xmm10, %xmm11
	paddw	%xmm11, %xmm0
	psrlw	$8, %xmm0
	pand	%xmm4, %xmm0
	packuswb	%xmm0, %xmm1
	pshufd	$8, %xmm1, %xmm1
	movq	%xmm1, (%rcx,%r8)
.L1186:
	movzbl	1(%rdx), %eax
	movzbl	(%rdx), %ecx
	imull	$150, %eax, %eax
	imull	$77, %ecx, %ecx
	addl	%ecx, %eax
	movzbl	2(%rdx), %ecx
	imull	$29, %ecx, %ecx
	addl	%ecx, %eax
	movb	%ah, (%rsi)
	testl	%r13d, %r13d
	je	.L1187
	movzbl	5(%rdx), %eax
	movzbl	4(%rdx), %ecx
	imull	$150, %eax, %eax
	imull	$77, %ecx, %ecx
	addl	%ecx, %eax
	movzbl	6(%rdx), %ecx
	imull	$29, %ecx, %ecx
	addl	%ecx, %eax
	movb	%ah, 1(%rsi)
	cmpl	$1, %r13d
	je	.L1187
	movzbl	8(%rdx), %eax
	movzbl	9(%rdx), %ecx
	imull	$77, %eax, %eax
	imull	$150, %ecx, %ecx
	addl	%ecx, %eax
	movzbl	10(%rdx), %ecx
	imull	$29, %ecx, %ecx
	addl	%ecx, %eax
	movb	%ah, 2(%rsi)
	cmpl	$2, %r13d
	je	.L1187
	movzbl	13(%rdx), %eax
	movzbl	12(%rdx), %ecx
	imull	$150, %eax, %eax
	imull	$77, %ecx, %ecx
	addl	%ecx, %eax
	movzbl	14(%rdx), %ecx
	imull	$29, %ecx, %ecx
	addl	%ecx, %eax
	movb	%ah, 3(%rsi)
	cmpl	$3, %r13d
	je	.L1187
	movzbl	17(%rdx), %eax
	movzbl	16(%rdx), %ecx
	imull	$150, %eax, %eax
	imull	$77, %ecx, %ecx
	addl	%ecx, %eax
	movzbl	18(%rdx), %ecx
	imull	$29, %ecx, %ecx
	addl	%ecx, %eax
	movb	%ah, 4(%rsi)
	cmpl	$4, %r13d
	je	.L1187
	movzbl	21(%rdx), %eax
	movzbl	20(%rdx), %ecx
	imull	$150, %eax, %eax
	imull	$77, %ecx, %ecx
	addl	%ecx, %eax
	movzbl	22(%rdx), %ecx
	imull	$29, %ecx, %ecx
	addl	%ecx, %eax
	movb	%ah, 5(%rsi)
	cmpl	$5, %r13d
	je	.L1187
	movzbl	25(%rdx), %eax
	movzbl	24(%rdx), %ecx
	imull	$150, %eax, %eax
	imull	$77, %ecx, %ecx
	addl	%ecx, %eax
	movzbl	26(%rdx), %ecx
	imull	$29, %ecx, %ecx
	addl	%ecx, %eax
	movb	%ah, 6(%rsi)
	cmpl	$6, %r13d
	je	.L1187
	movzbl	28(%rdx), %ecx
	movzbl	29(%rdx), %eax
	addl	$1, %r10d
	movzbl	30(%rdx), %edx
	imull	$77, %ecx, %ecx
	imull	$150, %eax, %eax
	imull	$29, %edx, %edx
	addl	%ecx, %eax
	addl	%edx, %eax
	movb	%ah, 7(%rsi)
	movl	120(%rsp), %esi
	addl	%esi, 12(%rsp)
	movl	108(%rsp), %esi
	addl	%esi, 16(%rsp)
	cmpl	%r10d, 104(%rsp)
	je	.L1124
	movl	12(%rsp), %r12d
	movl	16(%rsp), %r8d
	leaq	(%rbx,%r12), %rdx
	leaq	(%r11,%r8), %rsi
	jmp	.L1132
	.p2align 4,,10
	.p2align 3
.L1155:
	movl	120(%rsp), %esi
	movl	108(%rsp), %edx
	addl	$1, %r10d
	addl	%esi, 12(%rsp)
	movl	12(%rsp), %eax
	addl	%edx, 16(%rsp)
	movl	16(%rsp), %esi
	cmpl	%r10d, 104(%rsp)
	je	.L1124
	movl	%eax, %r13d
	movl	%esi, %r8d
	leaq	(%rbx,%r13), %rax
	leaq	(%r11,%r8), %rdx
	jmp	.L1138
	.p2align 4,,10
	.p2align 3
.L1187:
	movl	120(%rsp), %esi
	movl	108(%rsp), %edx
	addl	$1, %r10d
	addl	%esi, 12(%rsp)
	movl	12(%rsp), %eax
	addl	%edx, 16(%rsp)
	movl	16(%rsp), %esi
	cmpl	%r10d, 104(%rsp)
	je	.L1124
	movl	%eax, %r12d
	movl	%esi, %r8d
	leaq	(%rbx,%r12), %rdx
	leaq	(%r11,%r8), %rsi
	jmp	.L1132
.L1212:
	movl	%edi, %r13d
	xorl	%ecx, %ecx
	jmp	.L1184
.L1213:
	movl	%r14d, %esi
	xorl	%ecx, %ecx
	jmp	.L1195
.L1210:
	movl	%r14d, %esi
	xorl	%ecx, %ecx
	jmp	.L1166
.L1208:
	movl	%r12d, %edi
	xorl	%esi, %esi
	jmp	.L1143
.L1211:
	movl	%eax, %r10d
	xorl	%ecx, %ecx
	jmp	.L1173
.L1209:
	movl	%edi, %r12d
	xorl	%esi, %esi
	jmp	.L1152
.L1433:
	xorl	%edi, %edi
	call	malloc@PLT
	movq	%rax, 96(%rsp)
	testq	%rax, %rax
	jne	.L1124
	jmp	.L1120
.L1431:
	leaq	__PRETTY_FUNCTION__.43(%rip), %rcx
	movl	$1761, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC17(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE608:
	.size	stbi__convert_format, .-stbi__convert_format
	.p2align 4
	.type	stbi__gif_parse_colortable, @function
stbi__gif_parse_colortable:
.LFB721:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%ecx, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%edx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	jmp	.L1455
	.p2align 4,,10
	.p2align 3
.L1443:
	movl	48(%rbx), %ecx
	xorl	%r13d, %r13d
	testl	%ecx, %ecx
	jne	.L1461
.L1444:
	movb	%r13b, 2(%r12,%rbp,4)
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L1462
	movl	48(%rbx), %edx
	xorl	%r13d, %r13d
	testl	%edx, %edx
	jne	.L1463
.L1448:
	movb	%r13b, 1(%r12,%rbp,4)
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L1464
	movl	48(%rbx), %eax
	xorl	%r13d, %r13d
	testl	%eax, %eax
	jne	.L1465
.L1452:
	cmpl	%ebp, %r15d
	movb	%r13b, (%r12,%rbp,4)
	setne	%al
	negl	%eax
	movb	%al, 3(%r12,%rbp,4)
	addq	$1, %rbp
	cmpq	%rbp, %r14
	je	.L1466
.L1455:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L1443
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r13d
	jmp	.L1444
	.p2align 4,,10
	.p2align 3
.L1464:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r13d
	jmp	.L1452
	.p2align 4,,10
	.p2align 3
.L1462:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r13d
	jmp	.L1448
	.p2align 4,,10
	.p2align 3
.L1463:
	leaq	56(%rbx), %rcx
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rcx, 8(%rsp)
	movq	%rcx, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	8(%rsp), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	leaq	57(%rbx), %rdx
	jne	.L1449
	movl	$0, 48(%rbx)
	movq	%rdx, %rcx
	movb	$0, 56(%rbx)
.L1450:
	movq	%rcx, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L1448
	.p2align 4,,10
	.p2align 3
.L1461:
	leaq	56(%rbx), %rcx
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rcx, 8(%rsp)
	movq	%rcx, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	8(%rsp), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	leaq	57(%rbx), %rdx
	jne	.L1445
	movl	$0, 48(%rbx)
	movq	%rdx, %rcx
	movb	$0, 56(%rbx)
.L1446:
	movq	%rcx, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L1444
	.p2align 4,,10
	.p2align 3
.L1465:
	leaq	56(%rbx), %rcx
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rcx, 8(%rsp)
	movq	%rcx, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	8(%rsp), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	leaq	57(%rbx), %rdx
	jne	.L1453
	movl	$0, 48(%rbx)
	movq	%rdx, %rcx
	movb	$0, 56(%rbx)
.L1454:
	movq	%rcx, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L1452
	.p2align 4,,10
	.p2align 3
.L1466:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1449:
	.cfi_restore_state
	cltq
	movzbl	56(%rbx), %r13d
	addq	%rax, %rcx
	jmp	.L1450
	.p2align 4,,10
	.p2align 3
.L1445:
	cltq
	movzbl	56(%rbx), %r13d
	addq	%rax, %rcx
	jmp	.L1446
	.p2align 4,,10
	.p2align 3
.L1453:
	cltq
	movzbl	56(%rbx), %r13d
	addq	%rax, %rcx
	jmp	.L1454
	.cfi_endproc
.LFE721:
	.size	stbi__gif_parse_colortable, .-stbi__gif_parse_colortable
	.p2align 4
	.type	stbi__pnm_skip_whitespace, @function
stbi__pnm_skip_whitespace:
.LFB744:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L1484:
	cmpq	$0, 16(%rbx)
	je	.L1521
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L1473
	movl	48(%rbx), %edi
	testl	%edi, %edi
	je	.L1474
	movq	192(%rbx), %rcx
	movq	%rcx, %rdx
	cmpq	200(%rbx), %rcx
	jnb	.L1522
.L1471:
	movzbl	0(%rbp), %eax
	cmpb	$32, %al
	je	.L1478
	cmpb	$9, %al
	je	.L1478
	subl	$10, %eax
	cmpb	$3, %al
	jbe	.L1523
.L1474:
	cmpq	$0, 16(%rbx)
	je	.L1490
.L1485:
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L1487
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L1467
.L1490:
	movq	200(%rbx), %rax
	cmpq	%rax, 192(%rbx)
	jnb	.L1467
.L1487:
	cmpb	$35, 0(%rbp)
	jne	.L1467
	cmpq	$0, 16(%rbx)
	je	.L1499
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L1498
.L1524:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L1484
.L1499:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L1484
	movzbl	0(%rbp), %edx
	cmpb	$10, %dl
	je	.L1484
	cmpb	$13, %dl
	je	.L1484
.L1502:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r12d
.L1492:
	movb	%r12b, 0(%rbp)
	cmpq	$0, 16(%rbx)
	je	.L1499
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	jne	.L1524
.L1498:
	movzbl	0(%rbp), %eax
	cmpb	$13, %al
	je	.L1484
	cmpb	$10, %al
	je	.L1484
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L1502
	movl	48(%rbx), %edx
	xorl	%r12d, %r12d
	testl	%edx, %edx
	je	.L1492
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L1493
	movl	$0, 48(%rbx)
	movq	%rdx, %r13
	movb	$0, 56(%rbx)
.L1494:
	movq	%r13, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L1492
	.p2align 4,,10
	.p2align 3
.L1521:
	movq	192(%rbx), %rcx
	movq	%rcx, %rdx
	cmpq	200(%rbx), %rcx
	jb	.L1471
.L1467:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1473:
	.cfi_restore_state
	movzbl	0(%rbp), %eax
	cmpb	$32, %al
	je	.L1480
	cmpb	$9, %al
	jne	.L1476
.L1480:
	movq	192(%rbx), %rdx
	cmpq	200(%rbx), %rdx
	jb	.L1478
	movl	48(%rbx), %esi
	xorl	%r12d, %r12d
	testl	%esi, %esi
	jne	.L1525
.L1481:
	movb	%r12b, 0(%rbp)
	jmp	.L1484
.L1523:
	movq	%rcx, %rdx
	.p2align 4,,10
	.p2align 3
.L1478:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %r12d
	jmp	.L1481
	.p2align 4,,10
	.p2align 3
.L1525:
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L1482
	movl	$0, 48(%rbx)
	movq	%rdx, %r13
	movb	$0, 56(%rbx)
.L1483:
	movq	%r13, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L1481
	.p2align 4,,10
	.p2align 3
.L1493:
	cltq
	movzbl	56(%rbx), %r12d
	addq	%rax, %r13
	jmp	.L1494
	.p2align 4,,10
	.p2align 3
.L1476:
	subl	$10, %eax
	cmpb	$3, %al
	jbe	.L1480
	jmp	.L1474
	.p2align 4,,10
	.p2align 3
.L1482:
	cltq
	movzbl	56(%rbx), %r12d
	addq	%rax, %r13
	jmp	.L1483
	.p2align 4,,10
	.p2align 3
.L1522:
	cmpq	$0, 16(%rbx)
	jne	.L1485
	jmp	.L1467
	.cfi_endproc
.LFE744:
	.size	stbi__pnm_skip_whitespace, .-stbi__pnm_skip_whitespace
	.section	.rodata.str1.1
.LC63:
	.string	"integer parse overflow"
	.text
	.p2align 4
	.type	stbi__pnm_getinteger, @function
stbi__pnm_getinteger:
.LFB746:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
.L1527:
	cmpq	$0, 16(%rbx)
	je	.L1540
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L1538
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L1526
.L1540:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L1526
	movsbl	(%r12), %edx
	leal	-48(%rdx), %ecx
	cmpb	$9, %cl
	jbe	.L1543
.L1526:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1543:
	.cfi_restore_state
	leal	0(%rbp,%rbp,4), %ecx
	leal	-48(%rdx,%rcx,2), %ebp
.L1542:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
.L1529:
	movb	%al, (%r12)
	cmpl	$214748364, %ebp
	jg	.L1535
	jne	.L1527
	cmpb	$55, %al
	jle	.L1527
.L1535:
	leaq	.LC63(%rip), %rax
	xorl	%ebp, %ebp
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1538:
	.cfi_restore_state
	movsbl	(%r12), %edx
	movl	%edx, %eax
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L1526
	leal	0(%rbp,%rbp,4), %eax
	leal	-48(%rdx,%rax,2), %ebp
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L1542
	movl	48(%rbx), %edx
	testl	%edx, %edx
	jne	.L1530
	movb	$0, (%r12)
	cmpl	$214748364, %ebp
	jle	.L1527
	jmp	.L1535
	.p2align 4,,10
	.p2align 3
.L1530:
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L1545
	cltq
	addq	%rax, %r13
	movzbl	56(%rbx), %eax
.L1534:
	movq	%r13, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L1529
	.p2align 4,,10
	.p2align 3
.L1545:
	movl	$0, 48(%rbx)
	movq	%rdx, %r13
	movb	$0, 56(%rbx)
	jmp	.L1534
	.cfi_endproc
.LFE746:
	.size	stbi__pnm_getinteger, .-stbi__pnm_getinteger
	.section	.rodata.str1.1
.LC64:
	.string	"#?RADIANCE\n"
.LC65:
	.string	"#?RGBE\n"
	.text
	.p2align 4
	.type	stbi__hdr_test, @function
stbi__hdr_test:
.LFB732:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	56(%rdi), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	1+.LC64(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	$35, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rax
	.p2align 4,,10
	.p2align 3
.L1551:
	cmpq	%rax, %rdx
	jb	.L1562
	movl	48(%rbx), %edx
	testl	%edx, %edx
	jne	.L1563
.L1549:
	movdqu	208(%rbx), %xmm0
	movq	216(%rbx), %rdx
	leaq	1+.LC65(%rip), %r12
	movl	$35, %ebp
	movq	208(%rbx), %rax
	movups	%xmm0, 192(%rbx)
.L1558:
	cmpq	%rdx, %rax
	jb	.L1564
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L1565
.L1555:
	xorl	%eax, %eax
.L1557:
	movq	208(%rbx), %rdx
	movq	%rdx, 192(%rbx)
	movq	216(%rbx), %rdx
.L1552:
	movq	%rdx, 200(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1562:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rdx), %esi
	movq	%rcx, %rdx
.L1548:
	cmpl	%esi, %ebp
	jne	.L1549
	movsbl	(%r12), %ebp
	addq	$1, %r12
	testb	%bpl, %bpl
	jne	.L1551
	movq	208(%rbx), %rax
	movq	216(%rbx), %rdx
	movq	%rax, 192(%rbx)
	movl	$1, %eax
	jmp	.L1552
	.p2align 4,,10
	.p2align 3
.L1563:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L1550
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L1549
	.p2align 4,,10
	.p2align 3
.L1564:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %edx
.L1554:
	cmpl	%edx, %ebp
	jne	.L1555
	movsbl	(%r12), %ebp
	addq	$1, %r12
	testb	%bpl, %bpl
	je	.L1559
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
	jmp	.L1558
	.p2align 4,,10
	.p2align 3
.L1550:
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %esi
	addq	%r13, %rax
	movq	%rax, 200(%rbx)
	jmp	.L1548
	.p2align 4,,10
	.p2align 3
.L1565:
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L1556
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	jmp	.L1555
	.p2align 4,,10
	.p2align 3
.L1556:
	cltq
	movzbl	56(%rbx), %edx
	addq	%rax, %r13
	leaq	57(%rbx), %rax
	movq	%r13, 200(%rbx)
	movq	%rax, 192(%rbx)
	jmp	.L1554
	.p2align 4,,10
	.p2align 3
.L1559:
	movl	$1, %eax
	jmp	.L1557
	.cfi_endproc
.LFE732:
	.size	stbi__hdr_test, .-stbi__hdr_test
	.section	.rodata.str1.1
.LC66:
	.string	"too large"
.LC67:
	.string	"not enough pixels"
.LC68:
	.string	"invalid filter"
.LC69:
	.string	"invalid width"
	.section	.rodata.str1.8
	.align 8
.LC70:
	.string	"out_n == s->img_n || out_n == s->img_n + 1"
	.section	.rodata.str1.1
.LC72:
	.string	"img_n + 1 == out_n"
.LC77:
	.string	"img_n == 3"
	.text
	.p2align 4
	.type	stbi__create_png_image_raw, @function
stbi__create_png_image_raw:
.LFB679:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%ecx, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebx
	subq	$488, %rsp
	.cfi_def_cfa_offset 544
	cmpl	$16, 544(%rsp)
	movq	%rdi, 184(%rsp)
	movq	%rsi, 96(%rsp)
	movl	%ecx, 180(%rsp)
	movl	%r8d, 160(%rsp)
	movl	%r9d, 192(%rsp)
	je	.L2120
	movl	%ecx, %r14d
	movl	$1, %r12d
	movl	$1, %r15d
	movq	%rdi, %rax
.L1567:
	movq	(%rax), %rax
	movl	180(%rsp), %edi
	movl	8(%rax), %eax
	movl	%eax, 240(%rsp)
	cmpl	%eax, %edi
	je	.L1568
	addl	$1, %eax
	cmpl	%edi, %eax
	jne	.L2121
.L1568:
	movl	160(%rsp), %esi
	movl	192(%rsp), %eax
	movl	%esi, %edi
	orl	%eax, %edi
	js	.L1569
	movl	%esi, 200(%rsp)
	movl	%eax, %ecx
	testl	%eax, %eax
	je	.L2122
	movl	%eax, %edi
	xorl	%edx, %edx
	movl	$2147483647, %eax
	idivl	%ecx
	cmpl	%eax, %esi
	jg	.L1569
	testl	%r14d, %r14d
	js	.L1569
	imull	%esi, %edi
	movl	%edi, %ecx
	testl	%r14d, %r14d
	je	.L1571
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%r14d
	cmpl	%eax, %edi
	jle	.L1571
	.p2align 4,,10
	.p2align 3
.L1569:
	movq	184(%rsp), %rax
	movq	$0, 24(%rax)
.L1572:
	leaq	.LC18(%rip), %rdx
	jmp	.L1574
	.p2align 4,,10
	.p2align 3
.L2122:
	testl	%r14d, %r14d
	js	.L1569
.L1571:
	imull	%r14d, %ecx
	movslq	%ecx, %rdi
	call	malloc@PLT
	movq	%rax, %rdi
	movq	184(%rsp), %rax
	movq	%rdi, 24(%rax)
	testq	%rdi, %rdi
	je	.L1572
	movl	240(%rsp), %eax
	testl	%eax, %eax
	js	.L1807
	movl	160(%rsp), %eax
	testl	%eax, %eax
	je	.L2123
	movl	160(%rsp), %esi
	movl	$2147483647, %eax
	xorl	%edx, %edx
	movl	240(%rsp), %ecx
	idivl	%esi
	cmpl	%eax, %ecx
	jg	.L1807
	movl	544(%rsp), %eax
	testl	%eax, %eax
	js	.L1807
	je	.L1576
	movl	$2147483647, %eax
	imull	%esi, %ecx
	xorl	%edx, %edx
	idivl	544(%rsp)
	leaq	.LC66(%rip), %rdx
	cmpl	%eax, %ecx
	jg	.L1574
	imull	544(%rsp), %ecx
	cmpl	$2147483640, %ecx
	jg	.L1574
.L1576:
	movl	160(%rsp), %esi
	movl	240(%rsp), %eax
	imull	%esi, %eax
	movl	192(%rsp), %esi
	movl	%eax, 464(%rsp)
	imull	544(%rsp), %eax
	addl	$7, %eax
	shrl	$3, %eax
	movl	%eax, 244(%rsp)
	addl	$1, %eax
	imull	%esi, %eax
	cmpl	%eax, %ebx
	jb	.L1810
	testl	%esi, %esi
	je	.L1791
	movl	180(%rsp), %eax
	movl	160(%rsp), %esi
	movl	$0, 144(%rsp)
	leaq	.L1585(%rip), %rbp
	movl	$0, 108(%rsp)
	movl	%eax, %ebx
	imull	%esi, %ebx
	imull	%ebx, %r12d
	movl	%ebx, 248(%rsp)
	movl	240(%rsp), %ebx
	imull	%ebx, %r15d
	cmpl	$7, 544(%rsp)
	setle	%dl
	cmpl	%ebx, %eax
	movl	%r12d, 176(%rsp)
	sete	%al
	orl	%eax, %edx
	leal	1(%rbx), %eax
	movl	%r15d, 8(%rsp)
	movb	%dl, 208(%rsp)
	movl	%eax, 252(%rsp)
	.p2align 4,,10
	.p2align 3
.L1755:
	movq	96(%rsp), %rax
	movl	144(%rsp), %r15d
	movzbl	(%rax), %edx
	addq	%r15, %rdi
	leaq	1(%rax), %r11
	cmpl	$4, %edx
	jg	.L1811
	cmpl	$7, 544(%rsp)
	jg	.L1579
	movl	244(%rsp), %ebx
	cmpl	%ebx, 160(%rsp)
	jb	.L1812
	movl	248(%rsp), %eax
	movl	176(%rsp), %ecx
	movl	%ebx, 200(%rsp)
	movl	108(%rsp), %r13d
	movl	$1, 8(%rsp)
	subl	%ebx, %eax
	addq	%rax, %rdi
	movq	%rdi, %rax
	subq	%rcx, %rax
	testl	%r13d, %r13d
	jne	.L1580
	leaq	first_row_filter(%rip), %rbx
	movzbl	(%rbx,%rdx), %edx
.L1580:
	movl	8(%rsp), %ebx
	movq	%r11, %r9
	movq	%rdi, %r8
	xorl	%esi, %esi
	movl	%edx, %r10d
	.p2align 4,,10
	.p2align 3
.L1592:
	cmpl	$6, %edx
	ja	.L1583
	movslq	0(%rbp,%r10,4), %rcx
	addq	%rbp, %rcx
	jmp	*%rcx
	.section	.rodata
	.align 4
	.align 4
.L1585:
	.long	.L1584-.L1585
	.long	.L1584-.L1585
	.long	.L1587-.L1585
	.long	.L1588-.L1585
	.long	.L1587-.L1585
	.long	.L1584-.L1585
	.long	.L1584-.L1585
	.text
.L2123:
	movl	544(%rsp), %eax
	testl	%eax, %eax
	jns	.L1576
	.p2align 4,,10
	.p2align 3
.L1807:
	leaq	.LC66(%rip), %rdx
.L1574:
	movq	%rdx, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L1566:
	addq	$488, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L2120:
	.cfi_restore_state
	addl	%eax, %eax
	movl	$2, %r12d
	movl	$2, %r15d
	movl	%eax, %r14d
	movq	%rdi, %rax
	jmp	.L1567
	.p2align 4,,10
	.p2align 3
.L1584:
	movzbl	(%r9), %ecx
	movb	%cl, (%r8)
.L1583:
	addq	$1, %rsi
	addq	$1, %r9
	addq	$1, %r8
	cmpl	%esi, %ebx
	jg	.L1592
	cmpl	$8, 544(%rsp)
	je	.L2124
.L1593:
	cmpl	$16, 544(%rsp)
	je	.L2125
	addq	$2, 96(%rsp)
	addq	$1, %rdi
	addq	$1, %rax
.L1595:
	cmpb	$0, 208(%rsp)
	je	.L1598
.L2126:
	movl	200(%rsp), %ebx
	movl	8(%rsp), %r15d
	leal	-1(%rbx), %ecx
	imull	%ecx, %r15d
	movslq	%r15d, %r13
	cmpl	$6, %edx
	ja	.L1599
	leaq	.L1601(%rip), %rcx
	movl	%edx, %edx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L1601:
	.long	.L1607-.L1601
	.long	.L1606-.L1601
	.long	.L1605-.L1601
	.long	.L1604-.L1601
	.long	.L1603-.L1601
	.long	.L1602-.L1601
	.long	.L1600-.L1601
	.text
	.p2align 4,,10
	.p2align 3
.L1587:
	movzbl	(%rax,%rsi), %ecx
	addb	(%r9), %cl
	movb	%cl, (%r8)
	jmp	.L1583
	.p2align 4,,10
	.p2align 3
.L1588:
	movzbl	(%rax,%rsi), %ecx
	shrb	%cl
	addb	(%r9), %cl
	movb	%cl, (%r8)
	jmp	.L1583
.L1602:
	testl	%r15d, %r15d
	jle	.L1599
	leal	-1(%r15), %eax
	cmpl	$14, %eax
	jbe	.L1827
	movl	8(%rsp), %edx
	negl	%edx
	movslq	%edx, %rdx
	movq	%rdx, %rax
	notq	%rax
	cmpq	$14, %rax
	jbe	.L1827
	movq	96(%rsp), %rsi
	movq	%rdi, %rax
	leaq	1(%rsi), %rcx
	subq	%rcx, %rax
	cmpq	$14, %rax
	jbe	.L1827
	movl	%r15d, %ecx
	movdqa	.LC15(%rip), %xmm3
	addq	%rdi, %rdx
	xorl	%eax, %eax
	shrl	$4, %ecx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L1649:
	movdqu	(%rdx,%rax), %xmm0
	movdqu	(%rsi,%rax), %xmm5
	psrlw	$1, %xmm0
	pand	%xmm3, %xmm0
	paddb	%xmm5, %xmm0
	movups	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpq	%rax, %rcx
	jne	.L1649
	movl	%r15d, %ecx
	andl	$-16, %ecx
	testb	$15, %r15b
	je	.L1599
	movl	8(%rsp), %ebx
	movl	%ecx, %eax
	movq	96(%rsp), %rsi
	movl	%ecx, %edx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	1(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	2(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	3(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	4(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	5(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	6(%rcx), %eax
	cmpl	%r15d, %eax
	jge	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	7(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	8(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	9(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	10(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	11(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	12(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	13(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	14(%rcx), %eax
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rsi,%rdx), %al
	movb	%al, (%rdi,%rdx)
	jmp	.L1599
	.p2align 4,,10
	.p2align 3
.L1603:
	testl	%r15d, %r15d
	jle	.L1599
	leal	-1(%r15), %edx
	cmpl	$14, %edx
	jbe	.L1823
	movl	8(%rsp), %edx
	movq	96(%rsp), %rbx
	movq	%rdi, %rsi
	negl	%edx
	leaq	1(%rbx), %r9
	movslq	%edx, %rdx
	leaq	1(%rdx), %rcx
	leaq	(%rax,%rcx), %r8
	subq	%r8, %rsi
	movq	%rdi, %r8
	cmpq	$14, %rsi
	seta	%sil
	subq	%r9, %r8
	cmpq	$14, %r8
	seta	%r8b
	negq	%rcx
	andl	%esi, %r8d
	cmpq	$14, %rcx
	seta	%cl
	testb	%cl, %r8b
	je	.L1823
	leaq	1(%rax), %rsi
	movq	%rdi, %rcx
	subq	%rsi, %rcx
	cmpq	$14, %rcx
	jbe	.L1823
	leaq	(%rax,%rdx), %rsi
	leaq	(%rdi,%rdx), %r8
	movl	%r15d, %edx
	movq	%rbx, %r9
	shrl	$4, %edx
	movq	%rsi, 80(%rsp)
	movq	%r8, %r11
	pxor	%xmm14, %xmm14
	salq	$4, %rdx
	movdqa	.LC2(%rip), %xmm4
	pxor	%xmm13, %xmm13
	movq	%rdx, %rcx
	xorl	%edx, %edx
.L1640:
	movdqu	(%rsi,%rdx), %xmm0
	pxor	%xmm5, %xmm5
	movdqu	(%rsi,%rdx), %xmm1
	movdqu	(%r8,%rdx), %xmm8
	movdqa	%xmm5, %xmm3
	movdqu	(%r8,%rdx), %xmm7
	punpckhbw	%xmm5, %xmm0
	punpcklbw	%xmm5, %xmm1
	movdqa	%xmm0, %xmm6
	punpcklbw	%xmm3, %xmm8
	movdqa	%xmm1, %xmm2
	punpckhwd	%xmm14, %xmm6
	movdqa	%xmm8, %xmm15
	punpckhbw	%xmm3, %xmm7
	movaps	%xmm6, 64(%rsp)
	movdqu	(%rax,%rdx), %xmm6
	punpcklwd	%xmm14, %xmm15
	punpcklwd	%xmm14, %xmm2
	movaps	%xmm2, 16(%rsp)
	movdqa	%xmm0, %xmm9
	punpckhwd	%xmm14, %xmm8
	punpckhwd	%xmm14, %xmm1
	punpcklbw	%xmm5, %xmm6
	movdqu	(%rax,%rdx), %xmm5
	punpcklwd	%xmm14, %xmm9
	movdqa	%xmm8, %xmm2
	movdqa	%xmm6, %xmm11
	movaps	%xmm9, 48(%rsp)
	punpckhwd	%xmm14, %xmm6
	movdqa	%xmm7, %xmm12
	punpckhbw	%xmm3, %xmm5
	punpcklwd	%xmm14, %xmm11
	movdqa	%xmm15, %xmm3
	movaps	%xmm1, 32(%rsp)
	paddd	%xmm11, %xmm3
	psubd	16(%rsp), %xmm3
	punpcklwd	%xmm14, %xmm12
	paddd	%xmm6, %xmm2
	psubd	32(%rsp), %xmm2
	movdqa	%xmm5, %xmm10
	movdqa	%xmm3, %xmm9
	punpcklwd	%xmm14, %xmm10
	movdqa	%xmm12, %xmm1
	psubd	%xmm15, %xmm9
	paddd	%xmm10, %xmm1
	punpckhwd	%xmm14, %xmm7
	movdqa	%xmm9, %xmm15
	psubd	48(%rsp), %xmm1
	punpckhwd	%xmm14, %xmm5
	psrad	$31, %xmm15
	movdqa	%xmm7, %xmm0
	pxor	%xmm15, %xmm9
	paddd	%xmm5, %xmm0
	psubd	64(%rsp), %xmm0
	psubd	%xmm15, %xmm9
	movdqa	%xmm2, %xmm15
	psubd	%xmm8, %xmm15
	movaps	%xmm9, 112(%rsp)
	movdqa	%xmm15, %xmm8
	movdqa	%xmm15, %xmm9
	psrad	$31, %xmm8
	pxor	%xmm8, %xmm9
	movdqa	%xmm9, %xmm15
	psubd	%xmm8, %xmm15
	movdqa	%xmm1, %xmm8
	movaps	%xmm15, 128(%rsp)
	psubd	%xmm12, %xmm8
	movdqa	%xmm8, %xmm12
	psrad	$31, %xmm12
	pxor	%xmm12, %xmm8
	movdqa	%xmm12, %xmm9
	movdqa	%xmm8, %xmm12
	movdqa	%xmm0, %xmm8
	psubd	%xmm7, %xmm8
	psubd	%xmm9, %xmm12
	movdqa	%xmm8, %xmm7
	psrad	$31, %xmm7
	pxor	%xmm7, %xmm8
	psubd	%xmm7, %xmm8
	movdqa	%xmm3, %xmm7
	psubd	16(%rsp), %xmm3
	psubd	%xmm11, %xmm7
	movdqa	%xmm8, %xmm15
	movdqa	%xmm7, %xmm8
	psrad	$31, %xmm8
	pxor	%xmm8, %xmm7
	psubd	%xmm8, %xmm7
	movdqa	%xmm2, %xmm8
	psubd	32(%rsp), %xmm2
	psubd	%xmm6, %xmm8
	movdqa	%xmm8, %xmm6
	psrad	$31, %xmm6
	pxor	%xmm6, %xmm8
	psubd	%xmm6, %xmm8
	movdqa	%xmm1, %xmm6
	psubd	48(%rsp), %xmm1
	psubd	%xmm10, %xmm6
	movdqa	%xmm6, %xmm11
	psrad	$31, %xmm11
	pxor	%xmm11, %xmm6
	psubd	%xmm11, %xmm6
	movdqa	%xmm0, %xmm11
	psubd	64(%rsp), %xmm0
	psubd	%xmm5, %xmm11
	movdqa	%xmm11, %xmm5
	movdqa	%xmm11, %xmm9
	psrad	$31, %xmm5
	pxor	%xmm5, %xmm9
	psubd	%xmm5, %xmm9
	movdqa	%xmm3, %xmm5
	psrad	$31, %xmm5
	pxor	%xmm5, %xmm3
	psubd	%xmm5, %xmm3
	movdqa	%xmm2, %xmm5
	psrad	$31, %xmm5
	pxor	%xmm5, %xmm2
	psubd	%xmm5, %xmm2
	movdqa	%xmm1, %xmm5
	psrad	$31, %xmm5
	pxor	%xmm5, %xmm1
	psubd	%xmm5, %xmm1
	movdqa	%xmm0, %xmm5
	psrad	$31, %xmm5
	pxor	%xmm5, %xmm0
	psubd	%xmm5, %xmm0
	movdqa	%xmm7, %xmm5
	pcmpgtd	%xmm3, %xmm5
	movdqa	%xmm5, %xmm10
	pand	%xmm5, %xmm3
	pandn	%xmm7, %xmm10
	por	%xmm10, %xmm3
	movdqa	%xmm8, %xmm10
	pcmpgtd	%xmm2, %xmm10
	movdqa	%xmm10, %xmm7
	pand	%xmm10, %xmm2
	pandn	%xmm8, %xmm7
	por	%xmm7, %xmm2
	movdqa	%xmm6, %xmm7
	pcmpgtd	%xmm1, %xmm7
	movdqa	%xmm7, %xmm8
	pand	%xmm7, %xmm1
	pandn	%xmm6, %xmm8
	movdqa	%xmm9, %xmm6
	pcmpgtd	%xmm0, %xmm6
	por	%xmm8, %xmm1
	movdqa	%xmm6, %xmm8
	pand	%xmm6, %xmm0
	movdqa	%xmm6, %xmm11
	pandn	%xmm9, %xmm8
	pcmpeqd	%xmm13, %xmm11
	por	%xmm0, %xmm8
	movdqa	112(%rsp), %xmm0
	pcmpgtd	%xmm8, %xmm15
	movdqa	%xmm7, %xmm8
	pcmpgtd	%xmm3, %xmm0
	pcmpeqd	%xmm13, %xmm8
	movdqa	128(%rsp), %xmm3
	pcmpgtd	%xmm2, %xmm3
	movdqa	%xmm12, %xmm2
	movdqa	%xmm10, %xmm12
	pcmpgtd	%xmm1, %xmm2
	movdqa	%xmm5, %xmm1
	pand	%xmm0, %xmm5
	pcmpeqd	%xmm13, %xmm1
	pcmpeqd	%xmm13, %xmm12
	movdqa	%xmm15, %xmm9
	pand	%xmm3, %xmm10
	pcmpeqd	%xmm13, %xmm9
	pand	%xmm15, %xmm11
	pand	%xmm2, %xmm8
	pand	%xmm2, %xmm7
	pand	%xmm15, %xmm6
	pand	%xmm0, %xmm1
	pcmpeqd	%xmm13, %xmm0
	pand	%xmm3, %xmm12
	pcmpeqd	%xmm13, %xmm3
	pcmpeqd	%xmm13, %xmm2
	movdqa	%xmm0, %xmm15
	punpcklwd	%xmm3, %xmm0
	punpckhwd	%xmm3, %xmm15
	movdqa	%xmm0, %xmm3
	punpcklwd	%xmm15, %xmm0
	punpckhwd	%xmm15, %xmm3
	punpcklwd	%xmm3, %xmm0
	movdqa	%xmm2, %xmm3
	punpcklwd	%xmm9, %xmm2
	punpckhwd	%xmm9, %xmm3
	movdqa	%xmm2, %xmm9
	pand	%xmm4, %xmm0
	punpckhwd	%xmm3, %xmm9
	punpcklwd	%xmm3, %xmm2
	movdqu	(%rsi,%rdx), %xmm3
	punpcklwd	%xmm9, %xmm2
	pand	%xmm4, %xmm2
	packuswb	%xmm2, %xmm0
	movdqu	(%r8,%rdx), %xmm2
	pand	%xmm0, %xmm2
	pandn	%xmm3, %xmm0
	por	%xmm2, %xmm0
	movdqa	%xmm5, %xmm2
	punpcklwd	%xmm10, %xmm5
	punpckhwd	%xmm10, %xmm2
	movdqa	%xmm5, %xmm3
	punpckhwd	%xmm2, %xmm3
	punpcklwd	%xmm2, %xmm5
	movdqa	%xmm7, %xmm2
	punpcklwd	%xmm6, %xmm7
	punpckhwd	%xmm6, %xmm2
	punpcklwd	%xmm3, %xmm5
	movdqa	%xmm7, %xmm3
	punpcklwd	%xmm2, %xmm7
	pand	%xmm4, %xmm5
	punpckhwd	%xmm2, %xmm3
	movdqu	(%rsi,%rdx), %xmm2
	punpcklwd	%xmm3, %xmm7
	pand	%xmm4, %xmm7
	packuswb	%xmm7, %xmm5
	pand	%xmm5, %xmm2
	pandn	%xmm0, %xmm5
	movdqa	%xmm1, %xmm0
	punpcklwd	%xmm12, %xmm1
	punpckhwd	%xmm12, %xmm0
	por	%xmm2, %xmm5
	movdqa	%xmm1, %xmm2
	punpcklwd	%xmm0, %xmm1
	punpckhwd	%xmm0, %xmm2
	movdqa	%xmm8, %xmm0
	punpcklwd	%xmm11, %xmm8
	punpckhwd	%xmm11, %xmm0
	punpcklwd	%xmm2, %xmm1
	movdqa	%xmm8, %xmm2
	punpckhwd	%xmm0, %xmm2
	punpcklwd	%xmm0, %xmm8
	pand	%xmm4, %xmm1
	movdqu	(%rax,%rdx), %xmm0
	punpcklwd	%xmm2, %xmm8
	pand	%xmm4, %xmm8
	packuswb	%xmm8, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm5, %xmm1
	por	%xmm0, %xmm1
	movdqu	(%r9,%rdx), %xmm0
	paddb	%xmm1, %xmm0
	movups	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %rcx
	jne	.L1640
	movl	%r15d, %ecx
	andl	$-16, %ecx
	testb	$15, %r15b
	je	.L1599
	movq	%r13, 32(%rsp)
	movl	%r14d, 16(%rsp)
	movq	%r11, %r14
	.p2align 4,,10
	.p2align 3
.L1644:
	movq	96(%rsp), %rbx
	movzbl	(%rax,%rcx), %r9d
	movzbl	(%r14,%rcx), %r11d
	movzbl	(%rbx,%rcx), %r13d
	movq	80(%rsp), %rbx
	movl	%r9d, %r12d
	leal	(%r9,%r11), %edx
	movl	%r11d, %esi
	movzbl	(%rbx,%rcx), %r8d
	subl	%r8d, %edx
	movl	%r8d, %ebx
	movl	%edx, %r10d
	subl	%r9d, %r10d
	movl	%r10d, %r9d
	negl	%r9d
	cmovs	%r10d, %r9d
	movl	%edx, %r10d
	subl	%r8d, %r10d
	movl	%r10d, %r8d
	negl	%r8d
	cmovs	%r10d, %r8d
	subl	%r11d, %edx
	movl	%edx, %r10d
	negl	%r10d
	cmovns	%r10d, %edx
	cmpl	%r8d, %r9d
	movl	%r8d, %r10d
	cmovle	%r9d, %r10d
	cmpl	%r10d, %edx
	jle	.L1645
	cmpl	%r8d, %r9d
	cmovle	%r12d, %ebx
	movl	%ebx, %esi
.L1645:
	addl	%r13d, %esi
	movb	%sil, (%rdi,%rcx)
	addq	$1, %rcx
	cmpl	%ecx, %r15d
	jg	.L1644
	movl	16(%rsp), %r14d
	movq	32(%rsp), %r13
	jmp	.L1599
.L1604:
	testl	%r15d, %r15d
	jle	.L1599
	leal	-1(%r15), %edx
	cmpl	$14, %edx
	jbe	.L1821
	movq	96(%rsp), %rbx
	movl	8(%rsp), %edx
	movq	%rdi, %rcx
	leaq	1(%rax), %r8
	leaq	1(%rbx), %rsi
	negl	%edx
	subq	%rsi, %rcx
	movq	%rdi, %rsi
	movslq	%edx, %rdx
	cmpq	$14, %rcx
	seta	%cl
	subq	%r8, %rsi
	cmpq	$14, %rsi
	seta	%sil
	testb	%sil, %cl
	je	.L1821
	movq	%rdx, %rcx
	notq	%rcx
	cmpq	$14, %rcx
	jbe	.L1821
	movl	%r15d, %esi
	movdqa	.LC14(%rip), %xmm4
	addq	%rdi, %rdx
	xorl	%ecx, %ecx
	shrl	$4, %esi
	movdqa	.LC15(%rip), %xmm3
	movq	%rbx, %r8
	salq	$4, %rsi
	.p2align 4,,10
	.p2align 3
.L1634:
	movdqu	(%rax,%rcx), %xmm0
	movdqu	(%rdx,%rcx), %xmm5
	movdqu	(%r8,%rcx), %xmm1
	movdqu	(%rdx,%rcx), %xmm2
	pand	%xmm5, %xmm0
	pand	%xmm4, %xmm0
	psrlw	$1, %xmm2
	paddb	%xmm0, %xmm1
	movdqu	(%rax,%rcx), %xmm0
	pand	%xmm3, %xmm2
	psrlw	$1, %xmm0
	pand	%xmm3, %xmm0
	paddb	%xmm2, %xmm0
	paddb	%xmm1, %xmm0
	movups	%xmm0, (%rdi,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %rsi
	jne	.L1634
	movl	%r15d, %r8d
	andl	$-16, %r8d
	testb	$15, %r15b
	je	.L1599
	movl	8(%rsp), %ebx
	movl	%r8d, %edx
	movl	%r8d, %ecx
	movq	96(%rsp), %r11
	movzbl	(%rax,%rcx), %esi
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	1(%r8), %edx
	cmpl	%edx, %r15d
	jle	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	2(%r8), %edx
	cmpl	%edx, %r15d
	jle	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	3(%r8), %edx
	cmpl	%edx, %r15d
	jle	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	4(%r8), %edx
	cmpl	%edx, %r15d
	jle	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	5(%r8), %edx
	cmpl	%edx, %r15d
	jle	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	6(%r8), %edx
	cmpl	%edx, %r15d
	jle	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	7(%r8), %edx
	cmpl	%r15d, %edx
	jge	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	8(%r8), %edx
	cmpl	%r15d, %edx
	jge	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	9(%r8), %edx
	cmpl	%edx, %r15d
	jle	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	10(%r8), %edx
	cmpl	%r15d, %edx
	jge	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	11(%r8), %edx
	cmpl	%edx, %r15d
	jle	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	12(%r8), %edx
	cmpl	%edx, %r15d
	jle	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	13(%r8), %edx
	cmpl	%edx, %r15d
	jle	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %esi
	movzbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	sarl	%edx
	addb	(%r11,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	14(%r8), %edx
	cmpl	%edx, %r15d
	jle	.L1599
	movslq	%edx, %rcx
	subl	%ebx, %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rcx), %eax
	movzbl	(%rdi,%rdx), %edx
	addl	%edx, %eax
	sarl	%eax
	addb	(%r11,%rcx), %al
	movb	%al, (%rdi,%rcx)
	jmp	.L1599
	.p2align 4,,10
	.p2align 3
.L1605:
	testl	%r15d, %r15d
	jle	.L1599
	leal	-1(%r15), %edx
	movl	%r15d, %esi
	cmpl	$6, %edx
	jbe	.L1818
	movq	96(%rsp), %rbx
	movq	%rdi, %rcx
	leaq	1(%rbx), %r8
	subq	%r8, %rcx
	cmpq	$14, %rcx
	jbe	.L1818
	leaq	1(%rax), %r8
	movq	%rdi, %rcx
	subq	%r8, %rcx
	cmpq	$14, %rcx
	jbe	.L1818
	cmpl	$14, %edx
	jbe	.L1819
	movl	%r15d, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rsi
	shrl	$4, %ecx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L1626:
	movdqu	(%rsi,%rdx), %xmm0
	movdqu	(%rax,%rdx), %xmm5
	paddb	%xmm5, %xmm0
	movups	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %rcx
	jne	.L1626
	movl	%r15d, %edx
	andl	$-16, %edx
	movl	%edx, %ecx
	cmpl	%edx, %r15d
	je	.L1599
	movl	%r15d, %esi
	subl	%edx, %esi
	leal	-1(%rsi), %r8d
	cmpl	$6, %r8d
	jbe	.L1629
.L1625:
	movq	96(%rsp), %rbx
	movq	(%rax,%rcx), %xmm1
	movq	(%rbx,%rcx), %xmm0
	paddb	%xmm1, %xmm0
	movq	%xmm0, (%rdi,%rcx)
	movl	%esi, %ecx
	andl	$-8, %ecx
	addl	%ecx, %edx
	andl	$7, %esi
	je	.L1599
.L1629:
	movq	96(%rsp), %rbx
	movslq	%edx, %rcx
	movzbl	(%rax,%rcx), %esi
	addb	(%rbx,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	leal	1(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1599
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %esi
	addb	(%rbx,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	leal	2(%rdx), %ecx
	cmpl	%ecx, %r15d
	jle	.L1599
	movslq	%ecx, %rcx
	movzbl	(%rbx,%rcx), %esi
	addb	(%rax,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	leal	3(%rdx), %ecx
	cmpl	%r15d, %ecx
	jge	.L1599
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %esi
	addb	(%rbx,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	leal	4(%rdx), %ecx
	cmpl	%r15d, %ecx
	jge	.L1599
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %esi
	addb	(%rbx,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	leal	5(%rdx), %ecx
	cmpl	%r15d, %ecx
	jge	.L1599
	movslq	%ecx, %rcx
	addl	$6, %edx
	movzbl	(%rbx,%rcx), %esi
	addb	(%rax,%rcx), %sil
	movb	%sil, (%rdi,%rcx)
	cmpl	%edx, %r15d
	jle	.L1599
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %eax
	addb	(%rbx,%rdx), %al
	movb	%al, (%rdi,%rdx)
	jmp	.L1599
.L1606:
	testl	%r15d, %r15d
	jle	.L1599
	leal	-1(%r15), %ecx
	movl	%r15d, %edx
	cmpl	$6, %ecx
	jbe	.L1815
	movl	8(%rsp), %eax
	negl	%eax
	cltq
	movq	%rax, %rsi
	notq	%rsi
	cmpq	$14, %rsi
	jbe	.L1815
	movq	96(%rsp), %rbx
	movq	%rdi, %rsi
	leaq	1(%rbx), %r8
	subq	%r8, %rsi
	cmpq	$14, %rsi
	jbe	.L1815
	cmpl	$14, %ecx
	jbe	.L1816
	movl	%r15d, %ecx
	addq	%rdi, %rax
	xorl	%edx, %edx
	movq	%rbx, %rsi
	shrl	$4, %ecx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L1617:
	movdqu	(%rsi,%rdx), %xmm0
	movdqu	(%rax,%rdx), %xmm5
	paddb	%xmm5, %xmm0
	movups	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %rcx
	jne	.L1617
	movl	%r15d, %r8d
	andl	$-16, %r8d
	movl	%r8d, %ecx
	cmpl	%r8d, %r15d
	je	.L1599
	movl	%r15d, %edx
	subl	%r8d, %edx
	leal	-1(%rdx), %esi
	cmpl	$6, %esi
	jbe	.L1620
.L1616:
	movq	(%rax,%rcx), %xmm0
	movq	96(%rsp), %rax
	movq	(%rax,%rcx), %xmm1
	movl	%edx, %eax
	andl	$-8, %eax
	paddb	%xmm1, %xmm0
	addl	%eax, %r8d
	andl	$7, %edx
	movq	%xmm0, (%rdi,%rcx)
	je	.L1599
.L1620:
	movl	8(%rsp), %ebx
	movl	%r8d, %eax
	movq	96(%rsp), %rsi
	movslq	%r8d, %rdx
	subl	%ebx, %eax
	movzbl	(%rsi,%rdx), %ecx
	cltq
	addb	(%rdi,%rax), %cl
	leal	1(%r8), %eax
	movb	%cl, (%rdi,%rdx)
	cmpl	%r15d, %eax
	jge	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rdx), %ecx
	addb	(%rdi,%rax), %cl
	leal	2(%r8), %eax
	movb	%cl, (%rdi,%rdx)
	cmpl	%r15d, %eax
	jge	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rdx), %ecx
	addb	(%rdi,%rax), %cl
	leal	3(%r8), %eax
	movb	%cl, (%rdi,%rdx)
	cmpl	%r15d, %eax
	jge	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rdx), %ecx
	addb	(%rdi,%rax), %cl
	leal	4(%r8), %eax
	movb	%cl, (%rdi,%rdx)
	cmpl	%r15d, %eax
	jl	.L2118
	jmp	.L1599
	.p2align 4,,10
	.p2align 3
.L1607:
	movq	96(%rsp), %rsi
	movq	%r13, %rdx
	call	memcpy@PLT
	.p2align 4,,10
	.p2align 3
.L1599:
	addq	%r13, 96(%rsp)
.L1663:
	movl	108(%rsp), %eax
	movl	176(%rsp), %edi
	addl	%edi, 144(%rsp)
	addl	$1, %eax
	cmpl	%eax, 192(%rsp)
	je	.L1754
	movq	184(%rsp), %rdi
	movl	%eax, 108(%rsp)
	movq	24(%rdi), %rdi
	jmp	.L1755
.L1600:
	testl	%r15d, %r15d
	jle	.L1599
	leal	-1(%r15), %ecx
	movl	%r15d, %edx
	cmpl	$6, %ecx
	jbe	.L1829
	movl	8(%rsp), %eax
	negl	%eax
	cltq
	movq	%rax, %rsi
	notq	%rsi
	cmpq	$14, %rsi
	jbe	.L1829
	movq	96(%rsp), %rbx
	movq	%rdi, %rsi
	leaq	1(%rbx), %r8
	subq	%r8, %rsi
	cmpq	$14, %rsi
	jbe	.L1829
	cmpl	$14, %ecx
	jbe	.L1830
	movl	%r15d, %ecx
	addq	%rdi, %rax
	xorl	%edx, %edx
	movq	%rbx, %rsi
	shrl	$4, %ecx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L1656:
	movdqu	(%rsi,%rdx), %xmm0
	movdqu	(%rax,%rdx), %xmm5
	paddb	%xmm5, %xmm0
	movups	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%rcx, %rdx
	jne	.L1656
	movl	%r15d, %r8d
	andl	$-16, %r8d
	movl	%r8d, %ecx
	cmpl	%r8d, %r15d
	je	.L1599
	movl	%r15d, %edx
	subl	%r8d, %edx
	leal	-1(%rdx), %esi
	cmpl	$6, %esi
	jbe	.L1659
.L1655:
	movq	(%rax,%rcx), %xmm0
	movq	96(%rsp), %rax
	movq	(%rax,%rcx), %xmm1
	movl	%edx, %eax
	andl	$-8, %eax
	paddb	%xmm1, %xmm0
	addl	%eax, %r8d
	andl	$7, %edx
	movq	%xmm0, (%rdi,%rcx)
	je	.L1599
.L1659:
	movl	8(%rsp), %ebx
	movl	%r8d, %eax
	movq	96(%rsp), %rsi
	movslq	%r8d, %rdx
	subl	%ebx, %eax
	movzbl	(%rsi,%rdx), %ecx
	cltq
	addb	(%rdi,%rax), %cl
	leal	1(%r8), %eax
	movb	%cl, (%rdi,%rdx)
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rdx), %ecx
	addb	(%rdi,%rax), %cl
	leal	2(%r8), %eax
	movb	%cl, (%rdi,%rdx)
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rdx), %ecx
	addb	(%rdi,%rax), %cl
	leal	3(%r8), %eax
	movb	%cl, (%rdi,%rdx)
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rdx), %ecx
	addb	(%rdi,%rax), %cl
	leal	4(%r8), %eax
	movb	%cl, (%rdi,%rdx)
	cmpl	%eax, %r15d
	jle	.L1599
.L2118:
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rdx), %ecx
	addb	(%rdi,%rax), %cl
	leal	5(%r8), %eax
	movb	%cl, (%rdi,%rdx)
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rdx), %ecx
	addb	(%rdi,%rax), %cl
	leal	6(%r8), %eax
	movb	%cl, (%rdi,%rdx)
	cmpl	%eax, %r15d
	jle	.L1599
	movslq	%eax, %rdx
	subl	%ebx, %eax
	cltq
	movzbl	(%rsi,%rdx), %ecx
	addb	(%rdi,%rax), %cl
	movb	%cl, (%rdi,%rdx)
	jmp	.L1599
.L1827:
	movl	8(%rsp), %ecx
	movq	96(%rsp), %rsi
	xorl	%eax, %eax
	negl	%ecx
	movslq	%ecx, %rcx
	addq	%rdi, %rcx
	.p2align 4,,10
	.p2align 3
.L1652:
	movzbl	(%rcx,%rax), %edx
	shrb	%dl
	addb	(%rsi,%rax), %dl
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rax, %r13
	jne	.L1652
	jmp	.L1599
.L1821:
	movl	8(%rsp), %r8d
	movq	96(%rsp), %r9
	xorl	%ecx, %ecx
	negl	%r8d
	movslq	%r8d, %r8
	addq	%rdi, %r8
	.p2align 4,,10
	.p2align 3
.L1637:
	movzbl	(%r8,%rcx), %edx
	movzbl	(%rax,%rcx), %esi
	addl	%esi, %edx
	sarl	%edx
	addb	(%r9,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	addq	$1, %rcx
	cmpq	%r13, %rcx
	jne	.L1637
	jmp	.L1599
.L1818:
	movq	96(%rsp), %rsi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1631:
	movzbl	(%rax,%rdx), %ecx
	addb	(%rsi,%rdx), %cl
	movb	%cl, (%rdi,%rdx)
	addq	$1, %rdx
	cmpq	%rdx, %r13
	jne	.L1631
	jmp	.L1599
.L1815:
	movl	8(%rsp), %ecx
	movq	96(%rsp), %rsi
	xorl	%eax, %eax
	negl	%ecx
	movslq	%ecx, %rcx
	addq	%rdi, %rcx
	.p2align 4,,10
	.p2align 3
.L1622:
	movzbl	(%rsi,%rax), %edx
	addb	(%rcx,%rax), %dl
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rax, %r13
	jne	.L1622
	jmp	.L1599
.L1823:
	movl	8(%rsp), %r12d
	movl	%r14d, 32(%rsp)
	xorl	%ecx, %ecx
	negl	%r12d
	movslq	%r12d, %r12
	leaq	(%rdi,%r12), %rbx
	leaq	(%rax,%r12), %r15
	movq	%rbx, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L1647:
	movq	16(%rsp), %rsi
	movzbl	(%rax,%rcx), %r8d
	movzbl	(%r15,%rcx), %r9d
	movq	96(%rsp), %rbx
	movzbl	(%rsi,%rcx), %r10d
	movzbl	(%rbx,%rcx), %r12d
	movl	%r8d, %ebx
	movl	%r9d, %r11d
	leal	(%r10,%r8), %edx
	movl	%r10d, %esi
	subl	%r9d, %edx
	movl	%edx, %r14d
	subl	%r8d, %r14d
	movl	%r14d, %r8d
	negl	%r8d
	cmovs	%r14d, %r8d
	movl	%edx, %r14d
	subl	%r9d, %r14d
	movl	%r14d, %r9d
	negl	%r9d
	cmovs	%r14d, %r9d
	movl	%r8d, %r14d
	cmpl	%r8d, %r9d
	cmovle	%r9d, %r14d
	subl	%r10d, %edx
	movl	%edx, %r10d
	negl	%r10d
	cmovs	%edx, %r10d
	cmpl	%r10d, %r14d
	jge	.L1646
	cmpl	%r8d, %r9d
	movl	%r11d, %esi
	cmovge	%ebx, %esi
.L1646:
	addl	%r12d, %esi
	movb	%sil, (%rdi,%rcx)
	addq	$1, %rcx
	cmpq	%rcx, %r13
	jne	.L1647
	movl	32(%rsp), %r14d
	jmp	.L1599
.L1829:
	movl	8(%rsp), %ecx
	movq	96(%rsp), %rsi
	xorl	%eax, %eax
	negl	%ecx
	movslq	%ecx, %rcx
	addq	%rdi, %rcx
	.p2align 4,,10
	.p2align 3
.L1661:
	movzbl	(%rsi,%rax), %edx
	addb	(%rcx,%rax), %dl
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rax, %r13
	jne	.L1661
	jmp	.L1599
	.p2align 4,,10
	.p2align 3
.L1579:
	movl	176(%rsp), %ecx
	movl	108(%rsp), %r12d
	movq	%rdi, %rax
	subq	%rcx, %rax
	testl	%r12d, %r12d
	jne	.L1581
	leaq	first_row_filter(%rip), %rbx
	movzbl	(%rbx,%rdx), %edx
.L1581:
	movl	8(%rsp), %ebx
	testl	%ebx, %ebx
	jg	.L1580
	cmpl	$8, 544(%rsp)
	jne	.L1593
	.p2align 4,,10
	.p2align 3
.L2124:
	movslq	240(%rsp), %rcx
	cmpl	%ecx, 180(%rsp)
	je	.L1594
	movb	$-1, (%rdi,%rcx)
.L1594:
	leaq	(%r11,%rcx), %rbx
	movslq	180(%rsp), %rcx
	movq	%rbx, 96(%rsp)
	addq	%rcx, %rdi
	addq	%rcx, %rax
	cmpb	$0, 208(%rsp)
	jne	.L2126
.L1598:
	movl	180(%rsp), %esi
	cmpl	%esi, 252(%rsp)
	jne	.L2127
	cmpl	$6, %edx
	ja	.L1665
	leaq	.L1667(%rip), %rsi
	movl	%edx, %ecx
	movslq	(%rsi,%rcx,4), %rcx
	addq	%rsi, %rcx
	jmp	*%rcx
	.section	.rodata
	.align 4
	.align 4
.L1667:
	.long	.L1673-.L1667
	.long	.L1672-.L1667
	.long	.L1671-.L1667
	.long	.L1670-.L1667
	.long	.L1669-.L1667
	.long	.L1668-.L1667
	.long	.L1666-.L1667
	.text
.L1668:
	movl	160(%rsp), %eax
	subl	$1, %eax
	movl	%eax, 232(%rsp)
	movl	%eax, %r9d
	je	.L1674
	movslq	8(%rsp), %r8
	movl	%r14d, %eax
	movslq	%r14d, %r12
	negl	%eax
	movl	%r8d, %r11d
	movslq	%eax, %rdx
	leal	-1(%r8), %r13d
	movl	%r8d, %r10d
	andl	$-16, %r11d
	addq	%rdx, %rdi
	notq	%rdx
	shrl	$4, %r10d
	movl	%r11d, %eax
	salq	$4, %r10
	movslq	%r11d, %rbx
	subl	%r14d, %eax
	cltq
	movq	%rax, 64(%rsp)
	leal	1(%r11), %eax
	movslq	%eax, %rcx
	movl	%eax, 48(%rsp)
	subl	%r14d, %eax
	cltq
	movq	%rcx, 112(%rsp)
	movq	%rax, 128(%rsp)
	leal	2(%r11), %eax
	movslq	%eax, %rcx
	movl	%eax, 80(%rsp)
	subl	%r14d, %eax
	cltq
	movq	%rcx, 224(%rsp)
	movq	%rax, 256(%rsp)
	leal	3(%r11), %eax
	movslq	%eax, %rcx
	movl	%eax, 216(%rsp)
	subl	%r14d, %eax
	cltq
	movq	%rcx, 272(%rsp)
	movq	%rax, 280(%rsp)
	leal	4(%r11), %eax
	movslq	%eax, %rcx
	movl	%eax, 264(%rsp)
	subl	%r14d, %eax
	cltq
	movq	%rcx, 296(%rsp)
	movq	%rax, 304(%rsp)
	leal	5(%r11), %eax
	movslq	%eax, %rcx
	movl	%eax, 288(%rsp)
	subl	%r14d, %eax
	cltq
	movq	%rcx, 320(%rsp)
	movq	%rax, 328(%rsp)
	leal	6(%r11), %eax
	movslq	%eax, %rcx
	movl	%eax, 312(%rsp)
	subl	%r14d, %eax
	cltq
	movq	%rcx, 344(%rsp)
	movq	%rax, 352(%rsp)
	leal	7(%r11), %eax
	movslq	%eax, %rcx
	movl	%eax, 336(%rsp)
	subl	%r14d, %eax
	cltq
	movq	%rcx, 368(%rsp)
	movq	%rax, 376(%rsp)
	leal	8(%r11), %eax
	movslq	%eax, %rcx
	movl	%eax, 360(%rsp)
	subl	%r14d, %eax
	cltq
	movq	%rcx, 392(%rsp)
	movq	%rax, 400(%rsp)
	leal	9(%r11), %eax
	movslq	%eax, %rcx
	movl	%eax, 384(%rsp)
	subl	%r14d, %eax
	cltq
	movq	%rcx, 416(%rsp)
	movq	%rax, 424(%rsp)
	leal	10(%r11), %eax
	movslq	%eax, %rcx
	movl	%eax, 408(%rsp)
	subl	%r14d, %eax
	cltq
	movq	%rcx, 432(%rsp)
	movq	%rax, 440(%rsp)
	leal	11(%r11), %eax
	movl	%eax, 448(%rsp)
	movq	96(%rsp), %rcx
	movq	%rdx, 16(%rsp)
	movdqa	.LC15(%rip), %xmm1
	movq	%r15, 456(%rsp)
	movl	%r8d, %r15d
	.p2align 4,,10
	.p2align 3
.L1732:
	movq	%rdi, %rsi
	addq	%r12, %rdi
	testl	%r15d, %r15d
	jle	.L1739
	cmpl	$14, %r13d
	jbe	.L1850
	cmpq	$14, 16(%rsp)
	jbe	.L1850
	leaq	1(%rcx), %rdx
	movq	%rdi, %rax
	subq	%rdx, %rax
	cmpq	$14, %rax
	jbe	.L1850
	addq	$0, %rsi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1734:
	movdqu	(%rsi,%rax), %xmm0
	movdqu	(%rcx,%rax), %xmm5
	psrlw	$1, %xmm0
	pand	%xmm1, %xmm0
	paddb	%xmm5, %xmm0
	movups	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpq	%r10, %rax
	jne	.L1734
	cmpl	%r11d, %r15d
	je	.L1739
	movq	64(%rsp), %rax
	movzbl	(%rdi,%rax), %eax
	movb	%al, 32(%rsp)
	shrb	%al
	addb	(%rcx,%rbx), %al
	movb	%al, (%rdi,%rbx)
	movl	48(%rsp), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movq	128(%rsp), %rax
	movq	112(%rsp), %rsi
	movzbl	(%rdi,%rax), %eax
	movb	%al, 32(%rsp)
	shrb	%al
	addb	(%rcx,%rsi), %al
	movb	%al, (%rdi,%rsi)
	movl	80(%rsp), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movq	256(%rsp), %rax
	movq	224(%rsp), %rsi
	movzbl	(%rdi,%rax), %eax
	movb	%al, 32(%rsp)
	shrb	%al
	addb	(%rcx,%rsi), %al
	movb	%al, (%rdi,%rsi)
	movl	216(%rsp), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movq	280(%rsp), %rax
	movq	272(%rsp), %rsi
	movzbl	(%rdi,%rax), %eax
	movb	%al, 32(%rsp)
	shrb	%al
	addb	(%rcx,%rsi), %al
	movb	%al, (%rdi,%rsi)
	movl	264(%rsp), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movq	304(%rsp), %rax
	movq	296(%rsp), %rsi
	movzbl	(%rdi,%rax), %eax
	movb	%al, 32(%rsp)
	shrb	%al
	addb	(%rcx,%rsi), %al
	movb	%al, (%rdi,%rsi)
	movl	288(%rsp), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movq	328(%rsp), %rax
	movq	320(%rsp), %rsi
	movzbl	(%rdi,%rax), %eax
	movb	%al, 32(%rsp)
	shrb	%al
	addb	(%rcx,%rsi), %al
	movb	%al, (%rdi,%rsi)
	movl	312(%rsp), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movq	352(%rsp), %rax
	movq	344(%rsp), %rsi
	movzbl	(%rdi,%rax), %eax
	movb	%al, 32(%rsp)
	shrb	%al
	addb	(%rcx,%rsi), %al
	movb	%al, (%rdi,%rsi)
	movl	336(%rsp), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movq	376(%rsp), %rax
	movq	368(%rsp), %rsi
	movzbl	(%rdi,%rax), %eax
	movb	%al, 32(%rsp)
	shrb	%al
	addb	(%rcx,%rsi), %al
	movb	%al, (%rdi,%rsi)
	movl	360(%rsp), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movq	400(%rsp), %rax
	movq	392(%rsp), %rsi
	movzbl	(%rdi,%rax), %eax
	movb	%al, 32(%rsp)
	shrb	%al
	addb	(%rcx,%rsi), %al
	movb	%al, (%rdi,%rsi)
	movl	384(%rsp), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movq	424(%rsp), %rax
	movq	416(%rsp), %rsi
	movzbl	(%rdi,%rax), %eax
	movb	%al, 32(%rsp)
	shrb	%al
	addb	(%rcx,%rsi), %al
	movb	%al, (%rdi,%rsi)
	movl	408(%rsp), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movq	440(%rsp), %rax
	movq	432(%rsp), %rsi
	movzbl	(%rdi,%rax), %eax
	movb	%al, 32(%rsp)
	shrb	%al
	addb	(%rcx,%rsi), %al
	movb	%al, (%rdi,%rsi)
	movl	448(%rsp), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movslq	%eax, %rdx
	subl	%r14d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rcx,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	12(%r11), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movslq	%eax, %rdx
	subl	%r14d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rcx,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	13(%r11), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movslq	%eax, %rdx
	subl	%r14d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rcx,%rdx), %al
	movb	%al, (%rdi,%rdx)
	leal	14(%r11), %eax
	cmpl	%eax, %r15d
	jle	.L1739
	movslq	%eax, %rdx
	subl	%r14d, %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	shrb	%al
	addb	(%rcx,%rdx), %al
	movb	%al, (%rdi,%rdx)
	.p2align 4,,10
	.p2align 3
.L1739:
	movb	$-1, (%rdi,%r8)
	addq	%r8, %rcx
	subl	$1, %r9d
	jne	.L1732
	movl	232(%rsp), %eax
	movq	456(%rsp), %r15
	imulq	%r8, %rax
	addq	%rax, 96(%rsp)
	cmpl	$16, 544(%rsp)
	jne	.L1663
.L2128:
	movq	184(%rsp), %rax
	movl	160(%rsp), %r9d
	addq	24(%rax), %r15
	testl	%r9d, %r9d
	je	.L1663
.L1752:
	movslq	8(%rsp), %rax
	movl	160(%rsp), %esi
	movslq	%r14d, %rdx
	leaq	1(%r15,%rax), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1753:
	addl	$1, %eax
	movb	$-1, (%rcx)
	addq	%rdx, %rcx
	cmpl	%esi, %eax
	jb	.L1753
	jmp	.L1663
.L1669:
	movl	160(%rsp), %ebx
	subl	$1, %ebx
	movl	%ebx, 232(%rsp)
	movl	%ebx, %r12d
	je	.L1674
	movslq	8(%rsp), %rbx
	movl	%r14d, %edx
	movslq	%r14d, %r8
	movq	96(%rsp), %r13
	negl	%edx
	pxor	%xmm14, %xmm14
	pxor	%xmm13, %xmm13
	movq	%r15, 304(%rsp)
	movq	%rbx, %rsi
	movq	%rbx, 112(%rsp)
	movslq	%edx, %rbx
	leal	-1(%rsi), %ecx
	leaq	(%rax,%rbx), %r9
	movq	%rbx, 280(%rsp)
	movl	%ecx, 256(%rsp)
	movl	%esi, %ecx
	andl	$-16, %esi
	leaq	(%rdi,%rbx), %r10
	movl	%esi, 264(%rsp)
	shrl	$4, %ecx
	movslq	%esi, %rsi
	movq	%r9, %rdx
	salq	$4, %rcx
	movq	%rsi, 296(%rsp)
	movq	%rbx, %rsi
	movq	%rcx, %r11
	notq	%rsi
	movq	%r8, %rcx
	movq	%r9, 128(%rsp)
	movq	%r10, 224(%rsp)
	movq	%r10, 64(%rsp)
	movq	%r9, 216(%rsp)
	movq	%rsi, 272(%rsp)
	movl	%r14d, 312(%rsp)
	movq	%r11, 288(%rsp)
	.p2align 4,,10
	.p2align 3
.L1720:
	movl	8(%rsp), %r10d
	testl	%r10d, %r10d
	jle	.L1729
	cmpl	$14, 256(%rsp)
	jbe	.L1846
	leaq	1(%rdx), %r8
	movq	%rdi, %rsi
	leaq	1(%rax), %r9
	subq	%r8, %rsi
	cmpq	$14, %rsi
	seta	%sil
	cmpq	$14, 272(%rsp)
	seta	%r8b
	andl	%r8d, %esi
	movq	%rdi, %r8
	subq	%r9, %r8
	cmpq	$14, %r8
	seta	%r8b
	testb	%r8b, %sil
	je	.L1846
	leaq	1(%r13), %r8
	movq	%rdi, %rsi
	subq	%r8, %rsi
	cmpq	$14, %rsi
	jbe	.L1846
	movq	280(%rsp), %rbx
	movq	288(%rsp), %r10
	xorl	%esi, %esi
	leaq	(%rdi,%rbx), %r8
.L1722:
	movdqu	(%rdx,%rsi), %xmm0
	pxor	%xmm7, %xmm7
	movdqu	(%rdx,%rsi), %xmm1
	movdqu	(%rax,%rsi), %xmm4
	movdqa	%xmm7, %xmm6
	punpckhbw	%xmm7, %xmm0
	punpcklbw	%xmm7, %xmm1
	movdqa	%xmm6, %xmm3
	movdqa	%xmm0, %xmm5
	punpckhbw	%xmm7, %xmm4
	movdqa	%xmm1, %xmm9
	punpckhwd	%xmm14, %xmm5
	punpcklwd	%xmm14, %xmm9
	movdqa	%xmm0, %xmm8
	movaps	%xmm5, 48(%rsp)
	movdqu	(%rax,%rsi), %xmm5
	punpcklwd	%xmm14, %xmm8
	punpckhwd	%xmm14, %xmm1
	movaps	%xmm8, 32(%rsp)
	movdqa	%xmm4, %xmm10
	punpckhwd	%xmm14, %xmm4
	punpcklbw	%xmm7, %xmm5
	movdqu	(%r8,%rsi), %xmm7
	movaps	%xmm1, 16(%rsp)
	punpcklwd	%xmm14, %xmm10
	movdqa	%xmm5, %xmm11
	punpckhwd	%xmm14, %xmm5
	punpcklbw	%xmm6, %xmm7
	movdqu	(%r8,%rsi), %xmm6
	punpcklwd	%xmm14, %xmm11
	movdqa	%xmm7, %xmm15
	punpckhwd	%xmm14, %xmm7
	punpcklwd	%xmm14, %xmm15
	punpckhbw	%xmm3, %xmm6
	movdqa	%xmm7, %xmm2
	movdqa	%xmm15, %xmm3
	paddd	%xmm5, %xmm2
	psubd	16(%rsp), %xmm2
	paddd	%xmm11, %xmm3
	movdqa	%xmm6, %xmm12
	punpckhwd	%xmm14, %xmm6
	psubd	%xmm9, %xmm3
	punpcklwd	%xmm14, %xmm12
	movdqa	%xmm6, %xmm0
	movdqa	%xmm3, %xmm8
	movdqa	%xmm12, %xmm1
	paddd	%xmm4, %xmm0
	psubd	%xmm15, %xmm8
	paddd	%xmm10, %xmm1
	movdqa	%xmm8, %xmm15
	psubd	32(%rsp), %xmm1
	psubd	48(%rsp), %xmm0
	psrad	$31, %xmm15
	pxor	%xmm15, %xmm8
	psubd	%xmm15, %xmm8
	movdqa	%xmm2, %xmm15
	psubd	%xmm7, %xmm15
	movaps	%xmm8, 80(%rsp)
	movdqa	%xmm15, %xmm7
	movdqa	%xmm15, %xmm8
	psrad	$31, %xmm7
	pxor	%xmm7, %xmm8
	movdqa	%xmm8, %xmm15
	psubd	%xmm7, %xmm15
	movdqa	%xmm1, %xmm7
	psubd	%xmm12, %xmm7
	movdqa	%xmm7, %xmm12
	psrad	$31, %xmm12
	pxor	%xmm12, %xmm7
	psubd	%xmm12, %xmm7
	movdqa	%xmm7, %xmm12
	movdqa	%xmm0, %xmm7
	psubd	%xmm6, %xmm7
	movdqa	%xmm7, %xmm6
	psrad	$31, %xmm6
	pxor	%xmm6, %xmm7
	psubd	%xmm6, %xmm7
	movdqa	%xmm3, %xmm6
	psubd	%xmm9, %xmm3
	psubd	%xmm11, %xmm6
	movdqa	%xmm6, %xmm11
	psrad	$31, %xmm11
	pxor	%xmm11, %xmm6
	psubd	%xmm11, %xmm6
	movdqa	%xmm2, %xmm11
	psubd	16(%rsp), %xmm2
	psubd	%xmm5, %xmm11
	movdqa	%xmm11, %xmm5
	movdqa	%xmm11, %xmm8
	psrad	$31, %xmm5
	pxor	%xmm5, %xmm8
	psubd	%xmm5, %xmm8
	movdqa	%xmm1, %xmm5
	psubd	32(%rsp), %xmm1
	psubd	%xmm10, %xmm5
	movdqa	%xmm5, %xmm10
	psrad	$31, %xmm10
	pxor	%xmm10, %xmm5
	psubd	%xmm10, %xmm5
	movdqa	%xmm0, %xmm10
	psubd	48(%rsp), %xmm0
	psubd	%xmm4, %xmm10
	movdqa	%xmm10, %xmm4
	psrad	$31, %xmm4
	pxor	%xmm4, %xmm10
	psubd	%xmm4, %xmm10
	movdqa	%xmm3, %xmm4
	psrad	$31, %xmm4
	pxor	%xmm4, %xmm3
	psubd	%xmm4, %xmm3
	movdqa	%xmm2, %xmm4
	psrad	$31, %xmm4
	pxor	%xmm4, %xmm2
	psubd	%xmm4, %xmm2
	movdqa	%xmm1, %xmm4
	psrad	$31, %xmm4
	pxor	%xmm4, %xmm1
	psubd	%xmm4, %xmm1
	movdqa	%xmm0, %xmm4
	psrad	$31, %xmm4
	pxor	%xmm4, %xmm0
	psubd	%xmm4, %xmm0
	movdqa	%xmm6, %xmm4
	pcmpgtd	%xmm3, %xmm4
	movdqa	%xmm4, %xmm9
	pand	%xmm4, %xmm3
	pandn	%xmm6, %xmm9
	por	%xmm9, %xmm3
	movdqa	%xmm8, %xmm9
	pcmpgtd	%xmm2, %xmm9
	movdqa	%xmm9, %xmm6
	pand	%xmm9, %xmm2
	pandn	%xmm8, %xmm6
	por	%xmm6, %xmm2
	movdqa	%xmm5, %xmm6
	pcmpgtd	%xmm1, %xmm6
	movdqa	%xmm6, %xmm11
	pand	%xmm6, %xmm1
	pandn	%xmm5, %xmm11
	movdqa	%xmm10, %xmm5
	pcmpgtd	%xmm0, %xmm5
	por	%xmm11, %xmm1
	movdqa	%xmm5, %xmm11
	pand	%xmm5, %xmm0
	pandn	%xmm10, %xmm11
	movdqa	%xmm5, %xmm10
	movdqa	%xmm11, %xmm8
	pcmpeqd	%xmm13, %xmm10
	movdqa	%xmm9, %xmm11
	por	%xmm0, %xmm8
	movdqa	80(%rsp), %xmm0
	pcmpeqd	%xmm13, %xmm11
	pcmpgtd	%xmm8, %xmm7
	movdqa	%xmm6, %xmm8
	pcmpgtd	%xmm3, %xmm0
	pcmpeqd	%xmm13, %xmm8
	movdqa	%xmm15, %xmm3
	pcmpgtd	%xmm2, %xmm3
	movdqa	%xmm12, %xmm2
	pcmpgtd	%xmm1, %xmm2
	movdqa	%xmm4, %xmm1
	pand	%xmm7, %xmm10
	pcmpeqd	%xmm13, %xmm1
	pand	%xmm0, %xmm4
	pand	%xmm7, %xmm5
	pand	%xmm3, %xmm11
	pcmpeqd	%xmm13, %xmm7
	pand	%xmm3, %xmm9
	pcmpeqd	%xmm13, %xmm3
	pand	%xmm2, %xmm8
	pand	%xmm2, %xmm6
	pand	%xmm0, %xmm1
	pcmpeqd	%xmm13, %xmm0
	pcmpeqd	%xmm13, %xmm2
	movdqa	%xmm0, %xmm12
	punpcklwd	%xmm3, %xmm0
	punpckhwd	%xmm3, %xmm12
	movdqa	%xmm0, %xmm3
	punpckhwd	%xmm12, %xmm3
	punpcklwd	%xmm12, %xmm0
	punpcklwd	%xmm3, %xmm0
	movdqa	%xmm2, %xmm3
	punpcklwd	%xmm7, %xmm2
	punpckhwd	%xmm7, %xmm3
	movdqa	%xmm2, %xmm7
	pand	.LC2(%rip), %xmm0
	punpckhwd	%xmm3, %xmm7
	punpcklwd	%xmm3, %xmm2
	movdqu	(%rdx,%rsi), %xmm3
	punpcklwd	%xmm7, %xmm2
	pand	.LC2(%rip), %xmm2
	packuswb	%xmm2, %xmm0
	movdqu	(%r8,%rsi), %xmm2
	pand	%xmm0, %xmm2
	pandn	%xmm3, %xmm0
	por	%xmm2, %xmm0
	movdqa	%xmm4, %xmm2
	punpcklwd	%xmm9, %xmm4
	punpckhwd	%xmm9, %xmm2
	movdqa	%xmm4, %xmm3
	punpckhwd	%xmm2, %xmm3
	punpcklwd	%xmm2, %xmm4
	movdqa	%xmm6, %xmm2
	punpcklwd	%xmm5, %xmm6
	punpckhwd	%xmm5, %xmm2
	punpcklwd	%xmm3, %xmm4
	movdqa	%xmm6, %xmm3
	punpcklwd	%xmm2, %xmm6
	pand	.LC2(%rip), %xmm4
	punpckhwd	%xmm2, %xmm3
	movdqu	(%rdx,%rsi), %xmm2
	punpcklwd	%xmm3, %xmm6
	pand	.LC2(%rip), %xmm6
	packuswb	%xmm6, %xmm4
	pand	%xmm4, %xmm2
	pandn	%xmm0, %xmm4
	movdqa	%xmm1, %xmm0
	punpcklwd	%xmm11, %xmm1
	punpckhwd	%xmm11, %xmm0
	por	%xmm2, %xmm4
	movdqa	%xmm1, %xmm2
	punpcklwd	%xmm0, %xmm1
	punpckhwd	%xmm0, %xmm2
	movdqa	%xmm8, %xmm0
	punpcklwd	%xmm10, %xmm8
	punpckhwd	%xmm10, %xmm0
	punpcklwd	%xmm2, %xmm1
	movdqa	%xmm8, %xmm2
	punpckhwd	%xmm0, %xmm2
	punpcklwd	%xmm0, %xmm8
	pand	.LC2(%rip), %xmm1
	movdqu	(%rax,%rsi), %xmm0
	punpcklwd	%xmm2, %xmm8
	pand	.LC2(%rip), %xmm8
	packuswb	%xmm8, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm4, %xmm1
	por	%xmm0, %xmm1
	movdqu	0(%r13,%rsi), %xmm0
	paddb	%xmm1, %xmm0
	movups	%xmm0, (%rdi,%rsi)
	addq	$16, %rsi
	cmpq	%r10, %rsi
	jne	.L1722
	movl	264(%rsp), %esi
	cmpl	%esi, 8(%rsp)
	je	.L1729
	movq	%rdx, 16(%rsp)
	movq	296(%rsp), %rsi
	movl	%r12d, 32(%rsp)
	movq	216(%rsp), %r15
	movq	%rcx, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L1725:
	movq	64(%rsp), %rcx
	movzbl	(%rax,%rsi), %r9d
	movzbl	(%r15,%rsi), %r8d
	movzbl	0(%r13,%rsi), %r14d
	movzbl	(%rcx,%rsi), %r11d
	movl	%r9d, %r12d
	movl	%r8d, %ebx
	leal	(%r9,%r11), %edx
	movl	%r11d, %ecx
	subl	%r8d, %edx
	movl	%edx, %r10d
	subl	%r9d, %r10d
	movl	%r10d, %r9d
	negl	%r9d
	cmovs	%r10d, %r9d
	movl	%edx, %r10d
	subl	%r8d, %r10d
	movl	%r10d, %r8d
	negl	%r8d
	cmovs	%r10d, %r8d
	subl	%r11d, %edx
	movl	%edx, %r10d
	negl	%r10d
	cmovns	%r10d, %edx
	cmpl	%r8d, %r9d
	movl	%r8d, %r10d
	cmovle	%r9d, %r10d
	cmpl	%r10d, %edx
	jle	.L1726
	cmpl	%r8d, %r9d
	cmovle	%r12d, %ebx
	movl	%ebx, %ecx
.L1726:
	addl	%r14d, %ecx
	movb	%cl, (%rdi,%rsi)
	addq	$1, %rsi
	cmpl	%esi, 8(%rsp)
	jg	.L1725
.L2103:
	movq	16(%rsp), %rdx
	movl	32(%rsp), %r12d
	movq	48(%rsp), %rcx
.L1729:
	movq	112(%rsp), %rbx
	addq	%rcx, 64(%rsp)
	addq	%rcx, %rax
	addq	%rcx, %rdx
	addq	%rcx, 128(%rsp)
	movb	$-1, (%rdi,%rbx)
	addq	%rbx, %r13
	addq	%rcx, %rdi
	addq	%rcx, 224(%rsp)
	addq	%rcx, 216(%rsp)
	subl	$1, %r12d
	jne	.L1720
	movl	232(%rsp), %eax
	movq	304(%rsp), %r15
	movl	312(%rsp), %r14d
	imulq	%rbx, %rax
	addq	%rax, 96(%rsp)
	jmp	.L1665
.L1670:
	movl	160(%rsp), %ebx
	subl	$1, %ebx
	movl	%ebx, 232(%rsp)
	je	.L1674
	movslq	8(%rsp), %r10
	movl	%r14d, %edx
	movslq	%r14d, %r13
	negl	%edx
	movl	%r10d, %r11d
	movslq	%edx, %rcx
	leal	-1(%r10), %esi
	movl	%r10d, %r12d
	andl	$-16, %r11d
	movl	%esi, 16(%rsp)
	addq	%rcx, %rdi
	notq	%rcx
	movl	%r11d, %edx
	movslq	%r11d, %r8
	shrl	$4, %r12d
	subl	%r14d, %edx
	salq	$4, %r12
	movslq	%edx, %rsi
	movq	%rsi, 112(%rsp)
	leal	1(%r11), %esi
	movslq	%esi, %rdx
	movl	%esi, 80(%rsp)
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movq	%rdx, 440(%rsp)
	movq	%rsi, 216(%rsp)
	leal	2(%r11), %esi
	movslq	%esi, %rdx
	movl	%esi, 128(%rsp)
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movq	%rdx, 256(%rsp)
	movq	%rsi, 264(%rsp)
	leal	3(%r11), %esi
	movslq	%esi, %rdx
	movl	%esi, 224(%rsp)
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movq	%rdx, 280(%rsp)
	movq	%rsi, 288(%rsp)
	leal	4(%r11), %esi
	movslq	%esi, %rdx
	movl	%esi, 272(%rsp)
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movq	%rdx, 304(%rsp)
	movq	%rsi, 312(%rsp)
	leal	5(%r11), %esi
	movslq	%esi, %rdx
	movl	%esi, 296(%rsp)
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movq	%rdx, 328(%rsp)
	movq	%rsi, 336(%rsp)
	leal	6(%r11), %esi
	movslq	%esi, %rdx
	movl	%esi, 320(%rsp)
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movq	%rdx, 352(%rsp)
	movq	%rsi, 360(%rsp)
	leal	7(%r11), %esi
	movslq	%esi, %rdx
	movl	%esi, 344(%rsp)
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movq	%rdx, 376(%rsp)
	movq	%rsi, 384(%rsp)
	leal	8(%r11), %esi
	movslq	%esi, %rdx
	movl	%esi, 368(%rsp)
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movq	%rdx, 400(%rsp)
	movq	%rsi, 408(%rsp)
	leal	9(%r11), %esi
	movslq	%esi, %rdx
	movl	%esi, 392(%rsp)
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movq	%rdx, 424(%rsp)
	movq	%rsi, 432(%rsp)
	leal	10(%r11), %esi
	movl	%esi, 416(%rsp)
	movslq	%esi, %rdx
	subl	%r14d, %esi
	movslq	%esi, %rsi
	movq	%rdx, 448(%rsp)
	movq	%rsi, 456(%rsp)
	leal	11(%r11), %esi
	movdqa	.LC14(%rip), %xmm4
	movq	%rcx, 32(%rsp)
	movdqa	.LC15(%rip), %xmm3
	movl	%esi, 468(%rsp)
	movq	96(%rsp), %rsi
	movl	%r11d, 48(%rsp)
	movq	440(%rsp), %r11
	movq	%r15, 472(%rsp)
	movq	%r8, %r15
	movl	%r14d, 64(%rsp)
	movl	%r10d, %r14d
	.p2align 4,,10
	.p2align 3
.L1711:
	movq	%rdi, %r9
	addq	%r13, %rdi
	testl	%r14d, %r14d
	jle	.L1718
	cmpl	$14, 16(%rsp)
	jbe	.L1844
	cmpq	$14, 32(%rsp)
	leaq	1(%rsi), %r8
	movq	%rdi, %rcx
	seta	%dl
	subq	%r8, %rcx
	cmpq	$14, %rcx
	seta	%cl
	testb	%cl, %dl
	je	.L1844
	leaq	1(%rax), %rcx
	movq	%rdi, %rdx
	subq	%rcx, %rdx
	cmpq	$14, %rdx
	jbe	.L1844
	addq	$0, %r9
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1713:
	movdqu	(%rax,%rdx), %xmm0
	movdqu	(%r9,%rdx), %xmm5
	movdqu	(%rsi,%rdx), %xmm1
	movdqu	(%r9,%rdx), %xmm2
	pand	%xmm5, %xmm0
	pand	%xmm4, %xmm0
	psrlw	$1, %xmm2
	paddb	%xmm0, %xmm1
	movdqu	(%rax,%rdx), %xmm0
	pand	%xmm3, %xmm2
	psrlw	$1, %xmm0
	pand	%xmm3, %xmm0
	paddb	%xmm2, %xmm0
	paddb	%xmm1, %xmm0
	movups	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %r12
	jne	.L1713
	movl	48(%rsp), %r9d
	cmpl	%r9d, %r14d
	je	.L1718
	movq	112(%rsp), %rcx
	movzbl	(%rax,%r15), %edx
	movzbl	(%rdi,%rcx), %ecx
	addl	%ecx, %edx
	sarl	%edx
	addb	(%rsi,%r15), %dl
	movb	%dl, (%rdi,%r15)
	movl	80(%rsp), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movq	216(%rsp), %rcx
	movzbl	(%rax,%r11), %edx
	movzbl	(%rdi,%rcx), %ecx
	addl	%ecx, %edx
	sarl	%edx
	addb	(%rsi,%r11), %dl
	movb	%dl, (%rdi,%r11)
	movl	128(%rsp), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movq	256(%rsp), %r9
	movq	264(%rsp), %rcx
	movzbl	(%rax,%r9), %edx
	movzbl	(%rdi,%rcx), %ecx
	addl	%ecx, %edx
	sarl	%edx
	addb	(%rsi,%r9), %dl
	movb	%dl, (%rdi,%r9)
	movl	224(%rsp), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movq	280(%rsp), %r8
	movq	288(%rsp), %rcx
	movzbl	(%rax,%r8), %edx
	movzbl	(%rdi,%rcx), %ecx
	addl	%ecx, %edx
	sarl	%edx
	addb	(%rsi,%r8), %dl
	movb	%dl, (%rdi,%r8)
	movl	272(%rsp), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movq	304(%rsp), %r8
	movq	312(%rsp), %rcx
	movzbl	(%rax,%r8), %edx
	movzbl	(%rdi,%rcx), %ecx
	addl	%ecx, %edx
	sarl	%edx
	addb	(%rsi,%r8), %dl
	movb	%dl, (%rdi,%r8)
	movl	296(%rsp), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movq	328(%rsp), %r8
	movq	336(%rsp), %rcx
	movzbl	(%rax,%r8), %edx
	movzbl	(%rdi,%rcx), %ecx
	addl	%ecx, %edx
	sarl	%edx
	addb	(%rsi,%r8), %dl
	movb	%dl, (%rdi,%r8)
	movl	320(%rsp), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movq	352(%rsp), %r8
	movq	360(%rsp), %rcx
	movzbl	(%rax,%r8), %edx
	movzbl	(%rdi,%rcx), %ecx
	addl	%ecx, %edx
	sarl	%edx
	addb	(%rsi,%r8), %dl
	movb	%dl, (%rdi,%r8)
	movl	344(%rsp), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movq	376(%rsp), %r8
	movq	384(%rsp), %rcx
	movzbl	(%rax,%r8), %edx
	movzbl	(%rdi,%rcx), %ecx
	addl	%ecx, %edx
	sarl	%edx
	addb	(%rsi,%r8), %dl
	movb	%dl, (%rdi,%r8)
	movl	368(%rsp), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movq	400(%rsp), %r8
	movq	408(%rsp), %rcx
	movzbl	(%rax,%r8), %edx
	movzbl	(%rdi,%rcx), %ecx
	addl	%ecx, %edx
	sarl	%edx
	addb	(%rsi,%r8), %dl
	movb	%dl, (%rdi,%r8)
	movl	392(%rsp), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movq	424(%rsp), %r8
	movq	432(%rsp), %rcx
	movzbl	(%rax,%r8), %edx
	movzbl	(%rdi,%rcx), %ecx
	addl	%ecx, %edx
	sarl	%edx
	addb	(%rsi,%r8), %dl
	movb	%dl, (%rdi,%r8)
	movl	416(%rsp), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movq	448(%rsp), %r8
	movq	456(%rsp), %rcx
	movzbl	(%rax,%r8), %edx
	movzbl	(%rdi,%rcx), %ecx
	addl	%ecx, %edx
	sarl	%edx
	addb	(%rsi,%r8), %dl
	movb	%dl, (%rdi,%r8)
	movl	468(%rsp), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movl	64(%rsp), %r8d
	movslq	%edx, %rcx
	movl	48(%rsp), %r9d
	subl	%r8d, %edx
	movzbl	(%rax,%rcx), %r8d
	movslq	%edx, %rdx
	movzbl	(%rdi,%rdx), %edx
	addl	%r8d, %edx
	sarl	%edx
	addb	(%rsi,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	12(%r9), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movl	64(%rsp), %r8d
	movslq	%edx, %rcx
	subl	%r8d, %edx
	movzbl	(%rax,%rcx), %r8d
	movslq	%edx, %rdx
	movzbl	(%rdi,%rdx), %edx
	addl	%r8d, %edx
	sarl	%edx
	addb	(%rsi,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	13(%r9), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movl	64(%rsp), %r8d
	movslq	%edx, %rcx
	subl	%r8d, %edx
	movzbl	(%rax,%rcx), %r8d
	movslq	%edx, %rdx
	movzbl	(%rdi,%rdx), %edx
	addl	%r8d, %edx
	sarl	%edx
	addb	(%rsi,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	leal	14(%r9), %edx
	cmpl	%edx, %r14d
	jle	.L1718
	movl	64(%rsp), %r8d
	movslq	%edx, %rcx
	subl	%r8d, %edx
	movzbl	(%rax,%rcx), %r8d
	movslq	%edx, %rdx
	movzbl	(%rdi,%rdx), %edx
	addl	%r8d, %edx
	sarl	%edx
	addb	(%rsi,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	.p2align 4,,10
	.p2align 3
.L1718:
	movb	$-1, (%rdi,%r10)
	addq	%r10, %rsi
	addq	%r13, %rax
	subl	$1, %ebx
	jne	.L1711
	movl	232(%rsp), %eax
	movq	472(%rsp), %r15
	movl	64(%rsp), %r14d
	imulq	%r10, %rax
	addq	%rax, 96(%rsp)
	jmp	.L1665
.L1671:
	movl	160(%rsp), %ebx
	subl	$1, %ebx
	movl	%ebx, 232(%rsp)
	movl	%ebx, %r8d
	je	.L1674
	movslq	8(%rsp), %rcx
	movq	96(%rsp), %rdx
	movq	%r15, 48(%rsp)
	movslq	%r14d, %r10
	movl	%ecx, %ebx
	movl	%ecx, %r9d
	movl	%ecx, %r13d
	movq	%rcx, %r11
	andl	$15, %ebx
	shrl	$4, %r9d
	leal	-1(%rcx), %r12d
	andl	$-16, %r13d
	movl	%ebx, 16(%rsp)
	subl	$1, %ebx
	salq	$4, %r9
	movl	%ebx, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L1699:
	testl	%r11d, %r11d
	jle	.L1709
	cmpl	$6, %r12d
	jbe	.L1840
	leaq	1(%rax), %rbx
	movq	%rdi, %rsi
	subq	%rbx, %rsi
	cmpq	$14, %rsi
	jbe	.L1840
	leaq	1(%rdx), %rbx
	movq	%rdi, %rsi
	subq	%rbx, %rsi
	cmpq	$14, %rsi
	jbe	.L1840
	cmpl	$14, %r12d
	jbe	.L1841
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L1702:
	movdqu	(%rdx,%rsi), %xmm0
	movdqu	(%rax,%rsi), %xmm5
	paddb	%xmm5, %xmm0
	movups	%xmm0, (%rdi,%rsi)
	addq	$16, %rsi
	cmpq	%rsi, %r9
	jne	.L1702
	cmpl	%r13d, %r11d
	je	.L1709
	cmpl	$6, 32(%rsp)
	movl	16(%rsp), %ebx
	jbe	.L1842
	movl	%r13d, %esi
	movl	%r13d, %r15d
.L1701:
	movq	(%rdx,%rsi), %xmm0
	movq	(%rax,%rsi), %xmm1
	paddb	%xmm1, %xmm0
	movq	%xmm0, (%rdi,%rsi)
	movl	%ebx, %esi
	andl	$-8, %esi
	addl	%r15d, %esi
	andl	$7, %ebx
	je	.L1709
.L1704:
	movslq	%esi, %rbx
	movzbl	(%rax,%rbx), %r15d
	addb	(%rdx,%rbx), %r15b
	movb	%r15b, (%rdi,%rbx)
	leal	1(%rsi), %ebx
	cmpl	%ebx, %r11d
	jle	.L1709
	movslq	%ebx, %rbx
	movzbl	(%rax,%rbx), %r15d
	addb	(%rdx,%rbx), %r15b
	movb	%r15b, (%rdi,%rbx)
	leal	2(%rsi), %ebx
	cmpl	%ebx, %r11d
	jle	.L1709
	movslq	%ebx, %rbx
	movzbl	(%rax,%rbx), %r15d
	addb	(%rdx,%rbx), %r15b
	movb	%r15b, (%rdi,%rbx)
	leal	3(%rsi), %ebx
	cmpl	%ebx, %r11d
	jle	.L1709
	movslq	%ebx, %rbx
	movzbl	(%rax,%rbx), %r15d
	addb	(%rdx,%rbx), %r15b
	movb	%r15b, (%rdi,%rbx)
	leal	4(%rsi), %ebx
	cmpl	%ebx, %r11d
	jle	.L1709
	movslq	%ebx, %rbx
	movzbl	(%rax,%rbx), %r15d
	addb	(%rdx,%rbx), %r15b
	movb	%r15b, (%rdi,%rbx)
	leal	5(%rsi), %ebx
	cmpl	%ebx, %r11d
	jle	.L1709
	movslq	%ebx, %rbx
	addl	$6, %esi
	movzbl	(%rax,%rbx), %r15d
	addb	(%rdx,%rbx), %r15b
	movb	%r15b, (%rdi,%rbx)
	cmpl	%esi, %r11d
	jle	.L1709
	movslq	%esi, %rsi
	movzbl	(%rax,%rsi), %ebx
	addb	(%rdx,%rsi), %bl
	movb	%bl, (%rdi,%rsi)
	.p2align 4,,10
	.p2align 3
.L1709:
	movb	$-1, (%rdi,%rcx)
	addq	%rcx, %rdx
	addq	%r10, %rdi
	addq	%r10, %rax
	subl	$1, %r8d
	jne	.L1699
	movq	48(%rsp), %r15
.L2104:
	movl	232(%rsp), %eax
	imulq	%rcx, %rax
	addq	%rax, 96(%rsp)
.L1665:
	cmpl	$16, 544(%rsp)
	jne	.L1663
	jmp	.L2128
.L1672:
	movl	160(%rsp), %eax
	subl	$1, %eax
	movl	%eax, 232(%rsp)
	movl	%eax, %esi
	je	.L1674
	movl	%r14d, %r12d
	movslq	8(%rsp), %rdx
	movq	%r15, 112(%rsp)
	movslq	%r14d, %r13
	negl	%r12d
	movq	96(%rsp), %rax
	movslq	%r12d, %r12
	movl	%edx, %r8d
	movl	%edx, %ebx
	movq	%rdx, %r9
	movq	%r12, %rcx
	movq	%r12, 48(%rsp)
	shrl	$4, %r8d
	addq	%r12, %rdi
	notq	%rcx
	leal	-1(%rdx), %r10d
	salq	$4, %r8
	andl	$-16, %ebx
	movq	%rcx, 32(%rsp)
	movl	%edx, %ecx
	andl	$15, %ecx
	movl	%ecx, 64(%rsp)
	subl	$1, %ecx
	movl	%ecx, 80(%rsp)
	.p2align 4,,10
	.p2align 3
.L1687:
	movq	%rdi, %r12
	addq	%r13, %rdi
	testl	%r9d, %r9d
	jle	.L1697
	cmpl	$6, %r10d
	jbe	.L1836
	cmpq	$14, 32(%rsp)
	jbe	.L1836
	leaq	1(%rax), %r11
	movq	%rdi, %rcx
	subq	%r11, %rcx
	cmpq	$14, %rcx
	jbe	.L1836
	cmpl	$14, %r10d
	jbe	.L1837
	addq	$0, %r12
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L1690:
	movdqu	(%rax,%rcx), %xmm0
	movdqu	(%r12,%rcx), %xmm5
	paddb	%xmm5, %xmm0
	movups	%xmm0, (%rdi,%rcx)
	addq	$16, %rcx
	cmpq	%r8, %rcx
	jne	.L1690
	cmpl	%ebx, %r9d
	je	.L1697
	cmpl	$6, 80(%rsp)
	movl	64(%rsp), %r11d
	jbe	.L1838
	movl	%ebx, 16(%rsp)
	movl	%ebx, %ecx
.L1689:
	movq	48(%rsp), %r15
	leaq	(%rdi,%rcx), %r12
	movq	(%rax,%rcx), %xmm1
	movq	(%r12,%r15), %xmm0
	movl	16(%rsp), %r15d
	paddb	%xmm1, %xmm0
	movq	%xmm0, (%rdi,%rcx)
	movl	%r11d, %ecx
	andl	$-8, %ecx
	addl	%r15d, %ecx
	andl	$7, %r11d
	je	.L1697
.L1692:
	movl	%ecx, %r11d
	movslq	%ecx, %r12
	subl	%r14d, %r11d
	movzbl	(%rax,%r12), %r15d
	movslq	%r11d, %r11
	addb	(%rdi,%r11), %r15b
	leal	1(%rcx), %r11d
	movb	%r15b, (%rdi,%r12)
	cmpl	%r11d, %r9d
	jle	.L1697
	movslq	%r11d, %r12
	subl	%r14d, %r11d
	movslq	%r11d, %r11
	movzbl	(%rax,%r12), %r15d
	addb	(%rdi,%r11), %r15b
	leal	2(%rcx), %r11d
	movb	%r15b, (%rdi,%r12)
	cmpl	%r11d, %r9d
	jle	.L1697
	movslq	%r11d, %r12
	subl	%r14d, %r11d
	movslq	%r11d, %r11
	movzbl	(%rax,%r12), %r15d
	addb	(%rdi,%r11), %r15b
	leal	3(%rcx), %r11d
	movb	%r15b, (%rdi,%r12)
	cmpl	%r11d, %r9d
	jle	.L1697
	movslq	%r11d, %r12
	subl	%r14d, %r11d
	movslq	%r11d, %r11
	movzbl	(%rax,%r12), %r15d
	addb	(%rdi,%r11), %r15b
	leal	4(%rcx), %r11d
	movb	%r15b, (%rdi,%r12)
	cmpl	%r11d, %r9d
	jle	.L1697
	movslq	%r11d, %r12
	subl	%r14d, %r11d
	movslq	%r11d, %r11
	movzbl	(%rax,%r12), %r15d
	addb	(%rdi,%r11), %r15b
	leal	5(%rcx), %r11d
	movb	%r15b, (%rdi,%r12)
	cmpl	%r11d, %r9d
	jle	.L1697
	movslq	%r11d, %r12
	subl	%r14d, %r11d
	addl	$6, %ecx
	movslq	%r11d, %r11
	movzbl	(%rax,%r12), %r15d
	addb	(%rdi,%r11), %r15b
	movb	%r15b, (%rdi,%r12)
	cmpl	%ecx, %r9d
	jle	.L1697
	movslq	%ecx, %r11
	subl	%r14d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%r11), %r12d
	addb	(%rdi,%rcx), %r12b
	movb	%r12b, (%rdi,%r11)
	.p2align 4,,10
	.p2align 3
.L1697:
	movb	$-1, (%rdi,%rdx)
	addq	%rdx, %rax
	subl	$1, %esi
	jne	.L1687
	movl	232(%rsp), %eax
	movq	112(%rsp), %r15
	imulq	%rdx, %rax
	addq	%rax, 96(%rsp)
	jmp	.L1665
.L1666:
	movl	160(%rsp), %eax
	subl	$1, %eax
	movl	%eax, 232(%rsp)
	movl	%eax, %esi
	je	.L1674
	movl	%r14d, %r12d
	movslq	8(%rsp), %rdx
	movq	%r15, 80(%rsp)
	movslq	%r14d, %r13
	negl	%r12d
	movq	96(%rsp), %rax
	movslq	%r12d, %r12
	movl	%edx, %r8d
	movl	%edx, %ebx
	movq	%rdx, %r9
	movq	%r12, %rcx
	movq	%r12, 32(%rsp)
	shrl	$4, %r8d
	addq	%r12, %rdi
	notq	%rcx
	leal	-1(%rdx), %r10d
	salq	$4, %r8
	andl	$-16, %ebx
	movq	%rcx, 16(%rsp)
	movl	%edx, %ecx
	andl	$15, %ecx
	movl	%ecx, 48(%rsp)
	subl	$1, %ecx
	movl	%ecx, 64(%rsp)
	.p2align 4,,10
	.p2align 3
.L1741:
	movq	%rdi, %r12
	addq	%r13, %rdi
	testl	%r9d, %r9d
	jle	.L1751
	cmpl	$6, %r10d
	jbe	.L1852
	cmpq	$14, 16(%rsp)
	jbe	.L1852
	leaq	1(%rax), %r11
	movq	%rdi, %rcx
	subq	%r11, %rcx
	cmpq	$14, %rcx
	jbe	.L1852
	cmpl	$14, %r10d
	jbe	.L1853
	addq	$0, %r12
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L1744:
	movdqu	(%rax,%rcx), %xmm0
	movdqu	(%r12,%rcx), %xmm5
	paddb	%xmm5, %xmm0
	movups	%xmm0, (%rdi,%rcx)
	addq	$16, %rcx
	cmpq	%r8, %rcx
	jne	.L1744
	cmpl	%ebx, %r9d
	je	.L1751
	cmpl	$6, 64(%rsp)
	movl	48(%rsp), %r11d
	jbe	.L1854
	movl	%ebx, %ecx
	movl	%ebx, %r15d
.L1743:
	movq	32(%rsp), %r12
	movq	(%rax,%rcx), %xmm1
	addq	%rdi, %r12
	movq	(%r12,%rcx), %xmm0
	paddb	%xmm1, %xmm0
	movq	%xmm0, (%rdi,%rcx)
	movl	%r11d, %ecx
	andl	$-8, %ecx
	addl	%r15d, %ecx
	andl	$7, %r11d
	je	.L1751
.L1746:
	movl	%ecx, %r11d
	movslq	%ecx, %r12
	subl	%r14d, %r11d
	movzbl	(%rax,%r12), %r15d
	movslq	%r11d, %r11
	addb	(%rdi,%r11), %r15b
	leal	1(%rcx), %r11d
	movb	%r15b, (%rdi,%r12)
	cmpl	%r11d, %r9d
	jle	.L1751
	movslq	%r11d, %r12
	subl	%r14d, %r11d
	movslq	%r11d, %r11
	movzbl	(%rax,%r12), %r15d
	addb	(%rdi,%r11), %r15b
	leal	2(%rcx), %r11d
	movb	%r15b, (%rdi,%r12)
	cmpl	%r11d, %r9d
	jle	.L1751
	movslq	%r11d, %r12
	subl	%r14d, %r11d
	movslq	%r11d, %r11
	movzbl	(%rax,%r12), %r15d
	addb	(%rdi,%r11), %r15b
	leal	3(%rcx), %r11d
	movb	%r15b, (%rdi,%r12)
	cmpl	%r11d, %r9d
	jle	.L1751
	movslq	%r11d, %r12
	subl	%r14d, %r11d
	movslq	%r11d, %r11
	movzbl	(%rax,%r12), %r15d
	addb	(%rdi,%r11), %r15b
	leal	4(%rcx), %r11d
	movb	%r15b, (%rdi,%r12)
	cmpl	%r11d, %r9d
	jle	.L1751
	movslq	%r11d, %r12
	subl	%r14d, %r11d
	movslq	%r11d, %r11
	movzbl	(%rax,%r12), %r15d
	addb	(%rdi,%r11), %r15b
	leal	5(%rcx), %r11d
	movb	%r15b, (%rdi,%r12)
	cmpl	%r11d, %r9d
	jle	.L1751
	movslq	%r11d, %r12
	subl	%r14d, %r11d
	addl	$6, %ecx
	movslq	%r11d, %r11
	movzbl	(%rax,%r12), %r15d
	addb	(%rdi,%r11), %r15b
	movb	%r15b, (%rdi,%r12)
	cmpl	%ecx, %r9d
	jle	.L1751
	movslq	%ecx, %r11
	subl	%r14d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%r11), %r12d
	addb	(%rdi,%rcx), %r12b
	movb	%r12b, (%rdi,%r11)
	.p2align 4,,10
	.p2align 3
.L1751:
	movb	$-1, (%rdi,%rdx)
	addq	%rdx, %rax
	subl	$1, %esi
	jne	.L1741
	movl	232(%rsp), %eax
	movq	80(%rsp), %r15
	imulq	%rdx, %rax
	addq	%rax, 96(%rsp)
	jmp	.L1665
.L1673:
	movl	160(%rsp), %eax
	subl	$1, %eax
	movl	%eax, 232(%rsp)
	movl	%eax, %r8d
	je	.L1674
	movslq	8(%rsp), %rcx
	movq	96(%rsp), %rax
	movl	%edx, 48(%rsp)
	movslq	%r14d, %r12
	movl	%ecx, %ebx
	movl	%ecx, %r9d
	movl	%ecx, %r13d
	movq	%rcx, %rsi
	andl	$15, %ebx
	shrl	$4, %r9d
	leal	-1(%rcx), %r11d
	andl	$-16, %r13d
	movl	%ebx, 16(%rsp)
	subl	$1, %ebx
	salq	$4, %r9
	movl	%ebx, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L1675:
	testl	%esi, %esi
	jle	.L1685
	cmpl	$6, %r11d
	jbe	.L1831
	leaq	1(%rax), %rdx
	movq	%rdi, %r10
	subq	%rdx, %r10
	xorl	%edx, %edx
	cmpq	$14, %r10
	ja	.L2129
	.p2align 4,,10
	.p2align 3
.L1682:
	movzbl	(%rax,%rdx), %r10d
	movb	%r10b, (%rdi,%rdx)
	addq	$1, %rdx
	cmpq	%rdx, %rcx
	jne	.L1682
.L1685:
	movb	$-1, (%rdi,%rcx)
	addq	%rcx, %rax
	addq	%r12, %rdi
	subl	$1, %r8d
	jne	.L1675
	jmp	.L2104
	.p2align 4,,10
	.p2align 3
.L1852:
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L1748:
	movzbl	(%r12,%rcx), %r11d
	addb	(%rax,%rcx), %r11b
	movb	%r11b, (%rdi,%rcx)
	addq	$1, %rcx
	cmpq	%rcx, %rdx
	jne	.L1748
	jmp	.L1751
	.p2align 4,,10
	.p2align 3
.L1836:
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L1694:
	movzbl	(%r12,%rcx), %r11d
	addb	(%rax,%rcx), %r11b
	movb	%r11b, (%rdi,%rcx)
	addq	$1, %rcx
	cmpq	%rcx, %rdx
	jne	.L1694
	jmp	.L1697
	.p2align 4,,10
	.p2align 3
.L1840:
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L1706:
	movzbl	(%rax,%rsi), %ebx
	addb	(%rdx,%rsi), %bl
	movb	%bl, (%rdi,%rsi)
	addq	$1, %rsi
	cmpq	%rsi, %rcx
	jne	.L1706
	jmp	.L1709
	.p2align 4,,10
	.p2align 3
.L1844:
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L1715:
	movzbl	(%rax,%rcx), %edx
	movzbl	(%r9,%rcx), %r8d
	addl	%r8d, %edx
	sarl	%edx
	addb	(%rsi,%rcx), %dl
	movb	%dl, (%rdi,%rcx)
	addq	$1, %rcx
	cmpq	%rcx, %r10
	jne	.L1715
	jmp	.L1718
	.p2align 4,,10
	.p2align 3
.L1846:
	movq	%rdx, 16(%rsp)
	movq	224(%rsp), %r15
	xorl	%esi, %esi
	movl	%r12d, 32(%rsp)
	movq	%rcx, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L1728:
	movq	128(%rsp), %rbx
	movzbl	(%rax,%rsi), %r8d
	movzbl	(%r15,%rsi), %r10d
	movzbl	0(%r13,%rsi), %r12d
	movzbl	(%rbx,%rsi), %r9d
	movl	%r8d, %ebx
	leal	(%r10,%r8), %edx
	movl	%r10d, %ecx
	subl	%r9d, %edx
	movl	%r9d, %r11d
	movl	%edx, %r14d
	subl	%r8d, %r14d
	movl	%r14d, %r8d
	negl	%r8d
	cmovs	%r14d, %r8d
	movl	%edx, %r14d
	subl	%r9d, %r14d
	movl	%r14d, %r9d
	negl	%r9d
	cmovs	%r14d, %r9d
	movl	%r8d, %r14d
	cmpl	%r8d, %r9d
	cmovle	%r9d, %r14d
	subl	%r10d, %edx
	movl	%edx, %r10d
	negl	%r10d
	cmovs	%edx, %r10d
	cmpl	%r10d, %r14d
	jge	.L1727
	cmpl	%r8d, %r9d
	movl	%r11d, %ecx
	cmovge	%ebx, %ecx
.L1727:
	addl	%r12d, %ecx
	movb	%cl, (%rdi,%rsi)
	addq	$1, %rsi
	cmpq	%rsi, 112(%rsp)
	jne	.L1728
	jmp	.L2103
	.p2align 4,,10
	.p2align 3
.L1850:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1736:
	movzbl	(%rsi,%rax), %edx
	shrb	%dl
	addb	(%rcx,%rax), %dl
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%r8, %rax
	jne	.L1736
	jmp	.L1739
	.p2align 4,,10
	.p2align 3
.L2125:
	movslq	8(%rsp), %rcx
	movl	240(%rsp), %esi
	cmpl	%esi, 180(%rsp)
	je	.L1597
	movzwl	.LC71(%rip), %ebx
	movw	%bx, (%rdi,%rcx)
.L1597:
	leaq	(%r11,%rcx), %rbx
	movslq	%r14d, %rcx
	movq	%rbx, 96(%rsp)
	addq	%rcx, %rdi
	addq	%rcx, %rax
	jmp	.L1595
	.p2align 4,,10
	.p2align 3
.L2129:
	cmpl	$14, %r11d
	jbe	.L1833
	.p2align 4,,10
	.p2align 3
.L1678:
	movdqu	(%rax,%rdx), %xmm5
	movups	%xmm5, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %r9
	jne	.L1678
	cmpl	%r13d, %esi
	je	.L1685
	cmpl	$6, 32(%rsp)
	movl	16(%rsp), %r10d
	jbe	.L1834
	movl	%r13d, %edx
	movl	%r13d, %ebx
.L1677:
	movq	(%rax,%rdx), %xmm0
	movq	%xmm0, (%rdi,%rdx)
	movl	%r10d, %edx
	andl	$-8, %edx
	addl	%ebx, %edx
	andl	$7, %r10d
	je	.L1685
.L1680:
	movslq	%edx, %r10
	movzbl	(%rax,%r10), %ebx
	movb	%bl, (%rdi,%r10)
	leal	1(%rdx), %r10d
	cmpl	%r10d, %esi
	jle	.L1685
	movslq	%r10d, %r10
	movzbl	(%rax,%r10), %ebx
	movb	%bl, (%rdi,%r10)
	leal	2(%rdx), %r10d
	cmpl	%r10d, %esi
	jle	.L1685
	movslq	%r10d, %r10
	movzbl	(%rax,%r10), %ebx
	movb	%bl, (%rdi,%r10)
	leal	3(%rdx), %r10d
	cmpl	%r10d, %esi
	jle	.L1685
	movslq	%r10d, %r10
	movzbl	(%rax,%r10), %ebx
	movb	%bl, (%rdi,%r10)
	leal	4(%rdx), %r10d
	cmpl	%r10d, %esi
	jle	.L1685
	movslq	%r10d, %r10
	movzbl	(%rax,%r10), %ebx
	movb	%bl, (%rdi,%r10)
	leal	5(%rdx), %r10d
	cmpl	%r10d, %esi
	jle	.L1685
	movslq	%r10d, %r10
	addl	$6, %edx
	movzbl	(%rax,%r10), %ebx
	movb	%bl, (%rdi,%r10)
	cmpl	%edx, %esi
	jle	.L1685
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %r10d
	addq	%rcx, %rax
	movb	%r10b, (%rdi,%rdx)
	movb	$-1, (%rdi,%rcx)
	addq	%r12, %rdi
	subl	$1, %r8d
	jne	.L1675
	jmp	.L2104
	.p2align 4,,10
	.p2align 3
.L1831:
	xorl	%edx, %edx
	jmp	.L1682
.L1674:
	cmpl	$16, 544(%rsp)
	jne	.L1663
	movq	184(%rsp), %rax
	addq	24(%rax), %r15
	jmp	.L1752
.L1810:
	leaq	.LC67(%rip), %rdx
	jmp	.L1574
.L1756:
	cmpl	$16, 544(%rsp)
	je	.L2130
.L1791:
	movl	$1, %eax
	jmp	.L1566
.L1811:
	leaq	.LC68(%rip), %rdx
	jmp	.L1574
.L1754:
	cmpl	$7, 544(%rsp)
	jg	.L1756
	movl	464(%rsp), %ebx
	movl	244(%rsp), %eax
	xorl	%r10d, %r10d
	leaq	stbi__depth_scale_table(%rip), %rbp
	movl	248(%rsp), %edx
	movl	160(%rsp), %r15d
	movdqa	.LC2(%rip), %xmm14
	leal	-8(%rbx), %edi
	movdqa	.LC73(%rip), %xmm13
	subq	%rax, %rdx
	movl	%edi, %eax
	movl	%edi, 272(%rsp)
	leal	-1(%r15), %r14d
	shrl	$3, %eax
	movq	%rdx, %r13
	movl	%r14d, 16(%rsp)
	leal	1(%rax), %esi
	negl	%eax
	leal	(%rdi,%rax,8), %eax
	leal	-4(%rbx), %edi
	movl	%esi, 264(%rsp)
	movl	%eax, 256(%rsp)
	movl	%edi, %eax
	movq	%rsi, 200(%rsp)
	shrl	$2, %eax
	salq	$3, %rsi
	movq	%rsi, 232(%rsp)
	leal	1(%rax), %esi
	negl	%eax
	movl	%esi, 280(%rsp)
	leal	(%rdi,%rax,4), %eax
	movq	%rsi, 208(%rsp)
	salq	$2, %rsi
	movq	%rsi, 192(%rsp)
	leal	-2(%rbx), %esi
	movl	%esi, %ecx
	movl	%eax, 248(%rsp)
	shrl	%ecx
	movl	%edi, 252(%rsp)
	leal	1(%rcx), %r12d
	movl	%esi, 244(%rsp)
	leaq	(%r12,%r12), %rax
	movl	%r12d, 312(%rsp)
	movq	%rax, 112(%rsp)
	movl	%r12d, %eax
	shrl	$4, %eax
	salq	$4, %rax
	movq	%rax, 320(%rsp)
	movl	%r12d, %eax
	andl	$-16, %eax
	movl	%eax, %edx
	movq	%rax, 304(%rsp)
	addq	%rax, %rax
	negl	%edx
	movq	%rax, 296(%rsp)
	leal	(%rbx,%rdx,2), %edi
	movl	%r14d, %edx
	xorl	%ebx, %ebx
	leal	-2(%rdi), %eax
	movl	%edi, 32(%rsp)
	movslq	544(%rsp), %rdi
	movl	%eax, 288(%rsp)
	movl	%ecx, %eax
	negl	%eax
	movq	%rdi, 48(%rsp)
	leal	(%rsi,%rax,2), %eax
	movl	%eax, 224(%rsp)
	leal	0(,%r14,4), %eax
	cltq
	movq	%rax, 64(%rsp)
	leal	-3(%r15,%r15,2), %eax
	cltq
	movq	%rax, 96(%rsp)
	movslq	%r14d, %rax
	movq	%rax, 216(%rsp)
	subq	%rdx, %rax
	leaq	-4(,%rax,4), %rax
	movq	%rax, 80(%rsp)
	movl	240(%rsp), %r11d
	movq	%r12, 8(%rsp)
	movl	544(%rsp), %r9d
	movq	184(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L1790:
	movq	24(%r12), %rdx
	movl	%ebx, %esi
	movl	$1, %ecx
	movl	552(%rsp), %r8d
	leaq	(%rsi,%r13), %rax
	leaq	(%rdx,%rsi), %rdi
	addq	%rax, %rdx
	testl	%r8d, %r8d
	jne	.L1757
	movq	48(%rsp), %rcx
	movzbl	0(%rbp,%rcx), %ecx
.L1757:
	cmpl	$4, %r9d
	je	.L2131
	cmpl	$2, %r9d
	je	.L2132
	cmpl	$1, %r9d
	je	.L2133
.L1768:
	cmpl	%r11d, 180(%rsp)
	je	.L1793
	addq	24(%r12), %rsi
	cmpl	$1, %r11d
	je	.L2134
	cmpl	$3, %r11d
	jne	.L2135
	cmpl	$-1, 16(%rsp)
	je	.L1793
	movq	96(%rsp), %rdi
	movq	64(%rsp), %rax
	leaq	(%rsi,%rdi), %rdx
	movq	80(%rsp), %rdi
	addq	%rsi, %rax
	addq	%rdi, %rsi
	.p2align 4,,10
	.p2align 3
.L1796:
	movb	$-1, 3(%rax)
	movzbl	2(%rdx), %ecx
	subq	$4, %rax
	subq	$3, %rdx
	movb	%cl, 6(%rax)
	movzbl	4(%rdx), %ecx
	movb	%cl, 5(%rax)
	movzbl	3(%rdx), %ecx
	movb	%cl, 4(%rax)
	cmpq	%rax, %rsi
	jne	.L1796
.L1793:
	movl	176(%rsp), %edi
	leal	1(%r10), %eax
	addl	%edi, %ebx
	cmpl	%r10d, 108(%rsp)
	je	.L1791
	movl	%eax, %r10d
	jmp	.L1790
.L2134:
	cmpl	$-1, 16(%rsp)
	je	.L1793
	movq	216(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L1794:
	movb	$-1, 1(%rsi,%rax,2)
	movzbl	(%rsi,%rax), %edx
	movb	%dl, (%rsi,%rax,2)
	subq	$1, %rax
	cmpl	$-1, %eax
	jne	.L1794
	jmp	.L1793
.L2131:
	cmpl	$1, 464(%rsp)
	jle	.L1856
	cmpl	$29, 244(%rsp)
	jbe	.L1760
	movq	112(%rsp), %r15
	leaq	(%rsi,%r15), %r8
	cmpq	%r8, %rax
	jge	.L1861
	movq	8(%rsp), %r15
	addq	%r15, %rax
	cmpq	%rax, %rsi
	jge	.L1861
.L1760:
	movq	8(%rsp), %rax
	movq	%rdi, %r8
	leaq	(%rdx,%rax), %r14
	.p2align 4,,10
	.p2align 3
.L1765:
	movzbl	(%rdx), %eax
	addq	$2, %r8
	addq	$1, %rdx
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, -2(%r8)
	movzbl	-1(%rdx), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	movb	%al, -1(%r8)
	cmpq	%r14, %rdx
	jne	.L1765
.L1766:
	movq	112(%rsp), %rax
	movq	%r14, %rdx
	addq	%rax, %rdi
	movl	224(%rsp), %eax
.L1759:
	cmpl	$1, %eax
	jne	.L1768
	movzbl	(%rdx), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, (%rdi)
	jmp	.L1768
.L2132:
	cmpl	$3, 464(%rsp)
	jle	.L1857
	cmpl	$59, 252(%rsp)
	jbe	.L1771
	movq	192(%rsp), %r15
	leaq	(%rsi,%r15), %r8
	cmpq	%r8, %rax
	jge	.L1862
	movq	208(%rsp), %r15
	addq	%r15, %rax
	cmpq	%rax, %rsi
	jge	.L1862
.L1771:
	movq	208(%rsp), %rax
	movq	%rdi, %r8
	leaq	(%rdx,%rax), %r14
	.p2align 4,,10
	.p2align 3
.L1777:
	movzbl	(%rdx), %eax
	addq	$4, %r8
	addq	$1, %rdx
	shrb	$6, %al
	imull	%ecx, %eax
	movb	%al, -4(%r8)
	movzbl	-1(%rdx), %eax
	shrb	$4, %al
	andl	$3, %eax
	imull	%ecx, %eax
	movb	%al, -3(%r8)
	movzbl	-1(%rdx), %eax
	shrb	$2, %al
	andl	$3, %eax
	imull	%ecx, %eax
	movb	%al, -2(%r8)
	movzbl	-1(%rdx), %eax
	andl	$3, %eax
	imull	%ecx, %eax
	movb	%al, -1(%r8)
	cmpq	%r14, %rdx
	jne	.L1777
.L1778:
	movq	192(%rsp), %rax
	movl	248(%rsp), %r8d
	movq	%r14, %rdx
	addq	%rax, %rdi
.L1770:
	testl	%r8d, %r8d
	jle	.L1768
	movzbl	(%rdx), %eax
	shrb	$6, %al
	imull	%ecx, %eax
	movb	%al, (%rdi)
	cmpl	$1, %r8d
	je	.L1768
	movzbl	(%rdx), %eax
	shrb	$4, %al
	andl	$3, %eax
	imull	%ecx, %eax
	movb	%al, 1(%rdi)
	cmpl	$3, %r8d
	jne	.L1768
	movzbl	(%rdx), %eax
	shrb	$2, %al
	andl	$3, %eax
	imull	%ecx, %eax
	movb	%al, 2(%rdi)
	jmp	.L1768
.L2133:
	cmpl	$7, 464(%rsp)
	jle	.L1858
	cmpl	$119, 272(%rsp)
	jbe	.L1781
	movq	232(%rsp), %r15
	leaq	(%rsi,%r15), %r8
	cmpq	%r8, %rax
	jge	.L1863
	movq	200(%rsp), %r15
	addq	%r15, %rax
	cmpq	%rax, %rsi
	jge	.L1863
.L1781:
	movq	200(%rsp), %rax
	movq	%rdi, %r8
	leaq	(%rdx,%rax), %r14
	.p2align 4,,10
	.p2align 3
.L1787:
	movzbl	(%rdx), %eax
	addq	$8, %r8
	addq	$1, %rdx
	shrb	$7, %al
	imull	%ecx, %eax
	movb	%al, -8(%r8)
	movzbl	-1(%rdx), %eax
	shrb	$6, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -7(%r8)
	movzbl	-1(%rdx), %eax
	shrb	$5, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -6(%r8)
	movzbl	-1(%rdx), %eax
	shrb	$4, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -5(%r8)
	movzbl	-1(%rdx), %eax
	shrb	$3, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -4(%r8)
	movzbl	-1(%rdx), %eax
	shrb	$2, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -3(%r8)
	movzbl	-1(%rdx), %eax
	shrb	%al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -2(%r8)
	movzbl	-1(%rdx), %eax
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -1(%r8)
	cmpq	%r14, %rdx
	jne	.L1787
.L1788:
	movq	232(%rsp), %rax
	movl	256(%rsp), %r8d
	movq	%r14, %rdx
	addq	%rax, %rdi
.L1780:
	testl	%r8d, %r8d
	jle	.L1768
	movzbl	(%rdx), %eax
	shrb	$7, %al
	imull	%ecx, %eax
	movb	%al, (%rdi)
	cmpl	$1, %r8d
	je	.L1768
	movzbl	(%rdx), %eax
	shrb	$6, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, 1(%rdi)
	cmpl	$2, %r8d
	je	.L1768
	movzbl	(%rdx), %eax
	shrb	$5, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, 2(%rdi)
	cmpl	$3, %r8d
	je	.L1768
	movzbl	(%rdx), %eax
	shrb	$4, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, 3(%rdi)
	cmpl	$4, %r8d
	je	.L1768
	movzbl	(%rdx), %eax
	shrb	$3, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, 4(%rdi)
	cmpl	$5, %r8d
	je	.L1768
	movzbl	(%rdx), %eax
	shrb	$2, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, 5(%rdi)
	cmpl	$7, %r8d
	jne	.L1768
	movzbl	(%rdx), %eax
	shrb	%al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, 6(%rdi)
	jmp	.L1768
	.p2align 4,,10
	.p2align 3
.L1833:
	movl	48(%rsp), %ebx
	movl	%esi, %r10d
	xorl	%edx, %edx
	jmp	.L1677
.L1853:
	movl	%r9d, %r11d
	xorl	%ecx, %ecx
	xorl	%r15d, %r15d
	jmp	.L1743
.L1837:
	movl	$0, 16(%rsp)
	movl	%r9d, %r11d
	xorl	%ecx, %ecx
	jmp	.L1689
.L1841:
	movl	%r11d, %ebx
	xorl	%esi, %esi
	xorl	%r15d, %r15d
	jmp	.L1701
.L1838:
	movl	%ebx, %ecx
	jmp	.L1692
.L1842:
	movl	%r13d, %esi
	jmp	.L1704
.L1834:
	movl	%r13d, %edx
	jmp	.L1680
.L1854:
	movl	%ebx, %ecx
	jmp	.L1746
.L1861:
	movd	%ecx, %xmm0
	movq	320(%rsp), %r8
	xorl	%eax, %eax
	punpcklbw	%xmm0, %xmm0
	movdqa	%xmm0, %xmm3
	punpcklwd	%xmm0, %xmm3
	pshufd	$0, %xmm3, %xmm3
	movdqa	%xmm3, %xmm4
	punpcklbw	%xmm3, %xmm4
	punpckhbw	%xmm3, %xmm3
	.p2align 4,,10
	.p2align 3
.L1762:
	movdqu	(%rdx,%rax), %xmm0
	movdqa	%xmm0, %xmm1
	pand	%xmm13, %xmm0
	psrlw	$4, %xmm1
	pand	%xmm13, %xmm1
	movdqa	%xmm1, %xmm2
	punpcklbw	%xmm1, %xmm2
	punpckhbw	%xmm1, %xmm1
	pmullw	%xmm4, %xmm2
	pmullw	%xmm3, %xmm1
	pand	%xmm14, %xmm2
	pand	%xmm14, %xmm1
	packuswb	%xmm1, %xmm2
	movdqa	%xmm0, %xmm1
	punpcklbw	%xmm0, %xmm1
	punpckhbw	%xmm0, %xmm0
	pmullw	%xmm4, %xmm1
	pmullw	%xmm3, %xmm0
	pand	%xmm14, %xmm1
	pand	%xmm14, %xmm0
	packuswb	%xmm0, %xmm1
	movdqa	%xmm2, %xmm0
	punpcklbw	%xmm1, %xmm0
	punpckhbw	%xmm1, %xmm2
	movups	%xmm0, (%rdi,%rax,2)
	movups	%xmm2, 16(%rdi,%rax,2)
	addq	$16, %rax
	cmpq	%rax, %r8
	jne	.L1762
	movq	296(%rsp), %rax
	leaq	(%rdi,%rax), %r8
	movq	304(%rsp), %rax
	leaq	(%rdx,%rax), %r14
	testb	$15, 312(%rsp)
	je	.L2106
	movzbl	(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, (%r8)
	movzbl	(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$1, 288(%rsp)
	movb	%al, 1(%r8)
	jle	.L2106
	movzbl	1(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 2(%r8)
	movzbl	1(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$5, 32(%rsp)
	movb	%al, 3(%r8)
	jle	.L2106
	movzbl	2(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 4(%r8)
	movzbl	2(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$7, 32(%rsp)
	movb	%al, 5(%r8)
	jle	.L2106
	movzbl	3(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 6(%r8)
	movzbl	3(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$9, 32(%rsp)
	movb	%al, 7(%r8)
	jle	.L2106
	movzbl	4(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 8(%r8)
	movzbl	4(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$11, 32(%rsp)
	movb	%al, 9(%r8)
	jle	.L2106
	movzbl	5(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 10(%r8)
	movzbl	5(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$13, 32(%rsp)
	movb	%al, 11(%r8)
	jle	.L2106
	movzbl	6(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 12(%r8)
	movzbl	6(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$15, 32(%rsp)
	movb	%al, 13(%r8)
	jle	.L2106
	movzbl	7(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 14(%r8)
	movzbl	7(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$17, 32(%rsp)
	movb	%al, 15(%r8)
	jle	.L2106
	movzbl	8(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 16(%r8)
	movzbl	8(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$19, 32(%rsp)
	movb	%al, 17(%r8)
	jle	.L2106
	movzbl	9(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 18(%r8)
	movzbl	9(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$21, 32(%rsp)
	movb	%al, 19(%r8)
	jle	.L2106
	movzbl	10(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 20(%r8)
	movzbl	10(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$23, 32(%rsp)
	movb	%al, 21(%r8)
	jle	.L2106
	movzbl	11(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 22(%r8)
	movzbl	11(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$25, 32(%rsp)
	movb	%al, 23(%r8)
	jle	.L2106
	movzbl	12(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 24(%r8)
	movzbl	12(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$27, 32(%rsp)
	movb	%al, 25(%r8)
	jle	.L2106
	movzbl	13(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 26(%r8)
	movzbl	13(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	cmpl	$29, 32(%rsp)
	movb	%al, 27(%r8)
	jle	.L2106
	movzbl	14(%r14), %eax
	shrb	$4, %al
	imull	%ecx, %eax
	movb	%al, 28(%r8)
	movzbl	14(%r14), %eax
	andl	$15, %eax
	imull	%ecx, %eax
	movb	%al, 29(%r8)
.L2106:
	movq	8(%rsp), %rax
	leaq	(%rdx,%rax), %r14
	jmp	.L1766
.L1862:
	movd	%ecx, %xmm0
	movq	%rdi, %rax
	movq	%rdx, %r8
	movl	280(%rsp), %r14d
	punpcklbw	%xmm0, %xmm0
	movdqa	.LC73(%rip), %xmm7
	movdqa	.LC0(%rip), %xmm12
	movdqa	%xmm0, %xmm5
	shrl	$4, %r14d
	movdqa	.LC74(%rip), %xmm8
	punpcklwd	%xmm0, %xmm5
	salq	$6, %r14
	movdqa	.LC2(%rip), %xmm0
	pshufd	$0, %xmm5, %xmm5
	addq	%rdi, %r14
	movdqa	%xmm5, %xmm6
	punpcklbw	%xmm5, %xmm6
	punpckhbw	%xmm5, %xmm5
.L1773:
	movdqu	(%r8), %xmm1
	addq	$64, %rax
	addq	$16, %r8
	movdqa	%xmm1, %xmm2
	psrlw	$6, %xmm2
	pand	%xmm12, %xmm2
	movdqa	%xmm2, %xmm3
	punpcklbw	%xmm2, %xmm3
	punpckhbw	%xmm2, %xmm2
	pmullw	%xmm6, %xmm3
	pmullw	%xmm5, %xmm2
	pand	%xmm0, %xmm3
	pand	%xmm0, %xmm2
	packuswb	%xmm2, %xmm3
	movdqa	%xmm1, %xmm2
	psrlw	$4, %xmm2
	pand	%xmm7, %xmm2
	pand	%xmm12, %xmm2
	movdqa	%xmm2, %xmm4
	punpcklbw	%xmm2, %xmm4
	punpckhbw	%xmm2, %xmm2
	pmullw	%xmm6, %xmm4
	pmullw	%xmm5, %xmm2
	pand	%xmm0, %xmm4
	pand	%xmm0, %xmm2
	packuswb	%xmm2, %xmm4
	movdqa	%xmm1, %xmm2
	pand	%xmm12, %xmm1
	psrlw	$2, %xmm2
	pand	%xmm8, %xmm2
	pand	%xmm12, %xmm2
	movdqa	%xmm2, %xmm9
	punpcklbw	%xmm2, %xmm9
	punpckhbw	%xmm2, %xmm2
	pmullw	%xmm6, %xmm9
	pmullw	%xmm5, %xmm2
	pand	%xmm0, %xmm9
	pand	%xmm0, %xmm2
	packuswb	%xmm2, %xmm9
	movdqa	%xmm1, %xmm2
	punpcklbw	%xmm1, %xmm2
	punpckhbw	%xmm1, %xmm1
	pmullw	%xmm6, %xmm2
	pmullw	%xmm5, %xmm1
	pand	%xmm0, %xmm2
	pand	%xmm0, %xmm1
	packuswb	%xmm1, %xmm2
	movdqa	%xmm3, %xmm1
	punpckhbw	%xmm9, %xmm3
	punpcklbw	%xmm9, %xmm1
	movdqa	%xmm4, %xmm9
	punpckhbw	%xmm2, %xmm4
	punpcklbw	%xmm2, %xmm9
	movdqa	%xmm1, %xmm2
	punpckhbw	%xmm9, %xmm1
	punpcklbw	%xmm9, %xmm2
	movups	%xmm1, -48(%rax)
	movdqa	%xmm3, %xmm1
	punpckhbw	%xmm4, %xmm3
	punpcklbw	%xmm4, %xmm1
	movups	%xmm2, -64(%rax)
	movups	%xmm1, -32(%rax)
	movups	%xmm3, -16(%rax)
	cmpq	%rax, %r14
	jne	.L1773
	movl	280(%rsp), %r14d
	movl	464(%rsp), %r15d
	movl	%r14d, %r8d
	andl	$-16, %r8d
	movl	%r8d, %eax
	negl	%eax
	leal	(%r15,%rax,4), %eax
	leaq	(%rdi,%r8,4), %r15
	addq	%rdx, %r8
	andl	$15, %r14d
	leal	(%rax,%r15), %r14d
	je	.L2107
	.p2align 4,,10
	.p2align 3
.L1776:
	movzbl	(%r8), %eax
	addq	$4, %r15
	addq	$1, %r8
	shrb	$6, %al
	imull	%ecx, %eax
	movb	%al, -4(%r15)
	movzbl	-1(%r8), %eax
	shrb	$4, %al
	andl	$3, %eax
	imull	%ecx, %eax
	movb	%al, -3(%r15)
	movzbl	-1(%r8), %eax
	shrb	$2, %al
	andl	$3, %eax
	imull	%ecx, %eax
	movb	%al, -2(%r15)
	movzbl	-1(%r8), %eax
	andl	$3, %eax
	imull	%ecx, %eax
	movb	%al, -1(%r15)
	movl	%r14d, %eax
	subl	%r15d, %eax
	cmpl	$3, %eax
	jg	.L1776
.L2107:
	movq	208(%rsp), %rax
	leaq	(%rdx,%rax), %r14
	jmp	.L1778
.L1812:
	leaq	.LC69(%rip), %rdx
	jmp	.L1574
.L1863:
	movdqa	.LC15(%rip), %xmm5
	movd	%ecx, %xmm0
	movq	%rdx, %r8
	movl	264(%rsp), %r14d
	movdqa	.LC14(%rip), %xmm11
	punpcklbw	%xmm0, %xmm0
	movq	%rdi, %rax
	movdqa	.LC0(%rip), %xmm12
	movdqa	%xmm0, %xmm6
	movaps	%xmm5, 160(%rsp)
	shrl	$4, %r14d
	movdqa	.LC73(%rip), %xmm5
	punpcklwd	%xmm0, %xmm6
	salq	$4, %r14
	movdqa	.LC2(%rip), %xmm0
	pshufd	$0, %xmm6, %xmm6
	movaps	%xmm5, 128(%rsp)
	addq	%rdx, %r14
	movdqa	.LC74(%rip), %xmm5
	movdqa	%xmm6, %xmm10
	punpcklbw	%xmm6, %xmm10
	movaps	%xmm5, 144(%rsp)
	punpckhbw	%xmm6, %xmm6
.L1783:
	movdqu	(%r8), %xmm1
	addq	$16, %r8
	subq	$-128, %rax
	movdqa	%xmm1, %xmm2
	movdqa	%xmm1, %xmm7
	movdqa	%xmm1, %xmm15
	psrlw	$7, %xmm2
	psrlw	$4, %xmm7
	pand	128(%rsp), %xmm7
	pand	%xmm11, %xmm2
	psrlw	$1, %xmm15
	pand	160(%rsp), %xmm15
	movdqa	%xmm2, %xmm4
	movdqa	%xmm2, %xmm3
	pand	%xmm11, %xmm7
	punpcklbw	%xmm2, %xmm4
	punpckhbw	%xmm2, %xmm3
	pand	%xmm11, %xmm15
	movdqa	%xmm4, %xmm2
	pmullw	%xmm6, %xmm3
	pmullw	%xmm10, %xmm2
	pand	%xmm0, %xmm3
	pand	%xmm0, %xmm2
	packuswb	%xmm3, %xmm2
	movdqa	%xmm1, %xmm3
	psrlw	$6, %xmm3
	pand	%xmm12, %xmm3
	pand	%xmm11, %xmm3
	movdqa	%xmm3, %xmm5
	movdqa	%xmm3, %xmm4
	punpcklbw	%xmm3, %xmm5
	punpckhbw	%xmm3, %xmm4
	movdqa	%xmm5, %xmm3
	pmullw	%xmm6, %xmm4
	pmullw	%xmm10, %xmm3
	pand	%xmm0, %xmm4
	pand	%xmm0, %xmm3
	packuswb	%xmm4, %xmm3
	movdqa	%xmm1, %xmm4
	psrlw	$5, %xmm4
	pand	.LC75(%rip), %xmm4
	pand	%xmm11, %xmm4
	movdqa	%xmm4, %xmm5
	punpcklbw	%xmm4, %xmm5
	punpckhbw	%xmm4, %xmm4
	pmullw	%xmm10, %xmm5
	pmullw	%xmm6, %xmm4
	pand	%xmm0, %xmm5
	pand	%xmm0, %xmm4
	packuswb	%xmm4, %xmm5
	movdqa	%xmm7, %xmm4
	punpcklbw	%xmm7, %xmm4
	punpckhbw	%xmm7, %xmm7
	pmullw	%xmm10, %xmm4
	pmullw	%xmm6, %xmm7
	pand	%xmm0, %xmm4
	pand	%xmm0, %xmm7
	packuswb	%xmm7, %xmm4
	movdqa	%xmm1, %xmm7
	psrlw	$3, %xmm7
	pand	.LC76(%rip), %xmm7
	pand	%xmm11, %xmm7
	movdqa	%xmm7, %xmm9
	punpcklbw	%xmm7, %xmm9
	punpckhbw	%xmm7, %xmm7
	pmullw	%xmm10, %xmm9
	pmullw	%xmm6, %xmm7
	pand	%xmm0, %xmm9
	pand	%xmm0, %xmm7
	packuswb	%xmm7, %xmm9
	movdqa	%xmm1, %xmm7
	pand	%xmm11, %xmm1
	psrlw	$2, %xmm7
	pand	144(%rsp), %xmm7
	pand	%xmm11, %xmm7
	movdqa	%xmm7, %xmm8
	punpcklbw	%xmm7, %xmm8
	punpckhbw	%xmm7, %xmm7
	pmullw	%xmm10, %xmm8
	pmullw	%xmm6, %xmm7
	pand	%xmm0, %xmm8
	pand	%xmm0, %xmm7
	packuswb	%xmm7, %xmm8
	movdqa	%xmm15, %xmm7
	punpcklbw	%xmm15, %xmm7
	punpckhbw	%xmm15, %xmm15
	pmullw	%xmm10, %xmm7
	pmullw	%xmm6, %xmm15
	pand	%xmm0, %xmm7
	pand	%xmm0, %xmm15
	packuswb	%xmm15, %xmm7
	movdqa	%xmm1, %xmm15
	punpcklbw	%xmm1, %xmm15
	punpckhbw	%xmm1, %xmm1
	pmullw	%xmm10, %xmm15
	pmullw	%xmm6, %xmm1
	pand	%xmm0, %xmm15
	pand	%xmm0, %xmm1
	packuswb	%xmm1, %xmm15
	movdqa	%xmm2, %xmm1
	punpckhbw	%xmm9, %xmm2
	punpcklbw	%xmm9, %xmm1
	movdqa	%xmm3, %xmm9
	punpckhbw	%xmm8, %xmm3
	punpcklbw	%xmm8, %xmm9
	movdqa	%xmm5, %xmm8
	punpckhbw	%xmm7, %xmm5
	punpcklbw	%xmm7, %xmm8
	movdqa	%xmm4, %xmm7
	punpckhbw	%xmm15, %xmm4
	punpcklbw	%xmm15, %xmm7
	movdqa	%xmm1, %xmm15
	punpckhbw	%xmm8, %xmm1
	punpcklbw	%xmm8, %xmm15
	movdqa	%xmm2, %xmm8
	punpckhbw	%xmm5, %xmm2
	punpcklbw	%xmm5, %xmm8
	movdqa	%xmm9, %xmm5
	punpckhbw	%xmm7, %xmm9
	punpcklbw	%xmm7, %xmm5
	movdqa	%xmm3, %xmm7
	punpckhbw	%xmm4, %xmm3
	punpcklbw	%xmm4, %xmm7
	movdqa	%xmm15, %xmm4
	punpckhbw	%xmm5, %xmm15
	punpcklbw	%xmm5, %xmm4
	movups	%xmm15, -112(%rax)
	movups	%xmm4, -128(%rax)
	movdqa	%xmm1, %xmm4
	punpckhbw	%xmm9, %xmm1
	movups	%xmm1, -80(%rax)
	movdqa	%xmm8, %xmm1
	punpcklbw	%xmm9, %xmm4
	punpckhbw	%xmm7, %xmm8
	punpcklbw	%xmm7, %xmm1
	movups	%xmm4, -96(%rax)
	movups	%xmm1, -64(%rax)
	movdqa	%xmm2, %xmm1
	punpckhbw	%xmm3, %xmm2
	punpcklbw	%xmm3, %xmm1
	movups	%xmm8, -48(%rax)
	movups	%xmm1, -32(%rax)
	movups	%xmm2, -16(%rax)
	cmpq	%r14, %r8
	jne	.L1783
	movl	264(%rsp), %r15d
	movl	464(%rsp), %r8d
	movl	%r15d, %r14d
	andl	$-16, %r14d
	movl	%r14d, %eax
	negl	%eax
	leal	(%r8,%rax,8), %eax
	leaq	(%rdi,%r14,8), %r8
	addq	%rdx, %r14
	andl	$15, %r15d
	leal	(%rax,%r8), %r15d
	je	.L2108
	.p2align 4,,10
	.p2align 3
.L1786:
	movzbl	(%r14), %eax
	addq	$8, %r8
	addq	$1, %r14
	shrb	$7, %al
	imull	%ecx, %eax
	movb	%al, -8(%r8)
	movzbl	-1(%r14), %eax
	shrb	$6, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -7(%r8)
	movzbl	-1(%r14), %eax
	shrb	$5, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -6(%r8)
	movzbl	-1(%r14), %eax
	shrb	$4, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -5(%r8)
	movzbl	-1(%r14), %eax
	shrb	$3, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -4(%r8)
	movzbl	-1(%r14), %eax
	shrb	$2, %al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -3(%r8)
	movzbl	-1(%r14), %eax
	shrb	%al
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -2(%r8)
	movzbl	-1(%r14), %eax
	andl	$1, %eax
	imull	%ecx, %eax
	movb	%al, -1(%r8)
	movl	%r15d, %eax
	subl	%r8d, %eax
	cmpl	$7, %eax
	jg	.L1786
.L2108:
	movq	200(%rsp), %rax
	leaq	(%rdx,%rax), %r14
	jmp	.L1788
.L2130:
	movq	184(%rsp), %rax
	movl	192(%rsp), %edi
	movq	24(%rax), %rsi
	movl	160(%rsp), %eax
	imull	%edi, %eax
	movl	180(%rsp), %edi
	imull	%edi, %eax
	testl	%eax, %eax
	je	.L1791
	leal	-1(%rax), %edx
	cmpl	$6, %edx
	jbe	.L1860
	movl	%eax, %ecx
	movq	%rsi, %rdx
	shrl	$3, %ecx
	salq	$4, %rcx
	addq	%rsi, %rcx
.L1798:
	movdqu	(%rdx), %xmm0
	addq	$16, %rdx
	movdqa	%xmm0, %xmm1
	psllw	$8, %xmm0
	psrlw	$8, %xmm1
	por	%xmm1, %xmm0
	movups	%xmm0, -16(%rdx)
	cmpq	%rcx, %rdx
	jne	.L1798
	movl	%eax, %edx
	andl	$-8, %edx
	movl	%edx, %ecx
	leaq	(%rsi,%rcx,2), %rcx
	testb	$7, %al
	je	.L1791
.L1797:
	movl	%eax, %edi
	subl	%edx, %edi
	leal	-1(%rdi), %r8d
	cmpl	$2, %r8d
	jbe	.L1801
	movl	%edx, %r8d
	leaq	(%rsi,%r8,2), %rsi
	movq	(%rsi), %xmm0
	movdqa	%xmm0, %xmm1
	psllw	$8, %xmm0
	psrlw	$8, %xmm1
	por	%xmm1, %xmm0
	movq	%xmm0, (%rsi)
	movl	%edi, %esi
	andl	$-4, %esi
	addl	%esi, %edx
	andl	$3, %edi
	leaq	(%rcx,%rsi,2), %rcx
	je	.L1791
.L1801:
	leal	1(%rdx), %esi
	rolw	$8, (%rcx)
	cmpl	%eax, %esi
	jnb	.L1791
	addl	$2, %edx
	rolw	$8, 2(%rcx)
	cmpl	%eax, %edx
	jnb	.L1791
	rolw	$8, 4(%rcx)
	jmp	.L1791
.L1856:
	movl	464(%rsp), %eax
	jmp	.L1759
.L1857:
	movl	464(%rsp), %r8d
	jmp	.L1770
.L1858:
	movl	464(%rsp), %r8d
	jmp	.L1780
.L1819:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	jmp	.L1625
.L1816:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	addq	%rdi, %rax
	jmp	.L1616
.L1830:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	addq	%rdi, %rax
	jmp	.L1655
.L2135:
	leaq	__PRETTY_FUNCTION__.47(%rip), %rcx
	movl	$4884, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC77(%rip), %rdi
	call	__assert_fail@PLT
.L2127:
	leaq	__PRETTY_FUNCTION__.47(%rip), %rcx
	movl	$4792, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC72(%rip), %rdi
	call	__assert_fail@PLT
.L1860:
	movq	%rsi, %rcx
	xorl	%edx, %edx
	jmp	.L1797
.L2121:
	leaq	__PRETTY_FUNCTION__.47(%rip), %rcx
	movl	$4705, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC70(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE679:
	.size	stbi__create_png_image_raw, .-stbi__create_png_image_raw
	.p2align 4
	.type	stbi__compute_huffman_codes, @function
stbi__compute_huffman_codes:
.LFB665:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$2712, %rsp
	.cfi_def_cfa_offset 2768
	movl	16(%rdi), %ecx
	movl	20(%rdi), %r8d
	movq	%fs:40, %rax
	movq	%rax, 2696(%rsp)
	xorl	%eax, %eax
	cmpl	$4, %ecx
	jle	.L2274
.L2137:
	movl	%r8d, %esi
	subl	$5, %ecx
	shrl	$5, %esi
	movl	%ecx, 16(%rbx)
	movl	%esi, 20(%rbx)
	cmpl	$4, %ecx
	jle	.L2275
.L2142:
	movl	%esi, %r10d
	subl	$5, %ecx
	shrl	$5, %r10d
	movl	%ecx, 16(%rbx)
	movl	%r10d, 20(%rbx)
	cmpl	$3, %ecx
	jle	.L2276
.L2147:
	movl	%r10d, %edx
	subl	$4, %ecx
	andl	$15, %r10d
	xorl	%edi, %edi
	shrl	$4, %edx
	pxor	%xmm0, %xmm0
	movl	%ecx, 16(%rbx)
	addl	$4, %r10d
	movaps	%xmm0, 2208(%rsp)
	leaq	length_dezigzag.31(%rip), %rbp
	movl	%edx, 20(%rbx)
	movl	$0, 2223(%rsp)
	jmp	.L2157
	.p2align 4,,10
	.p2align 3
.L2152:
	movzbl	0(%rbp,%rdi), %eax
	movl	%edx, %r9d
	subl	$3, %ecx
	shrl	$3, %edx
	andl	$7, %r9d
	addq	$1, %rdi
	movl	%edx, 20(%rbx)
	movl	%ecx, 16(%rbx)
	movb	%r9b, 2208(%rsp,%rax)
	cmpl	%edi, %r10d
	jle	.L2277
.L2157:
	cmpl	$2, %ecx
	jg	.L2152
	movq	8(%rbx), %r9
	jmp	.L2156
	.p2align 4,,10
	.p2align 3
.L2153:
	movq	(%rbx), %rax
	cmpq	%r9, %rax
	jnb	.L2154
	leaq	1(%rax), %r11
	movq	%r11, (%rbx)
	movzbl	(%rax), %eax
	sall	%cl, %eax
	orl	%eax, %edx
.L2154:
	addl	$8, %ecx
	movl	%edx, 20(%rbx)
	movl	%ecx, 16(%rbx)
	cmpl	$24, %ecx
	jg	.L2152
.L2156:
	movl	%edx, %eax
	shrl	%cl, %eax
	testl	%eax, %eax
	je	.L2153
	movq	%r9, (%rbx)
	jmp	.L2152
	.p2align 4,,10
	.p2align 3
.L2277:
	leaq	176(%rsp), %r11
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	movl	$128, %ecx
	movq	%r11, %rdi
	leaq	2208(%rsp), %r15
	movl	$0, 160(%rsp)
	rep stosq
	movaps	%xmm0, 96(%rsp)
	movq	%r15, %rax
	leaq	2227(%rsp), %rdi
	movaps	%xmm0, 112(%rsp)
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm0, 144(%rsp)
	.p2align 4,,10
	.p2align 3
.L2158:
	movzbl	(%rax), %edx
	addq	$1, %rax
	addl	$1, 96(%rsp,%rdx,4)
	cmpq	%rax, %rdi
	jne	.L2158
	movl	100(%rsp), %edi
	movl	$0, 96(%rsp)
	cmpl	$2, %edi
	jg	.L2159
	movl	104(%rsp), %edx
	cmpl	$4, %edx
	jg	.L2159
	movl	108(%rsp), %r9d
	cmpl	$8, %r9d
	jg	.L2159
	movl	112(%rsp), %r10d
	cmpl	$16, %r10d
	jg	.L2159
	movl	116(%rsp), %ebp
	cmpl	$32, %ebp
	jg	.L2159
	movl	120(%rsp), %r12d
	cmpl	$64, %r12d
	jg	.L2159
	movl	124(%rsp), %r13d
	cmpl	$128, %r13d
	jg	.L2159
	movl	128(%rsp), %r14d
	cmpl	$256, %r14d
	jg	.L2159
	movl	132(%rsp), %eax
	movl	%eax, 4(%rsp)
	cmpl	$512, %eax
	jg	.L2159
	movl	136(%rsp), %eax
	movl	%eax, 8(%rsp)
	cmpl	$1024, %eax
	jg	.L2159
	movl	140(%rsp), %eax
	movl	%eax, 12(%rsp)
	cmpl	$2048, %eax
	jg	.L2159
	movl	144(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$4096, %eax
	jg	.L2159
	movl	148(%rsp), %eax
	movl	%eax, 20(%rsp)
	cmpl	$8192, %eax
	jg	.L2159
	movl	152(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$16384, %eax
	jg	.L2159
	movl	156(%rsp), %eax
	movl	%eax, 28(%rsp)
	cmpl	$32768, %eax
	jg	.L2159
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movl	$0, 36(%rsp)
	movw	%ax, 1202(%rsp)
	movl	%edi, %eax
	sall	$15, %eax
	movw	%cx, 1302(%rsp)
	movl	%eax, 1236(%rsp)
	leal	(%rdi,%rdi), %eax
	movl	%eax, 40(%rsp)
	movw	%ax, 1204(%rsp)
	addl	%edx, %eax
	movw	%di, 1304(%rsp)
	testl	%edx, %edx
	je	.L2162
	cmpl	$4, %eax
	jg	.L2192
.L2162:
	movl	%eax, %ecx
	addl	%edi, %edx
	addl	%eax, %eax
	sall	$14, %ecx
	movl	%eax, 44(%rsp)
	movw	%ax, 1206(%rsp)
	addl	%r9d, %eax
	movl	%ecx, 1240(%rsp)
	movw	%dx, 1306(%rsp)
	testl	%r9d, %r9d
	je	.L2164
	cmpl	$8, %eax
	jg	.L2192
.L2164:
	movl	%eax, %edi
	addl	%r9d, %edx
	addl	%eax, %eax
	sall	$13, %edi
	movl	%eax, 48(%rsp)
	movw	%ax, 1208(%rsp)
	addl	%r10d, %eax
	movl	%edi, 1244(%rsp)
	movw	%dx, 1308(%rsp)
	testl	%r10d, %r10d
	je	.L2165
	cmpl	$16, %eax
	jg	.L2192
.L2165:
	movl	%eax, %edi
	addl	%r10d, %edx
	addl	%eax, %eax
	sall	$12, %edi
	movl	%eax, 52(%rsp)
	movw	%ax, 1210(%rsp)
	addl	%ebp, %eax
	movl	%edi, 1248(%rsp)
	movw	%dx, 1310(%rsp)
	testl	%ebp, %ebp
	je	.L2166
	cmpl	$32, %eax
	jg	.L2192
.L2166:
	movl	%eax, %edi
	addl	%ebp, %edx
	addl	%eax, %eax
	sall	$11, %edi
	movl	%eax, 56(%rsp)
	movw	%ax, 1212(%rsp)
	addl	%r12d, %eax
	movl	%edi, 1252(%rsp)
	movw	%dx, 1312(%rsp)
	testl	%r12d, %r12d
	je	.L2167
	cmpl	$64, %eax
	jg	.L2192
.L2167:
	movl	%eax, %edi
	addl	%r12d, %edx
	addl	%eax, %eax
	sall	$10, %edi
	movl	%eax, 60(%rsp)
	movw	%ax, 1214(%rsp)
	addl	%r13d, %eax
	movl	%edi, 1256(%rsp)
	movw	%dx, 1314(%rsp)
	testl	%r13d, %r13d
	je	.L2168
	cmpl	$128, %eax
	jg	.L2192
.L2168:
	movl	%eax, %edi
	addl	%r13d, %edx
	addl	%eax, %eax
	sall	$9, %edi
	movl	%eax, 64(%rsp)
	movw	%ax, 1216(%rsp)
	addl	%r14d, %eax
	movl	%edi, 1260(%rsp)
	movw	%dx, 1316(%rsp)
	testl	%r14d, %r14d
	je	.L2169
	cmpl	$256, %eax
	jg	.L2192
.L2169:
	movl	%eax, %edi
	addl	%r14d, %edx
	addl	%eax, %eax
	sall	$8, %edi
	movl	%eax, 68(%rsp)
	movl	%edi, 1264(%rsp)
	movl	4(%rsp), %edi
	movw	%ax, 1218(%rsp)
	movw	%dx, 1318(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2170
	cmpl	$512, %eax
	jg	.L2192
.L2170:
	movl	%eax, %edi
	addl	%eax, %eax
	sall	$7, %edi
	movl	%eax, 72(%rsp)
	movl	%edi, 1268(%rsp)
	movl	4(%rsp), %edi
	movw	%ax, 1220(%rsp)
	addl	%edi, %edx
	movl	8(%rsp), %edi
	movw	%dx, 1320(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2171
	cmpl	$1024, %eax
	jg	.L2192
.L2171:
	movl	%eax, %edi
	addl	%eax, %eax
	sall	$6, %edi
	movl	%eax, 76(%rsp)
	movl	%edi, 1272(%rsp)
	movl	8(%rsp), %edi
	movw	%ax, 1222(%rsp)
	addl	%edi, %edx
	movl	12(%rsp), %edi
	movw	%dx, 1322(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2172
	cmpl	$2048, %eax
	jg	.L2192
.L2172:
	movl	%eax, %edi
	addl	%eax, %eax
	sall	$5, %edi
	movl	%eax, 80(%rsp)
	movl	%edi, 1276(%rsp)
	movl	12(%rsp), %edi
	movw	%ax, 1224(%rsp)
	addl	%edi, %edx
	movl	16(%rsp), %edi
	movw	%dx, 1324(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2173
	cmpl	$4096, %eax
	jg	.L2192
.L2173:
	movl	%eax, %edi
	addl	%eax, %eax
	sall	$4, %edi
	movl	%eax, 84(%rsp)
	movl	%edi, 1280(%rsp)
	movl	16(%rsp), %edi
	movw	%ax, 1226(%rsp)
	addl	%edi, %edx
	movl	20(%rsp), %edi
	movw	%dx, 1326(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2174
	cmpl	$8192, %eax
	jg	.L2192
.L2174:
	leal	0(,%rax,8), %edi
	addl	%eax, %eax
	movl	%edi, 1284(%rsp)
	movl	20(%rsp), %edi
	movl	%eax, 88(%rsp)
	addl	%edi, %edx
	movl	24(%rsp), %edi
	movw	%ax, 1228(%rsp)
	movw	%dx, 1328(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2175
	cmpl	$16384, %eax
	jg	.L2192
.L2175:
	leal	0(,%rax,4), %edi
	addl	%eax, %eax
	movl	%edi, 1288(%rsp)
	movl	24(%rsp), %edi
	movl	%eax, 92(%rsp)
	addl	%edi, %edx
	movl	28(%rsp), %edi
	movw	%ax, 1230(%rsp)
	movw	%dx, 1330(%rsp)
	addl	%edi, %eax
	testl	%edi, %edi
	jne	.L2278
.L2176:
	addl	%eax, %eax
	xorl	%edx, %edx
	movl	$16, %r14d
	movl	$65536, 1296(%rsp)
	movl	%eax, 1292(%rsp)
	jmp	.L2181
	.p2align 4,,10
	.p2align 3
.L2180:
	addl	$1, %edi
	movl	%edi, 32(%rsp,%r9,4)
.L2177:
	addq	$1, %rdx
	cmpq	$19, %rdx
	je	.L2279
.L2181:
	movzbl	(%r15,%rdx), %r12d
	movl	%r12d, %ecx
	testl	%r12d, %r12d
	je	.L2177
	movslq	%r12d, %r9
	movzwl	1200(%rsp,%r9,2), %r10d
	movl	32(%rsp,%r9,4), %edi
	movl	%edi, %eax
	subl	%r10d, %eax
	movzwl	1300(%rsp,%r9,2), %r10d
	addl	%r10d, %eax
	cltq
	movb	%r12b, 1332(%rsp,%rax)
	movw	%dx, 1620(%rsp,%rax,2)
	cmpl	$9, %r12d
	jg	.L2180
	movl	%edi, %r10d
	leal	(%rdi,%rdi), %eax
	movl	%r12d, %ebp
	sarl	%r10d
	andl	$43690, %eax
	sall	$9, %ebp
	andl	$21845, %r10d
	orl	%edx, %ebp
	orl	%eax, %r10d
	movl	%r10d, %eax
	sall	$2, %r10d
	sarl	$2, %eax
	andl	$52428, %r10d
	andl	$13107, %eax
	orl	%r10d, %eax
	movl	$1, %r10d
	movl	%eax, %r13d
	sall	$4, %eax
	sarl	$4, %r13d
	andl	$61680, %eax
	sall	%cl, %r10d
	movl	%r14d, %ecx
	andl	$3855, %r13d
	subl	%r12d, %ecx
	movslq	%r10d, %r10
	orl	%eax, %r13d
	movl	%r13d, %eax
	sall	$8, %r13d
	sarl	$8, %eax
	movzwl	%r13w, %r13d
	orl	%r13d, %eax
	sarl	%cl, %eax
	cltq
	.p2align 4,,10
	.p2align 3
.L2179:
	movw	%bp, (%r11,%rax,2)
	addq	%r10, %rax
	cmpl	$511, %eax
	jle	.L2179
	jmp	.L2180
	.p2align 4,,10
	.p2align 3
.L2159:
	leaq	.LC54(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L2161:
	xorl	%eax, %eax
.L2136:
	movq	2696(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L2280
	addq	$2712, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L2282:
	.cfi_restore_state
	je	.L2281
	.p2align 4,,10
	.p2align 3
.L2192:
	leaq	.LC53(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L2161
	.p2align 4,,10
	.p2align 3
.L2279:
	andl	$31, %r8d
	andl	$31, %esi
	xorl	%r13d, %r13d
	movabsq	$72340172838076673, %r12
	leal	257(%r8), %r15d
	leal	1(%rsi), %r14d
	leal	(%r15,%r14), %ebp
	jmp	.L2209
	.p2align 4,,10
	.p2align 3
.L2283:
	movslq	%r13d, %rdx
	addl	$1, %r13d
	movb	%al, 2240(%rsp,%rdx)
.L2185:
	cmpl	%r13d, %ebp
	jle	.L2282
.L2209:
	movq	%r11, %rsi
	movq	%rbx, %rdi
	call	stbi__zhuffman_decode
	cmpl	$18, %eax
	ja	.L2192
	cmpl	$15, %eax
	jle	.L2283
	movl	16(%rbx), %ecx
	movl	20(%rbx), %edx
	cmpl	$16, %eax
	je	.L2284
	cmpl	$17, %eax
	je	.L2285
	cmpl	$6, %ecx
	jle	.L2286
.L2200:
	subl	$7, %ecx
	movl	%edx, %eax
	andl	$127, %edx
	movl	%ecx, 16(%rbx)
	shrl	$7, %eax
	addl	$11, %edx
	movl	%eax, 20(%rbx)
	xorl	%eax, %eax
.L2193:
	movl	%ebp, %ecx
	subl	%r13d, %ecx
	cmpl	%edx, %ecx
	jl	.L2192
	movslq	%r13d, %rcx
	imulq	%r12, %rax
	leaq	2240(%rsp,%rcx), %rcx
	cmpl	$8, %edx
	jnb	.L2205
	testb	$4, %dl
	jne	.L2287
	testl	%edx, %edx
	je	.L2206
	movb	%al, (%rcx)
	testb	$2, %dl
	jne	.L2288
.L2206:
	addl	%edx, %r13d
	jmp	.L2185
	.p2align 4,,10
	.p2align 3
.L2205:
	leaq	8(%rcx), %rdi
	movl	%edx, %esi
	movq	%rax, (%rcx)
	andq	$-8, %rdi
	movq	%rax, -8(%rcx,%rsi)
	subq	%rdi, %rcx
	addl	%edx, %ecx
	shrl	$3, %ecx
	rep stosq
	jmp	.L2206
	.p2align 4,,10
	.p2align 3
.L2284:
	cmpl	$1, %ecx
	jle	.L2289
.L2187:
	movl	%edx, %eax
	subl	$2, %ecx
	andl	$3, %edx
	shrl	$2, %eax
	movl	%ecx, 16(%rbx)
	addl	$3, %edx
	movl	%eax, 20(%rbx)
	testl	%r13d, %r13d
	je	.L2192
	leal	-1(%r13), %eax
	cltq
	movzbl	2240(%rsp,%rax), %eax
	jmp	.L2193
	.p2align 4,,10
	.p2align 3
.L2285:
	cmpl	$2, %ecx
	jle	.L2290
.L2195:
	movl	%edx, %eax
	subl	$3, %ecx
	andl	$7, %edx
	shrl	$3, %eax
	movl	%ecx, 16(%rbx)
	addl	$3, %edx
	movl	%eax, 20(%rbx)
	xorl	%eax, %eax
	jmp	.L2193
	.p2align 4,,10
	.p2align 3
.L2276:
	movq	8(%rbx), %rdx
	jmp	.L2151
	.p2align 4,,10
	.p2align 3
.L2148:
	movq	(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L2149
	leaq	1(%rax), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rax), %eax
	sall	%cl, %eax
	orl	%eax, %r10d
.L2149:
	addl	$8, %ecx
	movl	%r10d, 20(%rbx)
	movl	%ecx, 16(%rbx)
	cmpl	$24, %ecx
	jg	.L2147
.L2151:
	movl	%r10d, %eax
	shrl	%cl, %eax
	testl	%eax, %eax
	je	.L2148
	movq	%rdx, (%rbx)
	jmp	.L2147
	.p2align 4,,10
	.p2align 3
.L2275:
	movq	8(%rbx), %rdx
	jmp	.L2146
	.p2align 4,,10
	.p2align 3
.L2143:
	movq	(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L2144
	leaq	1(%rax), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rax), %eax
	sall	%cl, %eax
	orl	%eax, %esi
.L2144:
	addl	$8, %ecx
	movl	%esi, 20(%rbx)
	movl	%ecx, 16(%rbx)
	cmpl	$24, %ecx
	jg	.L2142
.L2146:
	movl	%esi, %eax
	shrl	%cl, %eax
	testl	%eax, %eax
	je	.L2143
	movq	%rdx, (%rbx)
	jmp	.L2142
	.p2align 4,,10
	.p2align 3
.L2274:
	movq	8(%rdi), %rdx
	jmp	.L2141
	.p2align 4,,10
	.p2align 3
.L2138:
	movq	(%rbx), %rax
	cmpq	%rdx, %rax
	jnb	.L2139
	leaq	1(%rax), %rsi
	movq	%rsi, (%rbx)
	movzbl	(%rax), %eax
	sall	%cl, %eax
	orl	%eax, %r8d
.L2139:
	addl	$8, %ecx
	movl	%r8d, 20(%rbx)
	movl	%ecx, 16(%rbx)
	cmpl	$24, %ecx
	jg	.L2137
.L2141:
	movl	%r8d, %eax
	shrl	%cl, %eax
	testl	%eax, %eax
	je	.L2138
	movq	%rdx, (%rbx)
	jmp	.L2137
	.p2align 4,,10
	.p2align 3
.L2286:
	movq	8(%rbx), %rsi
	jmp	.L2204
	.p2align 4,,10
	.p2align 3
.L2201:
	movq	(%rbx), %rax
	cmpq	%rsi, %rax
	jnb	.L2202
	leaq	1(%rax), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rax), %eax
	sall	%cl, %eax
	orl	%eax, %edx
.L2202:
	addl	$8, %ecx
	movl	%edx, 20(%rbx)
	movl	%ecx, 16(%rbx)
	cmpl	$24, %ecx
	jg	.L2200
.L2204:
	movl	%edx, %eax
	shrl	%cl, %eax
	testl	%eax, %eax
	je	.L2201
	movq	%rsi, (%rbx)
	jmp	.L2200
.L2289:
	movq	8(%rbx), %rsi
	jmp	.L2191
	.p2align 4,,10
	.p2align 3
.L2188:
	movq	(%rbx), %rax
	cmpq	%rsi, %rax
	jnb	.L2189
	leaq	1(%rax), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rax), %eax
	sall	%cl, %eax
	orl	%eax, %edx
.L2189:
	addl	$8, %ecx
	movl	%edx, 20(%rbx)
	movl	%ecx, 16(%rbx)
	cmpl	$24, %ecx
	jg	.L2187
.L2191:
	movl	%edx, %eax
	shrl	%cl, %eax
	testl	%eax, %eax
	je	.L2188
	movq	%rsi, (%rbx)
	jmp	.L2187
.L2278:
	cmpl	$32768, %eax
	jle	.L2176
	jmp	.L2192
	.p2align 4,,10
	.p2align 3
.L2290:
	movq	8(%rbx), %rsi
	jmp	.L2199
	.p2align 4,,10
	.p2align 3
.L2196:
	movq	(%rbx), %rax
	cmpq	%rsi, %rax
	jnb	.L2197
	leaq	1(%rax), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rax), %eax
	sall	%cl, %eax
	orl	%eax, %edx
.L2197:
	addl	$8, %ecx
	movl	%edx, 20(%rbx)
	movl	%ecx, 16(%rbx)
	cmpl	$24, %ecx
	jg	.L2195
.L2199:
	movl	%edx, %eax
	shrl	%cl, %eax
	testl	%eax, %eax
	je	.L2196
	movq	%rsi, (%rbx)
	jmp	.L2195
.L2287:
	movl	%edx, %esi
	movl	%eax, (%rcx)
	movl	%eax, -4(%rcx,%rsi)
	jmp	.L2206
.L2281:
	leaq	2240(%rsp), %rbp
	leaq	52(%rbx), %rdi
	movl	%r15d, %edx
	movq	%rbp, %rsi
	call	stbi__zbuild_huffman
	testl	%eax, %eax
	je	.L2161
	leaq	0(%rbp,%r15), %rsi
	leaq	2072(%rbx), %rdi
	movl	%r14d, %edx
	call	stbi__zbuild_huffman
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	jmp	.L2136
.L2288:
	movl	%edx, %esi
	movw	%ax, -2(%rcx,%rsi)
	jmp	.L2206
.L2280:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE665:
	.size	stbi__compute_huffman_codes, .-stbi__compute_huffman_codes
	.p2align 4
	.type	stbi__get8, @function
stbi__get8:
.LFB599:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	192(%rdi), %rax
	cmpq	200(%rdi), %rax
	jb	.L2298
	movl	48(%rdi), %eax
	xorl	%ebp, %ebp
	testl	%eax, %eax
	jne	.L2299
	movl	%ebp, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2298:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rdi)
	movzbl	(%rax), %ebp
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%ebp, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2299:
	.cfi_restore_state
	leaq	56(%rdi), %r12
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2294
	movl	$0, 48(%rbx)
	movq	%rdx, %r12
	movb	$0, 56(%rbx)
.L2295:
	movq	%r12, 200(%rbx)
	movl	%ebp, %eax
	movq	%rdx, 192(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2294:
	.cfi_restore_state
	cltq
	movzbl	56(%rbx), %ebp
	addq	%rax, %r12
	jmp	.L2295
	.cfi_endproc
.LFE599:
	.size	stbi__get8, .-stbi__get8
	.section	.rodata.str1.1
.LC78:
	.string	"output buffer limit"
.LC79:
	.string	"bad zlib header"
.LC80:
	.string	"no preset dict"
.LC81:
	.string	"bad compression"
.LC82:
	.string	"zlib corrupt"
.LC83:
	.string	"read past buffer"
.LC84:
	.string	"bad huffman code"
.LC85:
	.string	"bad dist"
	.text
	.p2align 4
	.type	stbi__parse_zlib, @function
stbi__parse_zlib:
.LFB668:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$200, %rsp
	.cfi_def_cfa_offset 256
	movq	%fs:40, %rax
	movq	%rax, 184(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	jne	.L2687
.L2301:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movq	$0, 16(%rbx)
	leaq	stbi__zlength_extra(%rip), %rbp
	testl	%ecx, %ecx
	jle	.L2688
	.p2align 4,,10
	.p2align 3
.L2309:
	movl	%eax, %r12d
	subl	$1, %ecx
	shrl	%eax
	movl	%eax, 20(%rbx)
	andl	$1, %r12d
	movl	%ecx, 16(%rbx)
	cmpl	$1, %ecx
	jle	.L2689
.L2314:
	movl	%eax, %esi
	leal	-2(%rcx), %edx
	shrl	$2, %esi
	movl	%edx, 16(%rbx)
	movl	%esi, 20(%rbx)
	andl	$3, %eax
	je	.L2690
	cmpl	$3, %eax
	je	.L2305
	cmpl	$1, %eax
	je	.L2691
	movq	%rbx, %rdi
	call	stbi__compute_huffman_codes
	testl	%eax, %eax
	je	.L2305
	movl	16(%rbx), %edx
.L2404:
	movl	%r12d, 36(%rsp)
	movq	24(%rbx), %r14
	leaq	stbi__zdist_extra(%rip), %r13
	cmpl	$15, %edx
	jg	.L2406
	.p2align 4,,10
	.p2align 3
.L2693:
	movq	8(%rbx), %rdi
	cmpq	%rdi, (%rbx)
	jnb	.L2427
	movl	20(%rbx), %eax
	jmp	.L2412
	.p2align 4,,10
	.p2align 3
.L2408:
	movq	(%rbx), %rcx
	cmpq	%rdi, %rcx
	jnb	.L2410
	leaq	1(%rcx), %rsi
	movq	%rsi, (%rbx)
	movzbl	(%rcx), %esi
	movl	%edx, %ecx
	sall	%cl, %esi
	orl	%esi, %eax
.L2410:
	addl	$8, %edx
	movl	%eax, 20(%rbx)
	movl	%edx, 16(%rbx)
	cmpl	$24, %edx
	jg	.L2409
.L2412:
	movl	%eax, %esi
	movl	%edx, %ecx
	shrl	%cl, %esi
	testl	%esi, %esi
	je	.L2408
	movq	%rdi, (%rbx)
.L2409:
	movl	%eax, %ecx
	andl	$511, %ecx
	movzwl	52(%rbx,%rcx,2), %ecx
	movl	%ecx, %esi
	testl	%ecx, %ecx
	je	.L2413
	sarl	$9, %ecx
	movl	%esi, %r15d
	shrl	%cl, %eax
	subl	%ecx, %edx
	andl	$511, %r15d
	movl	%eax, 20(%rbx)
	movl	%edx, 16(%rbx)
	testw	$256, %si
	jne	.L2415
.L2414:
	movq	40(%rbx), %rax
	cmpq	%rax, %r14
	jnb	.L2692
.L2418:
	movb	%r15b, (%r14)
	addq	$1, %r14
.L2425:
	movl	16(%rbx), %edx
	cmpl	$15, %edx
	jle	.L2693
.L2406:
	movl	20(%rbx), %eax
	jmp	.L2409
	.p2align 4,,10
	.p2align 3
.L2466:
	movl	$6, %ecx
	movl	$10, %edi
	.p2align 4,,10
	.p2align 3
.L2416:
	sarl	%cl, %esi
	movslq	%edi, %rcx
	movzwl	1076(%rbx,%rcx,2), %r8d
	movzwl	1176(%rbx,%rcx,2), %ecx
	subl	%r8d, %esi
	addl	%ecx, %esi
	cmpl	$287, %esi
	jg	.L2427
	movslq	%esi, %rsi
	movzbl	1208(%rbx,%rsi), %ecx
	cmpl	%edi, %ecx
	jne	.L2427
	movzwl	1496(%rbx,%rsi,2), %r15d
	movl	%edi, %ecx
	subl	%edi, %edx
	shrl	%cl, %eax
	movl	%edx, 16(%rbx)
	movl	%eax, 20(%rbx)
	cmpl	$255, %r15d
	jle	.L2414
.L2415:
	cmpl	$256, %r15d
	je	.L2694
	cmpl	$285, %r15d
	jg	.L2427
	subl	$257, %r15d
	leaq	stbi__zlength_base(%rip), %rax
	movslq	%r15d, %r15
	movl	0(%rbp,%r15,4), %edi
	movl	(%rax,%r15,4), %r12d
	testl	%edi, %edi
	jne	.L2695
.L2428:
	leaq	2072(%rbx), %rsi
	movq	%rbx, %rdi
	call	stbi__zhuffman_decode
	cmpl	$29, %eax
	ja	.L2427
	cltq
	leaq	stbi__zdist_base(%rip), %rdi
	movl	(%rdi,%rax,4), %r15d
	movl	0(%r13,%rax,4), %edi
	testl	%edi, %edi
	jne	.L2696
.L2434:
	movq	32(%rbx), %rdi
	movq	%r14, %r8
	movslq	%r15d, %r9
	subq	%rdi, %r8
	cmpq	%r9, %r8
	jl	.L2697
	movslq	%r12d, %rax
	movq	40(%rbx), %rcx
	addq	%r14, %rax
	cmpq	%rax, %rcx
	jb	.L2698
.L2441:
	movq	%r14, %rcx
	subq	%r9, %rcx
	cmpl	$1, %r15d
	je	.L2699
	testl	%r12d, %r12d
	je	.L2425
	leal	-1(%r12), %eax
	cmpl	$6, %eax
	jbe	.L2449
	leaq	-1(%r9), %rsi
	cmpq	$14, %rsi
	ja	.L2700
.L2449:
	movl	%r12d, %esi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L2456:
	movzbl	(%rcx,%rax), %edx
	movb	%dl, (%r14,%rax)
	addq	$1, %rax
	cmpq	%rax, %rsi
	jne	.L2456
.L2457:
	addq	%rsi, %r14
	jmp	.L2425
	.p2align 4,,10
	.p2align 3
.L2413:
	movl	%eax, %ecx
	leal	(%rax,%rax), %esi
	sarl	%ecx
	andl	$43690, %esi
	andl	$21845, %ecx
	orl	%esi, %ecx
	movl	%ecx, %esi
	sall	$2, %ecx
	sarl	$2, %esi
	andl	$52428, %ecx
	andl	$13107, %esi
	orl	%ecx, %esi
	movl	%esi, %ecx
	sall	$4, %esi
	sarl	$4, %ecx
	andl	$61680, %esi
	andl	$3855, %ecx
	orl	%esi, %ecx
	movl	%ecx, %esi
	sall	$8, %ecx
	sarl	$8, %esi
	movzwl	%cx, %ecx
	orl	%ecx, %esi
	cmpl	1148(%rbx), %esi
	jl	.L2466
	cmpl	1152(%rbx), %esi
	jl	.L2467
	cmpl	1156(%rbx), %esi
	jl	.L2468
	cmpl	1160(%rbx), %esi
	jl	.L2469
	cmpl	1164(%rbx), %esi
	jl	.L2470
	cmpl	1168(%rbx), %esi
	jl	.L2701
.L2427:
	leaq	.LC84(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L2305:
	xorl	%eax, %eax
	jmp	.L2300
	.p2align 4,,10
	.p2align 3
.L2692:
	movl	48(%rbx), %edx
	movq	%r14, 24(%rbx)
	testl	%edx, %edx
	je	.L2442
	movq	32(%rbx), %rdi
	subq	%rdi, %r14
	cmpl	$-1, %r14d
	je	.L2420
	subq	%rdi, %rax
	leal	1(%r14), %ecx
	cmpl	%ecx, %eax
	jnb	.L2421
	testl	%eax, %eax
	jns	.L2422
	jmp	.L2420
	.p2align 4,,10
	.p2align 3
.L2424:
	testl	%eax, %eax
	js	.L2420
.L2422:
	addl	%eax, %eax
	cmpl	%ecx, %eax
	jb	.L2424
.L2421:
	movl	%eax, %r12d
	movq	%r12, %rsi
	call	realloc@PLT
	testq	%rax, %rax
	je	.L2420
	movl	%r14d, %r14d
	movq	%rax, 32(%rbx)
	addq	%rax, %r14
	addq	%r12, %rax
	movq	%r14, 24(%rbx)
	movq	%rax, 40(%rbx)
	jmp	.L2418
	.p2align 4,,10
	.p2align 3
.L2695:
	movl	16(%rbx), %eax
	movl	20(%rbx), %esi
	cmpl	%eax, %edi
	jg	.L2702
.L2429:
	subl	%edi, %eax
	movl	%edi, %ecx
	movl	%esi, %edx
	movl	%eax, 16(%rbx)
	movl	$1, %eax
	shrl	%cl, %edx
	sall	%cl, %eax
	movl	%edx, 20(%rbx)
	subl	$1, %eax
	andl	%esi, %eax
	addl	%eax, %r12d
	jmp	.L2428
	.p2align 4,,10
	.p2align 3
.L2699:
	testl	%r12d, %r12d
	je	.L2425
	movl	%r12d, %r12d
	movsbl	(%rcx), %esi
	movq	%r14, %rdi
	movq	%r12, %rdx
	addq	%r12, %r14
	call	memset@PLT
	jmp	.L2425
	.p2align 4,,10
	.p2align 3
.L2696:
	movl	16(%rbx), %eax
	movl	20(%rbx), %esi
	cmpl	%eax, %edi
	jg	.L2703
.L2435:
	subl	%edi, %eax
	movl	%edi, %ecx
	movl	%esi, %edx
	movl	%eax, 16(%rbx)
	movl	$1, %eax
	shrl	%cl, %edx
	sall	%cl, %eax
	movl	%edx, 20(%rbx)
	subl	$1, %eax
	andl	%esi, %eax
	addl	%eax, %r15d
	jmp	.L2434
	.p2align 4,,10
	.p2align 3
.L2698:
	movl	48(%rbx), %eax
	movq	%r14, 24(%rbx)
	testl	%eax, %eax
	je	.L2442
	movl	%r12d, %eax
	addl	%r8d, %eax
	jc	.L2420
	subq	%rdi, %rcx
	leal	(%r12,%r8), %esi
	movl	%ecx, %eax
	cmpl	%esi, %ecx
	jnb	.L2445
	testl	%ecx, %ecx
	jns	.L2446
	jmp	.L2420
	.p2align 4,,10
	.p2align 3
.L2447:
	testl	%eax, %eax
	js	.L2420
.L2446:
	addl	%eax, %eax
	cmpl	%esi, %eax
	jb	.L2447
.L2445:
	movl	%eax, %ecx
	movq	%r9, 24(%rsp)
	movq	%rcx, %rsi
	movq	%r8, 16(%rsp)
	movq	%rcx, 8(%rsp)
	call	realloc@PLT
	testq	%rax, %rax
	je	.L2420
	movq	16(%rsp), %r8
	movq	8(%rsp), %rcx
	movq	%rax, 32(%rbx)
	movq	24(%rsp), %r9
	movl	%r8d, %r8d
	leaq	(%rax,%r8), %r14
	addq	%rcx, %rax
	movq	%r14, 24(%rbx)
	movq	%rax, 40(%rbx)
	jmp	.L2441
	.p2align 4,,10
	.p2align 3
.L2420:
	leaq	.LC18(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2300
	.p2align 4,,10
	.p2align 3
.L2442:
	leaq	.LC78(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2300
	.p2align 4,,10
	.p2align 3
.L2467:
	movl	$11, %edi
.L2417:
	movl	$16, %ecx
	subl	%edi, %ecx
	jmp	.L2416
	.p2align 4,,10
	.p2align 3
.L2702:
	movq	8(%rbx), %r9
	jmp	.L2433
	.p2align 4,,10
	.p2align 3
.L2430:
	movq	(%rbx), %rcx
	cmpq	%r9, %rcx
	jnb	.L2431
	leaq	1(%rcx), %r8
	movq	%r8, (%rbx)
	movzbl	(%rcx), %r8d
	movl	%eax, %ecx
	sall	%cl, %r8d
	orl	%r8d, %esi
.L2431:
	addl	$8, %eax
	movl	%esi, 20(%rbx)
	movl	%eax, 16(%rbx)
	cmpl	$24, %eax
	jg	.L2429
.L2433:
	movl	%esi, %edx
	movl	%eax, %ecx
	shrl	%cl, %edx
	testl	%edx, %edx
	je	.L2430
	movq	%r9, (%rbx)
	jmp	.L2429
	.p2align 4,,10
	.p2align 3
.L2703:
	movq	8(%rbx), %r9
	jmp	.L2439
	.p2align 4,,10
	.p2align 3
.L2436:
	movq	(%rbx), %rcx
	cmpq	%r9, %rcx
	jnb	.L2437
	leaq	1(%rcx), %r8
	movq	%r8, (%rbx)
	movzbl	(%rcx), %r8d
	movl	%eax, %ecx
	sall	%cl, %r8d
	orl	%r8d, %esi
.L2437:
	addl	$8, %eax
	movl	%esi, 20(%rbx)
	movl	%eax, 16(%rbx)
	cmpl	$24, %eax
	jg	.L2435
.L2439:
	movl	%esi, %edx
	movl	%eax, %ecx
	shrl	%cl, %edx
	testl	%edx, %edx
	je	.L2436
	movq	%r9, (%rbx)
	jmp	.L2435
	.p2align 4,,10
	.p2align 3
.L2468:
	movl	$12, %edi
	jmp	.L2417
.L2469:
	movl	$13, %edi
	jmp	.L2417
.L2470:
	movl	$14, %edi
	jmp	.L2417
.L2700:
	movl	%r12d, %r10d
	cmpl	$14, %eax
	jbe	.L2471
	movl	%r12d, %esi
	xorl	%eax, %eax
	shrl	$4, %esi
	salq	$4, %rsi
	.p2align 4,,10
	.p2align 3
.L2451:
	movdqu	(%rcx,%rax), %xmm1
	movups	%xmm1, (%r14,%rax)
	addq	$16, %rax
	cmpq	%rax, %rsi
	jne	.L2451
	movl	%r12d, %eax
	movl	%r12d, %edi
	andl	$-16, %eax
	movl	%eax, %esi
	subl	%eax, %edi
	leaq	(%r14,%rsi), %r8
	addq	%rsi, %rcx
	movl	%r12d, %esi
	cmpl	%r12d, %eax
	je	.L2457
	leal	-1(%rdi), %esi
	movl	%edi, %r10d
	cmpl	$6, %esi
	jbe	.L2454
.L2450:
	movq	%rax, %rsi
	subq	%r9, %rsi
	movq	(%r14,%rsi), %rsi
	movq	%rsi, (%r14,%rax)
	movl	%r10d, %eax
	andl	$-8, %eax
	movl	%eax, %esi
	subl	%eax, %edi
	addq	%rsi, %r8
	addq	%rsi, %rcx
	andl	$7, %r10d
	movl	%r12d, %esi
	je	.L2457
.L2454:
	movzbl	(%rcx), %eax
	movl	%r12d, %esi
	movb	%al, (%r8)
	cmpl	$1, %edi
	je	.L2457
	movzbl	1(%rcx), %eax
	movb	%al, 1(%r8)
	cmpl	$2, %edi
	je	.L2457
	movzbl	2(%rcx), %eax
	movb	%al, 2(%r8)
	cmpl	$3, %edi
	je	.L2457
	movzbl	3(%rcx), %eax
	movb	%al, 3(%r8)
	cmpl	$4, %edi
	je	.L2457
	movzbl	4(%rcx), %eax
	movb	%al, 4(%r8)
	cmpl	$5, %edi
	je	.L2457
	movzbl	5(%rcx), %eax
	movb	%al, 5(%r8)
	cmpl	$6, %edi
	je	.L2457
	movzbl	6(%rcx), %eax
	addq	%rsi, %r14
	movb	%al, 6(%r8)
	jmp	.L2425
.L2701:
	movl	$15, %edi
	jmp	.L2417
.L2690:
	movl	%edx, %r8d
	andl	$7, %r8d
	jne	.L2704
.L2320:
	testl	%edx, %edx
	jle	.L2329
.L2328:
	movl	%esi, %ecx
	leal	-8(%rdx), %edi
	movb	%sil, 180(%rsp)
	shrl	$8, %ecx
	testl	%edi, %edi
	jle	.L2461
	movb	%cl, 181(%rsp)
	movl	%esi, %ecx
	shrl	$16, %ecx
	cmpl	$16, %edx
	jle	.L2461
	movb	%cl, 182(%rsp)
	shrl	$24, %esi
	cmpl	$24, %edx
	jle	.L2462
	movb	%sil, 183(%rsp)
.L2330:
	leal	-1(%rdx), %ecx
	movl	%eax, 20(%rbx)
	shrl	$3, %ecx
	movl	%ecx, %edx
	negl	%edx
	leal	(%rdi,%rdx,8), %edx
	movl	%edx, 16(%rbx)
	testl	%edx, %edx
	jne	.L2334
	leal	1(%rcx), %edx
	cmpl	$3, %ecx
	je	.L2343
	movq	8(%rbx), %r8
	movq	(%rbx), %rax
	addl	$2, %ecx
	cmpq	%r8, %rax
	jb	.L2336
	movslq	%edx, %rdx
	movl	%ecx, %esi
	movb	$0, 180(%rsp,%rdx)
	cmpl	$4, %ecx
	je	.L2343
.L2337:
	movslq	%esi, %rax
	movl	$4, %edx
	leaq	180(%rsp,%rax), %rdi
	subl	%esi, %edx
	je	.L2343
	xorl	%eax, %eax
.L2344:
	movl	%eax, %ecx
	addl	$1, %eax
	movb	$0, (%rdi,%rcx)
	cmpl	%edx, %eax
	jb	.L2344
.L2343:
	movzbl	181(%rsp), %eax
	movzbl	180(%rsp), %edx
	movzbl	182(%rsp), %ecx
	sall	$8, %eax
	addl	%edx, %eax
	movzbl	183(%rsp), %edx
	sall	$8, %edx
	addl	%ecx, %edx
	movl	%eax, %ecx
	xorl	$65535, %ecx
	cmpl	%ecx, %edx
	jne	.L2334
	movq	(%rbx), %rsi
	movslq	%eax, %r15
	leaq	(%rsi,%r15), %rdx
	cmpq	%rdx, 8(%rbx)
	jb	.L2705
	movq	24(%rbx), %rdi
	movq	40(%rbx), %rcx
	leaq	(%rdi,%r15), %rdx
	cmpq	%rdx, %rcx
	jnb	.L2347
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L2465
	movq	32(%rbx), %r8
	subq	%r8, %rdi
	movq	%rdi, %r14
	movl	%eax, %edi
	addl	%r14d, %edi
	jc	.L2351
	subq	%r8, %rcx
	addl	%r14d, %eax
	movl	%ecx, %edx
	cmpl	%eax, %ecx
	jnb	.L2352
	testl	%ecx, %ecx
	jns	.L2353
.L2351:
	leaq	.LC18(%rip), %rax
.L2684:
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2300
.L2354:
	testl	%edx, %edx
	js	.L2351
.L2353:
	addl	%edx, %edx
	cmpl	%eax, %edx
	jb	.L2354
.L2352:
	movl	%edx, %r13d
	movq	%r8, %rdi
	movq	%r13, %rsi
	call	realloc@PLT
	testq	%rax, %rax
	je	.L2351
	movl	%r14d, %edi
	movq	%rax, 32(%rbx)
	movq	(%rbx), %rsi
	addq	%rax, %rdi
	addq	%r13, %rax
	movq	%rdi, 24(%rbx)
	movq	%rax, 40(%rbx)
.L2347:
	movq	%r15, %rdx
	call	memcpy@PLT
	addq	%r15, (%rbx)
	addq	%r15, 24(%rbx)
	testl	%r12d, %r12d
	jne	.L2472
.L2710:
	movl	16(%rbx), %ecx
	movl	20(%rbx), %eax
	testl	%ecx, %ecx
	jg	.L2309
.L2688:
	movq	8(%rbx), %rsi
	jmp	.L2313
	.p2align 4,,10
	.p2align 3
.L2310:
	movq	(%rbx), %rdx
	cmpq	%rsi, %rdx
	jnb	.L2311
	leaq	1(%rdx), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rdx), %edx
	sall	%cl, %edx
	orl	%edx, %eax
.L2311:
	addl	$8, %ecx
	movl	%eax, 20(%rbx)
	movl	%ecx, 16(%rbx)
	cmpl	$24, %ecx
	jg	.L2309
.L2313:
	movl	%eax, %edx
	shrl	%cl, %edx
	testl	%edx, %edx
	je	.L2310
	movq	%rsi, (%rbx)
	jmp	.L2309
.L2689:
	movq	8(%rbx), %rsi
	jmp	.L2318
	.p2align 4,,10
	.p2align 3
.L2315:
	movq	(%rbx), %rdx
	cmpq	%rsi, %rdx
	jnb	.L2316
	leaq	1(%rdx), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rdx), %edx
	sall	%cl, %edx
	orl	%edx, %eax
.L2316:
	addl	$8, %ecx
	movl	%eax, 20(%rbx)
	movl	%ecx, 16(%rbx)
	cmpl	$24, %ecx
	jg	.L2314
.L2318:
	movl	%eax, %edx
	shrl	%cl, %edx
	testl	%edx, %edx
	je	.L2315
	movq	%rsi, (%rbx)
	jmp	.L2314
.L2334:
	leaq	.LC82(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2300
.L2691:
	leaq	60(%rbx), %rdi
	movl	%ebx, %eax
	pxor	%xmm0, %xmm0
	movl	$0, 176(%rsp)
	andq	$-8, %rdi
	movaps	%xmm0, 144(%rsp)
	subl	%edi, %eax
	movaps	%xmm0, 112(%rsp)
	leal	1076(%rax), %ecx
	xorl	%eax, %eax
	movaps	%xmm0, 128(%rsp)
	shrl	$3, %ecx
	movaps	%xmm0, 160(%rsp)
	movq	$0, 52(%rbx)
	movq	$0, 1068(%rbx)
	rep stosq
	leaq	1+stbi__zdefault_length(%rip), %rax
	movl	$1, 144(%rsp)
	leaq	287(%rax), %rsi
	.p2align 4,,10
	.p2align 3
.L2358:
	movzbl	(%rax), %ecx
	addq	$1, %rax
	addl	$1, 112(%rsp,%rcx,4)
	cmpq	%rax, %rsi
	jne	.L2358
	movl	116(%rsp), %esi
	movl	$0, 112(%rsp)
	cmpl	$2, %esi
	jg	.L2382
	movl	120(%rsp), %ecx
	cmpl	$4, %ecx
	jg	.L2382
	movl	124(%rsp), %r8d
	cmpl	$8, %r8d
	jg	.L2382
	movl	128(%rsp), %r11d
	cmpl	$16, %r11d
	jg	.L2382
	movl	132(%rsp), %edi
	cmpl	$32, %edi
	jg	.L2382
	movl	136(%rsp), %r10d
	cmpl	$64, %r10d
	jg	.L2382
	movl	140(%rsp), %r9d
	cmpl	$128, %r9d
	jg	.L2382
	movl	144(%rsp), %r14d
	cmpl	$256, %r14d
	jg	.L2382
	movl	148(%rsp), %eax
	movl	%eax, 8(%rsp)
	cmpl	$512, %eax
	jg	.L2382
	movl	152(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$1024, %eax
	jg	.L2382
	movl	156(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$2048, %eax
	jg	.L2382
	movl	160(%rsp), %eax
	movl	%eax, 36(%rsp)
	cmpl	$4096, %eax
	jg	.L2382
	movl	164(%rsp), %eax
	movl	%eax, 40(%rsp)
	cmpl	$8192, %eax
	jg	.L2382
	movl	168(%rsp), %r15d
	cmpl	$16384, %r15d
	jg	.L2382
	movl	172(%rsp), %eax
	movl	%eax, 44(%rsp)
	cmpl	$32768, %eax
	jg	.L2382
	xorl	%eax, %eax
	movl	$0, 52(%rsp)
	movw	%ax, 1078(%rbx)
	xorl	%eax, %eax
	movw	%ax, 1178(%rbx)
	movl	%esi, %eax
	sall	$15, %eax
	movw	%si, 1180(%rbx)
	movl	%eax, 1112(%rbx)
	leal	(%rsi,%rsi), %eax
	movl	%eax, 56(%rsp)
	movw	%ax, 1080(%rbx)
	addl	%ecx, %eax
	testl	%ecx, %ecx
	je	.L2475
	cmpl	$4, %eax
	jg	.L2384
.L2475:
	movl	%eax, %r13d
	addl	%esi, %ecx
	addl	%eax, %eax
	sall	$14, %r13d
	movl	%eax, 60(%rsp)
	movw	%ax, 1082(%rbx)
	addl	%r8d, %eax
	movl	%r13d, 1116(%rbx)
	movw	%cx, 1182(%rbx)
	testl	%r8d, %r8d
	je	.L2476
	cmpl	$8, %eax
	jg	.L2384
.L2476:
	movl	%eax, %esi
	addl	%eax, %eax
	addl	%r8d, %ecx
	movl	%eax, 64(%rsp)
	sall	$13, %esi
	movw	%ax, 1084(%rbx)
	addl	%r11d, %eax
	movl	%esi, 1120(%rbx)
	movw	%cx, 1184(%rbx)
	cmpl	$16, %eax
	jle	.L2477
	testl	%r11d, %r11d
	jne	.L2384
.L2477:
	movl	%eax, %esi
	addl	%r11d, %ecx
	addl	%eax, %eax
	sall	$12, %esi
	movl	%eax, 68(%rsp)
	movw	%ax, 1086(%rbx)
	addl	%edi, %eax
	movl	%esi, 1124(%rbx)
	movw	%cx, 1186(%rbx)
	testl	%edi, %edi
	je	.L2478
	cmpl	$32, %eax
	jg	.L2384
.L2478:
	movl	%eax, %esi
	addl	%eax, %eax
	addl	%edi, %ecx
	movl	%eax, 72(%rsp)
	sall	$11, %esi
	movw	%ax, 1088(%rbx)
	addl	%r10d, %eax
	movl	%esi, 1128(%rbx)
	movw	%cx, 1188(%rbx)
	cmpl	$64, %eax
	jle	.L2479
	testl	%r10d, %r10d
	jne	.L2384
.L2479:
	movl	%eax, %esi
	addl	%r10d, %ecx
	addl	%eax, %eax
	sall	$10, %esi
	movl	%eax, 76(%rsp)
	movw	%ax, 1090(%rbx)
	addl	%r9d, %eax
	movl	%esi, 1132(%rbx)
	movw	%cx, 1190(%rbx)
	testl	%r9d, %r9d
	je	.L2480
	cmpl	$128, %eax
	jg	.L2384
.L2480:
	movl	%eax, %esi
	addl	%eax, %eax
	addl	%r9d, %ecx
	movl	%eax, 80(%rsp)
	sall	$9, %esi
	movw	%ax, 1092(%rbx)
	addl	%r14d, %eax
	movl	%esi, 1136(%rbx)
	movw	%cx, 1192(%rbx)
	cmpl	$256, %eax
	jle	.L2481
	testl	%r14d, %r14d
	jne	.L2384
.L2481:
	movl	%eax, %esi
	movl	8(%rsp), %edi
	addl	%eax, %eax
	addl	%r14d, %ecx
	sall	$8, %esi
	movl	%eax, 84(%rsp)
	movw	%ax, 1094(%rbx)
	addl	%edi, %eax
	movl	%esi, 1140(%rbx)
	movw	%cx, 1194(%rbx)
	testl	%edi, %edi
	je	.L2482
	cmpl	$512, %eax
	jg	.L2384
.L2482:
	movl	8(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	movl	%eax, 88(%rsp)
	sall	$7, %esi
	addl	%edi, %ecx
	movl	16(%rsp), %edi
	movw	%ax, 1096(%rbx)
	movl	%esi, 1144(%rbx)
	addl	%edi, %eax
	movw	%cx, 1196(%rbx)
	cmpl	$1024, %eax
	jle	.L2483
	testl	%edi, %edi
	jne	.L2384
.L2483:
	movl	16(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	sall	$6, %esi
	movl	%eax, 92(%rsp)
	addl	%edi, %ecx
	movl	24(%rsp), %edi
	movw	%ax, 1098(%rbx)
	movl	%esi, 1148(%rbx)
	movw	%cx, 1198(%rbx)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2484
	cmpl	$2048, %eax
	jg	.L2384
.L2484:
	movl	24(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	sall	$5, %esi
	movl	%eax, 96(%rsp)
	addl	%edi, %ecx
	movl	36(%rsp), %edi
	movw	%ax, 1100(%rbx)
	movl	%esi, 1152(%rbx)
	movw	%cx, 1200(%rbx)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2485
	cmpl	$4096, %eax
	jg	.L2384
.L2485:
	movl	36(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	movl	%eax, 100(%rsp)
	sall	$4, %esi
	addl	%edi, %ecx
	movl	40(%rsp), %edi
	movw	%ax, 1102(%rbx)
	movl	%esi, 1156(%rbx)
	addl	%edi, %eax
	movw	%cx, 1202(%rbx)
	cmpl	$8192, %eax
	jle	.L2486
	testl	%edi, %edi
	jne	.L2384
.L2486:
	movl	40(%rsp), %edi
	leal	0(,%rax,8), %esi
	addl	%eax, %eax
	movl	%eax, 104(%rsp)
	movw	%ax, 1104(%rbx)
	addl	%edi, %ecx
	addl	%r15d, %eax
	movl	%esi, 1160(%rbx)
	movw	%cx, 1204(%rbx)
	cmpl	$16384, %eax
	jle	.L2487
	testl	%r15d, %r15d
	jne	.L2384
.L2487:
	movl	44(%rsp), %edi
	leal	0(,%rax,4), %esi
	addl	%r15d, %ecx
	addl	%eax, %eax
	movl	%eax, 108(%rsp)
	movw	%ax, 1106(%rbx)
	addl	%edi, %eax
	movl	%esi, 1164(%rbx)
	movw	%cx, 1206(%rbx)
	testl	%edi, %edi
	je	.L2488
	cmpl	$32768, %eax
	jg	.L2384
.L2488:
	addl	%eax, %eax
	xorl	%esi, %esi
	movl	$1, %r14d
	movl	$16, %r15d
	movl	%eax, 1168(%rbx)
	leaq	stbi__zdefault_length(%rip), %r13
	movl	$65536, 1172(%rbx)
	jmp	.L2376
.L2380:
	addl	$1, %r8d
	movl	%r8d, 48(%rsp,%r9,4)
.L2377:
	addq	$1, %rsi
	cmpq	$288, %rsi
	je	.L2706
.L2376:
	movzbl	0(%r13,%rsi), %edi
	movl	%edi, %ecx
	testl	%edi, %edi
	je	.L2377
	movslq	%edi, %r9
	movzwl	1076(%rbx,%r9,2), %r10d
	movl	48(%rsp,%r9,4), %r8d
	movl	%r8d, %eax
	subl	%r10d, %eax
	movzwl	1176(%rbx,%r9,2), %r10d
	addl	%r10d, %eax
	cltq
	movb	%dil, 1208(%rbx,%rax)
	movw	%si, 1496(%rbx,%rax,2)
	cmpl	$9, %edi
	jg	.L2380
	movl	%r8d, %r10d
	leal	(%r8,%r8), %eax
	movl	%edi, %r11d
	sarl	%r10d
	andl	$43690, %eax
	sall	$9, %r11d
	andl	$21845, %r10d
	orl	%esi, %r11d
	orl	%r10d, %eax
	movl	%eax, %r10d
	sall	$2, %eax
	sarl	$2, %r10d
	andl	$52428, %eax
	andl	$13107, %r10d
	orl	%r10d, %eax
	movl	%eax, %r10d
	sall	$4, %eax
	sarl	$4, %r10d
	andl	$61680, %eax
	andl	$3855, %r10d
	orl	%r10d, %eax
	movl	%eax, %r10d
	sall	$8, %eax
	sarl	$8, %r10d
	movzwl	%ax, %eax
	movl	%r10d, 8(%rsp)
	movl	%r14d, %r10d
	sall	%cl, %r10d
	movl	8(%rsp), %ecx
	movslq	%r10d, %r10
	orl	%ecx, %eax
	movl	%r15d, %ecx
	subl	%edi, %ecx
	sarl	%cl, %eax
	cltq
	.p2align 4,,10
	.p2align 3
.L2379:
	movw	%r11w, 52(%rbx,%rax,2)
	addq	%r10, %rax
	cmpl	$511, %eax
	jle	.L2379
	jmp	.L2380
.L2706:
	pxor	%xmm0, %xmm0
	leaq	2072(%rbx), %rsi
	xorl	%eax, %eax
	movl	$128, %ecx
	movq	%rsi, %rdi
	movaps	%xmm0, 128(%rsp)
	rep stosq
	leaq	1+stbi__zdefault_distance(%rip), %rax
	movl	$0, 176(%rsp)
	movl	$1, 132(%rsp)
	leaq	31(%rax), %rsi
	movaps	%xmm0, 112(%rsp)
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm0, 160(%rsp)
	.p2align 4,,10
	.p2align 3
.L2381:
	movzbl	(%rax), %ecx
	addq	$1, %rax
	addl	$1, 112(%rsp,%rcx,4)
	cmpq	%rax, %rsi
	jne	.L2381
	movl	116(%rsp), %edi
	movl	$0, 112(%rsp)
	cmpl	$2, %edi
	jg	.L2382
	movl	120(%rsp), %ecx
	cmpl	$4, %ecx
	jg	.L2382
	movl	124(%rsp), %r11d
	cmpl	$8, %r11d
	jg	.L2382
	movl	128(%rsp), %r8d
	cmpl	$16, %r8d
	jg	.L2382
	movl	132(%rsp), %r10d
	cmpl	$32, %r10d
	jg	.L2382
	movl	136(%rsp), %r9d
	cmpl	$64, %r9d
	jg	.L2382
	movl	140(%rsp), %esi
	cmpl	$128, %esi
	jg	.L2382
	movl	144(%rsp), %r14d
	cmpl	$256, %r14d
	jg	.L2382
	movl	148(%rsp), %eax
	movl	%eax, 8(%rsp)
	cmpl	$512, %eax
	jg	.L2382
	movl	152(%rsp), %eax
	movl	%eax, 16(%rsp)
	cmpl	$1024, %eax
	jg	.L2382
	movl	156(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$2048, %eax
	jg	.L2382
	movl	160(%rsp), %eax
	movl	%eax, 36(%rsp)
	cmpl	$4096, %eax
	jg	.L2382
	movl	164(%rsp), %eax
	movl	%eax, 40(%rsp)
	cmpl	$8192, %eax
	jg	.L2382
	movl	168(%rsp), %r15d
	cmpl	$16384, %r15d
	jg	.L2382
	movl	172(%rsp), %eax
	movl	%eax, 44(%rsp)
	cmpl	$32768, %eax
	jg	.L2382
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	movl	$0, 52(%rsp)
	movw	%ax, 3198(%rbx)
	movl	%edi, %eax
	sall	$15, %eax
	movw	%r13w, 3098(%rbx)
	movl	%eax, 3132(%rbx)
	leal	(%rdi,%rdi), %eax
	movl	%eax, 56(%rsp)
	movw	%ax, 3100(%rbx)
	addl	%ecx, %eax
	movw	%di, 3200(%rbx)
	cmpl	$4, %eax
	jle	.L2489
	testl	%ecx, %ecx
	jne	.L2384
.L2489:
	movl	%eax, %r13d
	addl	%eax, %eax
	addl	%edi, %ecx
	movl	%eax, 60(%rsp)
	sall	$14, %r13d
	movw	%ax, 3102(%rbx)
	addl	%r11d, %eax
	movl	%r13d, 3136(%rbx)
	movw	%cx, 3202(%rbx)
	cmpl	$8, %eax
	jle	.L2490
	testl	%r11d, %r11d
	jne	.L2384
.L2490:
	movl	%eax, %edi
	addl	%r11d, %ecx
	addl	%eax, %eax
	sall	$13, %edi
	movl	%eax, 64(%rsp)
	movw	%ax, 3104(%rbx)
	addl	%r8d, %eax
	movl	%edi, 3140(%rbx)
	movw	%cx, 3204(%rbx)
	testl	%r8d, %r8d
	je	.L2491
	cmpl	$16, %eax
	jg	.L2384
.L2491:
	movl	%eax, %edi
	addl	%eax, %eax
	addl	%r8d, %ecx
	movl	%eax, 68(%rsp)
	sall	$12, %edi
	movw	%ax, 3106(%rbx)
	addl	%r10d, %eax
	movl	%edi, 3144(%rbx)
	movw	%cx, 3206(%rbx)
	cmpl	$32, %eax
	jle	.L2492
	testl	%r10d, %r10d
	jne	.L2384
.L2492:
	movl	%eax, %edi
	addl	%r10d, %ecx
	addl	%eax, %eax
	sall	$11, %edi
	movl	%eax, 72(%rsp)
	movw	%ax, 3108(%rbx)
	addl	%r9d, %eax
	movl	%edi, 3148(%rbx)
	movw	%cx, 3208(%rbx)
	testl	%r9d, %r9d
	je	.L2493
	cmpl	$64, %eax
	jg	.L2384
.L2493:
	movl	%eax, %edi
	addl	%eax, %eax
	sall	$10, %edi
	movl	%eax, 76(%rsp)
	movl	%edi, 3152(%rbx)
	leal	(%rcx,%r9), %edi
	movw	%ax, 3110(%rbx)
	addl	%esi, %eax
	movw	%di, 3210(%rbx)
	testl	%esi, %esi
	je	.L2494
	cmpl	$128, %eax
	jg	.L2384
.L2494:
	movl	%eax, %ecx
	addl	%eax, %eax
	addl	%edi, %esi
	movl	%eax, 80(%rsp)
	sall	$9, %ecx
	movw	%ax, 3112(%rbx)
	addl	%r14d, %eax
	movl	%ecx, 3156(%rbx)
	movw	%si, 3212(%rbx)
	cmpl	$256, %eax
	jle	.L2495
	testl	%r14d, %r14d
	jne	.L2384
.L2495:
	movl	%eax, %ecx
	movl	8(%rsp), %edi
	addl	%eax, %eax
	sall	$8, %ecx
	movl	%eax, 84(%rsp)
	movl	%ecx, 3160(%rbx)
	leal	(%rsi,%r14), %ecx
	movw	%ax, 3114(%rbx)
	addl	%edi, %eax
	movw	%cx, 3214(%rbx)
	cmpl	$512, %eax
	jle	.L2496
	testl	%edi, %edi
	jne	.L2384
.L2496:
	movl	8(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	sall	$7, %esi
	movl	%eax, 88(%rsp)
	addl	%edi, %ecx
	movl	16(%rsp), %edi
	movw	%ax, 3116(%rbx)
	movl	%esi, 3164(%rbx)
	movw	%cx, 3216(%rbx)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2497
	cmpl	$1024, %eax
	jg	.L2384
.L2497:
	movl	16(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	movl	%eax, 92(%rsp)
	sall	$6, %esi
	addl	%edi, %ecx
	movl	24(%rsp), %edi
	movw	%ax, 3118(%rbx)
	movl	%esi, 3168(%rbx)
	addl	%edi, %eax
	movw	%cx, 3218(%rbx)
	cmpl	$2048, %eax
	jle	.L2498
	testl	%edi, %edi
	jne	.L2384
.L2498:
	movl	24(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	sall	$5, %esi
	movl	%eax, 96(%rsp)
	addl	%edi, %ecx
	movl	36(%rsp), %edi
	movw	%ax, 3120(%rbx)
	movl	%esi, 3172(%rbx)
	movw	%cx, 3220(%rbx)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2499
	cmpl	$4096, %eax
	jg	.L2384
.L2499:
	movl	36(%rsp), %edi
	movl	%eax, %esi
	addl	%eax, %eax
	sall	$4, %esi
	movl	%eax, 100(%rsp)
	addl	%edi, %ecx
	movl	40(%rsp), %edi
	movw	%ax, 3122(%rbx)
	movl	%esi, 3176(%rbx)
	movw	%cx, 3222(%rbx)
	addl	%edi, %eax
	testl	%edi, %edi
	je	.L2500
	cmpl	$8192, %eax
	jg	.L2384
.L2500:
	movl	40(%rsp), %edi
	leal	0(,%rax,8), %esi
	addl	%eax, %eax
	movl	%eax, 104(%rsp)
	addl	%edi, %ecx
	movw	%ax, 3124(%rbx)
	addl	%r15d, %eax
	movl	%esi, 3180(%rbx)
	movw	%cx, 3224(%rbx)
	testl	%r15d, %r15d
	je	.L2501
	cmpl	$16384, %eax
	jg	.L2384
.L2501:
	movl	44(%rsp), %edi
	leal	0(,%rax,4), %esi
	addl	%eax, %eax
	addl	%r15d, %ecx
	movl	%eax, 108(%rsp)
	movw	%ax, 3126(%rbx)
	addl	%edi, %eax
	movl	%esi, 3184(%rbx)
	movw	%cx, 3226(%rbx)
	cmpl	$32768, %eax
	jle	.L2502
	testl	%edi, %edi
	jne	.L2384
.L2502:
	addl	%eax, %eax
	xorl	%esi, %esi
	movl	$1, %r14d
	movl	$16, %r15d
	movl	%eax, 3188(%rbx)
	leaq	stbi__zdefault_distance(%rip), %r13
	movl	$65536, 3192(%rbx)
	jmp	.L2399
.L2403:
	addl	$1, %r8d
	movl	%r8d, 48(%rsp,%r9,4)
.L2400:
	addq	$1, %rsi
	cmpq	$32, %rsi
	je	.L2404
.L2399:
	movzbl	0(%r13,%rsi), %edi
	movl	%edi, %ecx
	testl	%edi, %edi
	je	.L2400
	movslq	%edi, %r9
	movzwl	3096(%rbx,%r9,2), %r10d
	movl	48(%rsp,%r9,4), %r8d
	movl	%r8d, %eax
	subl	%r10d, %eax
	movzwl	3196(%rbx,%r9,2), %r10d
	addl	%r10d, %eax
	cltq
	movb	%dil, 3228(%rbx,%rax)
	movw	%si, 3516(%rbx,%rax,2)
	cmpl	$9, %edi
	jg	.L2403
	movl	%r8d, %r10d
	leal	(%r8,%r8), %eax
	movl	%edi, %r11d
	sarl	%r10d
	andl	$43690, %eax
	sall	$9, %r11d
	andl	$21845, %r10d
	orl	%esi, %r11d
	orl	%r10d, %eax
	movl	%eax, %r10d
	sall	$2, %eax
	sarl	$2, %r10d
	andl	$52428, %eax
	andl	$13107, %r10d
	orl	%r10d, %eax
	movl	%eax, %r10d
	sall	$4, %eax
	sarl	$4, %r10d
	andl	$61680, %eax
	andl	$3855, %r10d
	orl	%r10d, %eax
	movl	%eax, %r10d
	sall	$8, %eax
	sarl	$8, %r10d
	movzwl	%ax, %eax
	movl	%r10d, 8(%rsp)
	movl	%r14d, %r10d
	sall	%cl, %r10d
	movl	8(%rsp), %ecx
	movslq	%r10d, %r10
	orl	%ecx, %eax
	movl	%r15d, %ecx
	subl	%edi, %ecx
	sarl	%cl, %eax
	cltq
	.p2align 4,,10
	.p2align 3
.L2402:
	movw	%r11w, 2072(%rbx,%rax,2)
	addq	%r10, %rax
	cmpl	$511, %eax
	jle	.L2402
	jmp	.L2403
.L2382:
	leaq	.LC54(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2300
.L2329:
	jne	.L2334
	movq	8(%rbx), %r8
	movq	(%rbx), %rax
	cmpq	%r8, %rax
	jnb	.L2707
	movl	$1, %ecx
.L2336:
	leaq	1(%rax), %rdi
	movslq	%edx, %rsi
	movq	%rdi, (%rbx)
	movzbl	(%rax), %r9d
	movb	%r9b, 180(%rsp,%rsi)
	cmpl	$4, %ecx
	je	.L2343
	leal	2(%rdx), %esi
	cmpq	%r8, %rdi
	jb	.L2708
	movslq	%ecx, %rcx
	movb	$0, 180(%rsp,%rcx)
	cmpl	$4, %esi
	jne	.L2337
	jmp	.L2343
.L2708:
	leaq	2(%rax), %rdi
	movslq	%ecx, %rcx
	movq	%rdi, (%rbx)
	movzbl	1(%rax), %r9d
	movb	%r9b, 180(%rsp,%rcx)
	cmpl	$4, %esi
	je	.L2343
	addl	$3, %edx
	cmpq	%r8, %rdi
	jb	.L2709
	movslq	%esi, %rsi
	movb	$0, 180(%rsp,%rsi)
	movl	$3, %esi
	cmpl	$4, %edx
	jne	.L2337
	jmp	.L2343
	.p2align 4,,10
	.p2align 3
.L2694:
	movl	36(%rsp), %r12d
	movq	%r14, 24(%rbx)
	testl	%r12d, %r12d
	je	.L2710
.L2472:
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L2300:
	movq	184(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L2711
	addq	$200, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L2704:
	.cfi_restore_state
	cmpl	%r8d, %edx
	jl	.L2712
.L2321:
	movl	%r8d, %ecx
	subl	%r8d, %edx
	shrl	%cl, %esi
	movl	%edx, 16(%rbx)
	movl	%esi, 20(%rbx)
	jmp	.L2320
.L2697:
	leaq	.LC85(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2300
.L2709:
	leaq	3(%rax), %rcx
	movslq	%esi, %rsi
	movq	%rcx, (%rbx)
	movzbl	2(%rax), %edi
	movb	%dil, 180(%rsp,%rsi)
	cmpl	$4, %edx
	je	.L2343
	xorl	%edx, %edx
	cmpq	%r8, %rcx
	jnb	.L2342
	leaq	4(%rax), %rdx
	movq	%rdx, (%rbx)
	movzbl	3(%rax), %edx
.L2342:
	movb	%dl, 183(%rsp)
	jmp	.L2343
.L2461:
	movl	%ecx, %eax
	jmp	.L2330
.L2384:
	leaq	.LC53(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2300
.L2471:
	movq	%r14, %r8
	movl	%r12d, %edi
	xorl	%eax, %eax
	jmp	.L2450
.L2707:
	movb	$0, 180(%rsp)
	movl	$1, %esi
	jmp	.L2337
.L2712:
	movq	8(%rbx), %r9
	movl	%edx, %ecx
	jmp	.L2327
.L2322:
	movq	(%rbx), %rdx
	cmpq	%r9, %rdx
	jnb	.L2323
	leaq	1(%rdx), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rdx), %edx
	sall	%cl, %edx
	orl	%edx, %esi
.L2323:
	addl	$8, %ecx
	movl	%esi, 20(%rbx)
	movl	%ecx, 16(%rbx)
	cmpl	$24, %ecx
	jg	.L2713
.L2327:
	movl	%esi, %edx
	shrl	%cl, %edx
	testl	%edx, %edx
	je	.L2322
	movq	%r9, (%rbx)
	movl	%ecx, %edx
	jmp	.L2321
.L2705:
	leaq	.LC83(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2300
.L2462:
	movl	%esi, %eax
	jmp	.L2330
.L2687:
	movq	(%rdi), %rdx
	movq	8(%rdi), %rsi
	cmpq	%rsi, %rdx
	jnb	.L2306
	leaq	1(%rdx), %rdi
	movq	%rdi, (%rbx)
	movzbl	(%rdx), %eax
	movl	%eax, %ecx
	cmpq	%rsi, %rdi
	jnb	.L2306
	leaq	2(%rdx), %rdi
	movq	%rdi, (%rbx)
	movzbl	1(%rdx), %r8d
	movl	%r8d, %edx
	cmpq	%rsi, %rdi
	jnb	.L2306
	sall	$8, %eax
	addl	%r8d, %eax
	imull	$-1108378657, %eax, %eax
	cmpl	$138547332, %eax
	ja	.L2306
	andl	$32, %edx
	jne	.L2714
	andl	$15, %ecx
	cmpb	$8, %cl
	je	.L2301
	leaq	.LC81(%rip), %rax
	jmp	.L2684
.L2713:
	movl	%ecx, %edx
	movl	%r8d, %ecx
	shrl	%cl, %esi
	subl	%r8d, %edx
	movl	%esi, 20(%rbx)
	movl	%edx, 16(%rbx)
	jmp	.L2328
.L2306:
	leaq	.LC79(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2300
.L2465:
	leaq	.LC78(%rip), %rax
	jmp	.L2684
.L2714:
	leaq	.LC80(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L2300
.L2711:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE668:
	.size	stbi__parse_zlib, .-stbi__parse_zlib
	.section	.rodata.str1.1
.LC86:
	.string	"bad file"
	.text
	.p2align 4
	.type	stbi__readval, @function
stbi__readval:
.LFB714:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	4(%rdx), %rcx
	movl	%esi, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$128, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
.L2727:
	testl	%r12d, %r15d
	je	.L2716
	cmpq	$0, 16(%rbx)
	je	.L2721
	movq	%rcx, (%rsp)
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	movq	(%rsp), %rcx
	testl	%eax, %eax
	je	.L2720
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L2718
.L2721:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L2718
.L2728:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r14d
.L2724:
	movb	%r14b, 0(%rbp)
.L2716:
	addq	$1, %rbp
	sarl	%r12d
	cmpq	%rcx, %rbp
	jne	.L2727
.L2734:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2720:
	.cfi_restore_state
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L2728
	movl	48(%rbx), %eax
	xorl	%r14d, %r14d
	testl	%eax, %eax
	je	.L2724
	leaq	56(%rbx), %rsi
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rcx, 8(%rsp)
	movq	%rsi, (%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	(%rsp), %rsi
	leaq	57(%rbx), %rdx
	movq	8(%rsp), %rcx
	jne	.L2725
	movl	$0, 48(%rbx)
	movq	%rdx, %rsi
	movb	$0, 56(%rbx)
.L2726:
	movq	%rsi, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L2724
	.p2align 4,,10
	.p2align 3
.L2718:
	leaq	.LC86(%rip), %rax
	xorl	%r13d, %r13d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L2734
	.p2align 4,,10
	.p2align 3
.L2725:
	cltq
	movzbl	56(%rbx), %r14d
	addq	%rax, %rsi
	jmp	.L2726
	.cfi_endproc
.LFE714:
	.size	stbi__readval, .-stbi__readval
	.p2align 4
	.type	stbi__get16le, @function
stbi__get16le:
.LFB605:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	192(%rdi), %rdx
	movq	%rdi, %rbx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L2748
	movl	48(%rdi), %r12d
	testl	%r12d, %r12d
	jne	.L2749
.L2736:
	movl	%r12d, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2748:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %r12d
.L2738:
	cmpq	%rax, %rcx
	jnb	.L2741
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rcx), %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	sall	$8, %eax
	addl	%eax, %r12d
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2749:
	.cfi_restore_state
	leaq	56(%rdi), %rbp
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rcx
	movslq	%eax, %r12
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r12d, %r12d
	jne	.L2740
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
.L2741:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L2736
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2742
	movl	$0, 48(%rbx)
	movq	%rdx, %rbp
	movb	$0, 56(%rbx)
.L2743:
	movq	%rbp, 200(%rbx)
	movl	%r12d, %eax
	movq	%rdx, 192(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2742:
	.cfi_restore_state
	cltq
	addq	%rax, %rbp
	movzbl	56(%rbx), %eax
	sall	$8, %eax
	addl	%eax, %r12d
	jmp	.L2743
	.p2align 4,,10
	.p2align 3
.L2740:
	leaq	0(%rbp,%r12), %rax
	movq	%rcx, 192(%rbx)
	movzbl	56(%rbx), %r12d
	movq	%rax, 200(%rbx)
	jmp	.L2738
	.cfi_endproc
.LFE605:
	.size	stbi__get16le, .-stbi__get16le
	.p2align 4
	.type	stbi__get16be, @function
stbi__get16be:
.LFB603:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	192(%rdi), %rdx
	movq	%rdi, %rbx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L2762
	movl	48(%rdi), %ebp
	testl	%ebp, %ebp
	jne	.L2763
.L2750:
	movl	%ebp, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2762:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %ebp
	sall	$8, %ebp
.L2752:
	cmpq	%rax, %rcx
	jnb	.L2755
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rcx), %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	addl	%eax, %ebp
	movl	%ebp, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2763:
	.cfi_restore_state
	leaq	56(%rdi), %r12
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rcx
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ebp, %ebp
	jne	.L2754
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
.L2755:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L2750
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2756
	movl	$0, 48(%rbx)
	movq	%rdx, %r12
	movb	$0, 56(%rbx)
.L2757:
	movq	%r12, 200(%rbx)
	movl	%ebp, %eax
	movq	%rdx, 192(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2756:
	.cfi_restore_state
	cltq
	addq	%rax, %r12
	movzbl	56(%rbx), %eax
	addl	%eax, %ebp
	jmp	.L2757
	.p2align 4,,10
	.p2align 3
.L2754:
	leaq	(%r12,%rbp), %rax
	movzbl	56(%rbx), %ebp
	movq	%rcx, 192(%rbx)
	movq	%rax, 200(%rbx)
	sall	$8, %ebp
	jmp	.L2752
	.cfi_endproc
.LFE603:
	.size	stbi__get16be, .-stbi__get16be
	.p2align 4
	.type	stbi__get32le, @function
stbi__get32le:
.LFB606:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L2784
	movl	48(%rdi), %esi
	xorl	%r12d, %r12d
	testl	%esi, %esi
	jne	.L2785
.L2767:
	xorl	%ebp, %ebp
.L2776:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	sall	$16, %ebp
	leal	0(%rbp,%r12), %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2784:
	.cfi_restore_state
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rdi)
	movzbl	(%rdx), %r13d
.L2766:
	cmpq	%rax, %rsi
	jnb	.L2769
	leaq	1(%rsi), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rsi), %r12d
	sall	$8, %r12d
	addl	%r13d, %r12d
.L2770:
	cmpq	%rax, %rcx
	jnb	.L2773
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rcx), %ebp
.L2774:
	cmpq	%rax, %rdx
	jnb	.L2778
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %eax
	sall	$8, %eax
	addl	%eax, %ebp
	jmp	.L2776
	.p2align 4,,10
	.p2align 3
.L2785:
	leaq	56(%rdi), %rbp
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rsi
	movslq	%eax, %r13
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r13d, %r13d
	jne	.L2768
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rsi, 200(%rbx)
	movq	%rsi, 192(%rbx)
.L2769:
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	jne	.L2786
	movl	%r13d, %r12d
	jmp	.L2767
	.p2align 4,,10
	.p2align 3
.L2786:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L2772
	movl	$0, 48(%rbx)
	movl	%r13d, %r12d
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
.L2773:
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L2767
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rdx
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ebp, %ebp
	jne	.L2777
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, 200(%rbx)
	movq	%rdx, 192(%rbx)
.L2778:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L2776
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2779
	movl	$0, 48(%rbx)
	movq	%rdx, %r13
	movb	$0, 56(%rbx)
.L2780:
	movq	%r13, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L2776
	.p2align 4,,10
	.p2align 3
.L2768:
	leaq	0(%rbp,%r13), %rax
	movq	%rsi, 192(%rbx)
	movzbl	56(%rbx), %r13d
	movq	%rax, 200(%rbx)
	jmp	.L2766
	.p2align 4,,10
	.p2align 3
.L2772:
	movzbl	56(%rbx), %r12d
	cltq
	movq	%rcx, 192(%rbx)
	addq	%rbp, %rax
	sall	$8, %r12d
	movq	%rax, 200(%rbx)
	addl	%r13d, %r12d
	jmp	.L2770
	.p2align 4,,10
	.p2align 3
.L2777:
	leaq	0(%r13,%rbp), %rax
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %ebp
	movq	%rax, 200(%rbx)
	jmp	.L2774
	.p2align 4,,10
	.p2align 3
.L2779:
	cltq
	addq	%rax, %r13
	movzbl	56(%rbx), %eax
	sall	$8, %eax
	addl	%eax, %ebp
	jmp	.L2780
	.cfi_endproc
.LFE606:
	.size	stbi__get32le, .-stbi__get32le
	.p2align 4
	.type	stbi__get32be, @function
stbi__get32be:
.LFB604:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	192(%rdi), %rax
	movq	200(%rdi), %rdx
	cmpq	%rdx, %rax
	jb	.L2807
	movl	48(%rdi), %esi
	xorl	%r12d, %r12d
	testl	%esi, %esi
	jne	.L2808
.L2790:
	xorl	%ebp, %ebp
.L2799:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	leal	0(%rbp,%r12), %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2807:
	.cfi_restore_state
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rax), %ebp
	sall	$8, %ebp
.L2789:
	cmpq	%rdx, %rcx
	jnb	.L2792
	leaq	1(%rcx), %rsi
	movq	%rsi, 192(%rbx)
	movzbl	(%rcx), %r12d
	addl	%ebp, %r12d
.L2793:
	sall	$16, %r12d
	cmpq	%rdx, %rsi
	jnb	.L2796
	leaq	1(%rsi), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rsi), %ebp
	sall	$8, %ebp
.L2797:
	cmpq	%rdx, %rcx
	jnb	.L2801
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rcx), %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	addl	%eax, %ebp
	leal	0(%rbp,%r12), %eax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2808:
	.cfi_restore_state
	leaq	56(%rdi), %r12
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rcx
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ebp, %ebp
	jne	.L2791
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
.L2792:
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	jne	.L2809
	sall	$16, %ebp
	movl	%ebp, %r12d
	jmp	.L2790
	.p2align 4,,10
	.p2align 3
.L2809:
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rsi
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L2795
	movl	$0, 48(%rbx)
	sall	$16, %ebp
	movb	$0, 56(%rbx)
	movl	%ebp, %r12d
	movq	%rsi, 200(%rbx)
	movq	%rsi, 192(%rbx)
.L2796:
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L2790
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rcx
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ebp, %ebp
	jne	.L2800
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
.L2801:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L2799
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2802
	movl	$0, 48(%rbx)
	movq	%rdx, %r13
	movb	$0, 56(%rbx)
.L2803:
	movq	%r13, 200(%rbx)
	leal	0(%rbp,%r12), %eax
	movq	%rdx, 192(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2791:
	.cfi_restore_state
	leaq	(%r12,%rbp), %rdx
	movzbl	56(%rbx), %ebp
	movq	%rcx, 192(%rbx)
	movq	%rdx, 200(%rbx)
	sall	$8, %ebp
	jmp	.L2789
	.p2align 4,,10
	.p2align 3
.L2795:
	cltq
	movq	%rsi, 192(%rbx)
	leaq	(%r12,%rax), %rdx
	movzbl	56(%rbx), %r12d
	movq	%rdx, 200(%rbx)
	addl	%ebp, %r12d
	jmp	.L2793
	.p2align 4,,10
	.p2align 3
.L2800:
	leaq	0(%r13,%rbp), %rdx
	movzbl	56(%rbx), %ebp
	movq	%rcx, 192(%rbx)
	movq	%rdx, 200(%rbx)
	sall	$8, %ebp
	jmp	.L2797
	.p2align 4,,10
	.p2align 3
.L2802:
	cltq
	addq	%rax, %r13
	movzbl	56(%rbx), %eax
	addl	%eax, %ebp
	jmp	.L2803
	.cfi_endproc
.LFE604:
	.size	stbi__get32be, .-stbi__get32be
	.section	.rodata.str1.1
.LC87:
	.string	"max value > 65535"
	.text
	.p2align 4
	.type	stbi__pnm_info, @function
stbi__pnm_info:
.LFB747:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movdqu	208(%rdi), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rax
	testq	%rsi, %rsi
	cmove	%rax, %rbp
	testq	%rdx, %rdx
	movhlps	%xmm0, %xmm1
	movups	%xmm0, 192(%rdi)
	cmove	%rax, %r13
	movq	%xmm0, %rdx
	testq	%rcx, %rcx
	cmove	%rax, %r12
	movq	%xmm1, %rax
	cmpq	%rax, %rdx
	jb	.L2848
	movl	48(%rdi), %ecx
	testl	%ecx, %ecx
	jne	.L2849
.L2816:
	movups	%xmm0, 192(%rbx)
.L2822:
	xorl	%eax, %eax
.L2810:
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L2850
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2848:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %r15d
.L2815:
	cmpq	%rax, %rcx
	jnb	.L2818
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rcx), %ecx
.L2821:
	cmpb	$80, %r15b
	jne	.L2847
	leal	-53(%rcx), %esi
	cmpb	$1, %sil
	ja	.L2847
	cmpb	$54, %cl
	sete	%cl
	movzbl	%cl, %ecx
	leal	1(%rcx,%rcx), %ecx
	movl	%ecx, (%r12)
	cmpq	%rax, %rdx
	jb	.L2851
	movl	48(%rbx), %eax
	xorl	%r12d, %r12d
	testl	%eax, %eax
	jne	.L2852
.L2827:
	movb	%r12b, 3(%rsp)
	leaq	3(%rsp), %r12
	movq	%rbx, %rdi
	movq	%r12, %rsi
	call	stbi__pnm_skip_whitespace
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	stbi__pnm_getinteger
	movl	%eax, 0(%rbp)
	testl	%eax, %eax
	je	.L2832
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	stbi__pnm_skip_whitespace
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	stbi__pnm_getinteger
	movl	%eax, 0(%r13)
	testl	%eax, %eax
	je	.L2832
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	stbi__pnm_skip_whitespace
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	stbi__pnm_getinteger
	cmpl	$65535, %eax
	jg	.L2853
	cmpl	$256, %eax
	setge	%al
	movzbl	%al, %eax
	leal	8(,%rax,8), %eax
	jmp	.L2810
	.p2align 4,,10
	.p2align 3
.L2847:
	movdqu	208(%rbx), %xmm0
	jmp	.L2816
	.p2align 4,,10
	.p2align 3
.L2851:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %r12d
	jmp	.L2827
	.p2align 4,,10
	.p2align 3
.L2832:
	leaq	.LC69(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L2822
	.p2align 4,,10
	.p2align 3
.L2849:
	leaq	56(%rdi), %r14
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%r14, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L2817
	movl	$0, 48(%rbx)
	xorl	%r15d, %r15d
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
.L2818:
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L2847
	leaq	56(%rbx), %r14
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r14, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2823
	movl	$0, 48(%rbx)
	movq	%rdx, %rax
	xorl	%ecx, %ecx
	movb	$0, 56(%rbx)
.L2824:
	movq	%rax, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L2821
	.p2align 4,,10
	.p2align 3
.L2823:
	cltq
	movzbl	56(%rbx), %ecx
	addq	%r14, %rax
	jmp	.L2824
	.p2align 4,,10
	.p2align 3
.L2817:
	cltq
	movq	%rcx, 192(%rbx)
	movzbl	56(%rbx), %r15d
	addq	%r14, %rax
	movq	%rax, 200(%rbx)
	jmp	.L2815
	.p2align 4,,10
	.p2align 3
.L2853:
	leaq	.LC87(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L2822
	.p2align 4,,10
	.p2align 3
.L2852:
	leaq	56(%rbx), %r14
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r14, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L2828
	movl	$0, 48(%rbx)
	movq	%rdx, %r14
	movb	$0, 56(%rbx)
.L2829:
	movq	%r14, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L2827
	.p2align 4,,10
	.p2align 3
.L2828:
	cltq
	movzbl	56(%rbx), %r12d
	addq	%rax, %r14
	jmp	.L2829
.L2850:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE747:
	.size	stbi__pnm_info, .-stbi__pnm_info
	.p2align 4
	.type	stbiw__jpg_processDU.constprop.0, @function
stbiw__jpg_processDU.constprop.0:
.LFB849:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r11
	movq	%rcx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	512(%rcx), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r9d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r8, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rcx, %rdi
	subq	$376, %rsp
	.cfi_def_cfa_offset 432
	movq	%rdx, 24(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 360(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L2855:
	leaq	28(%rdi), %rax
	leaq	20(%rdi), %r9
	pushq	%rax
	.cfi_def_cfa_offset 440
	leaq	24(%rdi), %rax
	leaq	16(%rdi), %r8
	pushq	%rax
	.cfi_def_cfa_offset 448
	leaq	12(%rdi), %rcx
	leaq	8(%rdi), %rdx
	leaq	4(%rdi), %rsi
	call	stbiw__jpg_DCT
	addq	$64, %rdi
	popq	%r8
	.cfi_def_cfa_offset 440
	popq	%r9
	.cfi_def_cfa_offset 432
	cmpq	%r13, %rdi
	jne	.L2855
	leaq	32(%r14), %r13
	.p2align 4,,10
	.p2align 3
.L2856:
	leaq	448(%r14), %rax
	leaq	64(%r14), %rsi
	movq	%r14, %rdi
	pushq	%rax
	.cfi_def_cfa_offset 440
	leaq	384(%r14), %rax
	leaq	192(%r14), %rcx
	pushq	%rax
	.cfi_def_cfa_offset 448
	leaq	128(%r14), %rdx
	leaq	320(%r14), %r9
	leaq	256(%r14), %r8
	addq	$4, %r14
	call	stbiw__jpg_DCT
	popq	%rcx
	.cfi_def_cfa_offset 440
	popq	%rsi
	.cfi_def_cfa_offset 432
	cmpq	%r13, %r14
	jne	.L2856
	leaq	stbiw__jpg_ZigZag(%rip), %rax
	movss	.LC88(%rip), %xmm1
	pxor	%xmm0, %xmm0
	leaq	64(%rax), %rdx
	jmp	.L2874
	.p2align 4,,10
	.p2align 3
.L2949:
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L2858:
	movss	4(%r15), %xmm2
	mulss	4(%rbp), %xmm2
	movzbl	(%rax), %ecx
	movl	%esi, 96(%rsp,%rcx,4)
	comiss	%xmm2, %xmm0
	ja	.L2859
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L2860:
	movss	8(%r15), %xmm2
	mulss	8(%rbp), %xmm2
	movzbl	1(%rax), %ecx
	movl	%esi, 96(%rsp,%rcx,4)
	comiss	%xmm2, %xmm0
	ja	.L2861
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L2862:
	movss	12(%r15), %xmm2
	mulss	12(%rbp), %xmm2
	movzbl	2(%rax), %ecx
	movl	%esi, 96(%rsp,%rcx,4)
	comiss	%xmm2, %xmm0
	ja	.L2863
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L2864:
	movss	16(%r15), %xmm2
	mulss	16(%rbp), %xmm2
	movzbl	3(%rax), %ecx
	movl	%esi, 96(%rsp,%rcx,4)
	comiss	%xmm2, %xmm0
	ja	.L2865
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L2866:
	movss	20(%r15), %xmm2
	mulss	20(%rbp), %xmm2
	movzbl	4(%rax), %ecx
	movl	%esi, 96(%rsp,%rcx,4)
	comiss	%xmm2, %xmm0
	ja	.L2867
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L2868:
	movss	24(%r15), %xmm2
	mulss	24(%rbp), %xmm2
	movzbl	5(%rax), %ecx
	movl	%esi, 96(%rsp,%rcx,4)
	comiss	%xmm2, %xmm0
	ja	.L2869
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L2870:
	movss	28(%r15), %xmm2
	mulss	28(%rbp), %xmm2
	movzbl	6(%rax), %ecx
	movl	%esi, 96(%rsp,%rcx,4)
	movzbl	7(%rax), %ecx
	comiss	%xmm2, %xmm0
	ja	.L2871
	addss	%xmm1, %xmm2
.L2946:
	cvttss2sil	%xmm2, %esi
	addq	$8, %rax
	addq	$64, %r15
	addq	$32, %rbp
	movl	%esi, 96(%rsp,%rcx,4)
	cmpq	%rdx, %rax
	je	.L2948
.L2874:
	movss	0(%rbp), %xmm2
	mulss	(%r15), %xmm2
	comiss	%xmm2, %xmm0
	jbe	.L2949
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L2858
	.p2align 4,,10
	.p2align 3
.L2871:
	subss	%xmm1, %xmm2
	jmp	.L2946
	.p2align 4,,10
	.p2align 3
.L2869:
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L2870
	.p2align 4,,10
	.p2align 3
.L2867:
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L2868
	.p2align 4,,10
	.p2align 3
.L2865:
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L2866
	.p2align 4,,10
	.p2align 3
.L2863:
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L2864
	.p2align 4,,10
	.p2align 3
.L2861:
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L2862
	.p2align 4,,10
	.p2align 3
.L2859:
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L2860
.L2948:
	movl	96(%rsp), %eax
	movq	24(%rsp), %rdx
	movl	(%r11), %r13d
	movl	%eax, 76(%rsp)
	subl	%r12d, %eax
	movl	(%rdx), %r15d
	movl	%eax, %esi
	je	.L2950
	negl	%eax
	cmovs	%esi, %eax
	cmpl	$-2147483648, %esi
	adcl	$-1, %esi
	sarl	%eax
	je	.L2923
	movl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L2882:
	addl	$1, %ecx
	sarl	%eax
	jne	.L2882
	movl	$1, %r14d
	movzwl	%cx, %edx
	sall	%cl, %r14d
	movzwl	%cx, %ecx
	subl	$1, %r14d
	salq	$2, %rcx
.L2881:
	leaq	YDC_HT.4(%rip), %rax
	andl	%esi, %r14d
	addq	%rax, %rcx
	movzwl	2(%rcx), %eax
	addl	%r15d, %eax
	movzwl	(%rcx), %r15d
	movl	$24, %ecx
	subl	%eax, %ecx
	sall	%cl, %r15d
	orl	%r13d, %r15d
	cmpl	$7, %eax
	jle	.L2883
	movl	%eax, (%rsp)
	movq	%rbx, %r13
	movl	%eax, %r12d
	movl	%r15d, %ebx
	movw	%r14w, 8(%rsp)
	leaq	95(%rsp), %rbp
	movq	%r11, %r15
	movl	%edx, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L2885:
	movl	%ebx, %r14d
	movq	8(%r13), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	sarl	$16, %r14d
	movb	%r14b, 95(%rsp)
	call	*0(%r13)
	cmpb	$-1, %r14b
	jne	.L2884
	movb	$0, 95(%rsp)
	movq	8(%r13), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	*0(%r13)
.L2884:
	subl	$8, %r12d
	sall	$8, %ebx
	cmpl	$7, %r12d
	jg	.L2885
	movl	(%rsp), %eax
	movzwl	8(%rsp), %r14d
	movq	%r15, %r11
	movl	%ebx, %r15d
	movl	16(%rsp), %edx
	movq	%r13, %rbx
	andl	$7, %eax
.L2883:
	movq	24(%rsp), %rcx
	movl	%r15d, (%r11)
	movzwl	%r14w, %r14d
	movl	%eax, (%rcx)
	addl	%edx, %eax
	movl	$24, %ecx
	subl	%eax, %ecx
	sall	%cl, %r14d
	orl	(%r11), %r14d
	cmpl	$7, %eax
	jle	.L2886
	movq	%r11, (%rsp)
	movl	%eax, %r12d
	leaq	95(%rsp), %rbp
	movl	%eax, %r15d
	.p2align 4,,10
	.p2align 3
.L2888:
	movl	%r14d, %r13d
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	sarl	$16, %r13d
	movb	%r13b, 95(%rsp)
	call	*(%rbx)
	cmpb	$-1, %r13b
	jne	.L2887
	movb	$0, 95(%rsp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	*(%rbx)
.L2887:
	subl	$8, %r12d
	sall	$8, %r14d
	cmpl	$7, %r12d
	jg	.L2888
	movl	%r15d, %eax
	movq	(%rsp), %r11
	andl	$7, %eax
.L2886:
	movq	24(%rsp), %rdx
	movl	%r14d, (%r11)
	movl	%eax, (%rdx)
.L2879:
	movl	$63, %r8d
	leaq	96(%rsp), %r15
	jmp	.L2889
	.p2align 4,,10
	.p2align 3
.L2891:
	subq	$1, %r8
	je	.L2890
.L2889:
	movl	(%r15,%r8,4), %edx
	testl	%edx, %edx
	je	.L2891
	movl	%r8d, 40(%rsp)
	movq	%r15, %r14
	movl	$1, %ecx
	movl	%eax, %r15d
	movq	%r8, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L2892:
	movslq	%ecx, %rsi
	movl	96(%rsp,%rsi,4), %r12d
	testl	%r12d, %r12d
	jne	.L2916
	movl	40(%rsp), %eax
	cmpl	%eax, %ecx
	jg	.L2951
	movl	48(%rsp), %esi
	leal	2(%rcx), %edi
	leal	1(%rcx), %r13d
	movslq	%edi, %rdi
	movslq	%r13d, %r13
	subl	%ecx, %esi
	addq	%rsi, %rdi
	jmp	.L2897
	.p2align 4,,10
	.p2align 3
.L2953:
	leaq	1(%r13), %rax
	cmpq	%rdi, %rax
	je	.L2952
	movq	%rax, %r13
.L2897:
	movl	(%r14,%r13,4), %r12d
	testl	%r12d, %r12d
	je	.L2953
	movl	%r12d, %edi
	movl	%r13d, 44(%rsp)
	negl	%edi
	cmovs	%r12d, %edi
	subl	%ecx, %r13d
	sarl	%edi
	cmpl	$15, %r13d
	jg	.L2899
.L2956:
	sall	$4, %r13d
.L2900:
	cmpl	$-2147483648, %r12d
	adcl	$-1, %r12d
	movl	%r12d, %r8d
	testl	%edi, %edi
	je	.L2906
	movl	$2, %ecx
	.p2align 4,,10
	.p2align 3
.L2907:
	movzwl	%cx, %esi
	addl	$1, %ecx
	sarl	%edi
	jne	.L2907
	movl	$1, %r9d
	movl	%esi, %ecx
	addl	%esi, %r13d
	sall	%cl, %r9d
	movslq	%r13d, %rdi
	leal	-1(%r9), %r12d
	salq	$2, %rdi
	andl	%r8d, %r12d
	movzwl	%r12w, %r12d
.L2908:
	leaq	YAC_HT.3(%rip), %rax
	addq	%rax, %rdi
	movzwl	2(%rdi), %ecx
	leal	(%rcx,%r15), %eax
	movzwl	(%rdi), %r15d
	movl	$24, %ecx
	subl	%eax, %ecx
	sall	%cl, %r15d
	orl	(%r11), %r15d
	cmpl	$7, %eax
	jle	.L2909
	movl	%eax, 8(%rsp)
	movl	%eax, %ebp
	leaq	95(%rsp), %r13
	movl	%esi, 16(%rsp)
	movq	%r11, 32(%rsp)
	movl	%r12d, (%rsp)
	movq	%rbx, %r12
	movl	%r15d, %ebx
	movq	%r14, %r15
	.p2align 4,,10
	.p2align 3
.L2911:
	movl	%ebx, %r14d
	movq	8(%r12), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	sarl	$16, %r14d
	movb	%r14b, 95(%rsp)
	call	*(%r12)
	cmpb	$-1, %r14b
	jne	.L2910
	movb	$0, 95(%rsp)
	movq	8(%r12), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%r12)
.L2910:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	$7, %ebp
	jg	.L2911
	movl	8(%rsp), %eax
	movq	%r15, %r14
	movl	16(%rsp), %esi
	movl	%ebx, %r15d
	movq	32(%rsp), %r11
	movq	%r12, %rbx
	movl	(%rsp), %r12d
	andl	$7, %eax
.L2909:
	movl	%r15d, (%r11)
	movq	24(%rsp), %rdx
	leal	(%rax,%rsi), %r15d
	movl	$24, %ecx
	subl	%r15d, %ecx
	movl	%eax, (%rdx)
	sall	%cl, %r12d
	orl	(%r11), %r12d
	cmpl	$7, %r15d
	jle	.L2912
	movq	%r11, (%rsp)
	movl	%r15d, %ebp
	leaq	95(%rsp), %r13
	movq	%r14, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L2914:
	movl	%r12d, %r14d
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	sarl	$16, %r14d
	movb	%r14b, 95(%rsp)
	call	*(%rbx)
	cmpb	$-1, %r14b
	jne	.L2913
	movb	$0, 95(%rsp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r13, %rsi
	call	*(%rbx)
.L2913:
	subl	$8, %ebp
	sall	$8, %r12d
	cmpl	$7, %ebp
	jg	.L2914
	movq	(%rsp), %r11
	movq	8(%rsp), %r14
	andl	$7, %r15d
.L2912:
	movq	24(%rsp), %rax
	movl	44(%rsp), %ecx
	movl	%r12d, (%r11)
	movl	%r15d, (%rax)
	movl	40(%rsp), %eax
	addl	$1, %ecx
	cmpl	%eax, %ecx
	jle	.L2892
	movl	%eax, %r9d
	cmpl	$63, %r9d
	jne	.L2954
.L2854:
	movq	360(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L2955
	movl	76(%rsp), %eax
	addq	$376, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2952:
	.cfi_restore_state
	movl	%r13d, 44(%rsp)
	subl	%ecx, %r13d
	xorl	%edi, %edi
	cmpl	$15, %r13d
	jle	.L2956
.L2899:
	movl	%r13d, %eax
	movl	%edi, 56(%rsp)
	movl	$1, %esi
	movq	%r11, %rdx
	sarl	$4, %eax
	movl	%r13d, 72(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r12d, 60(%rsp)
	movq	24(%rsp), %r12
	movq	%r14, 64(%rsp)
	movl	%r15d, %r14d
	movq	%rbx, %r15
	.p2align 4,,10
	.p2align 3
.L2904:
	leal	11(%r14), %r13d
	movl	$24, %ecx
	movl	$2041, %eax
	subl	%r13d, %ecx
	sall	%cl, %eax
	orl	(%rdx), %eax
	movl	%eax, %ebx
	cmpl	$7, %r13d
	jle	.L2925
	movl	%esi, (%rsp)
	movq	%r12, %rax
	leaq	95(%rsp), %rbp
	movq	%r15, %r12
	movl	%r14d, 8(%rsp)
	movq	%rax, %r15
	movq	%rdx, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L2903:
	movl	%ebx, %r14d
	movq	8(%r12), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	sarl	$16, %r14d
	movb	%r14b, 95(%rsp)
	call	*(%r12)
	cmpb	$-1, %r14b
	jne	.L2902
	movb	$0, 95(%rsp)
	movq	8(%r12), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	*(%r12)
.L2902:
	subl	$8, %r13d
	sall	$8, %ebx
	cmpl	$7, %r13d
	jg	.L2903
	movl	8(%rsp), %r14d
	movq	%r15, %rax
	movl	(%rsp), %esi
	movq	%r12, %r15
	movq	16(%rsp), %rdx
	movq	%rax, %r12
	leal	3(%r14), %edi
	andl	$7, %edi
	movl	%edi, %r14d
.L2901:
	movl	32(%rsp), %eax
	addl	$1, %esi
	movl	%ebx, (%rdx)
	movl	%r14d, (%r12)
	cmpl	%eax, %esi
	jle	.L2904
	movl	72(%rsp), %r13d
	movq	%r15, %rbx
	movl	56(%rsp), %edi
	movl	%r14d, %r15d
	movl	60(%rsp), %r12d
	movq	64(%rsp), %r14
	movq	%rdx, %r11
	sall	$4, %r13d
	movzbl	%r13b, %r13d
	jmp	.L2900
	.p2align 4,,10
	.p2align 3
.L2925:
	movl	%r13d, %r14d
	jmp	.L2901
.L2954:
	leal	4(%r15), %r12d
	movl	$24, %ecx
	movl	$10, %r14d
	subl	%r12d, %ecx
	sall	%cl, %r14d
	orl	(%r11), %r14d
	cmpl	$7, %r12d
	jle	.L2918
	movq	%r11, (%rsp)
	leaq	95(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L2920:
	movl	%r14d, %r13d
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	sarl	$16, %r13d
	movb	%r13b, 95(%rsp)
	call	*(%rbx)
	cmpb	$-1, %r13b
	jne	.L2919
	movb	$0, 95(%rsp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	*(%rbx)
.L2919:
	subl	$8, %r12d
	sall	$8, %r14d
	cmpl	$7, %r12d
	jg	.L2920
.L2947:
	leal	-4(%r15), %r12d
	movq	(%rsp), %r11
	andl	$7, %r12d
.L2918:
	movq	24(%rsp), %rax
	movl	%r14d, (%r11)
	movl	%r12d, (%rax)
	jmp	.L2854
.L2906:
	leal	1(%r13), %edi
	andl	$1, %r12d
	movl	$1, %esi
	movslq	%edi, %rdi
	salq	$2, %rdi
	jmp	.L2908
.L2916:
	movl	%r12d, %edi
	movl	%ecx, 44(%rsp)
	negl	%edi
	cmovs	%r12d, %edi
	xorl	%r13d, %r13d
	sarl	%edi
	jmp	.L2900
.L2951:
	movl	%ecx, 44(%rsp)
	movl	$4, %edi
	movl	$1, %esi
	jmp	.L2908
.L2950:
	leal	2(%r15), %eax
	cmpl	$7, %eax
	jle	.L2876
	movq	%r11, (%rsp)
	leaq	95(%rsp), %rbp
	movl	%eax, %r12d
	.p2align 4,,10
	.p2align 3
.L2878:
	movl	%r13d, %r14d
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	sarl	$16, %r14d
	movb	%r14b, 95(%rsp)
	call	*(%rbx)
	cmpb	$-1, %r14b
	jne	.L2877
	movb	$0, 95(%rsp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	*(%rbx)
.L2877:
	subl	$8, %r12d
	sall	$8, %r13d
	cmpl	$7, %r12d
	jg	.L2878
	subl	$6, %r15d
	movq	(%rsp), %r11
	movl	%r15d, %eax
	andl	$7, %eax
.L2876:
	movq	24(%rsp), %rdx
	movl	%r13d, (%r11)
	movl	%eax, (%rdx)
	jmp	.L2879
.L2890:
	leal	4(%rax), %r12d
	movl	$24, %ecx
	movl	$10, %edx
	subl	%r12d, %ecx
	leaq	95(%rsp), %rbp
	sall	%cl, %edx
	orl	(%r11), %edx
	movl	%edx, %r14d
	cmpl	$7, %r12d
	jle	.L2918
	movq	%r11, (%rsp)
	movl	%eax, %r15d
	.p2align 4,,10
	.p2align 3
.L2894:
	movl	%r14d, %r13d
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	sarl	$16, %r13d
	movb	%r13b, 95(%rsp)
	call	*(%rbx)
	cmpb	$-1, %r13b
	jne	.L2893
	movb	$0, 95(%rsp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	*(%rbx)
.L2893:
	subl	$8, %r12d
	sall	$8, %r14d
	cmpl	$7, %r12d
	jg	.L2894
	jmp	.L2947
.L2923:
	movl	$4, %ecx
	movl	$1, %r14d
	movl	$1, %edx
	jmp	.L2881
.L2955:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE849:
	.size	stbiw__jpg_processDU.constprop.0, .-stbiw__jpg_processDU.constprop.0
	.p2align 4
	.type	stbi__grow_buffer_unsafe, @function
stbi__grow_buffer_unsafe:
.LFB615:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	$24, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
.L2977:
	movl	18476(%rbx), %esi
	testl	%esi, %esi
	je	.L2988
	movl	18468(%rbx), %eax
	addl	$8, %eax
	cmpl	$24, %eax
	jg	.L2987
	.p2align 4,,10
	.p2align 3
.L2975:
	addl	$8, %eax
	cmpl	$24, %eax
	jle	.L2975
.L2987:
	movl	%eax, 18468(%rbx)
.L2957:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2988:
	.cfi_restore_state
	movq	(%rbx), %rbp
	movq	192(%rbp), %rax
	cmpq	200(%rbp), %rax
	jb	.L2989
	movl	48(%rbp), %ecx
	testl	%ecx, %ecx
	jne	.L2990
.L2961:
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L2963:
	movl	18468(%rbx), %eax
	movl	%r13d, %ecx
	movl	%r12d, %edx
	subl	%eax, %ecx
	addl	$8, %eax
	sall	%cl, %edx
	movl	%eax, 18468(%rbx)
	orl	%edx, 18464(%rbx)
	cmpl	$24, %eax
	jle	.L2977
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2989:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rax), %r12d
.L2960:
	cmpl	$255, %r12d
	jne	.L2963
	movq	(%rbx), %r14
	movq	192(%r14), %rax
	cmpq	200(%r14), %rax
	jb	.L2991
	movl	48(%r14), %edx
	testl	%edx, %edx
	je	.L2963
	leaq	56(%r14), %rbp
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rbp, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	leaq	57(%r14), %rsi
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	jne	.L2967
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	movq	%rsi, 200(%r14)
	movq	%rsi, 192(%r14)
	jmp	.L2963
	.p2align 4,,10
	.p2align 3
.L2990:
	leaq	56(%rbp), %r14
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r14, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L2962
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdx, 200(%rbp)
	movq	%rdx, 192(%rbp)
	jmp	.L2961
	.p2align 4,,10
	.p2align 3
.L2962:
	cltq
	movq	%rdx, 192(%rbp)
	movzbl	56(%rbp), %r12d
	addq	%rax, %r14
	movq	%r14, 200(%rbp)
	jmp	.L2960
.L2991:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %edx
	movl	%edx, %ecx
	.p2align 4,,10
	.p2align 3
.L2965:
	cmpl	$255, %edx
	jne	.L2969
	movq	(%rbx), %rbp
	movq	192(%rbp), %rax
	cmpq	200(%rbp), %rax
	jb	.L2992
	movl	48(%rbp), %eax
	testl	%eax, %eax
	je	.L2963
	leaq	56(%rbp), %r14
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r14, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rsi
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L2972
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rsi, 200(%rbp)
	movq	%rsi, 192(%rbp)
	jmp	.L2963
	.p2align 4,,10
	.p2align 3
.L2992:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rax), %edx
	movl	%edx, %ecx
	jmp	.L2965
	.p2align 4,,10
	.p2align 3
.L2972:
	movzbl	56(%rbp), %edx
	cltq
	movq	%rsi, 192(%rbp)
	addq	%rax, %r14
	movq	%r14, 200(%rbp)
	movl	%edx, %ecx
	jmp	.L2965
.L2967:
	movzbl	56(%r14), %edx
	cltq
	movq	%rsi, 192(%r14)
	addq	%rax, %rbp
	movq	%rbp, 200(%r14)
	movl	%edx, %ecx
	jmp	.L2965
.L2969:
	testl	%edx, %edx
	je	.L2963
	movb	%cl, 18472(%rbx)
	movl	$1, 18476(%rbx)
	jmp	.L2957
	.cfi_endproc
.LFE615:
	.size	stbi__grow_buffer_unsafe, .-stbi__grow_buffer_unsafe
	.section	.rodata.str1.8
	.align 8
.LC89:
	.string	"(((j->code_buffer) >> (32 - h->size[c])) & stbi__bmask[h->size[c]]) == h->code[c]"
	.text
	.p2align 4
	.type	stbi__jpeg_huff_decode, @function
stbi__jpeg_huff_decode:
.LFB616:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	18468(%rdi), %eax
	cmpl	$15, %eax
	jle	.L3008
.L2994:
	movl	18464(%rbp), %edx
	movl	%edx, %ecx
	shrl	$23, %ecx
	movzbl	(%rbx,%rcx), %ecx
	cmpl	$255, %ecx
	je	.L2995
	movslq	%ecx, %rsi
	movzbl	1280(%rbx,%rsi), %ecx
	cmpl	%eax, %ecx
	jg	.L2996
	subl	%ecx, %eax
	sall	%cl, %edx
	movl	%edx, 18464(%rbp)
	movl	%eax, 18468(%rbp)
	movzbl	1024(%rbx,%rsi), %eax
.L2993:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2995:
	.cfi_restore_state
	movl	%edx, %ecx
	shrl	$16, %ecx
	cmpl	1580(%rbx), %ecx
	jb	.L3000
	cmpl	1584(%rbx), %ecx
	jb	.L3001
	cmpl	1588(%rbx), %ecx
	jb	.L3002
	cmpl	1592(%rbx), %ecx
	jb	.L3003
	cmpl	1596(%rbx), %ecx
	jb	.L3004
	cmpl	1600(%rbx), %ecx
	jb	.L3005
	cmpl	1604(%rbx), %ecx
	jb	.L3006
	subl	$16, %eax
	movl	%eax, 18468(%rbp)
.L2996:
	movl	$-1, %eax
	jmp	.L2993
	.p2align 4,,10
	.p2align 3
.L3008:
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbp), %eax
	jmp	.L2994
	.p2align 4,,10
	.p2align 3
.L3003:
	movl	$13, %edi
	.p2align 4,,10
	.p2align 3
.L2998:
	cmpl	%eax, %edi
	jg	.L2996
	movl	$32, %r8d
	movl	%edx, %esi
	leaq	stbi__bmask(%rip), %r10
	movl	%r8d, %ecx
	subl	%edi, %ecx
	shrl	%cl, %esi
	movslq	%edi, %rcx
	andl	(%r10,%rcx,4), %esi
	addl	1612(%rbx,%rcx,4), %esi
	cmpl	$255, %esi
	ja	.L2996
	movslq	%esi, %rsi
	movl	%r8d, %ecx
	movl	%edx, %r11d
	movzbl	1280(%rbx,%rsi), %r9d
	movzwl	512(%rbx,%rsi,2), %r8d
	subl	%r9d, %ecx
	shrl	%cl, %r11d
	movl	(%r10,%r9,4), %ecx
	andl	%r11d, %ecx
	cmpl	%r8d, %ecx
	jne	.L3009
	movl	%edi, %ecx
	subl	%edi, %eax
	sall	%cl, %edx
	movl	%eax, 18468(%rbp)
	movl	%edx, 18464(%rbp)
	movzbl	1024(%rbx,%rsi), %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3000:
	.cfi_restore_state
	movl	$10, %edi
	jmp	.L2998
	.p2align 4,,10
	.p2align 3
.L3001:
	movl	$11, %edi
	jmp	.L2998
	.p2align 4,,10
	.p2align 3
.L3002:
	movl	$12, %edi
	jmp	.L2998
.L3004:
	movl	$14, %edi
	jmp	.L2998
.L3005:
	movl	$15, %edi
	jmp	.L2998
.L3006:
	movl	$16, %edi
	jmp	.L2998
.L3009:
	leaq	__PRETTY_FUNCTION__.35(%rip), %rcx
	movl	$2140, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC89(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE616:
	.size	stbi__jpeg_huff_decode, .-stbi__jpeg_huff_decode
	.section	.rodata.str1.1
.LC90:
	.string	"bad delta"
.LC91:
	.string	"can't merge dc and ac"
	.text
	.p2align 4
	.type	stbi__jpeg_decode_block_prog_dc, @function
stbi__jpeg_decode_block_prog_dc:
.LFB621:
	.cfi_startproc
	movl	18488(%rdi), %eax
	testl	%eax, %eax
	jne	.L3042
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movslq	%ecx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	cmpl	$15, 18468(%rdi)
	movq	%rdi, %rbx
	jle	.L3043
	movl	18492(%rbx), %r14d
	testl	%r14d, %r14d
	jne	.L3014
.L3048:
	leaq	8(%rbp), %rdi
	movq	%rbp, %rcx
	xorl	%eax, %eax
	movq	%r12, %rsi
	andq	$-8, %rdi
	movq	$0, 0(%rbp)
	subq	%rdi, %rcx
	movq	$0, 120(%rbp)
	subl	$-128, %ecx
	shrl	$3, %ecx
	rep stosq
	movq	%rbx, %rdi
	call	stbi__jpeg_huff_decode
	movl	%eax, %r12d
	cmpl	$15, %eax
	ja	.L3015
	testl	%eax, %eax
	jne	.L3044
.L3016:
	leaq	0(%r13,%r13,2), %rax
	salq	$5, %rax
	movl	18104(%rbx,%rax), %esi
	testl	%esi, %esi
	js	.L3029
.L3018:
	addl	%r14d, %esi
.L3029:
	leaq	0(%r13,%r13,2), %rax
	movl	18496(%rbx), %ecx
	salq	$5, %rax
	movl	%esi, 18104(%rbx,%rax)
	movl	$1, %eax
	sall	%cl, %eax
	movl	%eax, %ecx
	leal	1(%rax), %eax
	cmpw	$1, %ax
	jbe	.L3022
	movl	%ecx, %eax
	movswl	%cx, %edi
	movswl	%si, %r8d
	xorw	%si, %ax
	jns	.L3045
	movl	$-32768, %eax
	movl	$-1, %edx
	idivl	%edi
	testw	%cx, %cx
	js	.L3046
	cmpl	%eax, %r8d
	jge	.L3022
.L3015:
	leaq	.LC91(%rip), %rax
.L3012:
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3014:
	.cfi_restore_state
	movl	18468(%rbx), %eax
	testl	%eax, %eax
	jle	.L3047
.L3026:
	movl	18464(%rbx), %edx
	subl	$1, %eax
	movl	%eax, 18468(%rbx)
	leal	(%rdx,%rdx), %ecx
	movl	%ecx, 18464(%rbx)
	testl	%edx, %edx
	jns	.L3027
	movl	18496(%rbx), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	addw	%ax, 0(%rbp)
.L3027:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3043:
	.cfi_restore_state
	call	stbi__grow_buffer_unsafe
	movl	18492(%rbx), %r14d
	testl	%r14d, %r14d
	jne	.L3014
	jmp	.L3048
	.p2align 4,,10
	.p2align 3
.L3044:
	movl	18468(%rbx), %edx
	cmpl	%edx, %eax
	jg	.L3049
	leaq	0(%r13,%r13,2), %rax
	salq	$5, %rax
	movl	18104(%rbx,%rax), %esi
.L3031:
	movl	18464(%rbx), %eax
	movl	%r12d, %ecx
	movslq	%r12d, %r9
	subl	%r12d, %edx
	movl	%edx, 18468(%rbx)
	movl	%eax, %edi
	shrl	$31, %eax
	roll	%cl, %edi
	leal	-1(%rax), %r14d
	leaq	stbi__jbias(%rip), %rax
	movl	%edi, %ecx
	leaq	stbi__bmask(%rip), %rdi
	andl	(%rax,%r9,4), %r14d
	movl	(%rdi,%r9,4), %r8d
	movl	%r8d, %edi
	notl	%edi
	andl	%ecx, %edi
	andl	%r8d, %ecx
	addl	%ecx, %r14d
	movl	%edi, 18464(%rbx)
	movl	%r14d, %eax
	xorl	%esi, %eax
	js	.L3018
	testl	%esi, %esi
	jns	.L3019
	testl	%r14d, %r14d
	jns	.L3019
	movl	$-2147483648, %eax
	subl	%r14d, %eax
	cmpl	%esi, %eax
	setle	%al
	movzbl	%al, %eax
.L3020:
	testl	%eax, %eax
	jne	.L3018
	leaq	.LC90(%rip), %rax
	jmp	.L3012
	.p2align 4,,10
	.p2align 3
.L3045:
	xorl	%edx, %edx
	movl	$32767, %eax
	idivl	%edi
	cmpl	%eax, %r8d
	setle	%al
	movzbl	%al, %eax
.L3024:
	testl	%eax, %eax
	je	.L3015
.L3022:
	imull	%esi, %ecx
	movw	%cx, 0(%rbp)
	jmp	.L3027
	.p2align 4,,10
	.p2align 3
.L3042:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	leaq	.LC91(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L3047:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
	movq	%rbx, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbx), %eax
	testl	%eax, %eax
	jle	.L3027
	jmp	.L3026
	.p2align 4,,10
	.p2align 3
.L3049:
	movq	%rbx, %rdi
	call	stbi__grow_buffer_unsafe
	leaq	0(%r13,%r13,2), %rax
	movl	18468(%rbx), %edx
	salq	$5, %rax
	movl	18104(%rbx,%rax), %esi
	cmpl	%edx, %r12d
	jg	.L3016
	jmp	.L3031
	.p2align 4,,10
	.p2align 3
.L3046:
	cmpl	%eax, %r8d
	setle	%al
	movzbl	%al, %eax
	jmp	.L3024
.L3019:
	movl	$2147483647, %eax
	subl	%r14d, %eax
	cmpl	%esi, %eax
	setge	%al
	movzbl	%al, %eax
	jmp	.L3020
	.cfi_endproc
.LFE621:
	.size	stbi__jpeg_decode_block_prog_dc, .-stbi__jpeg_decode_block_prog_dc
	.p2align 4
	.type	stbi__jpeg_decode_block, @function
stbi__jpeg_decode_block:
.LFB620:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%r9d, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$15, 18468(%rdi)
	movq	%rcx, (%rsp)
	movq	80(%rsp), %r13
	jle	.L3087
.L3051:
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	stbi__jpeg_huff_decode
	movl	%eax, %edx
	cmpl	$15, %eax
	jbe	.L3052
.L3065:
	leaq	.LC84(%rip), %rdx
.L3053:
	movq	%rdx, %fs:stbi__g_failure_reason@tpoff
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3052:
	.cfi_restore_state
	movl	$16, %ecx
	xorl	%eax, %eax
	movq	%rbp, %rdi
	rep stosq
	testl	%edx, %edx
	jne	.L3088
.L3054:
	leaq	(%r15,%r15,2), %rax
	salq	$5, %rax
	movl	18104(%rbx,%rax), %esi
	xorl	%eax, %eax
	testl	%esi, %esi
	js	.L3074
.L3056:
	addl	%eax, %esi
.L3074:
	movzwl	0(%r13), %edi
	leaq	(%r15,%r15,2), %rax
	salq	$5, %rax
	movl	%esi, 18104(%rbx,%rax)
	leal	1(%rdi), %eax
	cmpw	$1, %ax
	jbe	.L3059
	movl	%edi, %eax
	movswl	%di, %ecx
	movswl	%si, %r8d
	xorw	%si, %ax
	jns	.L3089
	movl	$-32768, %eax
	movl	$-1, %edx
	idivl	%ecx
	xorl	%ecx, %ecx
	cmpl	%eax, %r8d
	setge	%cl
	testw	%di, %di
	js	.L3090
.L3062:
	leaq	.LC91(%rip), %rdx
	testl	%ecx, %ecx
	je	.L3053
.L3059:
	imull	%esi, %edi
	movl	$1, %r14d
	leaq	stbi__jpeg_dezigzag(%rip), %r15
	movw	%di, 0(%rbp)
	jmp	.L3072
	.p2align 4,,10
	.p2align 3
.L3063:
	movl	18464(%rbx), %esi
	movl	%esi, %eax
	shrl	$23, %eax
	movswl	(%r12,%rax,2), %edx
	movl	%edx, %ecx
	testl	%edx, %edx
	je	.L3064
	movl	%edx, %eax
	movl	18468(%rbx), %r8d
	andl	$15, %ecx
	sarl	$4, %eax
	andl	$15, %eax
	addl	%r14d, %eax
	cmpl	%ecx, %r8d
	jl	.L3065
	leal	1(%rax), %r14d
	cltq
	sarl	$8, %edx
	subl	%ecx, %r8d
	movzbl	(%r15,%rax), %eax
	sall	%cl, %esi
	movl	%r8d, 18468(%rbx)
	movl	%esi, 18464(%rbx)
	imulw	0(%r13,%rax,2), %dx
	movw	%dx, 0(%rbp,%rax,2)
.L3066:
	cmpl	$63, %r14d
	jg	.L3073
.L3072:
	cmpl	$15, 18468(%rbx)
	jg	.L3063
	movq	%rbx, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L3063
	.p2align 4,,10
	.p2align 3
.L3087:
	call	stbi__grow_buffer_unsafe
	jmp	.L3051
	.p2align 4,,10
	.p2align 3
.L3064:
	movq	(%rsp), %rsi
	movq	%rbx, %rdi
	call	stbi__jpeg_huff_decode
	testl	%eax, %eax
	js	.L3065
	movl	%eax, %ecx
	andl	$15, %ecx
	jne	.L3067
	cmpl	$240, %eax
	jne	.L3073
	addl	$16, %r14d
	cmpl	$63, %r14d
	jle	.L3072
.L3073:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3067:
	.cfi_restore_state
	sarl	$4, %eax
	movl	18468(%rbx), %r10d
	addl	%r14d, %eax
	leal	1(%rax), %r14d
	cltq
	movzbl	(%r15,%rax), %edx
	cmpl	%r10d, %ecx
	jg	.L3091
.L3070:
	movslq	%ecx, %r9
	leaq	stbi__bmask(%rip), %rdi
	movl	18464(%rbx), %eax
	subl	%ecx, %r10d
	movl	(%rdi,%r9,4), %r8d
	movl	%r10d, 18468(%rbx)
	leaq	stbi__jbias(%rip), %rdi
	movl	%eax, %esi
	shrl	$31, %eax
	movl	%r8d, %r11d
	roll	%cl, %esi
	subl	$1, %eax
	andl	(%rdi,%r9,4), %eax
	notl	%r11d
	andl	%esi, %r11d
	andl	%r8d, %esi
	movl	%r11d, 18464(%rbx)
	addl	%esi, %eax
.L3071:
	imulw	0(%r13,%rdx,2), %ax
	movw	%ax, 0(%rbp,%rdx,2)
	jmp	.L3066
	.p2align 4,,10
	.p2align 3
.L3089:
	movl	$32767, %eax
	xorl	%edx, %edx
	idivl	%ecx
	leaq	.LC91(%rip), %rdx
	cmpl	%eax, %r8d
	jg	.L3053
	jmp	.L3059
	.p2align 4,,10
	.p2align 3
.L3088:
	movl	18468(%rbx), %edi
	cmpl	%edi, %edx
	jg	.L3092
	leaq	(%r15,%r15,2), %rax
	salq	$5, %rax
	movl	18104(%rbx,%rax), %esi
.L3076:
	movl	18464(%rbx), %eax
	movl	%edx, %ecx
	movslq	%edx, %r9
	subl	%edx, %edi
	leaq	stbi__bmask(%rip), %r8
	leaq	stbi__jbias(%rip), %rdx
	movl	%edi, 18468(%rbx)
	movl	%eax, %r11d
	movl	(%r8,%r9,4), %r8d
	shrl	$31, %eax
	roll	%cl, %r11d
	subl	$1, %eax
	andl	(%rdx,%r9,4), %eax
	movl	%r11d, %ecx
	movl	%r8d, %r10d
	andl	%r8d, %ecx
	notl	%r10d
	addl	%ecx, %eax
	andl	%r11d, %r10d
	movl	%eax, %edi
	movl	%r10d, 18464(%rbx)
	xorl	%esi, %edi
	js	.L3056
	testl	%esi, %esi
	jns	.L3057
	testl	%eax, %eax
	jns	.L3057
	movl	$-2147483648, %edx
	subl	%eax, %edx
	cmpl	%esi, %edx
	setle	%dl
	movzbl	%dl, %edx
.L3058:
	testl	%edx, %edx
	jne	.L3056
	leaq	.LC90(%rip), %rdx
	jmp	.L3053
	.p2align 4,,10
	.p2align 3
.L3091:
	movq	%rbx, %rdi
	movl	%ecx, 12(%rsp)
	movb	%dl, 8(%rsp)
	call	stbi__grow_buffer_unsafe
	movl	18468(%rbx), %r10d
	movl	12(%rsp), %ecx
	movzbl	8(%rsp), %edx
	cmpl	%r10d, %ecx
	jle	.L3070
	xorl	%eax, %eax
	jmp	.L3071
	.p2align 4,,10
	.p2align 3
.L3092:
	movq	%rbx, %rdi
	movl	%edx, 8(%rsp)
	call	stbi__grow_buffer_unsafe
	leaq	(%r15,%r15,2), %rax
	movl	18468(%rbx), %edi
	movl	8(%rsp), %edx
	salq	$5, %rax
	movl	18104(%rbx,%rax), %esi
	cmpl	%edi, %edx
	jg	.L3054
	jmp	.L3076
	.p2align 4,,10
	.p2align 3
.L3090:
	xorl	%ecx, %ecx
	cmpl	%eax, %r8d
	setle	%cl
	jmp	.L3062
.L3057:
	movl	$2147483647, %edx
	subl	%eax, %edx
	cmpl	%edx, %esi
	setle	%dl
	movzbl	%dl, %edx
	jmp	.L3058
	.cfi_endproc
.LFE620:
	.size	stbi__jpeg_decode_block, .-stbi__jpeg_decode_block
	.section	.rodata.str1.1
.LC92:
	.string	"expected marker"
.LC93:
	.string	"bad DRI len"
.LC94:
	.string	"bad DQT type"
.LC95:
	.string	"bad DQT table"
.LC96:
	.string	"bad DHT header"
.LC97:
	.string	"bad COM len"
.LC98:
	.string	"bad APP len"
.LC99:
	.string	"unknown marker"
	.text
	.p2align 4
	.type	stbi__process_marker, @function
stbi__process_marker:
.LFB631:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	cmpl	$221, %esi
	je	.L3094
	movl	%esi, %ebx
	jg	.L3095
	cmpl	$196, %esi
	je	.L3096
	cmpl	$219, %esi
	jne	.L3098
	movq	(%rdi), %rdi
	call	stbi__get16be
	subl	$2, %eax
	movl	%eax, 8(%rsp)
	testl	%eax, %eax
	jle	.L3130
	leaq	64+stbi__jpeg_dezigzag(%rip), %rcx
	.p2align 4,,10
	.p2align 3
.L3129:
	movq	(%r12), %rbx
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
	cmpq	%rdx, %rax
	jb	.L3240
	movl	48(%rbx), %r15d
	xorl	%r14d, %r14d
	testl	%r15d, %r15d
	jne	.L3241
.L3107:
	leaq	stbi__jpeg_dezigzag(%rip), %r13
	movslq	%r15d, %r15
	jmp	.L3112
	.p2align 4,,10
	.p2align 3
.L3245:
	cmpq	%rdx, %rax
	jb	.L3242
	movl	48(%rbx), %ebp
	testl	%ebp, %ebp
	jne	.L3243
.L3121:
	movzbl	0(%r13), %edx
	movq	%r15, %rax
	addq	$1, %r13
	salq	$6, %rax
	leaq	6720(%rdx,%rax), %rax
	movw	%bp, 8(%r12,%rax,2)
	cmpq	%r13, %rcx
	je	.L3244
	movq	(%r12), %rbx
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
.L3112:
	testl	%r14d, %r14d
	jne	.L3245
	cmpq	%rdx, %rax
	jb	.L3246
	movl	48(%rbx), %edi
	xorl	%ebp, %ebp
	testl	%edi, %edi
	je	.L3121
	leaq	56(%rbx), %rsi
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rsi, (%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	(%rsp), %rsi
	leaq	64+stbi__jpeg_dezigzag(%rip), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	leaq	57(%rbx), %rdx
	je	.L3239
	cltq
	movzbl	56(%rbx), %ebp
	addq	%rax, %rsi
.L3125:
	movq	%rsi, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L3121
.L3095:
	cmpl	$255, %esi
	jne	.L3099
	leaq	.LC92(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L3100:
	xorl	%eax, %eax
.L3093:
	movq	104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L3247
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L3094:
	.cfi_restore_state
	movq	(%rdi), %rdi
	call	stbi__get16be
	cmpl	$4, %eax
	je	.L3101
	leaq	.LC93(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3100
.L3099:
	leal	-224(%rsi), %eax
	cmpl	$15, %eax
	jbe	.L3181
	cmpl	$254, %esi
	je	.L3181
.L3098:
	leaq	.LC99(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3100
.L3096:
	movq	(%rdi), %rdi
	call	stbi__get16be
	subl	$2, %eax
	movl	%eax, 8(%rsp)
	testl	%eax, %eax
	jle	.L3130
	.p2align 4,,10
	.p2align 3
.L3147:
	movq	(%r12), %r14
	movq	192(%r14), %rax
	movq	200(%r14), %rdx
	cmpq	%rdx, %rax
	jb	.L3248
	movl	48(%r14), %r13d
	movl	$0, 28(%rsp)
	movb	$0, 15(%rsp)
	testl	%r13d, %r13d
	jne	.L3249
.L3133:
	leaq	32(%rsp), %rbx
	leaq	96(%rsp), %rbp
	xorl	%r9d, %r9d
	movq	%rbx, 16(%rsp)
	jmp	.L3137
	.p2align 4,,10
	.p2align 3
.L3139:
	movl	48(%r14), %eax
	testl	%eax, %eax
	jne	.L3250
.L3140:
	movl	%eax, (%rbx)
	addq	$4, %rbx
	cmpq	%rbp, %rbx
	je	.L3251
.L3143:
	movq	(%r12), %r14
	movq	192(%r14), %rax
	movq	200(%r14), %rdx
.L3137:
	cmpq	%rdx, %rax
	jnb	.L3139
	leaq	1(%rax), %rdx
	addq	$4, %rbx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %eax
	movl	%eax, -4(%rbx)
	addl	%eax, %r9d
	cmpq	%rbp, %rbx
	jne	.L3143
.L3251:
	cmpl	$256, %r9d
	jg	.L3136
	movl	8(%rsp), %eax
	movzbl	15(%rsp), %ebp
	movl	%r9d, (%rsp)
	subl	$17, %eax
	imulq	$1680, %rbp, %rbp
	movl	%eax, 24(%rsp)
	testl	%r13d, %r13d
	jne	.L3144
	movq	16(%rsp), %rsi
	leaq	8(%r12,%rbp), %rdi
	call	stbi__build_huffman
	testl	%eax, %eax
	je	.L3100
	movslq	28(%rsp), %rax
	movl	(%rsp), %r9d
	movq	%rax, 16(%rsp)
	imulq	$1680, %rax, %rax
	leaq	1032(%r12,%rax), %rbx
	testl	%r9d, %r9d
	je	.L3154
.L3146:
	xorl	%r15d, %r15d
	jmp	.L3153
	.p2align 4,,10
	.p2align 3
.L3149:
	movl	48(%r14), %esi
	xorl	%r10d, %r10d
	testl	%esi, %esi
	jne	.L3252
.L3150:
	movb	%r10b, (%rbx,%r15)
	addq	$1, %r15
	cmpl	%r15d, %r9d
	jle	.L3253
.L3153:
	movq	(%r12), %r14
	movq	192(%r14), %rax
	cmpq	200(%r14), %rax
	jnb	.L3149
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %r10d
	movb	%r10b, (%rbx,%r15)
	addq	$1, %r15
	cmpl	%r15d, %r9d
	jg	.L3153
.L3253:
	testl	%r13d, %r13d
	je	.L3154
	leaq	6728(%r12,%rbp), %r14
.L3148:
	movq	16(%rsp), %rbx
	xorl	%eax, %eax
	movl	$1, %r13d
	movl	$-1, %r15d
	salq	$10, %rbx
	leaq	13960(%r12,%rbx), %rbx
	.p2align 4,,10
	.p2align 3
.L3157:
	movzbl	(%r14,%rax), %edx
	xorl	%ecx, %ecx
	movw	%cx, (%rbx,%rax,2)
	cmpb	$-1, %dl
	je	.L3155
	movzbl	%dl, %ecx
	movzbl	1024(%r14,%rcx), %edx
	movl	%edx, %r10d
	andl	$15, %r10d
	je	.L3155
	movzbl	1280(%r14,%rcx), %ecx
	movzbl	%r10b, %edi
	movl	%ecx, %r11d
	addl	%edi, %ecx
	cmpl	$9, %ecx
	jg	.L3155
	movl	%r11d, %ecx
	movl	%eax, %esi
	sall	%cl, %esi
	movl	$9, %ecx
	subl	%edi, %ecx
	andl	$511, %esi
	sarl	%cl, %esi
	leal	-1(%rdi), %ecx
	movl	%r13d, %edi
	sall	%cl, %edi
	movl	%esi, %ebp
	cmpl	%edi, %esi
	jge	.L3156
	movl	%r15d, %edi
	movl	%r10d, %ecx
	sall	%cl, %edi
	leal	1(%rsi,%rdi), %ebp
	movl	%ebp, %esi
.L3156:
	subl	$-128, %ebp
	cmpl	$255, %ebp
	ja	.L3155
	sall	$4, %esi
	sarl	$4, %edx
	movzbl	%r10b, %r10d
	addl	%esi, %edx
	addl	%r10d, %r11d
	sall	$4, %edx
	addl	%r11d, %edx
	movw	%dx, (%rbx,%rax,2)
	.p2align 4,,10
	.p2align 3
.L3155:
	addq	$1, %rax
	cmpq	$512, %rax
	jne	.L3157
.L3154:
	movl	24(%rsp), %eax
	subl	%r9d, %eax
	movl	%eax, 8(%rsp)
	testl	%eax, %eax
	jg	.L3147
.L3130:
	movl	8(%rsp), %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	sete	%al
	jmp	.L3093
	.p2align 4,,10
	.p2align 3
.L3250:
	leaq	56(%r14), %r15
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movl	%r9d, (%rsp)
	movq	%r15, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	movl	(%rsp), %r9d
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	leaq	57(%r14), %rdx
	jne	.L3141
	movl	$0, 48(%r14)
	movq	%rdx, %rsi
	movb	$0, 56(%r14)
.L3142:
	movq	%rsi, 200(%r14)
	movq	%rdx, 192(%r14)
	jmp	.L3140
	.p2align 4,,10
	.p2align 3
.L3141:
	cltq
	leaq	(%r15,%rax), %rsi
	movzbl	56(%r14), %eax
	addl	%eax, %r9d
	jmp	.L3142
	.p2align 4,,10
	.p2align 3
.L3252:
	leaq	56(%r14), %rsi
	movl	%r9d, 8(%rsp)
	movl	52(%r14), %edx
	movq	%rsi, (%rsp)
	movq	40(%r14), %rdi
	movb	%r10b, 15(%rsp)
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	movq	(%rsp), %rsi
	leaq	57(%r14), %rdx
	movl	8(%rsp), %r9d
	jne	.L3151
	movb	$0, 56(%r14)
	movzbl	15(%rsp), %r10d
	movq	%rdx, %rsi
	movl	$0, 48(%r14)
.L3152:
	movq	%rsi, 200(%r14)
	movq	%rdx, 192(%r14)
	jmp	.L3150
	.p2align 4,,10
	.p2align 3
.L3151:
	cltq
	movzbl	56(%r14), %r10d
	addq	%rax, %rsi
	jmp	.L3152
	.p2align 4,,10
	.p2align 3
.L3144:
	leaq	6728(%r12,%rbp), %r14
	movq	16(%rsp), %rsi
	movq	%r14, %rdi
	call	stbi__build_huffman
	testl	%eax, %eax
	je	.L3100
	movslq	28(%rsp), %rax
	movl	(%rsp), %r9d
	movq	%rax, 16(%rsp)
	imulq	$1680, %rax, %rax
	leaq	7752(%r12,%rax), %rbx
	testl	%r9d, %r9d
	jne	.L3146
	jmp	.L3148
.L3248:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %eax
	movl	%eax, %esi
	movl	%eax, %r13d
	andl	$15, %esi
	sarl	$4, %r13d
	movb	%sil, 15(%rsp)
	movl	%eax, %esi
	andl	$15, %esi
	cmpl	$31, %eax
	seta	%al
	movl	%esi, 28(%rsp)
	cmpl	$3, %esi
	setg	%dl
	orl	%edx, %eax
.L3132:
	testb	%al, %al
	jne	.L3136
.L3135:
	movq	(%r12), %r14
	movq	192(%r14), %rax
	movq	200(%r14), %rdx
	jmp	.L3133
.L3249:
	leaq	56(%r14), %r15
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%r15, %rsi
	call	*16(%r14)
	leaq	57(%r14), %rdx
	movslq	%eax, %r13
	movq	192(%r14), %rax
	subq	208(%r14), %rax
	addl	%eax, 184(%r14)
	testl	%r13d, %r13d
	jne	.L3134
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	movq	%rdx, 200(%r14)
	movq	%rdx, 192(%r14)
	jmp	.L3135
.L3134:
	movzbl	56(%r14), %eax
	addq	%r13, %r15
	movq	%rdx, 192(%r14)
	movq	%r15, 200(%r14)
	movl	%eax, %edi
	movl	%eax, %r13d
	andl	$15, %edi
	sarl	$4, %r13d
	movb	%dil, 15(%rsp)
	movl	%eax, %edi
	andl	$15, %edi
	cmpl	$31, %eax
	seta	%al
	cmpl	$3, %edi
	movl	%edi, 28(%rsp)
	setg	%sil
	orl	%esi, %eax
	jmp	.L3132
.L3101:
	movq	(%r12), %rdi
	call	stbi__get16be
	movl	%eax, 18536(%r12)
.L3103:
	movl	$1, %eax
	jmp	.L3093
	.p2align 4,,10
	.p2align 3
.L3181:
	movq	(%r12), %rdi
	call	stbi__get16be
	movl	%eax, %ebp
	cmpl	$1, %eax
	jg	.L3159
	cmpl	$254, %ebx
	leaq	.LC97(%rip), %rax
	leaq	.LC98(%rip), %rdx
	cmovne	%rdx, %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3100
	.p2align 4,,10
	.p2align 3
.L3242:
	leaq	1(%rax), %rdi
	movq	%rdi, 192(%rbx)
	movzbl	(%rax), %ebp
	sall	$8, %ebp
.L3115:
	cmpq	%rdx, %rdi
	jnb	.L3118
	leaq	1(%rdi), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdi), %eax
	addl	%eax, %ebp
	jmp	.L3121
	.p2align 4,,10
	.p2align 3
.L3246:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %ebp
	jmp	.L3121
	.p2align 4,,10
	.p2align 3
.L3243:
	leaq	56(%rbx), %rsi
	movq	40(%rbx), %rdi
	movl	52(%rbx), %edx
	movq	%rsi, (%rsp)
	call	*16(%rbx)
	movq	(%rsp), %rsi
	leaq	57(%rbx), %rdi
	leaq	64+stbi__jpeg_dezigzag(%rip), %rcx
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ebp, %ebp
	jne	.L3117
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdi, 200(%rbx)
	movq	%rdi, 192(%rbx)
.L3118:
	movl	48(%rbx), %r8d
	testl	%r8d, %r8d
	je	.L3121
	leaq	56(%rbx), %rsi
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rsi, (%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	movq	(%rsp), %rsi
	leaq	64+stbi__jpeg_dezigzag(%rip), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	leaq	57(%rbx), %rdx
	je	.L3239
	cltq
	addq	%rax, %rsi
	movzbl	56(%rbx), %eax
	addl	%eax, %ebp
	jmp	.L3125
	.p2align 4,,10
	.p2align 3
.L3239:
	movl	$0, 48(%rbx)
	movq	%rdx, %rsi
	movb	$0, 56(%rbx)
	jmp	.L3125
	.p2align 4,,10
	.p2align 3
.L3117:
	leaq	(%rsi,%rbp), %rdx
	movzbl	56(%rbx), %ebp
	movq	%rdi, 192(%rbx)
	movq	%rdx, 200(%rbx)
	sall	$8, %ebp
	jmp	.L3115
	.p2align 4,,10
	.p2align 3
.L3244:
	testl	%r14d, %r14d
	je	.L3127
	subl	$129, 8(%rsp)
	movl	8(%rsp), %eax
	testl	%eax, %eax
	jg	.L3129
	jmp	.L3130
	.p2align 4,,10
	.p2align 3
.L3127:
	subl	$65, 8(%rsp)
	movl	8(%rsp), %eax
	testl	%eax, %eax
	jg	.L3129
	jmp	.L3130
	.p2align 4,,10
	.p2align 3
.L3240:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r14d
	movl	%r14d, %eax
	sarl	$4, %r14d
	movl	%eax, %r15d
	andl	$15, %r15d
	cmpl	$1, %r14d
	jg	.L3254
.L3110:
	testb	$12, %al
	jne	.L3111
.L3109:
	movq	(%r12), %rbx
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
	jmp	.L3107
.L3241:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rdx
	leaq	64+stbi__jpeg_dezigzag(%rip), %rcx
	movslq	%eax, %r14
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r14d, %r14d
	jne	.L3108
	movl	$0, 48(%rbx)
	xorl	%r15d, %r15d
	movb	$0, 56(%rbx)
	movq	%rdx, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L3109
.L3108:
	addq	%r14, %rbp
	movzbl	56(%rbx), %r14d
	movq	%rdx, 192(%rbx)
	movq	%rbp, 200(%rbx)
	movl	%r14d, %eax
	sarl	$4, %r14d
	movl	%eax, %r15d
	andl	$15, %r15d
	cmpl	$1, %r14d
	jle	.L3110
.L3254:
	leaq	.LC94(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3100
.L3136:
	leaq	.LC96(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3100
.L3111:
	leaq	.LC95(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3100
.L3159:
	leal	-2(%rax), %esi
	cmpl	$224, %ebx
	jne	.L3161
	cmpl	$4, %esi
	jle	.L3161
	leaq	tag.38(%rip), %rbx
	movl	$1, %r15d
	xorl	%r13d, %r13d
	leaq	5(%rbx), %r14
.L3163:
	movq	(%r12), %rdi
	call	stbi__get8
	cmpb	(%rbx), %al
	cmovne	%r13d, %r15d
	addq	$1, %rbx
	cmpq	%r14, %rbx
	jne	.L3163
	movq	(%r12), %rdi
	leal	-7(%rbp), %esi
	testl	%r15d, %r15d
	je	.L3238
	movl	$1, 18504(%r12)
	testl	%esi, %esi
	je	.L3103
.L3169:
	call	stbi__skip.part.0
	jmp	.L3103
.L3161:
	cmpl	$238, %ebx
	jne	.L3182
	leaq	tag.37(%rip), %rbx
	movl	$1, %r15d
	xorl	%r13d, %r13d
	leaq	6(%rbx), %r14
	cmpl	$11, %esi
	jle	.L3182
.L3171:
	movq	(%r12), %rdi
	call	stbi__get8
	cmpb	(%rbx), %al
	cmovne	%r13d, %r15d
	addq	$1, %rbx
	cmpq	%r14, %rbx
	jne	.L3171
	leal	-8(%rbp), %esi
	testl	%r15d, %r15d
	jne	.L3255
.L3173:
	movq	(%r12), %rdi
	testl	%esi, %esi
	je	.L3103
	jns	.L3169
	movq	200(%rdi), %rax
	movq	%rax, 192(%rdi)
	jmp	.L3103
.L3182:
	movq	(%r12), %rdi
.L3238:
	testl	%esi, %esi
	jne	.L3169
	jmp	.L3103
.L3255:
	movq	(%r12), %rdi
	call	stbi__get8
	movq	(%r12), %rdi
	call	stbi__get16be
	movq	(%r12), %rdi
	call	stbi__get16be
	movq	(%r12), %rdi
	call	stbi__get8
	leal	-14(%rbp), %esi
	movzbl	%al, %eax
	movl	%eax, 18508(%r12)
	jmp	.L3173
.L3247:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE631:
	.size	stbi__process_marker, .-stbi__process_marker
	.section	.rodata.str1.1
.LC100:
	.string	"bad BMP"
.LC101:
	.string	"BMP RLE"
.LC102:
	.string	"BMP JPEG/PNG"
.LC103:
	.string	"unknown BMP"
.LC104:
	.string	"not BMP"
	.text
	.p2align 4
	.type	stbi__bmp_parse_header.constprop.0, @function
stbi__bmp_parse_header.constprop.0:
.LFB850:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L3310
	movl	48(%rdi), %esi
	testl	%esi, %esi
	jne	.L3259
.L3262:
	leaq	.LC104(%rip), %rax
.L3260:
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L3256:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3310:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %edx
.L3258:
	cmpb	$66, %dl
	jne	.L3262
	cmpq	%rax, %rcx
	jb	.L3311
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L3262
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L3265
.L3308:
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
	jmp	.L3262
	.p2align 4,,10
	.p2align 3
.L3311:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rcx), %edx
.L3264:
	cmpb	$77, %dl
	jne	.L3262
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	call	stbi__get16le
	movq	%rbx, %rdi
	call	stbi__get16le
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	movl	%eax, 4(%rbp)
	call	stbi__get32le
	movl	4(%rbp), %edx
	pxor	%xmm0, %xmm0
	movl	$14, 32(%rbp)
	movl	%eax, 8(%rbp)
	movl	%eax, %r12d
	movups	%xmm0, 12(%rbp)
	testl	%edx, %edx
	js	.L3273
	cmpl	$12, %eax
	je	.L3305
	cmpl	$40, %eax
	je	.L3268
	andl	$-17, %eax
	cmpl	$108, %eax
	je	.L3271
	cmpl	$56, %r12d
	jne	.L3312
.L3271:
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	movl	%eax, (%rbx)
	call	stbi__get32le
	movq	%rbx, %rdi
	movl	%eax, 4(%rbx)
	call	stbi__get16le
	cmpl	$1, %eax
	jne	.L3273
	movq	%rbx, %rdi
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, 0(%rbp)
	call	stbi__get32le
	movl	%eax, %r13d
	leal	-1(%rax), %eax
	cmpl	$1, %eax
	jbe	.L3290
	cmpl	$3, %r13d
	jg	.L3291
	jne	.L3277
	movl	0(%rbp), %eax
	subl	$16, %eax
	andl	$-17, %eax
	jne	.L3273
.L3277:
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	call	stbi__get32le
	movl	%r12d, %eax
	andl	$-17, %eax
	cmpl	$40, %eax
	jne	.L3278
	cmpl	$56, %r12d
	je	.L3313
.L3279:
	movl	0(%rbp), %eax
	leal	-16(%rax), %edx
	andl	$-17, %edx
	jne	.L3276
	testl	%r13d, %r13d
	jne	.L3281
	cmpl	$16, %eax
	je	.L3314
	movdqa	.LC106(%rip), %xmm0
	movl	$0, 28(%rbp)
	movups	%xmm0, 12(%rbp)
	.p2align 4,,10
	.p2align 3
.L3276:
	movl	$1, %eax
	jmp	.L3256
.L3281:
	cmpl	$3, %r13d
	jne	.L3273
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	movl	%eax, 12(%rbp)
	call	stbi__get32le
	movq	%rbx, %rdi
	movl	%eax, 16(%rbp)
	call	stbi__get32le
	addl	$12, 32(%rbp)
	movl	16(%rbp), %edx
	movl	%eax, 20(%rbp)
	cmpl	%edx, 12(%rbp)
	jne	.L3276
	cmpl	%edx, %eax
	jne	.L3276
	.p2align 4,,10
	.p2align 3
.L3273:
	leaq	.LC100(%rip), %rax
	jmp	.L3260
	.p2align 4,,10
	.p2align 3
.L3259:
	leaq	56(%rdi), %r12
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L3308
	cltq
	movq	%rcx, 192(%rbx)
	movzbl	56(%rbx), %edx
	addq	%r12, %rax
	movq	%rax, 200(%rbx)
	jmp	.L3258
	.p2align 4,,10
	.p2align 3
.L3268:
	cmpl	$12, %eax
	jne	.L3271
	.p2align 4,,10
	.p2align 3
.L3305:
	movq	%rbx, %rdi
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, (%rbx)
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, 4(%rbx)
	call	stbi__get16le
	cmpl	$1, %eax
	jne	.L3273
	movq	%rbx, %rdi
	call	stbi__get16le
	movl	%eax, 0(%rbp)
	jmp	.L3276
	.p2align 4,,10
	.p2align 3
.L3265:
	cltq
	movq	%rcx, 192(%rbx)
	movzbl	56(%rbx), %edx
	addq	%rax, %r12
	movq	%r12, 200(%rbx)
	jmp	.L3264
.L3291:
	leaq	.LC102(%rip), %rax
	jmp	.L3260
	.p2align 4,,10
	.p2align 3
.L3278:
	cmpl	$108, %eax
	jne	.L3273
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	movl	%eax, 12(%rbp)
	call	stbi__get32le
	movq	%rbx, %rdi
	movl	%eax, 16(%rbp)
	call	stbi__get32le
	movq	%rbx, %rdi
	movl	%eax, 20(%rbp)
	call	stbi__get32le
	movl	%eax, 24(%rbp)
	testl	%r13d, %r13d
	je	.L3315
.L3284:
	movq	%rbx, %rdi
	movl	$12, %ebp
	call	stbi__get32le
	.p2align 4,,10
	.p2align 3
.L3287:
	movq	%rbx, %rdi
	call	stbi__get32le
	subl	$1, %ebp
	jne	.L3287
	cmpl	$124, %r12d
	jne	.L3276
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	call	stbi__get32le
	jmp	.L3276
	.p2align 4,,10
	.p2align 3
.L3312:
	leaq	.LC103(%rip), %rax
	jmp	.L3260
	.p2align 4,,10
	.p2align 3
.L3290:
	leaq	.LC101(%rip), %rax
	jmp	.L3260
.L3313:
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	call	stbi__get32le
	movq	%rbx, %rdi
	call	stbi__get32le
	jmp	.L3279
.L3315:
	movl	0(%rbp), %eax
	cmpl	$16, %eax
	je	.L3316
	cmpl	$32, %eax
	je	.L3317
	pxor	%xmm0, %xmm0
	movups	%xmm0, 12(%rbp)
	jmp	.L3284
.L3314:
	movq	.LC105(%rip), %rax
	movl	$31, 20(%rbp)
	movq	%rax, 12(%rbp)
	jmp	.L3276
.L3316:
	movq	.LC105(%rip), %rax
	movl	$31, 20(%rbp)
	movq	%rax, 12(%rbp)
	jmp	.L3284
.L3317:
	movdqa	.LC106(%rip), %xmm0
	xorl	%eax, %eax
	movl	%eax, 28(%rbp)
	movups	%xmm0, 12(%rbp)
	jmp	.L3284
	.cfi_endproc
.LFE850:
	.size	stbi__bmp_parse_header.constprop.0, .-stbi__bmp_parse_header.constprop.0
	.section	.rodata.str1.1
.LC108:
	.string	"bad png sig"
.LC109:
	.string	"multiple IHDR"
.LC110:
	.string	"bad IHDR len"
.LC111:
	.string	"1/2/4/8/16-bit only"
.LC112:
	.string	"bad ctype"
.LC113:
	.string	"bad comp method"
.LC114:
	.string	"bad filter method"
.LC115:
	.string	"bad interlace method"
.LC116:
	.string	"0-pixel image"
.LC117:
	.string	"first not IHDR"
.LC118:
	.string	"invalid PLTE"
.LC119:
	.string	"tRNS after IDAT"
.LC120:
	.string	"tRNS before PLTE"
.LC121:
	.string	"bad tRNS len"
.LC122:
	.string	"tRNS with alpha"
.LC123:
	.string	"no PLTE"
.LC124:
	.string	"IDAT size limit"
.LC125:
	.string	"outofdata"
.LC126:
	.string	"no IDAT"
.LC135:
	.string	"out_n == 2 || out_n == 4"
.LC136:
	.string	"s->img_out_n == 4"
	.text
	.p2align 4
	.type	stbi__parse_png_file, @function
stbi__parse_png_file:
.LFB689:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pxor	%xmm0, %xmm0
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$6136, %rsp
	.cfi_def_cfa_offset 6192
	movq	(%rdi), %rcx
	movl	%edx, 44(%rsp)
	movl	%esi, 16(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 6120(%rsp)
	xorl	%eax, %eax
	xorl	%eax, %eax
	movups	%xmm0, 8(%rdi)
	movq	192(%rcx), %rdx
	movw	%ax, 5085(%rsp)
	movq	200(%rcx), %rax
	movb	$0, 5087(%rsp)
	movq	%rcx, (%rsp)
	movq	$0, 24(%rdi)
	cmpq	%rax, %rdx
	jb	.L3319
	movl	48(%rcx), %eax
	testl	%eax, %eax
	jne	.L3600
	.p2align 4,,10
	.p2align 3
.L3320:
	leaq	.LC108(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L3345:
	xorl	%eax, %eax
.L3318:
	movq	6120(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L3601
	addq	$6136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3319:
	.cfi_restore_state
	movq	%rcx, %rsi
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rsi)
	movzbl	(%rdx), %edx
.L3322:
	cmpb	$-119, %dl
	jne	.L3320
	cmpq	%rax, %rcx
	jb	.L3323
	movq	(%rsp), %rax
	movl	48(%rax), %r15d
	testl	%r15d, %r15d
	je	.L3320
	leaq	56(%rax), %rbp
	movq	%rax, %rbx
	movl	52(%rax), %edx
	movq	40(%rax), %rdi
	movq	%rbp, %rsi
	call	*16(%rax)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L3336
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %ecx
	addq	%rbp, %rax
	movq	%rax, 200(%rbx)
	jmp	.L3325
	.p2align 4,,10
	.p2align 3
.L3323:
	movq	(%rsp), %rsi
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rsi)
	movzbl	(%rcx), %ecx
.L3325:
	cmpb	$80, %cl
	jne	.L3320
	cmpq	%rax, %rdx
	jb	.L3326
	movq	(%rsp), %rax
	movl	48(%rax), %r13d
	testl	%r13d, %r13d
	je	.L3320
	leaq	56(%rax), %rbp
	movq	%rax, %rbx
	movl	52(%rax), %edx
	movq	40(%rax), %rdi
	movq	%rbp, %rsi
	call	*16(%rax)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L3339
	cltq
	movq	%rcx, 192(%rbx)
	movzbl	56(%rbx), %edx
	addq	%rbp, %rax
	movq	%rax, 200(%rbx)
	jmp	.L3328
	.p2align 4,,10
	.p2align 3
.L3326:
	movq	(%rsp), %rsi
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rsi)
	movzbl	(%rdx), %edx
.L3328:
	cmpb	$78, %dl
	jne	.L3320
	cmpq	%rax, %rcx
	jb	.L3329
	movq	(%rsp), %rax
	movl	48(%rax), %r12d
	testl	%r12d, %r12d
	je	.L3320
	leaq	56(%rax), %rbp
	movq	%rax, %rbx
	movl	52(%rax), %edx
	movq	40(%rax), %rdi
	movq	%rbp, %rsi
	call	*16(%rax)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L3336
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %ecx
	addq	%rbp, %rax
	movq	%rax, 200(%rbx)
	jmp	.L3331
	.p2align 4,,10
	.p2align 3
.L3329:
	movq	(%rsp), %rsi
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rsi)
	movzbl	(%rcx), %ecx
.L3331:
	cmpb	$71, %cl
	jne	.L3320
	cmpq	%rax, %rdx
	jb	.L3332
	movq	(%rsp), %rax
	movl	48(%rax), %ebp
	testl	%ebp, %ebp
	je	.L3320
	leaq	56(%rax), %rbp
	movq	%rax, %rbx
	movl	52(%rax), %edx
	movq	40(%rax), %rdi
	movq	%rbp, %rsi
	call	*16(%rax)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L3339
	cltq
	movq	%rcx, 192(%rbx)
	movzbl	56(%rbx), %edx
	addq	%rbp, %rax
	movq	%rax, 200(%rbx)
	jmp	.L3334
	.p2align 4,,10
	.p2align 3
.L3332:
	movq	(%rsp), %rsi
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rsi)
	movzbl	(%rdx), %edx
.L3334:
	cmpb	$13, %dl
	jne	.L3320
	cmpq	%rax, %rcx
	jb	.L3335
	movq	(%rsp), %rax
	movl	48(%rax), %ebx
	testl	%ebx, %ebx
	je	.L3320
	leaq	56(%rax), %rbp
	movq	%rax, %rbx
	movl	52(%rax), %edx
	movq	40(%rax), %rdi
	movq	%rbp, %rsi
	call	*16(%rax)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L3336
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %ecx
	addq	%rbp, %rax
	movq	%rax, 200(%rbx)
	jmp	.L3337
	.p2align 4,,10
	.p2align 3
.L3335:
	movq	(%rsp), %rsi
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rsi)
	movzbl	(%rcx), %ecx
.L3337:
	cmpb	$10, %cl
	jne	.L3320
	cmpq	%rax, %rdx
	jb	.L3338
	movq	(%rsp), %rax
	movl	48(%rax), %r11d
	testl	%r11d, %r11d
	je	.L3320
	leaq	56(%rax), %rbp
	movq	%rax, %rbx
	movl	52(%rax), %edx
	movq	40(%rax), %rdi
	movq	%rbp, %rsi
	call	*16(%rax)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L3602
.L3339:
	movq	(%rsp), %rax
	movl	$0, 48(%rax)
	movb	$0, 56(%rax)
	movq	%rcx, 200(%rax)
	movq	%rcx, 192(%rax)
	jmp	.L3320
	.p2align 4,,10
	.p2align 3
.L3338:
	movq	(%rsp), %rsi
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rsi)
	movzbl	(%rdx), %edx
.L3340:
	cmpb	$26, %dl
	jne	.L3320
	cmpq	%rax, %rcx
	jb	.L3603
	movq	(%rsp), %rax
	movl	48(%rax), %r10d
	testl	%r10d, %r10d
	je	.L3320
	leaq	56(%rax), %rbp
	movq	%rax, %rbx
	movl	52(%rax), %edx
	movq	40(%rax), %rdi
	movq	%rbp, %rsi
	call	*16(%rax)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L3343
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
	jmp	.L3320
	.p2align 4,,10
	.p2align 3
.L3603:
	movq	(%rsp), %rsi
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rsi)
	movzbl	(%rcx), %edx
.L3342:
	cmpb	$10, %dl
	jne	.L3320
	movq	(%rsp), %r15
	movl	$0, 72(%rsp)
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	movl	$0, 40(%rsp)
	leaq	56(%r15), %rax
	movl	$0, 36(%rsp)
	movl	$1, 8(%rsp)
	movl	$0, 24(%rsp)
	movb	$0, 79(%rsp)
	movb	$0, 35(%rsp)
	movq	%rax, 64(%rsp)
	.p2align 4,,10
	.p2align 3
.L3344:
	movq	%r15, %rdi
	call	stbi__get32be
	movq	%r15, %rdi
	movl	%eax, %r13d
	call	stbi__get32be
	cmpl	$1229472850, %eax
	je	.L3346
	ja	.L3347
	cmpl	$1229209940, %eax
	je	.L3348
	cmpl	$1229278788, %eax
	jne	.L3604
	movl	8(%rsp), %r10d
	testl	%r10d, %r10d
	jne	.L3392
	movl	16(%rsp), %r9d
	testl	%r9d, %r9d
	jne	.L3396
	movq	8(%r14), %r13
	testq	%r13, %r13
	je	.L3605
	movq	(%rsp), %rcx
	movl	72(%rsp), %ebp
	movl	4(%rcx), %eax
	movl	(%rcx), %r12d
	xorl	$1, %ebp
	imull	32(%r14), %r12d
	movl	8(%rcx), %edx
	imull	%eax, %edx
	addl	$7, %r12d
	shrl	$3, %r12d
	imull	%edx, %r12d
	addl	%eax, %r12d
	movslq	%r12d, %r12
	movq	%r12, %rdi
	call	malloc@PLT
	movq	%rax, %xmm1
	punpcklqdq	%xmm1, %xmm1
	testq	%rax, %rax
	je	.L3599
	movslq	24(%rsp), %rdx
	addq	%r12, %rax
	movq	%r13, %xmm0
	movl	%ebp, %esi
	movq	%rax, 1016(%rsp)
	leaq	976(%rsp), %rax
	addq	%r13, %rdx
	movq	%rax, %rdi
	movl	$1, 1024(%rsp)
	movq	%rdx, %xmm3
	movq	%rax, 80(%rsp)
	punpcklqdq	%xmm3, %xmm0
	movups	%xmm1, 1000(%rsp)
	movaps	%xmm0, 976(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L3422
	movq	1008(%rsp), %rax
	movl	1000(%rsp), %ecx
	subl	%eax, %ecx
	movq	%rax, 16(%r14)
	movl	%ecx, 140(%rsp)
	testq	%rax, %rax
	je	.L3345
	movq	8(%r14), %rdi
	call	free@PLT
	movq	(%rsp), %rax
	movl	44(%rsp), %ecx
	movq	$0, 8(%r14)
	movl	8(%rax), %eax
	movl	%eax, 136(%rsp)
	addl	$1, %eax
	cmpl	%ecx, %eax
	je	.L3606
.L3425:
	cmpb	$0, 79(%rsp)
	cmove	136(%rsp), %eax
	movl	%eax, 136(%rsp)
	movl	%eax, %ecx
.L3426:
	movq	(%rsp), %rax
	movl	32(%r14), %esi
	movq	(%r14), %r13
	movl	36(%rsp), %r8d
	movl	%ecx, 12(%rax)
	movq	16(%r14), %rax
	cmpl	$16, %esi
	movl	4(%r13), %r9d
	movl	0(%r13), %ebp
	movl	%esi, 152(%rsp)
	movq	%rax, 144(%rsp)
	leal	(%rcx,%rcx), %eax
	cmovne	%ecx, %eax
	movl	%eax, %r12d
	testl	%r8d, %r8d
	je	.L3607
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movl	%r9d, %esi
	movl	%ebp, %edi
	movl	%r9d, 8(%rsp)
	call	stbi__malloc_mad3
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L3431
	xorl	%r10d, %r10d
	movq	%r13, %rcx
	movq	%r14, 48(%rsp)
	movl	8(%rsp), %r9d
	leaq	880(%rsp), %rax
	movq	%r10, %r13
	movq	%rax, 112(%rsp)
	leaq	944(%rsp), %rax
	movq	%rax, 128(%rsp)
	leaq	912(%rsp), %rax
	movq	%rax, 120(%rsp)
	jmp	.L3439
	.p2align 4,,10
	.p2align 3
.L3432:
	addq	$4, %r13
	cmpq	$28, %r13
	je	.L3438
	movq	48(%rsp), %rax
	movq	(%rax), %rcx
	movl	(%rcx), %ebp
	movl	4(%rcx), %r9d
.L3439:
	movq	.LC128(%rip), %rax
	movdqa	.LC127(%rip), %xmm5
	movl	$0, 904(%rsp)
	xorl	%edx, %edx
	movdqa	.LC131(%rip), %xmm7
	movl	$1, 968(%rsp)
	movq	%rax, 896(%rsp)
	movq	.LC130(%rip), %rax
	movaps	%xmm5, 880(%rsp)
	movdqa	.LC129(%rip), %xmm6
	movdqa	.LC133(%rip), %xmm4
	movq	%rax, 928(%rsp)
	movq	.LC132(%rip), %rax
	movaps	%xmm7, 944(%rsp)
	movq	%rax, 960(%rsp)
	movq	.LC134(%rip), %rax
	movl	$1, 936(%rsp)
	movq	%rax, 992(%rsp)
	movq	112(%rsp), %rax
	movaps	%xmm6, 912(%rsp)
	movl	(%rax,%r13), %r15d
	movq	128(%rsp), %rax
	movl	$2, 1000(%rsp)
	movaps	%xmm4, 976(%rsp)
	movl	(%rax,%r13), %ebx
	leal	-1(%rbp,%rbx), %eax
	subl	%r15d, %eax
	divl	%ebx
	xorl	%edx, %edx
	movl	%eax, %r8d
	movq	120(%rsp), %rax
	movl	(%rax,%r13), %r14d
	movq	80(%rsp), %rax
	movl	(%rax,%r13), %r10d
	leal	-1(%r10,%r9), %eax
	subl	%r14d, %eax
	divl	%r10d
	movl	%eax, %r11d
	testl	%r8d, %r8d
	je	.L3432
	testl	%eax, %eax
	je	.L3432
	movl	8(%rcx), %eax
	movl	152(%rsp), %ecx
	movl	%r10d, 36(%rsp)
	movl	%r11d, %r9d
	imull	%r8d, %eax
	imull	%ecx, %eax
	addl	$7, %eax
	sarl	$3, %eax
	addl	$1, %eax
	imull	%r11d, %eax
	movl	%eax, 156(%rsp)
	movl	40(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 6200
	pushq	%rcx
	.cfi_def_cfa_offset 6208
	movq	64(%rsp), %rbp
	movl	152(%rsp), %ecx
	movl	156(%rsp), %edx
	movq	160(%rsp), %rsi
	movq	%rbp, %rdi
	movl	%r11d, 24(%rsp)
	movl	%r8d, 40(%rsp)
	call	stbi__create_png_image_raw
	popq	%rdx
	.cfi_def_cfa_offset 6200
	popq	%rcx
	.cfi_def_cfa_offset 6192
	testl	%eax, %eax
	je	.L3433
	movl	8(%rsp), %r11d
	movq	24(%rbp), %rdi
	testl	%r11d, %r11d
	jle	.L3434
	movl	24(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L3434
	movl	%r8d, %eax
	imull	%r12d, %ebx
	movl	36(%rsp), %r10d
	movq	%rdi, %r9
	imull	%r12d, %eax
	movq	%rdi, 160(%rsp)
	movl	%r10d, 104(%rsp)
	movq	%r13, 168(%rsp)
	cltq
	movl	%r8d, 36(%rsp)
	movq	%rax, 96(%rsp)
	movslq	%ebx, %rax
	movq	%rax, 24(%rsp)
	movl	%r15d, %eax
	movslq	%r12d, %r15
	imull	%r12d, %eax
	movl	%r11d, 108(%rsp)
	cltq
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3436:
	movq	48(%rsp), %rcx
	movl	%eax, 56(%rsp)
	movq	%r9, %rbx
	xorl	%ebp, %ebp
	movq	%r9, 64(%rsp)
	movq	88(%rsp), %r13
	movq	(%rcx), %rsi
	movq	%rsi, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L3437:
	movq	8(%rsp), %rax
	movq	%rbx, %rsi
	movq	%r15, %rdx
	addl	$1, %ebp
	addq	%r15, %rbx
	movl	(%rax), %edi
	movq	16(%rsp), %rax
	imull	%r12d, %edi
	imull	%r14d, %edi
	addq	%r13, %rdi
	addq	%rax, %rdi
	call	memcpy@PLT
	movq	24(%rsp), %rax
	addq	%rax, %r13
	cmpl	%ebp, 36(%rsp)
	jne	.L3437
	movq	96(%rsp), %rcx
	movq	64(%rsp), %r9
	movl	56(%rsp), %eax
	addq	%rcx, %r9
	movl	104(%rsp), %ecx
	addl	$1, %eax
	addl	%ecx, %r14d
	cmpl	%eax, 108(%rsp)
	jne	.L3436
	movq	160(%rsp), %rdi
	movq	168(%rsp), %r13
.L3434:
	call	free@PLT
	movl	156(%rsp), %eax
	addq	%rax, 144(%rsp)
	subl	%eax, 140(%rsp)
	jmp	.L3432
	.p2align 4,,10
	.p2align 3
.L3347:
	cmpl	$1347179589, %eax
	je	.L3352
	cmpl	$1951551059, %eax
	jne	.L3351
	movl	8(%rsp), %ebx
	testl	%ebx, %ebx
	jne	.L3392
	cmpq	$0, 8(%r14)
	jne	.L3608
	cmpb	$0, 35(%rsp)
	jne	.L3609
	movl	8(%r15), %eax
	testb	$1, %al
	je	.L3610
	leal	(%rax,%rax), %edx
	cmpl	%r13d, %edx
	jne	.L3398
	cmpl	$2, 16(%rsp)
	je	.L3611
	cmpl	$16, 32(%r14)
	je	.L3404
	xorl	%ebx, %ebx
	leaq	5085(%rsp), %rdx
	leaq	stbi__depth_scale_table(%rip), %r13
	testl	%eax, %eax
	jle	.L3406
	movl	%r12d, 48(%rsp)
	movq	%r15, %r12
	movl	%ebp, %r15d
	movq	%rdx, %rbp
.L3405:
	movq	%r12, %rdi
	call	stbi__get16be
	movslq	32(%r14), %rsi
	movl	%eax, %edx
	movzbl	0(%r13,%rsi), %eax
	imull	%edx, %eax
	movb	%al, 0(%rbp,%rbx)
	addq	$1, %rbx
	cmpl	%ebx, 8(%r12)
	jg	.L3405
	movl	%r15d, %ebp
	movq	%r12, %r15
	movl	48(%rsp), %r12d
.L3406:
	movb	$1, 79(%rsp)
	jmp	.L3356
	.p2align 4,,10
	.p2align 3
.L3604:
	cmpl	$1130840649, %eax
	jne	.L3351
	testl	%r13d, %r13d
	je	.L3354
	js	.L3612
	movl	%r13d, %esi
	movq	%r15, %rdi
	call	stbi__skip.part.0
.L3354:
	movl	$1, 72(%rsp)
	.p2align 4,,10
	.p2align 3
.L3356:
	movq	%r15, %rdi
	call	stbi__get32be
	jmp	.L3344
	.p2align 4,,10
	.p2align 3
.L3348:
	movl	8(%rsp), %r11d
	testl	%r11d, %r11d
	jne	.L3392
	cmpb	$0, 35(%rsp)
	je	.L3408
	testl	%ebp, %ebp
	je	.L3613
.L3408:
	cmpl	$2, 16(%rsp)
	je	.L3614
	cmpl	$1073741824, %r13d
	ja	.L3615
	movl	24(%rsp), %eax
	leal	(%rax,%r13), %r8d
	cmpl	%eax, %r8d
	jl	.L3345
	movq	8(%r14), %rdi
	cmpl	%r8d, %r12d
	jb	.L3616
.L3413:
	movl	24(%rsp), %eax
	movq	192(%r15), %rsi
	addq	%rax, %rdi
	cmpq	$0, 16(%r15)
	movq	200(%r15), %rax
	je	.L3418
	movq	%rax, %r9
	subq	%rsi, %r9
	cmpl	%r9d, %r13d
	jg	.L3617
.L3418:
	leaq	(%rsi,%r13), %rdx
	cmpq	%rdx, %rax
	jnb	.L3618
.L3419:
	leaq	.LC125(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
	.p2align 4,,10
	.p2align 3
.L3346:
	movl	8(%rsp), %r9d
	testl	%r9d, %r9d
	je	.L3619
	cmpl	$13, %r13d
	jne	.L3620
	movq	%r15, %rdi
	call	stbi__get32be
	movq	%r15, %rdi
	movl	%eax, (%r15)
	call	stbi__get32be
	movl	%eax, 4(%r15)
	cmpl	$16777216, %eax
	ja	.L3360
	cmpl	$16777216, (%r15)
	ja	.L3360
	movq	%r15, %rdi
	call	stbi__get8
	movzbl	%al, %edx
	movl	%edx, 32(%r14)
	cmpb	$16, %al
	ja	.L3361
	movq	$-65815, %rdx
	btq	%rax, %rdx
	jc	.L3361
	movq	%r15, %rdi
	call	stbi__get8
	movl	%eax, %r13d
	movzbl	%al, %eax
	movl	%eax, 40(%rsp)
	cmpl	$6, %eax
	jg	.L3365
	cmpl	$3, 40(%rsp)
	je	.L3621
	testb	$1, %r13b
	jne	.L3365
.L3366:
	movq	%r15, %rdi
	call	stbi__get8
	testb	%al, %al
	jne	.L3622
	movq	%r15, %rdi
	call	stbi__get8
	testb	%al, %al
	jne	.L3623
	movq	%r15, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 36(%rsp)
	cmpl	$1, %eax
	jg	.L3624
	movl	(%r15), %esi
	testl	%esi, %esi
	je	.L3370
	movl	4(%r15), %edi
	testl	%edi, %edi
	je	.L3370
	cmpb	$0, 35(%rsp)
	jne	.L3372
	movl	40(%rsp), %r8d
	andl	$2, %r13d
	movl	$3, %eax
	cmove	8(%rsp), %eax
	xorl	%edx, %edx
	sarl	$2, %r8d
	addl	%eax, %r8d
	movl	$1073741824, %eax
	divl	%esi
	movl	%r8d, 8(%r15)
	xorl	%edx, %edx
	divl	%r8d
	cmpl	%edi, %eax
	jb	.L3360
.L3598:
	movl	$0, 8(%rsp)
	jmp	.L3356
	.p2align 4,,10
	.p2align 3
.L3351:
	movl	8(%rsp), %edx
	testl	%edx, %edx
	jne	.L3392
	testl	$536870912, %eax
	je	.L3625
	testl	%r13d, %r13d
	je	.L3356
	js	.L3626
	movl	%r13d, %esi
	movq	%r15, %rdi
	call	stbi__skip.part.0
	jmp	.L3356
	.p2align 4,,10
	.p2align 3
.L3352:
	movl	8(%rsp), %r8d
	testl	%r8d, %r8d
	jne	.L3392
	cmpl	$768, %r13d
	ja	.L3376
	movl	$2863311531, %eax
	movl	%r13d, %ebp
	imulq	%rax, %rbp
	shrq	$33, %rbp
	leal	0(%rbp,%rbp,2), %eax
	cmpl	%r13d, %eax
	jne	.L3376
	cmpl	$2, %eax
	jbe	.L3502
	leaq	5088(%rsp), %r8
	movl	%r12d, 48(%rsp)
	movq	192(%r15), %rdx
	movl	%ebp, %r12d
	movq	%r14, 56(%rsp)
	movq	64(%rsp), %rbx
	xorl	%r13d, %r13d
	movq	%r8, %rbp
	movq	200(%r15), %rax
	jmp	.L3391
	.p2align 4,,10
	.p2align 3
.L3377:
	movl	48(%r15), %edi
	testl	%edi, %edi
	jne	.L3627
	movb	$0, 0(%rbp,%r13,4)
.L3382:
	movl	48(%r15), %esi
	testl	%esi, %esi
	jne	.L3628
	movb	$0, 1(%rbp,%r13,4)
.L3387:
	movl	48(%r15), %ecx
	xorl	%r14d, %r14d
	testl	%ecx, %ecx
	jne	.L3629
.L3388:
	movb	%r14b, 2(%rbp,%r13,4)
	movb	$-1, 3(%rbp,%r13,4)
	addq	$1, %r13
	cmpl	%r12d, %r13d
	jnb	.L3630
.L3391:
	cmpq	%rax, %rdx
	jnb	.L3377
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%r15)
	movzbl	(%rdx), %edx
	movb	%dl, 0(%rbp,%r13,4)
	cmpq	%rax, %rdi
	jnb	.L3503
.L3632:
	leaq	1(%rdi), %rsi
	movq	%rsi, 192(%r15)
	movzbl	(%rdi), %edx
	movb	%dl, 1(%rbp,%r13,4)
	cmpq	%rax, %rsi
	jnb	.L3504
.L3631:
	leaq	1(%rsi), %rdx
	movq	%rdx, 192(%r15)
	movzbl	(%rsi), %r14d
	jmp	.L3388
	.p2align 4,,10
	.p2align 3
.L3629:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	leaq	57(%r15), %rdx
	testl	%eax, %eax
	jne	.L3389
	movl	$0, 48(%r15)
	movq	%rdx, %rax
	movb	$0, 56(%r15)
.L3390:
	movq	%rax, 200(%r15)
	movq	%rdx, 192(%r15)
	jmp	.L3388
	.p2align 4,,10
	.p2align 3
.L3628:
	movl	52(%r15), %edx
	movq	%rbx, %rsi
	movq	40(%r15), %rdi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rsi
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	jne	.L3385
	movl	$0, 48(%r15)
	movq	%rsi, %rax
	xorl	%edx, %edx
	movb	$0, 56(%r15)
.L3386:
	movq	%rax, 200(%r15)
	movq	%rsi, 192(%r15)
	movb	%dl, 1(%rbp,%r13,4)
	cmpq	%rax, %rsi
	jb	.L3631
.L3504:
	movq	%rsi, %rdx
	jmp	.L3387
	.p2align 4,,10
	.p2align 3
.L3627:
	movl	52(%r15), %edx
	movq	40(%r15), %rdi
	movq	%rbx, %rsi
	call	*16(%r15)
	movq	192(%r15), %rdx
	leaq	57(%r15), %rdi
	subq	208(%r15), %rdx
	addl	%edx, 184(%r15)
	testl	%eax, %eax
	jne	.L3380
	movl	$0, 48(%r15)
	movq	%rdi, %rax
	xorl	%edx, %edx
	movb	$0, 56(%r15)
.L3381:
	movq	%rax, 200(%r15)
	movq	%rdi, 192(%r15)
	movb	%dl, 0(%rbp,%r13,4)
	cmpq	%rax, %rdi
	jb	.L3632
.L3503:
	movq	%rdi, %rdx
	jmp	.L3382
	.p2align 4,,10
	.p2align 3
.L3630:
	movl	%r12d, %ebp
	movq	56(%rsp), %r14
	movl	48(%rsp), %r12d
	jmp	.L3356
	.p2align 4,,10
	.p2align 3
.L3389:
	cltq
	movzbl	56(%r15), %r14d
	addq	%rbx, %rax
	jmp	.L3390
	.p2align 4,,10
	.p2align 3
.L3385:
	cltq
	movzbl	56(%r15), %edx
	addq	%rbx, %rax
	jmp	.L3386
	.p2align 4,,10
	.p2align 3
.L3380:
	cltq
	movzbl	56(%r15), %edx
	addq	%rbx, %rax
	jmp	.L3381
	.p2align 4,,10
	.p2align 3
.L3404:
	testl	%eax, %eax
	jle	.L3406
	xorl	%r13d, %r13d
	leaq	874(%rsp), %rbx
.L3407:
	movq	%r15, %rdi
	call	stbi__get16be
	movw	%ax, (%rbx,%r13,2)
	addq	$1, %r13
	cmpl	%r13d, 8(%r15)
	jg	.L3407
	jmp	.L3406
	.p2align 4,,10
	.p2align 3
.L3392:
	leaq	.LC117(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
	.p2align 4,,10
	.p2align 3
.L3372:
	movl	$268435456, %eax
	xorl	%edx, %edx
	movl	$1, 8(%r15)
	divl	%esi
	cmpl	%edi, %eax
	jnb	.L3598
.L3360:
	leaq	.LC66(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
	.p2align 4,,10
	.p2align 3
.L3336:
	movq	(%rsp), %rax
	movl	$0, 48(%rax)
	movb	$0, 56(%rax)
	movq	%rdx, 200(%rax)
	movq	%rdx, 192(%rax)
	jmp	.L3320
	.p2align 4,,10
	.p2align 3
.L3616:
	testl	%r12d, %r12d
	jne	.L3416
	movl	$4096, %r12d
	cmpl	%r12d, %r13d
	cmovnb	%r13d, %r12d
	cmpl	%r8d, %r12d
	jnb	.L3415
	.p2align 4,,10
	.p2align 3
.L3416:
	addl	%r12d, %r12d
	cmpl	%r8d, %r12d
	jb	.L3416
.L3415:
	movl	%r12d, %esi
	movl	%r8d, 48(%rsp)
	call	realloc@PLT
	movl	48(%rsp), %r8d
	testq	%rax, %rax
	movq	%rax, %rdi
	je	.L3431
	movq	%rax, 8(%r14)
	jmp	.L3413
	.p2align 4,,10
	.p2align 3
.L3600:
	leaq	56(%rcx), %rbp
	movq	%rcx, %rbx
	movl	52(%rcx), %edx
	movq	40(%rcx), %rdi
	movq	%rbp, %rsi
	call	*16(%rcx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L3339
	cltq
	movq	%rcx, 192(%rbx)
	movzbl	56(%rbx), %edx
	addq	%rbp, %rax
	movq	%rax, 200(%rbx)
	jmp	.L3322
	.p2align 4,,10
	.p2align 3
.L3621:
	cmpl	$16, 32(%r14)
	je	.L3365
	movb	$3, 35(%rsp)
	jmp	.L3366
	.p2align 4,,10
	.p2align 3
.L3609:
	cmpl	$2, 16(%rsp)
	je	.L3633
	testl	%ebp, %ebp
	je	.L3634
	cmpl	%r13d, %ebp
	jb	.L3398
	testl	%r13d, %r13d
	je	.L3400
	leaq	5088(%rsp), %rbx
	leaq	(%rbx,%r13,4), %r13
	.p2align 4,,10
	.p2align 3
.L3401:
	movq	%r15, %rdi
	addq	$4, %rbx
	call	stbi__get8
	movb	%al, -1(%rbx)
	cmpq	%rbx, %r13
	jne	.L3401
.L3400:
	movb	$4, 35(%rsp)
	jmp	.L3356
	.p2align 4,,10
	.p2align 3
.L3618:
	movq	%r13, %rdx
	movl	%r8d, 24(%rsp)
	call	memcpy@PLT
	addq	%r13, 192(%r15)
	jmp	.L3356
	.p2align 4,,10
	.p2align 3
.L3612:
	movq	200(%r15), %rax
	movl	$1, 72(%rsp)
	movq	%rax, 192(%r15)
	jmp	.L3356
	.p2align 4,,10
	.p2align 3
.L3626:
	movq	200(%r15), %rax
	movq	%rax, 192(%r15)
	jmp	.L3356
.L3605:
	leaq	.LC126(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3438:
	movq	48(%rsp), %r14
	movq	16(%rsp), %rax
	movq	%rax, 24(%r14)
.L3430:
	cmpb	$0, 79(%rsp)
	je	.L3635
	movq	(%rsp), %rax
	movq	(%r14), %rdi
	movl	12(%rax), %esi
	movl	(%rdi), %ecx
	imull	4(%rdi), %ecx
	movq	24(%r14), %rax
	leal	-2(%rsi), %edx
	andl	$-3, %edx
	cmpl	$16, 32(%r14)
	je	.L3636
	testl	%edx, %edx
	jne	.L3637
	cmpl	$2, %esi
	je	.L3460
	testl	%ecx, %ecx
	je	.L3453
	movzbl	5085(%rsp), %esi
	movzbl	5086(%rsp), %edi
	leaq	(%rax,%rcx,4), %rdx
	movzbl	5087(%rsp), %r8d
	jmp	.L3466
	.p2align 4,,10
	.p2align 3
.L3465:
	addq	$4, %rax
	cmpq	%rdx, %rax
	je	.L3453
.L3466:
	cmpb	%sil, (%rax)
	jne	.L3465
	cmpb	%dil, 1(%rax)
	jne	.L3465
	cmpb	%r8b, 2(%rax)
	jne	.L3465
	movb	$0, 3(%rax)
	jmp	.L3465
	.p2align 4,,10
	.p2align 3
.L3617:
	movslq	%r9d, %rdx
	movl	%r8d, 56(%rsp)
	movq	%r9, 48(%rsp)
	movq	%rdx, 24(%rsp)
	call	memcpy@PLT
	movq	48(%rsp), %r9
	movq	24(%rsp), %rdx
	movq	40(%r15), %rdi
	subl	%r9d, %r13d
	leaq	(%rax,%rdx), %rsi
	movl	%r13d, %edx
	call	*16(%r15)
	movq	200(%r15), %rdx
	movq	%rdx, 192(%r15)
	cmpl	%eax, %r13d
	jne	.L3419
	movl	56(%rsp), %r8d
	movl	%r8d, 24(%rsp)
	jmp	.L3356
	.p2align 4,,10
	.p2align 3
.L3361:
	leaq	.LC111(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3485:
	movl	%r13d, %ecx
	xorl	%edx, %edx
	testl	%r13d, %r13d
	je	.L3492
	.p2align 4,,10
	.p2align 3
.L3491:
	movzbl	0(%rbp,%rdx), %eax
	sall	$2, %eax
	cltq
	movl	5088(%rsp,%rax), %eax
	movl	%eax, (%r12,%rdx,4)
	addq	$1, %rdx
	cmpq	%rcx, %rdx
	jne	.L3491
.L3492:
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r12, 24(%r14)
.L3445:
	movq	16(%r14), %rdi
	call	free@PLT
	movq	$0, 16(%r14)
	movq	(%rsp), %rdi
	call	stbi__get32be
.L3396:
	movl	$1, %eax
	jmp	.L3318
	.p2align 4,,10
	.p2align 3
.L3602:
	cltq
	movq	%rcx, 192(%rbx)
	movzbl	56(%rbx), %edx
	addq	%rbp, %rax
	movq	%rax, 200(%rbx)
	jmp	.L3340
.L3343:
	movq	(%rsp), %rsi
	cltq
	addq	%rax, %rbp
	movq	%rbp, 200(%rsi)
	movzbl	56(%rsi), %edx
	movq	%rcx, 192(%rsi)
	jmp	.L3342
.L3635:
	movl	72(%rsp), %r12d
	testl	%r12d, %r12d
	jne	.L3451
	cmpb	$0, 35(%rsp)
	je	.L3445
.L3444:
	movl	44(%rsp), %ecx
	movq	(%rsp), %rax
	movzbl	35(%rsp), %ebx
	cmpl	$3, %ecx
	movl	%ebx, 8(%rax)
	cmovge	%ecx, %ebx
	movl	%ebx, 12(%rax)
	movq	(%r14), %rax
	movq	24(%r14), %rbp
	movl	(%rax), %r13d
	imull	4(%rax), %r13d
	testl	%r13d, %r13d
	jns	.L3638
.L3431:
	leaq	.LC18(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
	.p2align 4,,10
	.p2align 3
.L3502:
	xorl	%ebp, %ebp
	jmp	.L3356
.L3607:
	movl	40(%rsp), %eax
	movq	%r14, %rdi
	movl	%ebp, %r8d
	pushq	%rax
	.cfi_def_cfa_offset 6200
	movl	160(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 6208
	movl	152(%rsp), %ecx
	movl	156(%rsp), %edx
	movq	160(%rsp), %rsi
	call	stbi__create_png_image_raw
	popq	%rsi
	.cfi_def_cfa_offset 6200
	popq	%rdi
	.cfi_def_cfa_offset 6192
	testl	%eax, %eax
	je	.L3345
	jmp	.L3430
.L3606:
	cmpl	$3, %ecx
	je	.L3425
	cmpb	$0, 35(%rsp)
	jne	.L3425
	movl	%ecx, 136(%rsp)
	jmp	.L3426
.L3460:
	testl	%ecx, %ecx
	je	.L3453
	leal	-1(%rcx), %r8d
	movzbl	5085(%rsp), %edi
	cmpl	$15, %r8d
	jbe	.L3510
	movd	%edi, %xmm0
	movl	%r8d, %esi
	pxor	%xmm4, %xmm4
	movq	%rax, %rdx
	punpcklbw	%xmm0, %xmm0
	shrl	$4, %esi
	movdqa	.LC2(%rip), %xmm3
	punpcklwd	%xmm0, %xmm0
	salq	$5, %rsi
	pshufd	$0, %xmm0, %xmm2
	addq	%rax, %rsi
.L3463:
	movdqu	(%rdx), %xmm0
	movdqu	16(%rdx), %xmm1
	addq	$32, %rdx
	pand	%xmm3, %xmm0
	pand	%xmm3, %xmm1
	packuswb	%xmm1, %xmm0
	pcmpeqb	%xmm2, %xmm0
	pcmpeqb	%xmm4, %xmm0
	movd	%xmm0, %r9d
	movb	%r9b, -31(%rdx)
	movaps	%xmm0, 848(%rsp)
	movzbl	849(%rsp), %r9d
	movb	%r9b, -29(%rdx)
	movaps	%xmm0, 832(%rsp)
	movzbl	834(%rsp), %r9d
	movb	%r9b, -27(%rdx)
	movaps	%xmm0, 816(%rsp)
	movzbl	819(%rsp), %r9d
	movb	%r9b, -25(%rdx)
	movaps	%xmm0, 800(%rsp)
	movzbl	804(%rsp), %r9d
	movb	%r9b, -23(%rdx)
	movaps	%xmm0, 784(%rsp)
	movzbl	789(%rsp), %r9d
	movb	%r9b, -21(%rdx)
	movaps	%xmm0, 768(%rsp)
	movzbl	774(%rsp), %r9d
	movb	%r9b, -19(%rdx)
	movaps	%xmm0, 752(%rsp)
	movzbl	759(%rsp), %r9d
	movb	%r9b, -17(%rdx)
	movaps	%xmm0, 736(%rsp)
	movzbl	744(%rsp), %r9d
	movb	%r9b, -15(%rdx)
	movaps	%xmm0, 720(%rsp)
	movzbl	729(%rsp), %r9d
	movb	%r9b, -13(%rdx)
	movaps	%xmm0, 704(%rsp)
	movzbl	714(%rsp), %r9d
	movb	%r9b, -11(%rdx)
	movaps	%xmm0, 688(%rsp)
	movzbl	699(%rsp), %r9d
	movb	%r9b, -9(%rdx)
	movaps	%xmm0, 672(%rsp)
	movzbl	684(%rsp), %r9d
	movb	%r9b, -7(%rdx)
	movaps	%xmm0, 656(%rsp)
	movzbl	669(%rsp), %r9d
	movb	%r9b, -5(%rdx)
	movaps	%xmm0, 640(%rsp)
	movzbl	654(%rsp), %r9d
	movb	%r9b, -3(%rdx)
	movaps	%xmm0, 624(%rsp)
	movzbl	639(%rsp), %r9d
	movb	%r9b, -1(%rdx)
	cmpq	%rdx, %rsi
	jne	.L3463
	movl	%r8d, %edx
	andl	$-16, %edx
	movl	%edx, %esi
	leaq	(%rax,%rsi,2), %rsi
.L3462:
	subl	%edx, %r8d
	cmpl	$7, %r8d
	jbe	.L3464
	movq	.LC4(%rip), %xmm0
	movl	%edx, %r9d
	andl	$-8, %r8d
	addq	%r9, %r9
	addl	%r8d, %edx
	leaq	(%rax,%r9), %r10
	leaq	1(%rax,%r9), %r9
	movzbl	%dil, %eax
	movq	8(%r10), %xmm1
	movq	(%r10), %xmm2
	movb	%al, %ah
	movd	%eax, %xmm3
	pand	%xmm0, %xmm2
	pand	%xmm1, %xmm0
	pshuflw	$0, %xmm3, %xmm1
	packuswb	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	pshufd	$8, %xmm2, %xmm2
	pcmpeqb	%xmm2, %xmm1
	pcmpeqb	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %r10
	movzbl	%ah, %ebx
	movb	%al, (%r9)
	shrq	$16, %r10
	movb	%bl, 2(%r9)
	movb	%r10b, 4(%r9)
	movq	%rax, %r10
	shrq	$24, %r10
	movb	%r10b, 6(%r9)
	movq	%rax, %r10
	shrq	$32, %r10
	movb	%r10b, 8(%r9)
	movq	%rax, %r10
	shrq	$40, %r10
	movb	%r10b, 10(%r9)
	movq	%rax, %r10
	shrq	$56, %rax
	shrq	$48, %r10
	movb	%al, 14(%r9)
	movl	%r8d, %eax
	movb	%r10b, 12(%r9)
	leaq	(%rsi,%rax,2), %rsi
.L3464:
	cmpb	%dil, (%rsi)
	setne	%al
	negl	%eax
	movb	%al, 1(%rsi)
	leal	1(%rdx), %eax
	cmpl	%ecx, %eax
	jnb	.L3453
	cmpb	%dil, 2(%rsi)
	setne	%al
	negl	%eax
	movb	%al, 3(%rsi)
	leal	2(%rdx), %eax
	cmpl	%ecx, %eax
	jnb	.L3453
	cmpb	%dil, 4(%rsi)
	setne	%al
	negl	%eax
	movb	%al, 5(%rsi)
	leal	3(%rdx), %eax
	cmpl	%ecx, %eax
	jnb	.L3453
	cmpb	%dil, 6(%rsi)
	setne	%al
	negl	%eax
	movb	%al, 7(%rsi)
	leal	4(%rdx), %eax
	cmpl	%ecx, %eax
	jnb	.L3453
	cmpb	%dil, 8(%rsi)
	setne	%al
	negl	%eax
	movb	%al, 9(%rsi)
	leal	5(%rdx), %eax
	cmpl	%ecx, %eax
	jnb	.L3453
	cmpb	%dil, 10(%rsi)
	setne	%al
	negl	%eax
	movb	%al, 11(%rsi)
	leal	6(%rdx), %eax
	cmpl	%ecx, %eax
	jnb	.L3453
	cmpb	%dil, 12(%rsi)
	setne	%al
	addl	$7, %edx
	negl	%eax
	movb	%al, 13(%rsi)
	cmpl	%ecx, %edx
	jnb	.L3453
	cmpb	%dil, 14(%rsi)
	setne	%al
	negl	%eax
	movb	%al, 15(%rsi)
.L3453:
	movl	72(%rsp), %ebx
	testl	%ebx, %ebx
	jne	.L3451
	cmpb	$0, 35(%rsp)
	jne	.L3444
.L3497:
	movq	(%rsp), %rax
	addl	$1, 8(%rax)
	jmp	.L3445
.L3451:
	movl	%fs:stbi__de_iphone_flag_set@tpoff, %ebp
	testl	%ebp, %ebp
	je	.L3639
	movl	%fs:stbi__de_iphone_flag_local@tpoff, %r10d
	testl	%r10d, %r10d
	setne	%al
.L3467:
	testb	%al, %al
	je	.L3471
	movq	(%rsp), %rax
	cmpl	$2, 12(%rax)
	jg	.L3468
.L3471:
	cmpb	$0, 35(%rsp)
	jne	.L3444
	cmpb	$0, 79(%rsp)
	jne	.L3497
	jmp	.L3445
	.p2align 4,,10
	.p2align 3
.L3422:
	movq	1008(%rsp), %rdi
	call	free@PLT
.L3599:
	movq	$0, 16(%r14)
	jmp	.L3345
.L3376:
	leaq	.LC118(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3365:
	leaq	.LC112(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3370:
	leaq	.LC116(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3639:
	movl	stbi__de_iphone_flag_global(%rip), %r9d
	testl	%r9d, %r9d
	setne	%al
	jmp	.L3467
.L3638:
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%ebx
	cmpl	%r13d, %eax
	jl	.L3431
	movl	%ebx, %edi
	imull	%r13d, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L3431
	cmpl	$3, %ebx
	jne	.L3485
	testl	%r13d, %r13d
	je	.L3492
	movl	%r13d, %esi
	movq	%rbp, %rcx
	movq	%rax, %rdx
	addq	%rbp, %rsi
	.p2align 4,,10
	.p2align 3
.L3490:
	movzbl	(%rcx), %eax
	addq	$1, %rcx
	addq	$3, %rdx
	sall	$2, %eax
	cltq
	movzwl	5088(%rsp,%rax), %edi
	movzbl	5090(%rsp,%rax), %eax
	movw	%di, -3(%rdx)
	movb	%al, -1(%rdx)
	cmpq	%rsi, %rcx
	jne	.L3490
	jmp	.L3492
.L3636:
	testl	%edx, %edx
	jne	.L3640
	cmpl	$2, %esi
	je	.L3449
	testl	%ecx, %ecx
	je	.L3453
	movzwl	874(%rsp), %esi
	movzwl	876(%rsp), %edi
	leaq	(%rax,%rcx,8), %rdx
	movzwl	878(%rsp), %r8d
	jmp	.L3458
.L3457:
	addq	$8, %rax
	cmpq	%rax, %rdx
	je	.L3453
.L3458:
	cmpw	%si, (%rax)
	jne	.L3457
	cmpw	%di, 2(%rax)
	jne	.L3457
	cmpw	%r8w, 4(%rax)
	jne	.L3457
	xorl	%r11d, %r11d
	movw	%r11w, 6(%rax)
	jmp	.L3457
.L3608:
	leaq	.LC119(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3613:
	leaq	.LC123(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3625:
	bswap	%eax
	movl	%eax, invalid_chunk.48(%rip)
	leaq	invalid_chunk.48(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3619:
	leaq	.LC109(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3620:
	leaq	.LC110(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3615:
	leaq	.LC124(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3398:
	leaq	.LC121(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3614:
	movzbl	35(%rsp), %eax
	testb	%al, %al
	je	.L3396
	movq	(%rsp), %rcx
	movl	%eax, 8(%rcx)
	jmp	.L3396
.L3622:
	leaq	.LC113(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3624:
	leaq	.LC115(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3623:
	leaq	.LC114(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3610:
	leaq	.LC122(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3611:
	movq	(%rsp), %rcx
	addl	$1, %eax
	movl	%eax, 8(%rcx)
	jmp	.L3396
.L3468:
	movq	(%r14), %rax
	movq	24(%r14), %rdi
	movl	(%rax), %edx
	imull	4(%rax), %edx
	movl	12(%rax), %eax
	cmpl	$3, %eax
	je	.L3641
	cmpl	$4, %eax
	jne	.L3642
	movl	%fs:stbi__unpremultiply_on_load_set@tpoff, %r8d
	testl	%r8d, %r8d
	je	.L3474
	movl	%fs:stbi__unpremultiply_on_load_local@tpoff, %esi
	testl	%esi, %esi
	je	.L3476
.L3475:
	testl	%edx, %edx
	je	.L3471
	leaq	(%rdi,%rdx,4), %rsi
.L3480:
	movzbl	3(%rdi), %ecx
	movzbl	(%rdi), %r10d
	movzbl	2(%rdi), %r9d
	testb	%cl, %cl
	je	.L3478
	movzbl	1(%rdi), %edx
	movl	%ecx, %r8d
	addq	$4, %rdi
	shrb	%r8b
	movl	%edx, %eax
	movzbl	%r8b, %r8d
	sall	$8, %eax
	subl	%edx, %eax
	addl	%r8d, %eax
	cltd
	idivl	%ecx
	movb	%al, -3(%rdi)
	movl	%r10d, %eax
	sall	$8, %eax
	subl	%r10d, %eax
	addl	%r8d, %eax
	cltd
	idivl	%ecx
	movb	%al, -2(%rdi)
	movl	%r9d, %eax
	sall	$8, %eax
	subl	%r9d, %eax
	addl	%r8d, %eax
	cltd
	idivl	%ecx
	movb	%al, -4(%rdi)
	cmpq	%rsi, %rdi
	jne	.L3480
	jmp	.L3471
.L3478:
	movb	%r10b, 2(%rdi)
	addq	$4, %rdi
	movb	%r9b, -4(%rdi)
	cmpq	%rsi, %rdi
	jne	.L3480
	jmp	.L3471
.L3433:
	movq	16(%rsp), %rdi
	call	free@PLT
	jmp	.L3345
.L3449:
	testl	%ecx, %ecx
	je	.L3453
	movzwl	874(%rsp), %r8d
	leal	-1(%rcx), %edi
	cmpl	$7, %edi
	jbe	.L3509
	movl	%edi, %edx
	movd	%r8d, %xmm0
	pxor	%xmm4, %xmm4
	movq	%rax, %rsi
	shrl	$3, %edx
	punpcklwd	%xmm0, %xmm0
	salq	$5, %rdx
	pshufd	$0, %xmm0, %xmm1
	addq	%rax, %rdx
.L3455:
	movdqu	16(%rsi), %xmm3
	movdqu	(%rsi), %xmm0
	addq	$32, %rsi
	movdqa	%xmm0, %xmm2
	punpcklwd	%xmm3, %xmm0
	punpckhwd	%xmm3, %xmm2
	movdqa	%xmm0, %xmm3
	punpckhwd	%xmm2, %xmm3
	punpcklwd	%xmm2, %xmm0
	punpcklwd	%xmm3, %xmm0
	pcmpeqw	%xmm1, %xmm0
	pcmpeqw	%xmm4, %xmm0
	pextrw	$0, %xmm0, %r9d
	movw	%r9w, -30(%rsi)
	pextrw	$1, %xmm0, %r9d
	movw	%r9w, -26(%rsi)
	pextrw	$2, %xmm0, %r9d
	movw	%r9w, -22(%rsi)
	pextrw	$3, %xmm0, %r9d
	movw	%r9w, -18(%rsi)
	pextrw	$4, %xmm0, %r9d
	movw	%r9w, -14(%rsi)
	pextrw	$5, %xmm0, %r9d
	movw	%r9w, -10(%rsi)
	pextrw	$6, %xmm0, %r9d
	movw	%r9w, -6(%rsi)
	pextrw	$7, %xmm0, %r9d
	movw	%r9w, -2(%rsi)
	cmpq	%rdx, %rsi
	jne	.L3455
	movl	%edi, %edx
	andl	$-8, %edx
	movl	%edx, %esi
	leaq	(%rax,%rsi,4), %rsi
.L3454:
	subl	%edx, %edi
	cmpl	$3, %edi
	jbe	.L3456
	movl	%edx, %r10d
	andl	$-4, %edi
	salq	$2, %r10
	addl	%edi, %edx
	leaq	(%rax,%r10), %r9
	leaq	2(%rax,%r10), %rax
	movq	(%r9), %xmm0
	movq	8(%r9), %xmm1
	movdqa	%xmm0, %xmm2
	punpcklwd	%xmm1, %xmm0
	punpcklwd	%xmm1, %xmm2
	pshufd	$78, %xmm2, %xmm2
	punpcklwd	%xmm2, %xmm0
	movd	%r8d, %xmm2
	pshuflw	$0, %xmm2, %xmm1
	pcmpeqw	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	pcmpeqw	%xmm1, %xmm0
	pextrw	$0, %xmm0, %r9d
	movw	%r9w, (%rax)
	pextrw	$1, %xmm0, %r9d
	movw	%r9w, 4(%rax)
	pextrw	$2, %xmm0, %r9d
	movw	%r9w, 8(%rax)
	pextrw	$3, %xmm0, %r9d
	movw	%r9w, 12(%rax)
	movl	%edi, %eax
	leaq	(%rsi,%rax,4), %rsi
.L3456:
	xorl	%eax, %eax
	cmpw	%r8w, (%rsi)
	setne	%al
	negl	%eax
	movw	%ax, 2(%rsi)
	leal	1(%rdx), %eax
	cmpl	%ecx, %eax
	jnb	.L3453
	xorl	%eax, %eax
	cmpw	%r8w, 4(%rsi)
	setne	%al
	negl	%eax
	movw	%ax, 6(%rsi)
	leal	2(%rdx), %eax
	cmpl	%ecx, %eax
	jnb	.L3453
	xorl	%eax, %eax
	cmpw	%r8w, 8(%rsi)
	setne	%al
	addl	$3, %edx
	negl	%eax
	movw	%ax, 10(%rsi)
	cmpl	%ecx, %edx
	jnb	.L3453
	xorl	%eax, %eax
	cmpw	%r8w, 12(%rsi)
	setne	%al
	negl	%eax
	movw	%ax, 14(%rsi)
	jmp	.L3453
.L3634:
	leaq	.LC120(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L3345
.L3633:
	movq	(%rsp), %rax
	movl	$4, 8(%rax)
	jmp	.L3396
.L3474:
	movl	stbi__unpremultiply_on_load_global(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L3475
.L3476:
	testl	%edx, %edx
	je	.L3471
	leal	-1(%rdx), %esi
	movq	%rdi, %rax
	cmpl	$15, %esi
	jbe	.L3511
	movl	%esi, %ecx
	shrl	$4, %ecx
	salq	$6, %rcx
	addq	%rdi, %rcx
.L3482:
	movdqu	(%rax), %xmm3
	movdqu	16(%rax), %xmm2
	addq	$64, %rax
	movdqu	-16(%rax), %xmm0
	movdqu	-32(%rax), %xmm1
	movaps	%xmm3, 608(%rsp)
	movzbl	610(%rsp), %r8d
	movb	%r8b, -64(%rax)
	movaps	%xmm3, 592(%rsp)
	movzbl	598(%rsp), %r8d
	movb	%r8b, -60(%rax)
	movaps	%xmm3, 576(%rsp)
	movzbl	586(%rsp), %r8d
	movb	%r8b, -56(%rax)
	movaps	%xmm3, 560(%rsp)
	movzbl	574(%rsp), %r8d
	movb	%r8b, -52(%rax)
	movaps	%xmm2, 544(%rsp)
	movzbl	546(%rsp), %r8d
	movb	%r8b, -48(%rax)
	movaps	%xmm2, 528(%rsp)
	movzbl	534(%rsp), %r8d
	movb	%r8b, -44(%rax)
	movaps	%xmm2, 512(%rsp)
	movzbl	522(%rsp), %r8d
	movb	%r8b, -40(%rax)
	movaps	%xmm2, 496(%rsp)
	movzbl	510(%rsp), %r8d
	movb	%r8b, -36(%rax)
	movaps	%xmm1, 480(%rsp)
	movzbl	482(%rsp), %r8d
	movb	%r8b, -32(%rax)
	movaps	%xmm1, 464(%rsp)
	movzbl	470(%rsp), %r8d
	movb	%r8b, -28(%rax)
	movaps	%xmm1, 448(%rsp)
	movzbl	458(%rsp), %r8d
	movb	%r8b, -24(%rax)
	movaps	%xmm1, 432(%rsp)
	movzbl	446(%rsp), %r8d
	movb	%r8b, -20(%rax)
	movaps	%xmm0, 416(%rsp)
	movzbl	418(%rsp), %r8d
	movb	%r8b, -16(%rax)
	movaps	%xmm0, 400(%rsp)
	movzbl	406(%rsp), %r8d
	movb	%r8b, -12(%rax)
	movaps	%xmm0, 384(%rsp)
	movzbl	394(%rsp), %r8d
	movb	%r8b, -8(%rax)
	movaps	%xmm0, 368(%rsp)
	movzbl	382(%rsp), %r8d
	movb	%r8b, -4(%rax)
	movd	%xmm3, %r8d
	movb	%r8b, -62(%rax)
	movaps	%xmm3, 352(%rsp)
	movzbl	356(%rsp), %r8d
	movb	%r8b, -58(%rax)
	movaps	%xmm3, 336(%rsp)
	movzbl	344(%rsp), %r8d
	movb	%r8b, -54(%rax)
	movaps	%xmm3, 320(%rsp)
	movzbl	332(%rsp), %r8d
	movb	%r8b, -50(%rax)
	movd	%xmm2, %r8d
	movb	%r8b, -46(%rax)
	movaps	%xmm2, 304(%rsp)
	movzbl	308(%rsp), %r8d
	movb	%r8b, -42(%rax)
	movaps	%xmm2, 288(%rsp)
	movzbl	296(%rsp), %r8d
	movb	%r8b, -38(%rax)
	movaps	%xmm2, 272(%rsp)
	movzbl	284(%rsp), %r8d
	movb	%r8b, -34(%rax)
	movd	%xmm1, %r8d
	movb	%r8b, -30(%rax)
	movaps	%xmm1, 256(%rsp)
	movzbl	260(%rsp), %r8d
	movb	%r8b, -26(%rax)
	movaps	%xmm1, 240(%rsp)
	movzbl	248(%rsp), %r8d
	movb	%r8b, -22(%rax)
	movaps	%xmm1, 224(%rsp)
	movzbl	236(%rsp), %r8d
	movb	%r8b, -18(%rax)
	movd	%xmm0, %r8d
	movb	%r8b, -14(%rax)
	movaps	%xmm0, 208(%rsp)
	movzbl	212(%rsp), %r8d
	movb	%r8b, -10(%rax)
	movaps	%xmm0, 192(%rsp)
	movzbl	200(%rsp), %r8d
	movb	%r8b, -6(%rax)
	movaps	%xmm0, 176(%rsp)
	movzbl	188(%rsp), %r8d
	movb	%r8b, -2(%rax)
	cmpq	%rcx, %rax
	jne	.L3482
	movl	%esi, %ecx
	andl	$-16, %ecx
	movl	%ecx, %eax
	leaq	(%rdi,%rax,4), %rax
.L3481:
	subl	%ecx, %esi
	movl	%esi, %r12d
	cmpl	$7, %esi
	jbe	.L3483
	movl	%ecx, %r8d
	andl	$-8, %r12d
	salq	$2, %r8
	addl	%r12d, %ecx
	leaq	(%rdi,%r8), %rsi
	leaq	2(%rdi,%r8), %rdi
	movq	(%rsi), %r11
	movq	8(%rsi), %r10
	movq	16(%rsi), %r9
	movq	24(%rsi), %r8
	movq	%r11, %rbp
	shrq	$16, %rbp
	movq	%r9, 8(%rsp)
	movb	%bpl, (%rsi)
	movq	%r11, %rbp
	shrq	$48, %rbp
	movb	%bpl, 4(%rsi)
	movq	%r10, %rbp
	shrq	$16, %rbp
	movb	%bpl, 8(%rsi)
	movq	%r10, %rbp
	shrq	$48, %rbp
	movb	%bpl, 12(%rsi)
	movq	%r9, %rbp
	shrq	$16, %rbp
	movb	%bpl, 16(%rsi)
	movq	%r9, %rbp
	shrq	$32, %r9
	shrq	$48, %rbp
	movb	%bpl, 20(%rsi)
	movq	%r8, %rbp
	shrq	$16, %rbp
	movb	%bpl, 24(%rsi)
	movq	%r8, %rbp
	shrq	$48, %rbp
	movb	%bpl, 28(%rsi)
	movzbl	8(%rsp), %esi
	movb	%r11b, (%rdi)
	shrq	$32, %r11
	movb	%r10b, 8(%rdi)
	shrq	$32, %r10
	movb	%r8b, 24(%rdi)
	shrq	$32, %r8
	movb	%r11b, 4(%rdi)
	movb	%r10b, 12(%rdi)
	movb	%r9b, 20(%rdi)
	movb	%r8b, 28(%rdi)
	movb	%sil, 16(%rdi)
	movl	%r12d, %esi
	leaq	(%rax,%rsi,4), %rax
.L3483:
	movzbl	(%rax), %esi
	movzbl	2(%rax), %edi
	movb	%sil, 2(%rax)
	leal	1(%rcx), %esi
	movb	%dil, (%rax)
	cmpl	%edx, %esi
	jnb	.L3471
	movzbl	4(%rax), %esi
	movzbl	6(%rax), %edi
	movb	%sil, 6(%rax)
	leal	2(%rcx), %esi
	movb	%dil, 4(%rax)
	cmpl	%edx, %esi
	jnb	.L3471
	movzbl	8(%rax), %esi
	movzbl	10(%rax), %edi
	movb	%sil, 10(%rax)
	leal	3(%rcx), %esi
	movb	%dil, 8(%rax)
	cmpl	%edx, %esi
	jnb	.L3471
	movzbl	12(%rax), %esi
	movzbl	14(%rax), %edi
	movb	%sil, 14(%rax)
	leal	4(%rcx), %esi
	movb	%dil, 12(%rax)
	cmpl	%edx, %esi
	jnb	.L3471
	movzbl	16(%rax), %esi
	movzbl	18(%rax), %edi
	movb	%sil, 18(%rax)
	leal	5(%rcx), %esi
	movb	%dil, 16(%rax)
	cmpl	%edx, %esi
	jnb	.L3471
	movzbl	20(%rax), %esi
	movzbl	22(%rax), %edi
	movb	%sil, 22(%rax)
	leal	6(%rcx), %esi
	movb	%dil, 20(%rax)
	cmpl	%edx, %esi
	jnb	.L3471
	movzbl	24(%rax), %esi
	movzbl	26(%rax), %edi
	addl	$7, %ecx
	movb	%dil, 24(%rax)
	movb	%sil, 26(%rax)
	cmpl	%edx, %ecx
	jnb	.L3471
	movzbl	28(%rax), %edx
	movzbl	30(%rax), %ecx
	movb	%dl, 30(%rax)
	movb	%cl, 28(%rax)
	jmp	.L3471
.L3641:
	testl	%edx, %edx
	je	.L3471
	leaq	(%rdx,%rdx,2), %rax
	addq	%rdi, %rax
.L3472:
	movzbl	(%rdi), %edx
	movzbl	2(%rdi), %ecx
	addq	$3, %rdi
	movb	%cl, -3(%rdi)
	movb	%dl, -1(%rdi)
	cmpq	%rax, %rdi
	jne	.L3472
	jmp	.L3471
.L3510:
	movq	%rax, %rsi
	jmp	.L3462
.L3601:
	call	__stack_chk_fail@PLT
.L3511:
	xorl	%ecx, %ecx
	jmp	.L3481
.L3640:
	leaq	__PRETTY_FUNCTION__.46(%rip), %rcx
	movl	$4990, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC135(%rip), %rdi
	call	__assert_fail@PLT
.L3637:
	leaq	__PRETTY_FUNCTION__.45(%rip), %rcx
	movl	$4964, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC135(%rip), %rdi
	call	__assert_fail@PLT
.L3509:
	movq	%rax, %rsi
	jmp	.L3454
.L3642:
	leaq	__PRETTY_FUNCTION__.44(%rip), %rcx
	movl	$5101, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC136(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE689:
	.size	stbi__parse_png_file, .-stbi__parse_png_file
	.p2align 4
	.type	stbiw__jpg_processDU.constprop.1, @function
stbiw__jpg_processDU.constprop.1:
.LFB855:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r11
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r12, %r14
	leaq	256(%r12), %rbp
	movq	%r12, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r8, %rbx
	subq	$392, %rsp
	.cfi_def_cfa_offset 448
	movq	456(%rsp), %rcx
	movq	%rdx, (%rsp)
	movl	%r9d, 12(%rsp)
	movq	448(%rsp), %r13
	movq	%rcx, 48(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 376(%rsp)
	movq	%rcx, %rax
	movzwl	(%rax), %ecx
	movw	%cx, 92(%rsp)
	movzwl	2(%rax), %ecx
	movw	%cx, 94(%rsp)
	movzwl	960(%rax), %ecx
	movzwl	962(%rax), %eax
	movw	%cx, 86(%rsp)
	movw	%ax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L3644:
	leaq	28(%rdi), %rax
	leaq	4(%rdi), %rsi
	pushq	%rax
	.cfi_def_cfa_offset 456
	leaq	24(%rdi), %rax
	leaq	16(%rdi), %r8
	pushq	%rax
	.cfi_def_cfa_offset 464
	leaq	12(%rdi), %rcx
	leaq	8(%rdi), %rdx
	leaq	20(%rdi), %r9
	call	stbiw__jpg_DCT
	addq	$32, %rdi
	popq	%rsi
	.cfi_def_cfa_offset 456
	popq	%r8
	.cfi_def_cfa_offset 448
	cmpq	%rbp, %rdi
	jne	.L3644
	leaq	32(%r12), %rbp
	.p2align 4,,10
	.p2align 3
.L3645:
	leaq	224(%r12), %rax
	leaq	96(%r12), %rcx
	movq	%r12, %rdi
	pushq	%rax
	.cfi_def_cfa_offset 456
	leaq	192(%r12), %rax
	leaq	64(%r12), %rdx
	pushq	%rax
	.cfi_def_cfa_offset 464
	leaq	32(%r12), %rsi
	leaq	160(%r12), %r9
	leaq	128(%r12), %r8
	addq	$4, %r12
	call	stbiw__jpg_DCT
	popq	%rdx
	.cfi_def_cfa_offset 456
	popq	%rcx
	.cfi_def_cfa_offset 448
	cmpq	%rbp, %r12
	jne	.L3645
	leaq	stbiw__jpg_ZigZag(%rip), %rax
	movss	.LC88(%rip), %xmm1
	pxor	%xmm0, %xmm0
	leaq	64(%rax), %rcx
	jmp	.L3663
	.p2align 4,,10
	.p2align 3
.L3737:
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L3647:
	movss	4(%r14), %xmm2
	mulss	4(%rbx), %xmm2
	movzbl	(%rax), %edx
	movl	%esi, 112(%rsp,%rdx,4)
	comiss	%xmm2, %xmm0
	ja	.L3648
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L3649:
	movss	8(%r14), %xmm2
	mulss	8(%rbx), %xmm2
	movzbl	1(%rax), %edx
	movl	%esi, 112(%rsp,%rdx,4)
	comiss	%xmm2, %xmm0
	ja	.L3650
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L3651:
	movss	12(%r14), %xmm2
	mulss	12(%rbx), %xmm2
	movzbl	2(%rax), %edx
	movl	%esi, 112(%rsp,%rdx,4)
	comiss	%xmm2, %xmm0
	ja	.L3652
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L3653:
	movss	16(%r14), %xmm2
	mulss	16(%rbx), %xmm2
	movzbl	3(%rax), %edx
	movl	%esi, 112(%rsp,%rdx,4)
	comiss	%xmm2, %xmm0
	ja	.L3654
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L3655:
	movss	20(%r14), %xmm2
	mulss	20(%rbx), %xmm2
	movzbl	4(%rax), %edx
	movl	%esi, 112(%rsp,%rdx,4)
	comiss	%xmm2, %xmm0
	ja	.L3656
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L3657:
	movss	24(%r14), %xmm2
	mulss	24(%rbx), %xmm2
	movzbl	5(%rax), %edx
	movl	%esi, 112(%rsp,%rdx,4)
	comiss	%xmm2, %xmm0
	ja	.L3658
	addss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
.L3659:
	movss	28(%r14), %xmm2
	mulss	28(%rbx), %xmm2
	movzbl	6(%rax), %edx
	movl	%esi, 112(%rsp,%rdx,4)
	movzbl	7(%rax), %edx
	comiss	%xmm2, %xmm0
	ja	.L3660
	addss	%xmm1, %xmm2
.L3734:
	cvttss2sil	%xmm2, %esi
	addq	$8, %rax
	addq	$32, %r14
	addq	$32, %rbx
	movl	%esi, 112(%rsp,%rdx,4)
	cmpq	%rcx, %rax
	je	.L3736
.L3663:
	movss	(%rbx), %xmm2
	mulss	(%r14), %xmm2
	comiss	%xmm2, %xmm0
	jbe	.L3737
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L3647
	.p2align 4,,10
	.p2align 3
.L3660:
	subss	%xmm1, %xmm2
	jmp	.L3734
	.p2align 4,,10
	.p2align 3
.L3658:
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L3659
	.p2align 4,,10
	.p2align 3
.L3656:
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L3657
	.p2align 4,,10
	.p2align 3
.L3654:
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L3655
	.p2align 4,,10
	.p2align 3
.L3652:
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L3653
	.p2align 4,,10
	.p2align 3
.L3650:
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L3651
	.p2align 4,,10
	.p2align 3
.L3648:
	subss	%xmm1, %xmm2
	cvttss2sil	%xmm2, %esi
	jmp	.L3649
.L3736:
	movq	(%rsp), %rax
	movl	112(%rsp), %esi
	movl	(%r11), %edx
	movl	(%rax), %edi
	movl	12(%rsp), %eax
	movl	%esi, 88(%rsp)
	subl	%eax, %esi
	je	.L3738
	movl	%esi, %eax
	negl	%eax
	cmovs	%esi, %eax
	cmpl	$-2147483648, %esi
	adcl	$-1, %esi
	sarl	%eax
	je	.L3712
	movl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L3671:
	addl	$1, %ecx
	sarl	%eax
	jne	.L3671
	movl	$1, %r14d
	movzwl	%cx, %eax
	sall	%cl, %r14d
	movzwl	%cx, %ecx
	subl	$1, %r14d
	salq	$2, %rcx
.L3670:
	addq	%r13, %rcx
	movl	%r14d, %r8d
	andl	%esi, %r8d
	movzwl	2(%rcx), %esi
	movzwl	(%rcx), %r13d
	movl	$24, %ecx
	leal	(%rsi,%rdi), %r14d
	subl	%r14d, %ecx
	sall	%cl, %r13d
	orl	%edx, %r13d
	cmpl	$7, %r14d
	jle	.L3672
	movl	%r14d, 32(%rsp)
	movl	%r13d, %r12d
	movl	%r14d, %ebp
	movq	%r15, %r13
	movw	%r8w, 12(%rsp)
	leaq	111(%rsp), %rbx
	movq	%r11, %r15
	movl	%eax, 24(%rsp)
	.p2align 4,,10
	.p2align 3
.L3674:
	movl	%r12d, %r14d
	movq	8(%r13), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	call	*0(%r13)
	cmpb	$-1, %r14b
	jne	.L3673
	movb	$0, 111(%rsp)
	movq	8(%r13), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*0(%r13)
.L3673:
	subl	$8, %ebp
	sall	$8, %r12d
	cmpl	$7, %ebp
	jg	.L3674
	movl	32(%rsp), %r14d
	movzwl	12(%rsp), %r8d
	movq	%r15, %r11
	movq	%r13, %r15
	movl	24(%rsp), %eax
	movl	%r12d, %r13d
	andl	$7, %r14d
.L3672:
	movq	(%rsp), %rcx
	movl	%r13d, (%r11)
	movzwl	%r8w, %r13d
	movl	%r14d, (%rcx)
	addl	%eax, %r14d
	movl	$24, %ecx
	subl	%r14d, %ecx
	sall	%cl, %r13d
	orl	(%r11), %r13d
	cmpl	$7, %r14d
	jle	.L3675
	movl	%r14d, 12(%rsp)
	movl	%r14d, %ebp
	leaq	111(%rsp), %rbx
	movq	%r15, %r14
	movq	%r11, %r15
	.p2align 4,,10
	.p2align 3
.L3677:
	movl	%r13d, %r12d
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r12d
	movb	%r12b, 111(%rsp)
	call	*(%r14)
	cmpb	$-1, %r12b
	jne	.L3676
	movb	$0, 111(%rsp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r14)
.L3676:
	subl	$8, %ebp
	sall	$8, %r13d
	cmpl	$7, %ebp
	jg	.L3677
.L3735:
	movq	%r15, %r11
	movq	%r14, %r15
	movl	12(%rsp), %r14d
	andl	$7, %r14d
.L3675:
	movq	(%rsp), %rax
	movl	%r13d, (%r11)
	movl	$63, %r10d
	leaq	112(%rsp), %r9
	movl	%r14d, (%rax)
	jmp	.L3678
	.p2align 4,,10
	.p2align 3
.L3680:
	subq	$1, %r10
	je	.L3679
.L3678:
	movl	(%r9,%r10,4), %eax
	testl	%eax, %eax
	je	.L3680
	movzwl	16(%rsp), %ecx
	movl	%r10d, 40(%rsp)
	movl	%r14d, %edx
	movq	%r9, %rbx
	movq	%r10, 56(%rsp)
	movl	$1, %eax
	movl	%ecx, 36(%rsp)
	.p2align 4,,10
	.p2align 3
.L3681:
	movslq	%eax, %rcx
	movl	112(%rsp,%rcx,4), %ebp
	testl	%ebp, %ebp
	jne	.L3705
	movl	40(%rsp), %ecx
	cmpl	%ecx, %eax
	jg	.L3739
	movl	56(%rsp), %ecx
	leal	2(%rax), %esi
	leal	1(%rax), %r12d
	movslq	%esi, %rsi
	movslq	%r12d, %r12
	subl	%eax, %ecx
	addq	%rcx, %rsi
	jmp	.L3686
	.p2align 4,,10
	.p2align 3
.L3741:
	leaq	1(%r12), %rcx
	cmpq	%rsi, %rcx
	je	.L3740
	movq	%rcx, %r12
.L3686:
	movl	(%rbx,%r12,4), %ebp
	testl	%ebp, %ebp
	je	.L3741
	movl	%ebp, %esi
	movl	%r12d, 44(%rsp)
	negl	%esi
	cmovs	%ebp, %esi
	subl	%eax, %r12d
	sarl	%esi
	cmpl	$15, %r12d
	jg	.L3688
.L3744:
	sall	$4, %r12d
.L3689:
	cmpl	$-2147483648, %ebp
	adcl	$-1, %ebp
	movl	%ebp, %edi
	testl	%esi, %esi
	je	.L3695
.L3745:
	movl	$2, %ecx
	.p2align 4,,10
	.p2align 3
.L3696:
	movzwl	%cx, %eax
	addl	$1, %ecx
	sarl	%esi
	jne	.L3696
	movl	$1, %r8d
	movl	%eax, %ecx
	addl	%eax, %r12d
	sall	%cl, %r8d
	movslq	%r12d, %rsi
	leal	-1(%r8), %ebp
	salq	$2, %rsi
	andl	%edi, %ebp
	movzwl	%bp, %ebp
.L3697:
	movq	48(%rsp), %rcx
	addq	%rcx, %rsi
	movzwl	2(%rsi), %ecx
	movzwl	(%rsi), %r14d
	addl	%ecx, %edx
	movl	$24, %ecx
	subl	%edx, %ecx
	sall	%cl, %r14d
	orl	(%r11), %r14d
	cmpl	$7, %edx
	jle	.L3698
	movl	%edx, 16(%rsp)
	movl	%edx, %r13d
	leaq	111(%rsp), %r12
	movl	%eax, 32(%rsp)
	movq	%r11, 24(%rsp)
	movl	%ebp, 12(%rsp)
	movq	%r15, %rbp
	movq	%rbx, %r15
	movl	%r14d, %ebx
	.p2align 4,,10
	.p2align 3
.L3700:
	movl	%ebx, %r14d
	movq	8(%rbp), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	call	*0(%rbp)
	cmpb	$-1, %r14b
	jne	.L3699
	movb	$0, 111(%rsp)
	movq	8(%rbp), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	call	*0(%rbp)
.L3699:
	subl	$8, %r13d
	sall	$8, %ebx
	cmpl	$7, %r13d
	jg	.L3700
	movl	16(%rsp), %edx
	movl	%ebx, %r14d
	movl	32(%rsp), %eax
	movq	%r15, %rbx
	movq	24(%rsp), %r11
	movq	%rbp, %r15
	movl	12(%rsp), %ebp
	andl	$7, %edx
.L3698:
	movq	(%rsp), %rcx
	movl	%r14d, (%r11)
	movl	%edx, (%rcx)
	addl	%eax, %edx
	movl	$24, %ecx
	subl	%edx, %ecx
	sall	%cl, %ebp
	orl	(%r11), %ebp
	cmpl	$7, %edx
	jle	.L3701
	movl	%edx, 12(%rsp)
	movq	%rbx, %rax
	movl	%edx, %r13d
	movq	%r15, %rbx
	movq	%r11, 16(%rsp)
	leaq	111(%rsp), %r12
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L3703:
	movl	%ebp, %r14d
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	call	*(%rbx)
	cmpb	$-1, %r14b
	jne	.L3702
	movb	$0, 111(%rsp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	call	*(%rbx)
.L3702:
	subl	$8, %r13d
	sall	$8, %ebp
	cmpl	$7, %r13d
	jg	.L3703
	movl	12(%rsp), %edx
	movq	%r15, %rax
	movq	16(%rsp), %r11
	movq	%rbx, %r15
	movq	%rax, %rbx
	andl	$7, %edx
.L3701:
	movq	(%rsp), %rax
	movl	40(%rsp), %ecx
	movl	%ebp, (%r11)
	movl	%edx, (%rax)
	movl	44(%rsp), %eax
	addl	$1, %eax
	cmpl	%ecx, %eax
	jle	.L3681
	cmpl	$63, 40(%rsp)
	jne	.L3742
.L3643:
	movq	376(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L3743
	movl	88(%rsp), %eax
	addq	$392, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3740:
	.cfi_restore_state
	movl	%r12d, 44(%rsp)
	subl	%eax, %r12d
	xorl	%esi, %esi
	cmpl	$15, %r12d
	jle	.L3744
.L3688:
	movzwl	86(%rsp), %eax
	movl	%r12d, %r14d
	movl	%esi, 64(%rsp)
	movl	$1, %r13d
	movl	%ebp, 68(%rsp)
	sarl	$4, %r14d
	movl	%eax, 32(%rsp)
	movl	%r12d, 80(%rsp)
	movq	%rbx, 72(%rsp)
	movl	%r14d, 24(%rsp)
	movq	%r15, %r14
	movl	%edx, %r15d
	movl	%r13d, %edx
	.p2align 4,,10
	.p2align 3
.L3693:
	movl	36(%rsp), %eax
	movl	$24, %ecx
	addl	%eax, %r15d
	movl	32(%rsp), %eax
	subl	%r15d, %ecx
	sall	%cl, %eax
	orl	(%r11), %eax
	movl	%eax, %r13d
	cmpl	$7, %r15d
	jle	.L3690
	movl	%edx, 12(%rsp)
	movl	%r15d, %ebx
	leaq	111(%rsp), %rbp
	movl	%eax, %r12d
	movq	%r11, 16(%rsp)
	movq	%r14, %r13
	.p2align 4,,10
	.p2align 3
.L3692:
	movl	%r12d, %r14d
	movq	8(%r13), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	sarl	$16, %r14d
	movb	%r14b, 111(%rsp)
	call	*0(%r13)
	cmpb	$-1, %r14b
	jne	.L3691
	movb	$0, 111(%rsp)
	movq	8(%r13), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	*0(%r13)
.L3691:
	subl	$8, %ebx
	sall	$8, %r12d
	cmpl	$7, %ebx
	jg	.L3692
	movl	12(%rsp), %edx
	movq	16(%rsp), %r11
	movq	%r13, %r14
	andl	$7, %r15d
	movl	%r12d, %r13d
.L3690:
	movq	(%rsp), %rax
	movl	%r13d, (%r11)
	addl	$1, %edx
	movl	%r15d, (%rax)
	movl	24(%rsp), %eax
	cmpl	%eax, %edx
	jle	.L3693
	movl	68(%rsp), %ebp
	movl	80(%rsp), %r12d
	movl	%r15d, %edx
	movq	%r14, %r15
	movl	64(%rsp), %esi
	movq	72(%rsp), %rbx
	sall	$4, %r12d
	cmpl	$-2147483648, %ebp
	adcl	$-1, %ebp
	movzbl	%r12b, %r12d
	movl	%ebp, %edi
	testl	%esi, %esi
	jne	.L3745
.L3695:
	leal	1(%r12), %esi
	andl	$1, %ebp
	movl	$1, %eax
	movslq	%esi, %rsi
	salq	$2, %rsi
	jmp	.L3697
.L3742:
	movzwl	94(%rsp), %eax
	movzwl	92(%rsp), %r13d
	movl	$24, %ecx
	addl	%edx, %eax
	subl	%eax, %ecx
	sall	%cl, %r13d
	orl	(%r11), %r13d
	cmpl	$7, %eax
	jle	.L3707
	movl	%eax, 12(%rsp)
	movq	%r15, %r14
	movl	%eax, %ebp
	leaq	111(%rsp), %rbx
	movq	%r11, %r15
	.p2align 4,,10
	.p2align 3
.L3709:
	movl	%r13d, %r12d
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r12d
	movb	%r12b, 111(%rsp)
	call	*(%r14)
	cmpb	$-1, %r12b
	jne	.L3708
	movb	$0, 111(%rsp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r14)
.L3708:
	subl	$8, %ebp
	sall	$8, %r13d
	cmpl	$7, %ebp
	jg	.L3709
	movl	12(%rsp), %eax
	movq	%r15, %r11
	andl	$7, %eax
.L3707:
	movq	(%rsp), %rcx
	movl	%r13d, (%r11)
	movl	%eax, (%rcx)
	jmp	.L3643
.L3705:
	movl	%ebp, %esi
	movl	%eax, 44(%rsp)
	negl	%esi
	cmovs	%ebp, %esi
	xorl	%r12d, %r12d
	sarl	%esi
	jmp	.L3689
.L3739:
	movl	%eax, 44(%rsp)
	movl	$4, %esi
	movl	$1, %eax
	jmp	.L3697
.L3738:
	movzwl	2(%r13), %esi
	movl	$24, %ecx
	movzwl	0(%r13), %r13d
	leal	(%rsi,%rdi), %r14d
	subl	%r14d, %ecx
	sall	%cl, %r13d
	orl	%edx, %r13d
	cmpl	$7, %r14d
	jle	.L3675
	movl	%r14d, 12(%rsp)
	movl	%r14d, %ebp
	leaq	111(%rsp), %rbx
	movq	%r15, %r14
	movq	%r11, %r15
	.p2align 4,,10
	.p2align 3
.L3667:
	movl	%r13d, %r12d
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r12d
	movb	%r12b, 111(%rsp)
	call	*(%r14)
	cmpb	$-1, %r12b
	jne	.L3666
	movb	$0, 111(%rsp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r14)
.L3666:
	subl	$8, %ebp
	sall	$8, %r13d
	cmpl	$7, %ebp
	jg	.L3667
	jmp	.L3735
.L3679:
	movzwl	94(%rsp), %edx
	movzwl	92(%rsp), %eax
	movl	$24, %ecx
	leaq	111(%rsp), %rbx
	addl	%r14d, %edx
	subl	%edx, %ecx
	movl	%edx, %ebp
	sall	%cl, %eax
	orl	(%r11), %eax
	movl	%eax, %r13d
	cmpl	$7, %edx
	jle	.L3710
	movl	%edx, 12(%rsp)
	movq	%r15, %r14
	movq	%r11, %r15
	.p2align 4,,10
	.p2align 3
.L3683:
	movl	%r13d, %r12d
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	sarl	$16, %r12d
	movb	%r12b, 111(%rsp)
	call	*(%r14)
	cmpb	$-1, %r12b
	jne	.L3682
	movb	$0, 111(%rsp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r14)
.L3682:
	subl	$8, %ebp
	sall	$8, %r13d
	cmpl	$7, %ebp
	jg	.L3683
	movl	12(%rsp), %edx
	movq	%r15, %r11
	andl	$7, %edx
.L3710:
	movq	(%rsp), %rax
	movl	%r13d, (%r11)
	movl	%edx, (%rax)
	jmp	.L3643
.L3712:
	movl	$4, %ecx
	movl	$1, %r14d
	movl	$1, %eax
	jmp	.L3670
.L3743:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE855:
	.size	stbiw__jpg_processDU.constprop.1, .-stbiw__jpg_processDU.constprop.1
	.p2align 4
	.type	stbi_write_jpg_core.part.0, @function
stbi_write_jpg_core.part.0:
.LFB816:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%r8, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$4696, %rsp
	.cfi_def_cfa_offset 4752
	movq	%rdi, 232(%rsp)
	movl	%esi, 48(%rsp)
	movl	%edx, 136(%rsp)
	movl	%ecx, 168(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 4680(%rsp)
	xorl	%eax, %eax
	testl	%r9d, %r9d
	je	.L3810
	movl	%r9d, %ebx
	movl	$5000, %eax
	jle	.L3750
	movl	$100, %ecx
	cmpl	%ecx, %r9d
	cmovle	%r9d, %ecx
	cmpl	$49, %r9d
	jg	.L3854
	movl	$5000, %eax
	xorl	%edx, %edx
	idivl	%ecx
	jmp	.L3750
.L3810:
	movl	$20, %eax
	movl	$90, %ebx
.L3750:
	xorl	%edx, %edx
	leaq	YQT.17(%rip), %r9
	leaq	stbiw__jpg_ZigZag(%rip), %r8
	leaq	UVQT.16(%rip), %rdi
.L3753:
	movl	(%r9,%rdx,4), %esi
	movl	$1, %ecx
	imull	%eax, %esi
	cmpl	$49, %esi
	jle	.L3751
	movl	$-1, %ecx
	cmpl	$25549, %esi
	jg	.L3751
	leal	50(%rsi), %ecx
	imulq	$1374389535, %rcx, %rcx
	shrq	$37, %rcx
.L3751:
	movl	(%rdi,%rdx,4), %r10d
	movzbl	(%r8,%rdx), %esi
	imull	%eax, %r10d
	movb	%cl, 4544(%rsp,%rsi)
	movl	$1, %ecx
	cmpl	$49, %r10d
	jle	.L3752
	movl	$-1, %ecx
	cmpl	$25549, %r10d
	jg	.L3752
	leal	50(%r10), %ecx
	imulq	$1374389535, %rcx, %rcx
	shrq	$37, %rcx
.L3752:
	addq	$1, %rdx
	movb	%cl, 4608(%rsp,%rsi)
	cmpq	$64, %rdx
	jne	.L3753
	leaq	416(%rsp), %rsi
	leaq	672(%rsp), %rdi
	movss	.LC42(%rip), %xmm3
	movaps	.LC138(%rip), %xmm6
	movq	%rsi, 312(%rsp)
	movq	%rsi, %r11
	movq	%rdi, %rbp
	movaps	.LC140(%rip), %xmm5
	movq	%rdi, 264(%rsp)
	leaq	stbiw__jpg_ZigZag(%rip), %rax
	leaq	aasf.15(%rip), %r12
	shufps	$0, %xmm3, %xmm3
.L3754:
	movzbl	(%rax), %r8d
	movzbl	1(%rax), %edi
	addq	$8, %rax
	addq	$4, %r12
	movzbl	-4(%rax), %r10d
	movss	-4(%r12), %xmm4
	addq	$32, %r11
	addq	$32, %rbp
	movzbl	4608(%rsp,%r8), %esi
	movzbl	4608(%rsp,%rdi), %edx
	shufps	$0, %xmm4, %xmm4
	movzbl	4544(%rsp,%rdi), %edi
	movd	%esi, %xmm0
	movzbl	-6(%rax), %esi
	movzbl	4608(%rsp,%rsi), %ecx
	movzbl	4544(%rsp,%rsi), %esi
	movd	%ecx, %xmm1
	movzbl	-5(%rax), %ecx
	movd	%esi, %xmm9
	movzbl	4608(%rsp,%rcx), %r9d
	movzbl	4544(%rsp,%rcx), %ecx
	movd	%r9d, %xmm7
	movzbl	-3(%rax), %r9d
	punpckldq	%xmm7, %xmm1
	movd	%edx, %xmm7
	movzbl	4608(%rsp,%r10), %edx
	movzbl	4544(%rsp,%r10), %r10d
	movzbl	4608(%rsp,%r9), %r14d
	punpckldq	%xmm7, %xmm0
	movzbl	4544(%rsp,%r9), %r9d
	punpcklqdq	%xmm1, %xmm0
	movd	%edx, %xmm1
	movzbl	-2(%rax), %edx
	movd	%r10d, %xmm2
	cvtdq2ps	%xmm0, %xmm0
	mulps	%xmm4, %xmm0
	movzbl	4608(%rsp,%rdx), %r13d
	movzbl	4544(%rsp,%rdx), %edx
	movd	%edx, %xmm8
	movzbl	-1(%rax), %edx
	movd	%r13d, %xmm7
	movzbl	4544(%rsp,%rdx), %r10d
	mulps	%xmm5, %xmm0
	movd	%r10d, %xmm10
	punpckldq	%xmm10, %xmm8
	movd	%r9d, %xmm10
	movzbl	4544(%rsp,%r8), %r9d
	punpckldq	%xmm10, %xmm2
	movd	%ecx, %xmm10
	punpcklqdq	%xmm8, %xmm2
	movaps	%xmm3, %xmm8
	punpckldq	%xmm10, %xmm9
	cvtdq2ps	%xmm2, %xmm2
	mulps	%xmm4, %xmm2
	movd	%edi, %xmm10
	leaq	64+stbiw__jpg_ZigZag(%rip), %rdi
	mulps	%xmm6, %xmm2
	divps	%xmm2, %xmm8
	movd	%r9d, %xmm2
	punpckldq	%xmm10, %xmm2
	punpcklqdq	%xmm9, %xmm2
	movaps	%xmm3, %xmm9
	cvtdq2ps	%xmm2, %xmm2
	mulps	%xmm4, %xmm2
	mulps	%xmm5, %xmm2
	divps	%xmm2, %xmm9
	movaps	%xmm8, -16(%r11)
	movaps	%xmm9, -32(%r11)
	movzbl	4608(%rsp,%rdx), %edx
	movd	%edx, %xmm2
	punpckldq	%xmm2, %xmm7
	movd	%r14d, %xmm2
	punpckldq	%xmm2, %xmm1
	movaps	%xmm3, %xmm2
	punpcklqdq	%xmm7, %xmm1
	cvtdq2ps	%xmm1, %xmm1
	mulps	%xmm4, %xmm1
	mulps	%xmm6, %xmm1
	divps	%xmm1, %xmm2
	movaps	%xmm3, %xmm1
	divps	%xmm0, %xmm1
	movaps	%xmm2, -16(%rbp)
	movaps	%xmm1, -32(%rbp)
	cmpq	%rax, %rdi
	jne	.L3754
	movl	48(%rsp), %ecx
	movl	.LC141(%rip), %eax
	leaq	412(%rsp), %rbp
	movb	$8, 4516(%rsp)
	movl	136(%rsp), %esi
	movq	232(%rsp), %r14
	movl	$17891840, 4524(%rsp)
	movl	%eax, 4512(%rsp)
	movzbl	%cl, %eax
	movzbl	%ch, %edx
	sall	$8, %eax
	movq	8(%r14), %rdi
	orl	%edx, %eax
	movzbl	%sil, %edx
	sall	$8, %eax
	orl	%edx, %eax
	movl	%esi, %edx
	leaq	head0.14(%rip), %rsi
	sall	$8, %eax
	movzbl	%dh, %edx
	orl	%edx, %eax
	cmpl	$91, %ebx
	movl	$17, %edx
	movl	%eax, 4517(%rsp)
	movzwl	.LC142(%rip), %eax
	movw	%ax, 4521(%rsp)
	movl	$34, %eax
	cmovge	%edx, %eax
	movl	$25, %edx
	movb	%al, 4523(%rsp)
	movabsq	$45600891830604035, %rax
	movq	%rax, 4528(%rsp)
	call	*(%r14)
	movq	8(%r14), %rdi
	leaq	4544(%rsp), %rsi
	movl	$64, %edx
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	movb	$1, 412(%rsp)
	movq	%rbp, 248(%rsp)
	call	*(%r14)
	movq	8(%r14), %rdi
	leaq	4608(%rsp), %rsi
	movl	$64, %edx
	call	*(%r14)
	movq	8(%r14), %rdi
	leaq	4512(%rsp), %rsi
	movl	$24, %edx
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$16, %edx
	leaq	1+std_dc_luminance_nrcodes.13(%rip), %rsi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$12, %edx
	leaq	std_dc_luminance_values.12(%rip), %rsi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	movb	$16, 412(%rsp)
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$16, %edx
	leaq	1+std_ac_luminance_nrcodes.11(%rip), %rsi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$162, %edx
	leaq	std_ac_luminance_values.10(%rip), %rsi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	movb	$1, 412(%rsp)
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$16, %edx
	leaq	1+std_dc_chrominance_nrcodes.9(%rip), %rsi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$12, %edx
	leaq	std_dc_chrominance_values.8(%rip), %rsi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	movb	$17, 412(%rsp)
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$16, %edx
	leaq	1+std_ac_chrominance_nrcodes.7(%rip), %rsi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$162, %edx
	leaq	std_ac_chrominance_values.6(%rip), %rsi
	call	*(%r14)
	movq	8(%r14), %rdi
	leaq	head2.5(%rip), %rsi
	movl	$14, %edx
	call	*(%r14)
	movl	168(%rsp), %esi
	movl	$0, 408(%rsp)
	movl	$0, 412(%rsp)
	cmpl	$2, %esi
	setg	%al
	setg	%dil
	addq	%rax, %rax
	movzbl	%dil, %edi
	andl	$2, %eax
	movq	%rdi, 216(%rsp)
	leaq	(%r15,%rdi), %r13
	movq	%rax, 224(%rsp)
	leaq	(%r15,%rax), %r12
	cmpl	$90, %ebx
	jle	.L3756
	movl	136(%rsp), %edx
	testl	%edx, %edx
	jle	.L3757
	movl	48(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L3757
	leal	-1(%rdx), %eax
	leaq	408(%rsp), %rbx
	movl	$0, 144(%rsp)
	movss	.LC144(%rip), %xmm10
	movl	%eax, 140(%rsp)
	andl	$-8, %eax
	movss	.LC146(%rip), %xmm9
	movl	$7, %r9d
	leal	15(%rax), %ebp
	leal	-1(%rcx), %eax
	movq	%rbx, 128(%rsp)
	movss	.LC148(%rip), %xmm8
	leaq	UVAC_HT.1(%rip), %rbx
	movl	%eax, 52(%rsp)
	andl	$-8, %eax
	movss	.LC150(%rip), %xmm7
	leal	8(%rax), %r14d
	movq	%r12, %rax
	movl	%ebp, %edx
	movq	%r15, %r12
	movq	%rbx, 240(%rsp)
	movq	%r13, %rbp
	movq	%rax, %r15
	leaq	UVDC_HT.2(%rip), %rbx
	movss	.LC157(%rip), %xmm14
	movl	%r9d, %r13d
	movl	$0, 152(%rsp)
	leaq	3488(%rsp), %rdi
	movl	$0, 148(%rsp)
	movss	.LC88(%rip), %xmm0
	leaq	1440(%rsp), %r10
	leaq	2464(%rsp), %r11
	shufps	$0, %xmm10, %xmm10
	shufps	$0, %xmm9, %xmm9
	shufps	$0, %xmm8, %xmm8
	movss	.LC159(%rip), %xmm15
	movq	%rbx, 256(%rsp)
	movl	%esi, %ebx
	shufps	$0, %xmm7, %xmm7
	shufps	$0, %xmm0, %xmm0
	movl	%r14d, 172(%rsp)
	movq	%rdi, %r14
	shufps	$0, %xmm14, %xmm14
	shufps	$0, %xmm15, %xmm15
.L3758:
	leal	-7(%r13), %eax
	movl	136(%rsp), %esi
	movl	$0, 8(%rsp)
	movl	%eax, 160(%rsp)
	leal	1(%r13), %eax
	cmpl	%esi, %eax
	movl	%edx, 176(%rsp)
	cmovg	%esi, %eax
	movl	%r13d, 168(%rsp)
	movq	%r11, %r13
	movl	%eax, 112(%rsp)
.L3806:
	movl	8(%rsp), %esi
	movl	48(%rsp), %edi
	movl	52(%rsp), %ecx
	movl	stbi__flip_vertically_on_write(%rip), %eax
	leal	1(%rsi), %edx
	cmpl	%edx, %edi
	movl	%eax, 16(%rsp)
	leal	7(%rsi), %eax
	cmovle	%ecx, %edx
	movl	%edx, 32(%rsp)
	leal	2(%rsi), %edx
	cmpl	%edx, %edi
	cmovle	%ecx, %edx
	movl	%edx, 40(%rsp)
	leal	3(%rsi), %edx
	cmpl	%edx, %edi
	cmovle	%ecx, %edx
	movl	%edx, 56(%rsp)
	leal	4(%rsi), %edx
	cmpl	%edx, %edi
	cmovle	%ecx, %edx
	movl	%edx, 80(%rsp)
	leal	5(%rsi), %edx
	cmpl	%edx, %edi
	cmovle	%ecx, %edx
	movl	%edx, 64(%rsp)
	leal	6(%rsi), %edx
	cmpl	%edx, %edi
	cmovle	%ecx, %edx
	cmpl	%eax, %edi
	cmovle	%ecx, %eax
	movl	%edx, 88(%rsp)
	movl	160(%rsp), %edx
	movl	%eax, 96(%rsp)
	xorl	%eax, %eax
	cmpl	%edx, 136(%rsp)
	jle	.L3805
	movl	168(%rsp), %eax
	leal	-6(%rax), %r9d
	movl	$8, %eax
.L3799:
	movl	16(%rsp), %edi
	leal	-1(%r9), %ecx
	movl	40(%rsp), %esi
	pxor	%xmm2, %xmm2
	movl	136(%rsp), %edx
	pxor	%xmm3, %xmm3
	pxor	%xmm1, %xmm1
	pxor	%xmm4, %xmm4
	pxor	%xmm6, %xmm6
	pxor	%xmm5, %xmm5
	pxor	%xmm11, %xmm11
	subl	%r9d, %edx
	pxor	%xmm12, %xmm12
	pxor	%xmm13, %xmm13
	testl	%edi, %edi
	cmove	%ecx, %edx
	movl	48(%rsp), %edi
	movl	56(%rsp), %ecx
	imull	%edi, %edx
	movl	8(%rsp), %edi
	leal	(%rdi,%rdx), %r8d
	movl	32(%rsp), %edi
	addl	%edx, %esi
	addl	%edx, %ecx
	imull	%ebx, %r8d
	addl	%edx, %edi
	imull	%ebx, %esi
	imull	%ebx, %edi
	movslq	%r8d, %r8
	imull	%ebx, %ecx
	movzbl	(%r12,%r8), %r11d
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	cvtsi2ssl	%r11d, %xmm2
	movzbl	(%r12,%rdi), %r11d
	movslq	%ecx, %rcx
	cvtsi2ssl	%r11d, %xmm3
	movzbl	(%r12,%rsi), %r11d
	cvtsi2ssl	%r11d, %xmm1
	movzbl	(%r12,%rcx), %r11d
	cvtsi2ssl	%r11d, %xmm4
	movzbl	0(%rbp,%r8), %r11d
	unpcklps	%xmm3, %xmm2
	pxor	%xmm3, %xmm3
	movzbl	(%r15,%r8), %r8d
	cvtsi2ssl	%r11d, %xmm6
	movzbl	0(%rbp,%rdi), %r11d
	movzbl	(%r15,%rdi), %edi
	cvtsi2ssl	%r8d, %xmm5
	movl	96(%rsp), %r8d
	cvtsi2ssl	%r11d, %xmm3
	unpcklps	%xmm4, %xmm1
	movzbl	0(%rbp,%rsi), %r11d
	pxor	%xmm4, %xmm4
	movlhps	%xmm1, %xmm2
	pxor	%xmm1, %xmm1
	movzbl	(%r15,%rsi), %esi
	cvtsi2ssl	%r11d, %xmm1
	movzbl	0(%rbp,%rcx), %r11d
	movzbl	(%r15,%rcx), %ecx
	cvtsi2ssl	%r11d, %xmm4
	unpcklps	%xmm3, %xmm6
	pxor	%xmm3, %xmm3
	cvtsi2ssl	%edi, %xmm3
	movl	80(%rsp), %edi
	addl	%edx, %edi
	unpcklps	%xmm4, %xmm1
	imull	%ebx, %edi
	pxor	%xmm4, %xmm4
	movlhps	%xmm1, %xmm6
	pxor	%xmm1, %xmm1
	unpcklps	%xmm3, %xmm5
	cvtsi2ssl	%esi, %xmm1
	movl	64(%rsp), %esi
	pxor	%xmm3, %xmm3
	cvtsi2ssl	%ecx, %xmm4
	movl	88(%rsp), %ecx
	movslq	%edi, %rdi
	addl	%edx, %esi
	imull	%ebx, %esi
	addl	%edx, %ecx
	addl	%r8d, %edx
	movzbl	(%r12,%rdi), %r8d
	imull	%ebx, %ecx
	unpcklps	%xmm4, %xmm1
	imull	%ebx, %edx
	pxor	%xmm4, %xmm4
	movlhps	%xmm1, %xmm5
	movslq	%esi, %rsi
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%r8d, %xmm1
	movzbl	(%r12,%rsi), %r8d
	movslq	%ecx, %rcx
	movslq	%edx, %rdx
	cvtsi2ssl	%r8d, %xmm4
	movzbl	(%r12,%rcx), %r8d
	cvtsi2ssl	%r8d, %xmm3
	movzbl	(%r12,%rdx), %r8d
	cvtsi2ssl	%r8d, %xmm11
	movzbl	0(%rbp,%rdi), %r8d
	unpcklps	%xmm4, %xmm1
	pxor	%xmm4, %xmm4
	movzbl	(%r15,%rdi), %edi
	cvtsi2ssl	%r8d, %xmm4
	movzbl	0(%rbp,%rsi), %r8d
	unpcklps	%xmm11, %xmm3
	pxor	%xmm11, %xmm11
	cvtsi2ssl	%r8d, %xmm11
	movzbl	0(%rbp,%rcx), %r8d
	movlhps	%xmm3, %xmm1
	pxor	%xmm3, %xmm3
	cvtsi2ssl	%r8d, %xmm3
	movzbl	0(%rbp,%rdx), %r8d
	movzbl	(%r15,%rsi), %esi
	movzbl	(%r15,%rcx), %ecx
	movzbl	(%r15,%rdx), %edx
	cvtsi2ssl	%r8d, %xmm12
	unpcklps	%xmm11, %xmm4
	pxor	%xmm11, %xmm11
	cvtsi2ssl	%ecx, %xmm11
	leaq	8(%rax), %rcx
	cvtsi2ssl	%edx, %xmm13
	movl	%r9d, %edx
	addl	$1, %r9d
	unpcklps	%xmm12, %xmm3
	pxor	%xmm12, %xmm12
	movlhps	%xmm3, %xmm4
	cvtsi2ssl	%esi, %xmm12
	pxor	%xmm3, %xmm3
	cvtsi2ssl	%edi, %xmm3
	unpcklps	%xmm13, %xmm11
	movl	112(%rsp), %edi
	unpcklps	%xmm12, %xmm3
	movaps	%xmm2, %xmm12
	mulps	%xmm9, %xmm12
	movlhps	%xmm11, %xmm3
	movaps	%xmm6, %xmm11
	mulps	%xmm10, %xmm11
	addps	%xmm12, %xmm11
	movaps	%xmm5, %xmm12
	mulps	%xmm8, %xmm12
	addps	%xmm12, %xmm11
	movaps	%xmm1, %xmm12
	mulps	%xmm9, %xmm12
	addps	%xmm7, %xmm11
	movaps	%xmm11, -32(%r10,%rax,4)
	movaps	%xmm4, %xmm11
	mulps	%xmm10, %xmm11
	addps	%xmm12, %xmm11
	movaps	%xmm3, %xmm12
	mulps	%xmm8, %xmm12
	addps	%xmm12, %xmm11
	movaps	.LC153(%rip), %xmm12
	mulps	%xmm6, %xmm12
	addps	%xmm7, %xmm11
	mulps	%xmm14, %xmm6
	movaps	%xmm11, -16(%r10,%rax,4)
	movaps	.LC151(%rip), %xmm11
	mulps	%xmm2, %xmm11
	mulps	%xmm0, %xmm2
	subps	%xmm12, %xmm11
	movaps	%xmm5, %xmm12
	mulps	%xmm0, %xmm12
	subps	%xmm6, %xmm2
	mulps	%xmm15, %xmm5
	addps	%xmm12, %xmm11
	movaps	.LC153(%rip), %xmm12
	subps	%xmm5, %xmm2
	mulps	%xmm4, %xmm12
	movaps	%xmm11, -32(%r13,%rax,4)
	movaps	.LC151(%rip), %xmm11
	mulps	%xmm14, %xmm4
	movaps	%xmm2, -32(%r14,%rax,4)
	mulps	%xmm1, %xmm11
	mulps	%xmm0, %xmm1
	subps	%xmm12, %xmm11
	movaps	%xmm3, %xmm12
	mulps	%xmm0, %xmm12
	subps	%xmm4, %xmm1
	mulps	%xmm15, %xmm3
	addps	%xmm12, %xmm11
	subps	%xmm3, %xmm1
	movaps	%xmm11, -16(%r13,%rax,4)
	movaps	%xmm1, -16(%r14,%rax,4)
	cmpl	%edi, %edx
	jl	.L3855
	cmpl	%edx, 168(%rsp)
	jl	.L3801
.L3805:
	movl	16(%rsp), %esi
	cltq
	xorl	%ecx, %ecx
	movl	8(%rsp), %edi
	pxor	%xmm2, %xmm2
	salq	$2, %rax
	pxor	%xmm1, %xmm1
	pxor	%xmm3, %xmm3
	pxor	%xmm12, %xmm12
	pxor	%xmm4, %xmm4
	pxor	%xmm11, %xmm11
	testl	%esi, %esi
	movl	48(%rsp), %esi
	cmove	140(%rsp), %ecx
	pxor	%xmm5, %xmm5
	pxor	%xmm6, %xmm6
	imull	%ecx, %esi
	leal	(%rdi,%rsi), %ecx
	imull	%ebx, %ecx
	movslq	%ecx, %rdi
	movl	32(%rsp), %ecx
	addl	%esi, %ecx
	imull	%ebx, %ecx
	movslq	%ecx, %r8
	movl	40(%rsp), %ecx
	addl	%esi, %ecx
	imull	%ebx, %ecx
	movslq	%ecx, %r9
	movl	56(%rsp), %ecx
	addl	%esi, %ecx
	imull	%ebx, %ecx
	movslq	%ecx, %r11
	movzbl	(%r12,%rdi), %ecx
	cvtsi2ssl	%ecx, %xmm12
	movzbl	(%r12,%r8), %ecx
	cvtsi2ssl	%ecx, %xmm2
	movzbl	(%r12,%r9), %ecx
	cvtsi2ssl	%ecx, %xmm1
	movzbl	(%r12,%r11), %ecx
	cvtsi2ssl	%ecx, %xmm3
	movzbl	0(%rbp,%rdi), %ecx
	unpcklps	%xmm2, %xmm12
	pxor	%xmm2, %xmm2
	cvtsi2ssl	%ecx, %xmm2
	movzbl	0(%rbp,%r8), %ecx
	unpcklps	%xmm3, %xmm1
	pxor	%xmm3, %xmm3
	cvtsi2ssl	%ecx, %xmm3
	movzbl	0(%rbp,%r9), %ecx
	movlhps	%xmm1, %xmm12
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%ecx, %xmm1
	movzbl	0(%rbp,%r11), %ecx
	cvtsi2ssl	%ecx, %xmm4
	movzbl	(%r15,%rdi), %ecx
	unpcklps	%xmm3, %xmm2
	pxor	%xmm3, %xmm3
	movl	64(%rsp), %edi
	cvtsi2ssl	%ecx, %xmm11
	movzbl	(%r15,%r8), %ecx
	movl	88(%rsp), %r8d
	addl	%esi, %edi
	cvtsi2ssl	%ecx, %xmm3
	unpcklps	%xmm4, %xmm1
	movzbl	(%r15,%r9), %ecx
	pxor	%xmm4, %xmm4
	movlhps	%xmm1, %xmm2
	pxor	%xmm1, %xmm1
	movl	96(%rsp), %r9d
	addl	%esi, %r8d
	cvtsi2ssl	%ecx, %xmm1
	movzbl	(%r15,%r11), %ecx
	imull	%ebx, %edi
	addl	%esi, %r9d
	cvtsi2ssl	%ecx, %xmm4
	movl	80(%rsp), %ecx
	unpcklps	%xmm3, %xmm11
	pxor	%xmm3, %xmm3
	imull	%ebx, %r8d
	addl	%esi, %ecx
	movl	%r9d, %esi
	movslq	%edi, %rdi
	imull	%ebx, %ecx
	unpcklps	%xmm4, %xmm1
	imull	%ebx, %esi
	pxor	%xmm4, %xmm4
	movslq	%r8d, %r8
	movlhps	%xmm1, %xmm11
	pxor	%xmm1, %xmm1
	movslq	%ecx, %rcx
	movzbl	(%r12,%rcx), %r9d
	movslq	%esi, %rsi
	cvtsi2ssl	%r9d, %xmm1
	movzbl	(%r12,%rdi), %r9d
	cvtsi2ssl	%r9d, %xmm4
	movzbl	(%r12,%r8), %r9d
	cvtsi2ssl	%r9d, %xmm3
	movzbl	(%r12,%rsi), %r9d
	cvtsi2ssl	%r9d, %xmm5
	movzbl	0(%rbp,%rcx), %r9d
	unpcklps	%xmm4, %xmm1
	pxor	%xmm4, %xmm4
	movzbl	(%r15,%rcx), %ecx
	cvtsi2ssl	%r9d, %xmm4
	movzbl	0(%rbp,%rdi), %r9d
	unpcklps	%xmm5, %xmm3
	pxor	%xmm5, %xmm5
	cvtsi2ssl	%r9d, %xmm5
	movzbl	0(%rbp,%r8), %r9d
	movlhps	%xmm3, %xmm1
	pxor	%xmm3, %xmm3
	cvtsi2ssl	%r9d, %xmm3
	movzbl	0(%rbp,%rsi), %r9d
	unpcklps	%xmm5, %xmm4
	cvtsi2ssl	%r9d, %xmm6
	pxor	%xmm5, %xmm5
	movaps	%xmm4, %xmm13
	pxor	%xmm4, %xmm4
	cvtsi2ssl	%ecx, %xmm4
	movzbl	(%r15,%rdi), %ecx
	movl	168(%rsp), %r11d
	leaq	1456(%rsp), %rdi
	cvtsi2ssl	%ecx, %xmm5
	unpcklps	%xmm6, %xmm3
	movzbl	(%r15,%r8), %ecx
	pxor	%xmm6, %xmm6
	movlhps	%xmm3, %xmm13
	pxor	%xmm3, %xmm3
	cvtsi2ssl	%ecx, %xmm3
	movzbl	(%r15,%rsi), %ecx
	movaps	%xmm13, 16(%rsp)
	leaq	2480(%rsp), %rsi
	cvtsi2ssl	%ecx, %xmm6
	unpcklps	%xmm5, %xmm4
	movaps	%xmm12, %xmm5
	mulps	%xmm0, %xmm5
	leaq	3504(%rsp), %rcx
	unpcklps	%xmm6, %xmm3
	movaps	%xmm4, %xmm6
	movaps	%xmm1, %xmm4
	mulps	%xmm0, %xmm4
	movlhps	%xmm3, %xmm6
	movaps	%xmm2, %xmm3
	mulps	%xmm14, %xmm3
	subps	%xmm3, %xmm5
	movaps	%xmm11, %xmm3
	mulps	%xmm15, %xmm3
	subps	%xmm3, %xmm5
	movaps	%xmm13, %xmm3
	movaps	.LC153(%rip), %xmm13
	mulps	%xmm14, %xmm3
	movaps	%xmm6, %xmm14
	mulps	%xmm2, %xmm13
	mulps	%xmm10, %xmm2
	mulps	%xmm15, %xmm6
	movaps	16(%rsp), %xmm15
	subps	%xmm3, %xmm4
	movaps	.LC151(%rip), %xmm3
	mulps	%xmm12, %xmm3
	mulps	%xmm9, %xmm12
	subps	%xmm6, %xmm4
	movaps	.LC153(%rip), %xmm6
	mulps	%xmm15, %xmm6
	subps	%xmm13, %xmm3
	movaps	%xmm11, %xmm13
	mulps	%xmm0, %xmm13
	addps	%xmm12, %xmm2
	mulps	%xmm8, %xmm11
	addps	%xmm13, %xmm3
	movaps	.LC151(%rip), %xmm13
	addps	%xmm11, %xmm2
	movaps	%xmm15, %xmm11
	mulps	%xmm1, %xmm13
	mulps	%xmm10, %xmm11
	mulps	%xmm9, %xmm1
	addps	%xmm7, %xmm2
	subps	%xmm6, %xmm13
	movaps	%xmm14, %xmm6
	mulps	%xmm0, %xmm6
	addps	%xmm11, %xmm1
	movaps	%xmm14, %xmm11
	mulps	%xmm8, %xmm11
	addps	%xmm13, %xmm6
	addps	%xmm11, %xmm1
	addps	%xmm7, %xmm1
	.p2align 4,,10
	.p2align 3
.L3800:
	addl	$1, %edx
	movaps	%xmm2, (%r10,%rax)
	movaps	%xmm3, 0(%r13,%rax)
	movaps	%xmm5, (%r14,%rax)
	movaps	%xmm1, (%rdi,%rax)
	movaps	%xmm6, (%rsi,%rax)
	movaps	%xmm4, (%rcx,%rax)
	addq	$32, %rax
	cmpl	%edx, %r11d
	jge	.L3800
.L3801:
	leaq	YAC_HT.3(%rip), %rax
	movq	%r10, %rcx
	pushq	%rax
	.cfi_def_cfa_offset 4760
	leaq	YDC_HT.4(%rip), %rax
	pushq	%rax
	.cfi_def_cfa_offset 4768
	movl	164(%rsp), %r9d
	movq	328(%rsp), %r8
	movq	264(%rsp), %rdx
	movq	144(%rsp), %rsi
	movq	248(%rsp), %rdi
	movq	%r10, 32(%rsp)
	call	stbiw__jpg_processDU.constprop.1
	movq	%r13, %rcx
	movl	%eax, 164(%rsp)
	pushq	256(%rsp)
	.cfi_def_cfa_offset 4776
	pushq	280(%rsp)
	.cfi_def_cfa_offset 4784
	movl	184(%rsp), %r9d
	movq	296(%rsp), %r8
	movq	280(%rsp), %rdx
	movq	160(%rsp), %rsi
	movq	264(%rsp), %rdi
	call	stbiw__jpg_processDU.constprop.1
	movq	%r14, %rcx
	movl	%eax, 184(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 4752
	pushq	240(%rsp)
	.cfi_def_cfa_offset 4760
	pushq	264(%rsp)
	.cfi_def_cfa_offset 4768
	movl	160(%rsp), %r9d
	movq	280(%rsp), %r8
	movq	264(%rsp), %rdx
	movq	144(%rsp), %rsi
	movq	248(%rsp), %rdi
	call	stbiw__jpg_processDU.constprop.1
	addl	$8, 24(%rsp)
	movaps	.LC149(%rip), %xmm7
	movl	%eax, 160(%rsp)
	movl	24(%rsp), %eax
	popq	%rdx
	.cfi_def_cfa_offset 4760
	popq	%rcx
	.cfi_def_cfa_offset 4752
	cmpl	%eax, 172(%rsp)
	movq	16(%rsp), %r10
	movaps	.LC156(%rip), %xmm14
	movaps	.LC158(%rip), %xmm15
	movaps	.LC155(%rip), %xmm0
	movaps	.LC143(%rip), %xmm10
	movaps	.LC145(%rip), %xmm9
	movaps	.LC147(%rip), %xmm8
	jne	.L3806
	movq	%r13, %r11
	movl	168(%rsp), %r13d
	movl	176(%rsp), %edx
	addl	$8, %r13d
	cmpl	%edx, %r13d
	jne	.L3758
.L3794:
	movl	412(%rsp), %eax
	movl	$24, %ecx
	leal	7(%rax), %ebx
	movl	$127, %eax
	subl	%ebx, %ecx
	sall	%cl, %eax
	orl	408(%rsp), %eax
	movl	%eax, %ebp
	cmpl	$7, %ebx
	jle	.L3757
	movq	232(%rsp), %r13
	leaq	407(%rsp), %r12
.L3808:
	movl	%ebp, %r14d
	movq	8(%r13), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	sarl	$16, %r14d
	movb	%r14b, 407(%rsp)
	call	*0(%r13)
	cmpb	$-1, %r14b
	jne	.L3807
	movb	$0, 407(%rsp)
	movq	8(%r13), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	call	*0(%r13)
.L3807:
	subl	$8, %ebx
	sall	$8, %ebp
	cmpl	$7, %ebx
	jg	.L3808
.L3757:
	movq	232(%rsp), %rbx
	movq	248(%rsp), %r15
	movl	$1, %edx
	movb	$-1, 412(%rsp)
	movq	8(%rbx), %rdi
	movq	%r15, %rsi
	call	*(%rbx)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r15, %rsi
	movb	$-39, 412(%rsp)
	call	*(%rbx)
	movq	4680(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L3856
	addq	$4696, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L3756:
	.cfi_restore_state
	movl	136(%rsp), %eax
	testl	%eax, %eax
	jle	.L3757
	movl	48(%rsp), %ebx
	testl	%ebx, %ebx
	jle	.L3757
	subl	$1, %eax
	xorl	%r14d, %r14d
	movl	$0, 328(%rsp)
	movq	%r15, %r10
	movl	%eax, 140(%rsp)
	andl	$-16, %eax
	movl	%r14d, %r15d
	movq	232(%rsp), %r14
	leal	16(%rax), %ebp
	leal	-1(%rbx), %eax
	movl	$0, 292(%rsp)
	leaq	1472(%rsp), %rbx
	movl	%eax, 52(%rsp)
	shrl	$4, %eax
	movq	%rbx, 352(%rsp)
	addl	$1, %eax
	leaq	1952(%rsp), %rbx
	salq	$4, %rax
	movq	%rbx, 360(%rsp)
	leaq	1984(%rsp), %rbx
	movq	%rax, 344(%rsp)
	movslq	168(%rsp), %rax
	movq	%rbx, 368(%rsp)
	leaq	1184(%rsp), %rbx
	movq	%rbx, 304(%rsp)
	leaq	928(%rsp), %rbx
	movq	%rax, 376(%rsp)
	leaq	1440(%rsp), %rax
	movq	%rbx, 296(%rsp)
	leaq	UVAC_HT.1(%rip), %rbx
	movq	%rax, 16(%rsp)
	leaq	2464(%rsp), %rax
	movq	%rbx, 240(%rsp)
	leaq	UVDC_HT.2(%rip), %rbx
	movq	%rax, 32(%rsp)
	leaq	3488(%rsp), %rax
	movl	$0, 288(%rsp)
	movq	%rbx, 256(%rsp)
	movq	%rax, 8(%rsp)
	leaq	408(%rsp), %rax
	movq	%r12, 184(%rsp)
	movq	248(%rsp), %r12
	movq	%r13, 176(%rsp)
	movq	%rax, %r13
.L3759:
	movq	$0, 56(%rsp)
	movq	%r12, %rbx
	movl	$15, 144(%rsp)
	movl	%ebp, 388(%rsp)
	movq	%r14, 272(%rsp)
	movq	%r13, 280(%rsp)
	movl	%r15d, 384(%rsp)
	movq	%r10, %r15
.L3795:
	movq	56(%rsp), %rax
	cmpl	$1, 168(%rsp)
	movl	%eax, 172(%rsp)
	movl	%eax, 148(%rsp)
	movl	stbi__flip_vertically_on_write(%rip), %eax
	movl	%eax, 128(%rsp)
	jne	.L3857
	movq	56(%rsp), %rdi
	movq	8(%rsp), %rax
	movq	%rbx, 320(%rsp)
	movl	48(%rsp), %esi
	movl	168(%rsp), %ecx
	movq	16(%rsp), %r13
	movq	%rax, 80(%rsp)
	movl	%edi, %eax
	addl	$16, %eax
	movq	32(%rsp), %r14
	movl	384(%rsp), %r12d
	movl	%edi, 152(%rsp)
	cmpl	%esi, %eax
	movq	%r13, 88(%rsp)
	movl	144(%rsp), %r8d
	cmovg	%esi, %eax
	movl	%r12d, 40(%rsp)
	movq	176(%rsp), %r9
	movq	%r14, 64(%rsp)
	movq	184(%rsp), %r10
	movl	%eax, %esi
	movl	%eax, 208(%rsp)
	subl	%edi, %eax
	cmpl	%esi, %edi
	cmovl	%eax, %ecx
	subl	$1, %eax
	cmpl	$14, %eax
	setbe	%dl
	cmpl	%esi, %edi
	movl	%ecx, 160(%rsp)
	setge	%al
	andl	$-16, %ecx
	xorl	%ebp, %ebp
	orl	%eax, %edx
	movl	%edi, %eax
	movl	%ecx, 196(%rsp)
	addl	%ecx, %eax
	movb	%dl, 192(%rsp)
	movl	%eax, 200(%rsp)
	jmp	.L3774
	.p2align 4,,10
	.p2align 3
.L3859:
	movl	148(%rsp), %eax
	.p2align 4,,10
	.p2align 3
.L3769:
	movl	172(%rsp), %esi
	movl	$1, %edi
	subl	%eax, %esi
	cmpl	%eax, %r8d
	leal	16(%rsi), %r11d
	cmovge	%r11d, %edi
	addl	$15, %esi
	movl	%edi, %r13d
	cmpl	$14, %esi
	jbe	.L3818
	cmpl	%eax, %r8d
	jl	.L3818
	movq	16(%rsp), %rdi
	movslq	%ecx, %rsi
	pxor	%xmm7, %xmm7
	pxor	%xmm3, %xmm3
	salq	$2, %rsi
	movdqa	%xmm3, %xmm1
	movss	.LC148(%rip), %xmm12
	leaq	(%rdi,%rsi), %r11
	movq	32(%rsp), %rdi
	shufps	$0, %xmm12, %xmm12
	leaq	(%rdi,%rsi), %rbx
	movq	8(%rsp), %rdi
	leaq	(%rdi,%rsi), %r12
	movl	52(%rsp), %edi
	addl	%edx, %edi
	movslq	%edi, %rdi
	movzbl	(%r15,%rdi), %esi
	movd	%esi, %xmm0
	movzbl	(%r9,%rdi), %esi
	punpcklbw	%xmm0, %xmm0
	punpcklwd	%xmm0, %xmm0
	pshufd	$0, %xmm0, %xmm0
	movdqa	%xmm0, %xmm2
	punpckhbw	%xmm7, %xmm0
	punpcklbw	%xmm7, %xmm2
	movdqa	%xmm0, %xmm4
	pcmpgtw	%xmm2, %xmm1
	movdqa	%xmm2, %xmm6
	punpcklwd	%xmm1, %xmm6
	punpckhwd	%xmm1, %xmm2
	movdqa	%xmm3, %xmm1
	pcmpgtw	%xmm0, %xmm1
	cvtdq2ps	%xmm6, %xmm6
	movaps	%xmm6, %xmm11
	cvtdq2ps	%xmm2, %xmm2
	punpcklwd	%xmm1, %xmm4
	punpckhwd	%xmm1, %xmm0
	movd	%esi, %xmm1
	movzbl	(%r10,%rdi), %esi
	punpcklbw	%xmm1, %xmm1
	cvtdq2ps	%xmm0, %xmm14
	movdqa	%xmm3, %xmm0
	cvtdq2ps	%xmm4, %xmm15
	punpcklwd	%xmm1, %xmm1
	movaps	%xmm14, 96(%rsp)
	pshufd	$0, %xmm1, %xmm1
	movaps	%xmm15, 112(%rsp)
	movdqa	%xmm1, %xmm5
	punpckhbw	%xmm7, %xmm1
	punpcklbw	%xmm7, %xmm5
	movdqa	%xmm1, %xmm8
	pcmpgtw	%xmm5, %xmm0
	movdqa	%xmm5, %xmm10
	punpcklwd	%xmm0, %xmm10
	punpckhwd	%xmm0, %xmm5
	movdqa	%xmm3, %xmm0
	pcmpgtw	%xmm1, %xmm0
	cvtdq2ps	%xmm10, %xmm10
	movaps	%xmm10, %xmm13
	cvtdq2ps	%xmm5, %xmm5
	movaps	%xmm5, %xmm15
	punpcklwd	%xmm0, %xmm8
	punpckhwd	%xmm0, %xmm1
	movd	%esi, %xmm0
	movl	%r13d, %esi
	punpcklbw	%xmm0, %xmm0
	cvtdq2ps	%xmm8, %xmm8
	cvtdq2ps	%xmm1, %xmm1
	andl	$-16, %esi
	punpcklwd	%xmm0, %xmm0
	addl	%esi, %eax
	pshufd	$0, %xmm0, %xmm0
	movdqa	%xmm0, %xmm4
	punpckhbw	%xmm7, %xmm0
	punpcklbw	%xmm7, %xmm4
	movdqa	%xmm3, %xmm7
	pcmpgtw	%xmm4, %xmm7
	pcmpgtw	%xmm0, %xmm3
	movdqa	%xmm4, %xmm9
	punpcklwd	%xmm7, %xmm9
	punpckhwd	%xmm7, %xmm4
	movdqa	%xmm0, %xmm7
	punpcklwd	%xmm3, %xmm7
	punpckhwd	%xmm3, %xmm0
	cvtdq2ps	%xmm9, %xmm9
	cvtdq2ps	%xmm4, %xmm4
	movss	.LC144(%rip), %xmm3
	cvtdq2ps	%xmm7, %xmm7
	cvtdq2ps	%xmm0, %xmm0
	shufps	$0, %xmm3, %xmm3
	mulps	%xmm3, %xmm13
	mulps	%xmm3, %xmm15
	movaps	%xmm13, %xmm14
	movss	.LC146(%rip), %xmm13
	shufps	$0, %xmm13, %xmm13
	mulps	%xmm13, %xmm11
	addps	%xmm11, %xmm14
	movaps	%xmm9, %xmm11
	mulps	%xmm12, %xmm11
	addps	%xmm14, %xmm11
	movss	.LC150(%rip), %xmm14
	shufps	$0, %xmm14, %xmm14
	addps	%xmm14, %xmm11
	movups	%xmm11, (%r11)
	movaps	%xmm2, %xmm11
	mulps	%xmm13, %xmm11
	addps	%xmm15, %xmm11
	movaps	%xmm4, %xmm15
	mulps	%xmm12, %xmm15
	addps	%xmm15, %xmm11
	movaps	%xmm8, %xmm15
	mulps	%xmm3, %xmm15
	mulps	%xmm1, %xmm3
	addps	%xmm14, %xmm11
	movups	%xmm11, 16(%r11)
	movaps	112(%rsp), %xmm11
	mulps	%xmm13, %xmm11
	mulps	96(%rsp), %xmm13
	addps	%xmm15, %xmm11
	movaps	%xmm7, %xmm15
	mulps	%xmm12, %xmm15
	addps	%xmm13, %xmm3
	movaps	%xmm6, %xmm13
	mulps	%xmm0, %xmm12
	addps	%xmm15, %xmm11
	movaps	112(%rsp), %xmm15
	addps	%xmm12, %xmm3
	movss	.LC154(%rip), %xmm12
	addps	%xmm14, %xmm11
	shufps	$0, %xmm12, %xmm12
	addps	%xmm14, %xmm3
	movaps	%xmm9, %xmm14
	movups	%xmm11, 32(%r11)
	movaps	%xmm10, %xmm11
	movups	%xmm3, 48(%r11)
	mulps	%xmm12, %xmm11
	leal	(%rsi,%rcx), %r11d
	movss	.LC152(%rip), %xmm3
	shufps	$0, %xmm3, %xmm3
	mulps	%xmm3, %xmm13
	subps	%xmm11, %xmm13
	movss	.LC88(%rip), %xmm11
	shufps	$0, %xmm11, %xmm11
	mulps	%xmm11, %xmm14
	mulps	%xmm11, %xmm6
	addps	%xmm14, %xmm13
	movaps	%xmm5, %xmm14
	mulps	%xmm12, %xmm14
	movups	%xmm13, (%rbx)
	movaps	%xmm2, %xmm13
	mulps	%xmm3, %xmm13
	mulps	%xmm11, %xmm2
	subps	%xmm14, %xmm13
	movaps	%xmm4, %xmm14
	mulps	%xmm11, %xmm14
	addps	%xmm14, %xmm13
	movaps	%xmm8, %xmm14
	mulps	%xmm12, %xmm14
	mulps	%xmm1, %xmm12
	movups	%xmm13, 16(%rbx)
	movaps	%xmm15, %xmm13
	mulps	%xmm3, %xmm13
	subps	%xmm14, %xmm13
	movaps	%xmm7, %xmm14
	mulps	%xmm11, %xmm14
	addps	%xmm14, %xmm13
	movaps	96(%rsp), %xmm14
	mulps	%xmm14, %xmm3
	movups	%xmm13, 32(%rbx)
	subps	%xmm12, %xmm3
	movaps	%xmm0, %xmm12
	mulps	%xmm11, %xmm12
	addps	%xmm12, %xmm3
	movss	.LC157(%rip), %xmm12
	shufps	$0, %xmm12, %xmm12
	mulps	%xmm12, %xmm5
	movups	%xmm3, 48(%rbx)
	movss	.LC159(%rip), %xmm3
	mulps	%xmm12, %xmm10
	mulps	%xmm12, %xmm8
	shufps	$0, %xmm3, %xmm3
	mulps	%xmm3, %xmm4
	mulps	%xmm3, %xmm9
	subps	%xmm5, %xmm2
	mulps	%xmm3, %xmm7
	subps	%xmm10, %xmm6
	mulps	%xmm3, %xmm0
	subps	%xmm4, %xmm2
	movaps	%xmm1, %xmm4
	subps	%xmm9, %xmm6
	mulps	%xmm12, %xmm4
	movups	%xmm2, 16(%r12)
	movaps	%xmm15, %xmm2
	mulps	%xmm11, %xmm2
	movups	%xmm6, (%r12)
	subps	%xmm8, %xmm2
	subps	%xmm7, %xmm2
	movups	%xmm2, 32(%r12)
	movaps	%xmm14, %xmm2
	mulps	%xmm11, %xmm2
	movaps	%xmm2, %xmm1
	subps	%xmm4, %xmm1
	subps	%xmm0, %xmm1
	movups	%xmm1, 48(%r12)
	testb	$15, %r13b
	je	.L3770
.L3763:
	movl	%r13d, %ebx
	subl	%esi, %ebx
	leal	-1(%rbx), %edi
	movl	%ebx, 96(%rsp)
	cmpl	$6, %edi
	jbe	.L3765
	movslq	%ecx, %rcx
	movq	16(%rsp), %rbx
	pxor	%xmm9, %xmm9
	pxor	%xmm2, %xmm2
	movq	.LC161(%rip), %xmm15
	addq	%rsi, %rcx
	movq	.LC162(%rip), %xmm14
	salq	$2, %rcx
	leaq	(%rbx,%rcx), %rdi
	movq	32(%rsp), %rbx
	leaq	(%rbx,%rcx), %rsi
	movq	8(%rsp), %rbx
	addq	%rbx, %rcx
	movl	52(%rsp), %ebx
	leal	(%rbx,%rdx), %r12d
	movslq	%r12d, %r12
	movzbl	(%r15,%r12), %r13d
	movzbl	(%r9,%r12), %r14d
	movzbl	(%r10,%r12), %r12d
	movl	%r13d, %ebx
	movb	%bl, %bh
	movl	%ebx, %r13d
	movl	%r14d, %ebx
	movb	%bl, %bh
	movd	%r13d, %xmm6
	movl	%ebx, %r14d
	movl	%r12d, %ebx
	pshuflw	$0, %xmm6, %xmm3
	movb	%bl, %bh
	movd	%r14d, %xmm7
	movdqa	%xmm3, %xmm4
	movl	%ebx, %r12d
	pshuflw	$0, %xmm7, %xmm1
	punpcklbw	%xmm9, %xmm3
	movd	%r12d, %xmm7
	movdqa	%xmm1, %xmm8
	punpcklbw	%xmm9, %xmm1
	pshuflw	$0, %xmm7, %xmm0
	punpcklbw	%xmm9, %xmm4
	punpcklbw	%xmm9, %xmm8
	movdqa	%xmm0, %xmm7
	punpcklbw	%xmm9, %xmm0
	pshufd	$78, %xmm3, %xmm3
	pshufd	$78, %xmm0, %xmm0
	punpcklbw	%xmm9, %xmm7
	pshufd	$78, %xmm1, %xmm1
	movdqa	%xmm0, %xmm9
	punpcklwd	%xmm2, %xmm0
	movdqa	%xmm4, %xmm6
	movdqa	%xmm3, %xmm5
	movdqa	%xmm8, %xmm12
	movdqa	%xmm1, %xmm10
	movdqa	%xmm7, %xmm11
	pshufd	$78, %xmm0, %xmm0
	punpcklwd	%xmm2, %xmm6
	punpcklwd	%xmm2, %xmm4
	punpcklwd	%xmm2, %xmm5
	punpcklwd	%xmm2, %xmm3
	cvtdq2ps	%xmm6, %xmm6
	punpcklwd	%xmm2, %xmm12
	punpcklwd	%xmm2, %xmm1
	punpcklwd	%xmm2, %xmm8
	cvtdq2ps	%xmm5, %xmm5
	punpcklwd	%xmm2, %xmm10
	punpcklwd	%xmm2, %xmm11
	punpcklwd	%xmm2, %xmm7
	cvtdq2ps	%xmm12, %xmm12
	punpcklwd	%xmm2, %xmm9
	cvtdq2ps	%xmm0, %xmm2
	movaps	%xmm12, %xmm13
	movq	%xmm2, %r12
	movaps	%xmm6, %xmm0
	cvtdq2ps	%xmm11, %xmm11
	pshufd	$78, %xmm4, %xmm4
	movq	.LC160(%rip), %xmm2
	mulps	%xmm15, %xmm0
	pshufd	$78, %xmm8, %xmm8
	cvtdq2ps	%xmm4, %xmm4
	cvtdq2ps	%xmm9, %xmm9
	mulps	%xmm2, %xmm13
	cvtdq2ps	%xmm8, %xmm8
	movq	%xmm9, %rbx
	pshufd	$78, %xmm7, %xmm7
	cvtdq2ps	%xmm7, %xmm7
	cvtdq2ps	%xmm10, %xmm10
	pshufd	$78, %xmm3, %xmm3
	pshufd	$78, %xmm1, %xmm1
	cvtdq2ps	%xmm3, %xmm3
	cvtdq2ps	%xmm1, %xmm1
	addps	%xmm13, %xmm0
	movaps	%xmm11, %xmm13
	mulps	%xmm14, %xmm13
	addps	%xmm0, %xmm13
	movq	.LC163(%rip), %xmm0
	addps	%xmm0, %xmm13
	movlps	%xmm13, (%rdi)
	movaps	%xmm8, %xmm13
	mulps	%xmm2, %xmm13
	movq	%xmm13, %r13
	movaps	%xmm4, %xmm13
	mulps	%xmm15, %xmm13
	movq	%r13, %xmm9
	addps	%xmm9, %xmm13
	movaps	%xmm7, %xmm9
	mulps	%xmm14, %xmm9
	addps	%xmm9, %xmm13
	movaps	%xmm10, %xmm9
	mulps	%xmm2, %xmm9
	mulps	%xmm1, %xmm2
	addps	%xmm0, %xmm13
	movlps	%xmm13, 8(%rdi)
	movaps	%xmm5, %xmm13
	mulps	%xmm15, %xmm13
	mulps	%xmm3, %xmm15
	addps	%xmm9, %xmm13
	movq	%rbx, %xmm9
	mulps	%xmm14, %xmm9
	addps	%xmm15, %xmm2
	movaps	%xmm6, %xmm15
	addps	%xmm9, %xmm13
	movq	%r12, %xmm9
	mulps	%xmm9, %xmm14
	movq	%rbx, %xmm9
	addps	%xmm0, %xmm13
	addps	%xmm14, %xmm2
	movlps	%xmm13, 16(%rdi)
	movaps	%xmm12, %xmm13
	movq	.LC165(%rip), %xmm14
	mulps	%xmm14, %xmm13
	addps	%xmm0, %xmm2
	movaps	%xmm11, %xmm0
	movlps	%xmm2, 24(%rdi)
	movq	.LC164(%rip), %xmm2
	mulps	%xmm2, %xmm15
	subps	%xmm13, %xmm15
	movq	.LC166(%rip), %xmm13
	mulps	%xmm13, %xmm0
	mulps	%xmm13, %xmm9
	mulps	%xmm13, %xmm6
	addps	%xmm0, %xmm15
	movaps	%xmm8, %xmm0
	mulps	%xmm14, %xmm0
	movlps	%xmm15, (%rsi)
	movaps	%xmm4, %xmm15
	mulps	%xmm2, %xmm15
	mulps	%xmm13, %xmm4
	subps	%xmm0, %xmm15
	movaps	%xmm7, %xmm0
	mulps	%xmm13, %xmm0
	addps	%xmm0, %xmm15
	movaps	%xmm10, %xmm0
	mulps	%xmm14, %xmm0
	mulps	%xmm1, %xmm14
	movlps	%xmm15, 8(%rsi)
	movaps	%xmm5, %xmm15
	mulps	%xmm2, %xmm15
	mulps	%xmm3, %xmm2
	mulps	%xmm13, %xmm5
	mulps	%xmm13, %xmm3
	subps	%xmm0, %xmm15
	movq	%r12, %xmm0
	subps	%xmm14, %xmm2
	movq	%r12, %xmm14
	mulps	%xmm13, %xmm14
	addps	%xmm9, %xmm15
	movq	%rbx, %xmm9
	movlps	%xmm15, 16(%rsi)
	addps	%xmm14, %xmm2
	movq	.LC167(%rip), %xmm14
	mulps	%xmm14, %xmm12
	mulps	%xmm14, %xmm8
	movlps	%xmm2, 24(%rsi)
	movl	96(%rsp), %esi
	movq	.LC168(%rip), %xmm2
	mulps	%xmm14, %xmm10
	mulps	%xmm14, %xmm1
	movl	%esi, %ebx
	mulps	%xmm2, %xmm11
	andl	$-8, %ebx
	mulps	%xmm2, %xmm7
	subps	%xmm12, %xmm6
	addl	%ebx, %eax
	addl	%ebx, %r11d
	mulps	%xmm2, %xmm9
	subps	%xmm8, %xmm4
	andl	$7, %esi
	mulps	%xmm2, %xmm0
	subps	%xmm10, %xmm5
	subps	%xmm1, %xmm3
	subps	%xmm11, %xmm6
	subps	%xmm7, %xmm4
	subps	%xmm9, %xmm5
	subps	%xmm0, %xmm3
	movlps	%xmm6, (%rcx)
	movlps	%xmm4, 8(%rcx)
	movlps	%xmm5, 16(%rcx)
	movlps	%xmm3, 24(%rcx)
	je	.L3770
.L3765:
	movslq	48(%rsp), %rcx
	movslq	%edx, %rsi
	pxor	%xmm0, %xmm0
	pxor	%xmm4, %xmm4
	movss	.LC146(%rip), %xmm1
	movss	.LC144(%rip), %xmm2
	pxor	%xmm3, %xmm3
	leaq	(%rcx,%rsi), %rdx
	movss	.LC154(%rip), %xmm5
	movzbl	-1(%r15,%rdx), %ecx
	cvtsi2ssl	%ecx, %xmm0
	movzbl	-1(%rdx,%r9), %ecx
	movzbl	-1(%rdx,%r10), %edx
	cvtsi2ssl	%ecx, %xmm4
	cvtsi2ssl	%edx, %xmm3
	movslq	%r11d, %rdx
	mulss	%xmm0, %xmm1
	mulss	%xmm4, %xmm2
	mulss	%xmm4, %xmm5
	movaps	%xmm3, %xmm6
	mulss	.LC157(%rip), %xmm4
	addss	%xmm2, %xmm1
	movss	.LC148(%rip), %xmm2
	mulss	%xmm3, %xmm2
	mulss	.LC159(%rip), %xmm3
	addss	%xmm2, %xmm1
	movss	.LC152(%rip), %xmm2
	subss	.LC169(%rip), %xmm1
	mulss	%xmm0, %xmm2
	movss	%xmm1, 1440(%rsp,%rdx,4)
	subss	%xmm5, %xmm2
	movss	.LC88(%rip), %xmm5
	mulss	%xmm5, %xmm0
	mulss	%xmm5, %xmm6
	subss	%xmm4, %xmm0
	addss	%xmm6, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 2464(%rsp,%rdx,4)
	movss	%xmm0, 3488(%rsp,%rdx,4)
	cmpl	%r8d, %eax
	jge	.L3770
	movl	172(%rsp), %ebx
	leal	1(%r11), %edx
	movslq	%edx, %rdx
	movss	%xmm1, 1440(%rsp,%rdx,4)
	leal	15(%rbx), %ecx
	movss	%xmm2, 2464(%rsp,%rdx,4)
	movss	%xmm0, 3488(%rsp,%rdx,4)
	leal	2(%rax), %edx
	cmpl	%ecx, %edx
	jg	.L3770
	leal	2(%r11), %edx
	movslq	%edx, %rdx
	movss	%xmm1, 1440(%rsp,%rdx,4)
	movss	%xmm2, 2464(%rsp,%rdx,4)
	movss	%xmm0, 3488(%rsp,%rdx,4)
	leal	3(%rax), %edx
	cmpl	%ecx, %edx
	jg	.L3770
	leal	3(%r11), %edx
	movslq	%edx, %rdx
	movss	%xmm1, 1440(%rsp,%rdx,4)
	movss	%xmm2, 2464(%rsp,%rdx,4)
	movss	%xmm0, 3488(%rsp,%rdx,4)
	leal	4(%rax), %edx
	cmpl	%r8d, %edx
	jg	.L3770
	leal	4(%r11), %edx
	movslq	%edx, %rdx
	movss	%xmm1, 1440(%rsp,%rdx,4)
	movss	%xmm2, 2464(%rsp,%rdx,4)
	movss	%xmm0, 3488(%rsp,%rdx,4)
	leal	5(%rax), %edx
	cmpl	%edx, %r8d
	jl	.L3770
	leal	5(%r11), %edx
	addl	$6, %eax
	movslq	%edx, %rdx
	movss	%xmm1, 1440(%rsp,%rdx,4)
	movss	%xmm2, 2464(%rsp,%rdx,4)
	movss	%xmm0, 3488(%rsp,%rdx,4)
	cmpl	%r8d, %eax
	jg	.L3770
	leal	6(%r11), %eax
	cltq
	movss	%xmm1, 1440(%rsp,%rax,4)
	movss	%xmm2, 2464(%rsp,%rax,4)
	movss	%xmm0, 3488(%rsp,%rax,4)
	.p2align 4,,10
	.p2align 3
.L3770:
	addq	$16, %rbp
	addl	$1, 40(%rsp)
	addq	$64, 88(%rsp)
	addq	$64, 64(%rsp)
	addq	$64, 80(%rsp)
	cmpq	$256, %rbp
	je	.L3858
.L3774:
	movl	140(%rsp), %eax
	movl	40(%rsp), %ebx
	movl	%ebp, %ecx
	cmpl	%ebx, 136(%rsp)
	movl	128(%rsp), %r11d
	movl	%eax, %edx
	movl	152(%rsp), %edi
	cmovg	%ebx, %edx
	subl	%edx, %eax
	testl	%r11d, %r11d
	cmovne	%eax, %edx
	movl	48(%rsp), %eax
	imull	%eax, %edx
	cmpl	%edi, %eax
	jle	.L3859
	cmpb	$0, 192(%rsp)
	jne	.L3819
	movq	56(%rsp), %rbx
	movslq	%edx, %rax
	pxor	%xmm7, %xmm7
	pxor	%xmm2, %xmm2
	movdqa	%xmm2, %xmm3
	movdqa	%xmm2, %xmm4
	movss	.LC148(%rip), %xmm12
	addq	%rbx, %rax
	movdqu	(%r15,%rax), %xmm1
	movdqu	(%r10,%rax), %xmm11
	shufps	$0, %xmm12, %xmm12
	movdqa	%xmm1, %xmm0
	punpckhbw	%xmm7, %xmm1
	punpcklbw	%xmm7, %xmm0
	pcmpgtw	%xmm1, %xmm4
	pcmpgtw	%xmm0, %xmm3
	movdqa	%xmm0, %xmm6
	punpcklwd	%xmm3, %xmm6
	punpckhwd	%xmm3, %xmm0
	movdqa	%xmm1, %xmm3
	punpckhwd	%xmm4, %xmm1
	punpcklwd	%xmm4, %xmm3
	movdqa	%xmm2, %xmm4
	cvtdq2ps	%xmm6, %xmm6
	cvtdq2ps	%xmm1, %xmm14
	movdqu	(%r9,%rax), %xmm1
	movaps	%xmm6, %xmm13
	cvtdq2ps	%xmm0, %xmm0
	movaps	%xmm14, 96(%rsp)
	movq	88(%rsp), %rax
	cvtdq2ps	%xmm3, %xmm3
	movdqa	%xmm1, %xmm5
	punpckhbw	%xmm7, %xmm1
	punpcklbw	%xmm7, %xmm5
	movdqa	%xmm1, %xmm8
	pcmpgtw	%xmm5, %xmm4
	movdqa	%xmm5, %xmm10
	punpcklwd	%xmm4, %xmm10
	punpckhwd	%xmm4, %xmm5
	movdqa	%xmm2, %xmm4
	pcmpgtw	%xmm1, %xmm4
	cvtdq2ps	%xmm10, %xmm10
	cvtdq2ps	%xmm5, %xmm5
	punpcklwd	%xmm4, %xmm8
	punpckhwd	%xmm4, %xmm1
	movdqa	%xmm11, %xmm4
	punpcklbw	%xmm7, %xmm4
	punpckhbw	%xmm7, %xmm11
	movdqa	%xmm2, %xmm7
	cvtdq2ps	%xmm8, %xmm8
	pcmpgtw	%xmm4, %xmm7
	pcmpgtw	%xmm11, %xmm2
	movdqa	%xmm4, %xmm9
	cvtdq2ps	%xmm1, %xmm1
	punpcklwd	%xmm7, %xmm9
	punpckhwd	%xmm7, %xmm4
	movdqa	%xmm11, %xmm7
	punpcklwd	%xmm2, %xmm7
	punpckhwd	%xmm2, %xmm11
	cvtdq2ps	%xmm9, %xmm9
	cvtdq2ps	%xmm4, %xmm4
	movss	.LC146(%rip), %xmm2
	cvtdq2ps	%xmm11, %xmm15
	movaps	%xmm10, %xmm11
	movaps	%xmm15, 112(%rsp)
	cvtdq2ps	%xmm7, %xmm7
	shufps	$0, %xmm2, %xmm2
	mulps	%xmm2, %xmm13
	movaps	%xmm13, %xmm14
	movss	.LC144(%rip), %xmm13
	shufps	$0, %xmm13, %xmm13
	mulps	%xmm13, %xmm11
	addps	%xmm11, %xmm14
	movaps	%xmm9, %xmm11
	mulps	%xmm12, %xmm11
	addps	%xmm14, %xmm11
	movss	.LC150(%rip), %xmm14
	shufps	$0, %xmm14, %xmm14
	addps	%xmm14, %xmm11
	movaps	%xmm11, (%rax)
	movaps	%xmm0, %xmm11
	mulps	%xmm2, %xmm11
	movaps	%xmm11, %xmm15
	movaps	%xmm5, %xmm11
	mulps	%xmm13, %xmm11
	addps	%xmm15, %xmm11
	movaps	%xmm4, %xmm15
	mulps	%xmm12, %xmm15
	addps	%xmm15, %xmm11
	addps	%xmm14, %xmm11
	movaps	%xmm11, 16(%rax)
	movaps	%xmm3, %xmm11
	mulps	%xmm2, %xmm11
	mulps	96(%rsp), %xmm2
	movaps	%xmm11, %xmm15
	movaps	%xmm8, %xmm11
	mulps	%xmm13, %xmm11
	mulps	%xmm1, %xmm13
	addps	%xmm15, %xmm11
	movaps	%xmm7, %xmm15
	mulps	%xmm12, %xmm15
	addps	%xmm13, %xmm2
	movaps	%xmm6, %xmm13
	addps	%xmm15, %xmm11
	movaps	112(%rsp), %xmm15
	mulps	%xmm15, %xmm12
	addps	%xmm14, %xmm11
	movaps	%xmm11, 32(%rax)
	movaps	%xmm10, %xmm11
	addps	%xmm12, %xmm2
	movss	.LC154(%rip), %xmm12
	shufps	$0, %xmm12, %xmm12
	mulps	%xmm12, %xmm11
	addps	%xmm14, %xmm2
	movaps	%xmm9, %xmm14
	movaps	%xmm2, 48(%rax)
	movss	.LC152(%rip), %xmm2
	movq	64(%rsp), %rax
	shufps	$0, %xmm2, %xmm2
	mulps	%xmm2, %xmm13
	subps	%xmm11, %xmm13
	movss	.LC88(%rip), %xmm11
	shufps	$0, %xmm11, %xmm11
	mulps	%xmm11, %xmm14
	mulps	%xmm11, %xmm6
	addps	%xmm14, %xmm13
	movaps	%xmm5, %xmm14
	mulps	%xmm12, %xmm14
	movaps	%xmm13, (%rax)
	movaps	%xmm0, %xmm13
	mulps	%xmm2, %xmm13
	mulps	%xmm11, %xmm0
	subps	%xmm14, %xmm13
	movaps	%xmm4, %xmm14
	mulps	%xmm11, %xmm14
	addps	%xmm14, %xmm13
	movaps	%xmm8, %xmm14
	mulps	%xmm12, %xmm14
	mulps	%xmm1, %xmm12
	movaps	%xmm13, 16(%rax)
	movaps	%xmm3, %xmm13
	mulps	%xmm2, %xmm13
	mulps	%xmm11, %xmm3
	subps	%xmm14, %xmm13
	movaps	%xmm7, %xmm14
	mulps	%xmm11, %xmm14
	addps	%xmm14, %xmm13
	movaps	96(%rsp), %xmm14
	mulps	%xmm14, %xmm2
	movaps	%xmm13, 32(%rax)
	subps	%xmm12, %xmm2
	movaps	%xmm15, %xmm12
	mulps	%xmm11, %xmm12
	addps	%xmm12, %xmm2
	movss	.LC157(%rip), %xmm12
	shufps	$0, %xmm12, %xmm12
	mulps	%xmm12, %xmm5
	movaps	%xmm2, 48(%rax)
	movss	.LC159(%rip), %xmm2
	movq	80(%rsp), %rax
	mulps	%xmm12, %xmm10
	mulps	%xmm12, %xmm8
	shufps	$0, %xmm2, %xmm2
	mulps	%xmm2, %xmm4
	mulps	%xmm12, %xmm1
	subps	%xmm5, %xmm0
	mulps	%xmm2, %xmm9
	mulps	%xmm2, %xmm7
	subps	%xmm10, %xmm6
	mulps	%xmm2, %xmm15
	subps	%xmm8, %xmm3
	subps	%xmm4, %xmm0
	subps	%xmm9, %xmm6
	movaps	%xmm0, 16(%rax)
	movaps	%xmm14, %xmm0
	subps	%xmm7, %xmm3
	mulps	%xmm11, %xmm0
	movaps	%xmm6, (%rax)
	movaps	%xmm3, 32(%rax)
	subps	%xmm1, %xmm0
	subps	%xmm15, %xmm0
	movaps	%xmm0, 48(%rax)
	movl	196(%rsp), %edi
	movl	200(%rsp), %eax
	leal	0(%rbp,%rdi), %r14d
	testb	$15, 160(%rsp)
	je	.L3860
.L3767:
	movl	160(%rsp), %r12d
	subl	%edi, %r12d
	leal	-1(%r12), %ecx
	cmpl	$6, %ecx
	jbe	.L3821
	movq	56(%rsp), %rbx
	movslq	%edx, %rsi
	movq	8(%rsp), %r13
	leaq	0(%rbp,%rdi), %rcx
	movq	32(%rsp), %r11
	salq	$2, %rcx
	pxor	%xmm8, %xmm8
	pxor	%xmm12, %xmm12
	movq	.LC160(%rip), %xmm14
	addq	%rbx, %rsi
	movq	16(%rsp), %rbx
	addq	%rcx, %r11
	addq	%rcx, %rbx
	addq	%r13, %rcx
	leaq	(%r15,%rsi), %r13
	movq	0(%r13,%rdi), %xmm0
	leaq	(%r9,%rsi), %r13
	addq	%r10, %rsi
	movq	(%rsi,%rdi), %xmm2
	movq	0(%r13,%rdi), %xmm3
	movdqa	%xmm0, %xmm1
	punpcklbw	%xmm8, %xmm0
	movdqa	%xmm3, %xmm7
	movdqa	%xmm2, %xmm6
	punpcklbw	%xmm8, %xmm3
	punpcklbw	%xmm8, %xmm2
	punpcklbw	%xmm8, %xmm1
	punpcklbw	%xmm8, %xmm7
	punpcklbw	%xmm8, %xmm6
	pshufd	$78, %xmm0, %xmm0
	pshufd	$78, %xmm3, %xmm3
	pshufd	$78, %xmm2, %xmm2
	movdqa	%xmm1, %xmm5
	movdqa	%xmm0, %xmm4
	movdqa	%xmm7, %xmm11
	movdqa	%xmm3, %xmm9
	movdqa	%xmm6, %xmm10
	movdqa	%xmm2, %xmm8
	punpcklwd	%xmm12, %xmm5
	punpcklwd	%xmm12, %xmm1
	punpcklwd	%xmm12, %xmm4
	punpcklwd	%xmm12, %xmm0
	punpcklwd	%xmm12, %xmm11
	cvtdq2ps	%xmm5, %xmm5
	punpcklwd	%xmm12, %xmm7
	punpcklwd	%xmm12, %xmm9
	punpcklwd	%xmm12, %xmm3
	cvtdq2ps	%xmm11, %xmm11
	punpcklwd	%xmm12, %xmm10
	punpcklwd	%xmm12, %xmm6
	punpcklwd	%xmm12, %xmm8
	cvtdq2ps	%xmm9, %xmm9
	punpcklwd	%xmm12, %xmm2
	movaps	%xmm11, %xmm13
	cvtdq2ps	%xmm10, %xmm10
	movq	.LC161(%rip), %xmm12
	mulps	%xmm14, %xmm13
	movaps	%xmm10, %xmm15
	pshufd	$78, %xmm1, %xmm1
	cvtdq2ps	%xmm8, %xmm8
	mulps	%xmm5, %xmm12
	cvtdq2ps	%xmm1, %xmm1
	pshufd	$78, %xmm7, %xmm7
	movq	%xmm8, %rdi
	cvtdq2ps	%xmm7, %xmm7
	pshufd	$78, %xmm6, %xmm6
	cvtdq2ps	%xmm4, %xmm4
	pshufd	$78, %xmm0, %xmm0
	cvtdq2ps	%xmm6, %xmm6
	pshufd	$78, %xmm3, %xmm3
	cvtdq2ps	%xmm0, %xmm0
	pshufd	$78, %xmm2, %xmm2
	cvtdq2ps	%xmm3, %xmm3
	cvtdq2ps	%xmm2, %xmm2
	addps	%xmm13, %xmm12
	movq	.LC162(%rip), %xmm13
	mulps	%xmm13, %xmm15
	addps	%xmm15, %xmm12
	movq	.LC163(%rip), %xmm15
	addps	%xmm15, %xmm12
	movlps	%xmm12, (%rbx)
	movq	.LC161(%rip), %xmm12
	mulps	%xmm1, %xmm12
	movq	%xmm12, %rsi
	movaps	%xmm7, %xmm12
	mulps	%xmm14, %xmm12
	movq	%rsi, %xmm8
	addps	%xmm8, %xmm12
	movaps	%xmm6, %xmm8
	mulps	%xmm13, %xmm8
	addps	%xmm8, %xmm12
	movq	.LC161(%rip), %xmm8
	mulps	%xmm4, %xmm8
	addps	%xmm15, %xmm12
	movlps	%xmm12, 8(%rbx)
	movaps	%xmm9, %xmm12
	mulps	%xmm14, %xmm12
	mulps	%xmm3, %xmm14
	addps	%xmm8, %xmm12
	movq	%rdi, %xmm8
	mulps	%xmm13, %xmm8
	mulps	%xmm2, %xmm13
	addps	%xmm8, %xmm12
	movaps	%xmm10, %xmm8
	addps	%xmm15, %xmm12
	movlps	%xmm12, 16(%rbx)
	movq	.LC161(%rip), %xmm12
	mulps	%xmm0, %xmm12
	addps	%xmm12, %xmm14
	movq	.LC164(%rip), %xmm12
	addps	%xmm14, %xmm13
	movq	.LC165(%rip), %xmm14
	addps	%xmm15, %xmm13
	movaps	%xmm5, %xmm15
	mulps	%xmm12, %xmm15
	movlps	%xmm13, 24(%rbx)
	movaps	%xmm11, %xmm13
	mulps	%xmm14, %xmm13
	subps	%xmm13, %xmm15
	movq	.LC166(%rip), %xmm13
	mulps	%xmm13, %xmm8
	mulps	%xmm13, %xmm5
	addps	%xmm8, %xmm15
	movaps	%xmm7, %xmm8
	mulps	%xmm14, %xmm8
	movlps	%xmm15, (%r11)
	movaps	%xmm1, %xmm15
	mulps	%xmm12, %xmm15
	mulps	%xmm13, %xmm1
	subps	%xmm8, %xmm15
	movaps	%xmm6, %xmm8
	mulps	%xmm13, %xmm8
	addps	%xmm8, %xmm15
	movaps	%xmm9, %xmm8
	mulps	%xmm14, %xmm8
	mulps	%xmm3, %xmm14
	movlps	%xmm15, 8(%r11)
	movaps	%xmm4, %xmm15
	mulps	%xmm12, %xmm15
	mulps	%xmm0, %xmm12
	mulps	%xmm13, %xmm4
	mulps	%xmm13, %xmm0
	subps	%xmm8, %xmm15
	movq	%rdi, %xmm8
	subps	%xmm14, %xmm12
	mulps	%xmm13, %xmm8
	movaps	%xmm2, %xmm14
	mulps	%xmm13, %xmm14
	addps	%xmm8, %xmm15
	movq	%rdi, %xmm8
	addps	%xmm14, %xmm12
	movlps	%xmm15, 16(%r11)
	movlps	%xmm12, 24(%r11)
	movq	.LC167(%rip), %xmm12
	mulps	%xmm12, %xmm11
	mulps	%xmm12, %xmm7
	mulps	%xmm12, %xmm9
	mulps	%xmm12, %xmm3
	subps	%xmm11, %xmm5
	movq	.LC168(%rip), %xmm11
	subps	%xmm7, %xmm1
	mulps	%xmm11, %xmm10
	subps	%xmm9, %xmm4
	mulps	%xmm11, %xmm6
	subps	%xmm3, %xmm0
	mulps	%xmm11, %xmm8
	mulps	%xmm11, %xmm2
	subps	%xmm10, %xmm5
	subps	%xmm6, %xmm1
	subps	%xmm8, %xmm4
	subps	%xmm2, %xmm0
	movlps	%xmm5, (%rcx)
	movlps	%xmm1, 8(%rcx)
	movlps	%xmm4, 16(%rcx)
	movlps	%xmm0, 24(%rcx)
	movl	%r12d, %ecx
	andl	$-8, %ecx
	andl	$7, %r12d
	leal	(%rax,%rcx), %esi
	leal	(%r14,%rcx), %edi
	je	.L3861
.L3771:
	leal	(%rdx,%rsi), %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm3, %xmm3
	movss	.LC146(%rip), %xmm1
	cltq
	movss	.LC144(%rip), %xmm4
	pxor	%xmm2, %xmm2
	movl	208(%rsp), %ebx
	movzbl	(%r15,%rax), %ecx
	cvtsi2ssl	%ecx, %xmm0
	movzbl	(%r9,%rax), %ecx
	movzbl	(%r10,%rax), %eax
	cvtsi2ssl	%ecx, %xmm3
	leal	1(%rdi), %ecx
	cvtsi2ssl	%eax, %xmm2
	movslq	%edi, %rax
	mulss	%xmm0, %xmm1
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm1
	movss	.LC148(%rip), %xmm4
	mulss	%xmm2, %xmm4
	addss	%xmm4, %xmm1
	subss	.LC169(%rip), %xmm1
	movss	.LC154(%rip), %xmm4
	mulss	%xmm3, %xmm4
	movss	%xmm1, 1440(%rsp,%rax,4)
	movss	.LC152(%rip), %xmm1
	mulss	.LC157(%rip), %xmm3
	mulss	%xmm0, %xmm1
	mulss	.LC88(%rip), %xmm0
	subss	%xmm4, %xmm1
	movss	.LC88(%rip), %xmm4
	subss	%xmm3, %xmm0
	mulss	%xmm2, %xmm4
	mulss	.LC159(%rip), %xmm2
	addss	%xmm4, %xmm1
	subss	%xmm2, %xmm0
	movss	%xmm1, 2464(%rsp,%rax,4)
	movss	%xmm0, 3488(%rsp,%rax,4)
	leal	1(%rsi), %eax
	cmpl	%ebx, %eax
	jl	.L3862
	.p2align 4,,10
	.p2align 3
.L3768:
	cmpl	%eax, %r8d
	jge	.L3769
	jmp	.L3770
.L3862:
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm3, %xmm3
	movslq	%ecx, %rcx
	cltq
	movss	.LC146(%rip), %xmm1
	movss	.LC144(%rip), %xmm4
	pxor	%xmm2, %xmm2
	movzbl	(%r15,%rax), %r11d
	cvtsi2ssl	%r11d, %xmm0
	movzbl	(%r9,%rax), %r11d
	movzbl	(%r10,%rax), %eax
	cvtsi2ssl	%r11d, %xmm3
	cvtsi2ssl	%eax, %xmm2
	leal	2(%rsi), %eax
	mulss	%xmm0, %xmm1
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm1
	movss	.LC148(%rip), %xmm4
	mulss	%xmm2, %xmm4
	addss	%xmm4, %xmm1
	subss	.LC169(%rip), %xmm1
	movss	.LC154(%rip), %xmm4
	mulss	%xmm3, %xmm4
	movss	%xmm1, 1440(%rsp,%rcx,4)
	movss	.LC152(%rip), %xmm1
	mulss	.LC157(%rip), %xmm3
	mulss	%xmm0, %xmm1
	mulss	.LC88(%rip), %xmm0
	subss	%xmm4, %xmm1
	movss	.LC88(%rip), %xmm4
	subss	%xmm3, %xmm0
	mulss	%xmm2, %xmm4
	mulss	.LC159(%rip), %xmm2
	addss	%xmm4, %xmm1
	subss	%xmm2, %xmm0
	movss	%xmm1, 2464(%rsp,%rcx,4)
	movss	%xmm0, 3488(%rsp,%rcx,4)
	leal	2(%rdi), %ecx
	cmpl	%ebx, %eax
	jge	.L3768
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm3, %xmm3
	movslq	%ecx, %rcx
	cltq
	movss	.LC146(%rip), %xmm1
	movss	.LC144(%rip), %xmm4
	pxor	%xmm2, %xmm2
	movzbl	(%r15,%rax), %r11d
	cvtsi2ssl	%r11d, %xmm0
	movzbl	(%r9,%rax), %r11d
	movzbl	(%r10,%rax), %eax
	cvtsi2ssl	%r11d, %xmm3
	cvtsi2ssl	%eax, %xmm2
	leal	3(%rsi), %eax
	mulss	%xmm0, %xmm1
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm1
	movss	.LC148(%rip), %xmm4
	mulss	%xmm2, %xmm4
	addss	%xmm4, %xmm1
	subss	.LC169(%rip), %xmm1
	movss	.LC154(%rip), %xmm4
	mulss	%xmm3, %xmm4
	movss	%xmm1, 1440(%rsp,%rcx,4)
	movss	.LC152(%rip), %xmm1
	mulss	.LC157(%rip), %xmm3
	mulss	%xmm0, %xmm1
	mulss	.LC88(%rip), %xmm0
	subss	%xmm4, %xmm1
	movss	.LC88(%rip), %xmm4
	subss	%xmm3, %xmm0
	mulss	%xmm2, %xmm4
	mulss	.LC159(%rip), %xmm2
	addss	%xmm4, %xmm1
	subss	%xmm2, %xmm0
	movss	%xmm1, 2464(%rsp,%rcx,4)
	movss	%xmm0, 3488(%rsp,%rcx,4)
	leal	3(%rdi), %ecx
	cmpl	%eax, %ebx
	jle	.L3768
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm3, %xmm3
	movslq	%ecx, %rcx
	cltq
	movss	.LC146(%rip), %xmm1
	movss	.LC144(%rip), %xmm4
	pxor	%xmm2, %xmm2
	movzbl	(%r15,%rax), %r11d
	cvtsi2ssl	%r11d, %xmm0
	movzbl	(%r9,%rax), %r11d
	movzbl	(%r10,%rax), %eax
	cvtsi2ssl	%r11d, %xmm3
	cvtsi2ssl	%eax, %xmm2
	leal	4(%rsi), %eax
	mulss	%xmm0, %xmm1
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm1
	movss	.LC148(%rip), %xmm4
	mulss	%xmm2, %xmm4
	addss	%xmm4, %xmm1
	subss	.LC169(%rip), %xmm1
	movss	.LC154(%rip), %xmm4
	mulss	%xmm3, %xmm4
	movss	%xmm1, 1440(%rsp,%rcx,4)
	movss	.LC152(%rip), %xmm1
	mulss	.LC157(%rip), %xmm3
	mulss	%xmm0, %xmm1
	mulss	.LC88(%rip), %xmm0
	subss	%xmm4, %xmm1
	movss	.LC88(%rip), %xmm4
	subss	%xmm3, %xmm0
	mulss	%xmm2, %xmm4
	mulss	.LC159(%rip), %xmm2
	addss	%xmm4, %xmm1
	subss	%xmm2, %xmm0
	movss	%xmm1, 2464(%rsp,%rcx,4)
	movss	%xmm0, 3488(%rsp,%rcx,4)
	leal	4(%rdi), %ecx
	cmpl	%eax, %ebx
	jle	.L3768
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm3, %xmm3
	movslq	%ecx, %rcx
	cltq
	movss	.LC146(%rip), %xmm1
	movss	.LC144(%rip), %xmm4
	pxor	%xmm2, %xmm2
	movzbl	(%r15,%rax), %r11d
	cvtsi2ssl	%r11d, %xmm0
	movzbl	(%r9,%rax), %r11d
	movzbl	(%r10,%rax), %eax
	cvtsi2ssl	%r11d, %xmm3
	cvtsi2ssl	%eax, %xmm2
	leal	5(%rsi), %eax
	mulss	%xmm0, %xmm1
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm1
	movss	.LC148(%rip), %xmm4
	mulss	%xmm2, %xmm4
	addss	%xmm4, %xmm1
	subss	.LC169(%rip), %xmm1
	movss	.LC154(%rip), %xmm4
	mulss	%xmm3, %xmm4
	movss	%xmm1, 1440(%rsp,%rcx,4)
	movss	.LC152(%rip), %xmm1
	mulss	.LC157(%rip), %xmm3
	mulss	%xmm0, %xmm1
	mulss	.LC88(%rip), %xmm0
	subss	%xmm4, %xmm1
	movss	.LC88(%rip), %xmm4
	subss	%xmm3, %xmm0
	mulss	%xmm2, %xmm4
	mulss	.LC159(%rip), %xmm2
	addss	%xmm4, %xmm1
	subss	%xmm2, %xmm0
	movss	%xmm1, 2464(%rsp,%rcx,4)
	movss	%xmm0, 3488(%rsp,%rcx,4)
	leal	5(%rdi), %ecx
	cmpl	%eax, %ebx
	jle	.L3768
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm3, %xmm3
	movslq	%ecx, %rcx
	cltq
	movss	.LC146(%rip), %xmm1
	movss	.LC144(%rip), %xmm4
	pxor	%xmm2, %xmm2
	movzbl	(%r15,%rax), %r11d
	cvtsi2ssl	%r11d, %xmm0
	movzbl	(%r9,%rax), %r11d
	movzbl	(%r10,%rax), %eax
	cvtsi2ssl	%r11d, %xmm3
	cvtsi2ssl	%eax, %xmm2
	leal	6(%rsi), %eax
	mulss	%xmm0, %xmm1
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm1
	movss	.LC148(%rip), %xmm4
	mulss	%xmm2, %xmm4
	addss	%xmm4, %xmm1
	subss	.LC169(%rip), %xmm1
	movss	.LC154(%rip), %xmm4
	mulss	%xmm3, %xmm4
	movss	%xmm1, 1440(%rsp,%rcx,4)
	movss	.LC152(%rip), %xmm1
	mulss	.LC157(%rip), %xmm3
	mulss	%xmm0, %xmm1
	mulss	.LC88(%rip), %xmm0
	subss	%xmm4, %xmm1
	movss	.LC88(%rip), %xmm4
	subss	%xmm3, %xmm0
	mulss	%xmm2, %xmm4
	mulss	.LC159(%rip), %xmm2
	addss	%xmm4, %xmm1
	subss	%xmm2, %xmm0
	movss	%xmm1, 2464(%rsp,%rcx,4)
	movss	%xmm0, 3488(%rsp,%rcx,4)
	leal	6(%rdi), %ecx
	cmpl	%ebx, %eax
	jge	.L3768
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm3, %xmm3
	movslq	%ecx, %rcx
	cltq
	movss	.LC146(%rip), %xmm1
	movss	.LC144(%rip), %xmm4
	pxor	%xmm2, %xmm2
	movzbl	(%r15,%rax), %r11d
	cvtsi2ssl	%r11d, %xmm0
	movzbl	(%r9,%rax), %r11d
	movzbl	(%r10,%rax), %eax
	cvtsi2ssl	%r11d, %xmm3
	cvtsi2ssl	%eax, %xmm2
	leal	7(%rsi), %eax
	mulss	%xmm0, %xmm1
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm1
	movss	.LC148(%rip), %xmm4
	mulss	%xmm2, %xmm4
	addss	%xmm4, %xmm1
	subss	.LC169(%rip), %xmm1
	movss	.LC154(%rip), %xmm4
	mulss	%xmm3, %xmm4
	movss	%xmm1, 1440(%rsp,%rcx,4)
	movss	.LC152(%rip), %xmm1
	mulss	.LC157(%rip), %xmm3
	mulss	%xmm0, %xmm1
	mulss	.LC88(%rip), %xmm0
	subss	%xmm4, %xmm1
	movss	.LC88(%rip), %xmm4
	subss	%xmm3, %xmm0
	mulss	%xmm2, %xmm4
	mulss	.LC159(%rip), %xmm2
	addss	%xmm4, %xmm1
	subss	%xmm2, %xmm0
	movss	%xmm1, 2464(%rsp,%rcx,4)
	movss	%xmm0, 3488(%rsp,%rcx,4)
	leal	7(%rdi), %ecx
	jmp	.L3768
.L3861:
	leal	1(%r14), %ecx
	movd	%r14d, %xmm0
	leal	1(%rax), %esi
	movq	.LC171(%rip), %xmm1
	movd	%ecx, %xmm6
	punpckldq	%xmm6, %xmm0
	paddd	%xmm1, %xmm0
	pshufd	$0xe5, %xmm0, %xmm6
	movd	%eax, %xmm0
	movd	%xmm6, %ecx
	movd	%esi, %xmm6
	punpckldq	%xmm6, %xmm0
	paddd	%xmm1, %xmm0
	pshufd	$0xe5, %xmm0, %xmm6
	movd	%xmm6, %eax
	jmp	.L3768
.L3858:
	movq	320(%rsp), %rbx
.L3775:
	movq	312(%rsp), %r13
	movq	16(%rsp), %rcx
	movq	%rbx, %rdx
	movq	280(%rsp), %rbp
	movq	272(%rsp), %r14
	movl	288(%rsp), %r9d
	movq	%r13, %r8
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	stbiw__jpg_processDU.constprop.0
	movq	%r13, %r8
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movq	352(%rsp), %rcx
	movl	%eax, %r9d
	movq	%r14, %rdi
	call	stbiw__jpg_processDU.constprop.0
	movq	%r13, %r8
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movq	360(%rsp), %rcx
	movl	%eax, %r9d
	movq	%r14, %rdi
	call	stbiw__jpg_processDU.constprop.0
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	movq	368(%rsp), %rcx
	movl	%eax, %r9d
	movq	%r13, %r8
	call	stbiw__jpg_processDU.constprop.0
	leaq	1440(%rsp), %rdi
	movq	304(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	%rdi, 16(%rsp)
	movq	296(%rsp), %rsi
	movl	%eax, 288(%rsp)
	movq	32(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L3790:
	movaps	(%rax), %xmm14
	movaps	64(%rax), %xmm13
	addq	$32, %rcx
	subq	$-128, %rdx
	movaps	32(%rax), %xmm11
	movaps	48(%rax), %xmm12
	addq	$32, %rsi
	subq	$-128, %rax
	movaps	%xmm14, %xmm0
	shufps	$136, -112(%rax), %xmm14
	shufps	$221, -112(%rax), %xmm0
	addps	%xmm14, %xmm0
	movaps	%xmm13, %xmm14
	shufps	$136, -48(%rax), %xmm14
	shufps	$221, -48(%rax), %xmm13
	movaps	-32(%rax), %xmm9
	movaps	-16(%rax), %xmm10
	movaps	-128(%rdx), %xmm7
	addps	%xmm14, %xmm0
	movaps	-112(%rdx), %xmm8
	movaps	-96(%rdx), %xmm3
	movaps	-80(%rdx), %xmm4
	movaps	-64(%rdx), %xmm5
	movaps	-48(%rdx), %xmm6
	movaps	-32(%rdx), %xmm1
	addps	%xmm13, %xmm0
	mulps	.LC172(%rip), %xmm0
	movaps	-16(%rdx), %xmm2
	movaps	%xmm0, -32(%rsi)
	movaps	%xmm11, %xmm0
	shufps	$136, %xmm12, %xmm11
	shufps	$221, %xmm12, %xmm0
	addps	%xmm11, %xmm0
	movaps	%xmm9, %xmm11
	shufps	$221, %xmm10, %xmm9
	shufps	$136, %xmm10, %xmm11
	addps	%xmm11, %xmm0
	addps	%xmm9, %xmm0
	mulps	.LC172(%rip), %xmm0
	movaps	%xmm0, -16(%rsi)
	movaps	%xmm7, %xmm0
	shufps	$136, %xmm8, %xmm7
	shufps	$221, %xmm8, %xmm0
	addps	%xmm7, %xmm0
	movaps	%xmm5, %xmm7
	shufps	$221, %xmm6, %xmm5
	shufps	$136, %xmm6, %xmm7
	addps	%xmm7, %xmm0
	addps	%xmm5, %xmm0
	mulps	.LC172(%rip), %xmm0
	movaps	%xmm0, -32(%rcx)
	movaps	%xmm3, %xmm0
	shufps	$136, %xmm4, %xmm3
	shufps	$221, %xmm4, %xmm0
	addps	%xmm3, %xmm0
	movaps	%xmm1, %xmm3
	shufps	$221, %xmm2, %xmm1
	shufps	$136, %xmm2, %xmm3
	addps	%xmm3, %xmm0
	addps	%xmm1, %xmm0
	mulps	.LC172(%rip), %xmm0
	movaps	%xmm0, -16(%rcx)
	cmpq	%rdi, %rcx
	jne	.L3790
	pushq	240(%rsp)
	.cfi_def_cfa_offset 4760
	movq	264(%rsp), %r12
	movq	%rbx, %rdx
	pushq	%r12
	.cfi_def_cfa_offset 4768
	movq	280(%rsp), %r13
	movq	296(%rsp), %rbp
	movq	288(%rsp), %r14
	movl	308(%rsp), %r9d
	movq	312(%rsp), %rcx
	movq	%r13, %r8
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	stbiw__jpg_processDU.constprop.1
	movq	%r13, %r8
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	%eax, 308(%rsp)
	movq	%r14, %rdi
	pushq	256(%rsp)
	.cfi_def_cfa_offset 4776
	pushq	%r12
	.cfi_def_cfa_offset 4784
	movl	360(%rsp), %r9d
	movq	336(%rsp), %rcx
	call	stbiw__jpg_processDU.constprop.1
	addq	$16, 88(%rsp)
	movl	%eax, 360(%rsp)
	movq	88(%rsp), %rax
	addl	$16, 176(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 4752
	cmpq	%rax, 344(%rsp)
	jne	.L3795
	movq	%r15, %r10
	movl	384(%rsp), %r15d
	movl	388(%rsp), %ebp
	movq	%rbx, %r12
	movq	272(%rsp), %r14
	movq	280(%rsp), %r13
	addl	$16, %r15d
	cmpl	%ebp, %r15d
	jne	.L3759
	jmp	.L3794
	.p2align 4,,10
	.p2align 3
.L3819:
	movl	148(%rsp), %eax
	movl	%ebp, %r14d
	xorl	%edi, %edi
	jmp	.L3767
.L3818:
	movl	%ecx, %r11d
	xorl	%esi, %esi
	jmp	.L3763
.L3821:
	movl	%r14d, %edi
	movl	%eax, %esi
	jmp	.L3771
.L3860:
	leal	2(%rbp), %ebx
	leal	3(%rbp), %esi
	movd	%ebp, %xmm0
	movd	%esi, %xmm5
	leal	1(%rbp), %eax
	movd	%ebx, %xmm1
	movl	172(%rsp), %ebx
	punpckldq	%xmm5, %xmm1
	movd	%eax, %xmm5
	punpckldq	%xmm5, %xmm0
	leal	2(%rbx), %esi
	leal	1(%rbx), %eax
	punpcklqdq	%xmm1, %xmm0
	paddd	.LC170(%rip), %xmm0
	movd	%esi, %xmm1
	leal	3(%rbx), %esi
	movd	%eax, %xmm5
	pshufd	$255, %xmm0, %xmm0
	movd	%esi, %xmm6
	movd	%xmm0, %ecx
	punpckldq	%xmm6, %xmm1
	movd	148(%rsp), %xmm0
	punpckldq	%xmm5, %xmm0
	punpcklqdq	%xmm1, %xmm0
	paddd	.LC170(%rip), %xmm0
	pshufd	$255, %xmm0, %xmm0
	movd	%xmm0, %eax
	jmp	.L3768
.L3857:
	movq	16(%rsp), %rax
	movq	56(%rsp), %rsi
	movq	$0, 40(%rsp)
	movl	48(%rsp), %edi
	movq	%rbx, 392(%rsp)
	movq	%rax, 112(%rsp)
	movq	32(%rsp), %rax
	movl	%esi, 192(%rsp)
	movq	%rax, 152(%rsp)
	movl	%esi, %eax
	addl	$16, %eax
	cmpl	%edi, %eax
	cmovg	%edi, %eax
	movl	%eax, %edi
	movl	%eax, 340(%rsp)
	subl	%esi, %edi
	cmpl	%eax, %esi
	movl	%edi, %edx
	movl	%eax, %edi
	movl	$1, %eax
	cmovl	%edx, %eax
	movl	%eax, %ecx
	movl	%eax, 196(%rsp)
	leal	-1(%rdx), %eax
	cmpl	$14, %eax
	setbe	%dl
	cmpl	%edi, %esi
	setge	%al
	andl	$-16, %ecx
	orl	%eax, %edx
	movl	%esi, %eax
	movl	%ecx, 332(%rsp)
	addl	%ecx, %eax
	movb	%dl, 320(%rsp)
	movl	%eax, 336(%rsp)
	movl	384(%rsp), %eax
	movl	%eax, 88(%rsp)
	movq	376(%rsp), %rax
	jmp	.L3789
.L3867:
	cmpb	$0, 320(%rsp)
	jne	.L3824
	movl	148(%rsp), %esi
	pxor	%xmm9, %xmm9
	pxor	%xmm7, %xmm7
	movdqa	%xmm7, %xmm2
	movdqa	%xmm7, %xmm4
	movdqa	%xmm7, %xmm11
	leal	(%rdi,%rsi), %edx
	movl	168(%rsp), %esi
	movq	216(%rsp), %rdi
	imull	%esi, %edx
	movslq	%edx, %rdx
	leaq	(%r15,%rdx), %r11
	leaq	(%rdi,%rdx), %rcx
	movq	224(%rsp), %rdi
	leaq	(%r11,%rax), %rbx
	leaq	(%r15,%rcx), %rsi
	leaq	(%rbx,%rax), %rcx
	addq	%rdi, %rdx
	movq	%rsi, 96(%rsp)
	movzbl	(%rbx), %ebx
	leaq	(%rcx,%rax), %r12
	leaq	(%r15,%rdx), %rdi
	movq	%rcx, 200(%rsp)
	leaq	(%r12,%rax), %r13
	movzbl	(%r12), %r12d
	movq	%rdi, 160(%rsp)
	leaq	0(%r13,%rax), %r14
	movzbl	0(%r13), %r13d
	leaq	(%r14,%rax), %r10
	movzbl	(%r14), %r14d
	leaq	(%r10,%rax), %rdx
	movzbl	(%r10), %r10d
	leaq	(%rdx,%rax), %r9
	movzbl	(%rdx), %edx
	leaq	(%r9,%rax), %rdi
	movq	%r9, 208(%rsp)
	salq	$8, %rdx
	leaq	(%rdi,%rax), %rsi
	movq	%rdi, 64(%rsp)
	orq	%r10, %rdx
	leaq	(%rsi,%rax), %rdi
	movzbl	(%rsi), %esi
	salq	$8, %rdx
	leaq	(%rdi,%rax), %r8
	movzbl	(%rdi), %edi
	orq	%r14, %rdx
	movq	200(%rsp), %r14
	leaq	(%r8,%rax), %r9
	movzbl	(%r8), %r8d
	salq	$8, %rdx
	leaq	(%r9,%rax), %rcx
	movzbl	(%r9), %r9d
	orq	%r13, %rdx
	movzbl	(%rcx), %r10d
	salq	$8, %rdx
	orq	%r12, %rdx
	movzbl	(%r14), %r12d
	salq	$8, %rdx
	orq	%r12, %rdx
	salq	$8, %rdx
	orq	%rbx, %rdx
	movzbl	(%r11), %ebx
	movq	%rdx, %r11
	movzbl	(%rcx,%rax), %edx
	salq	$8, %r11
	salq	$8, %rdx
	orq	%rbx, %r11
	orq	%r10, %rdx
	salq	$8, %rdx
	orq	%r9, %rdx
	movq	208(%rsp), %r9
	salq	$8, %rdx
	orq	%r8, %rdx
	salq	$8, %rdx
	orq	%rdi, %rdx
	movq	64(%rsp), %rdi
	movq	%r11, 64(%rsp)
	salq	$8, %rdx
	movzbl	(%rdi), %ecx
	orq	%rsi, %rdx
	salq	$8, %rdx
	orq	%rcx, %rdx
	movzbl	(%r9), %ecx
	salq	$8, %rdx
	orq	%rcx, %rdx
	movq	%rdx, 72(%rsp)
	movdqa	64(%rsp), %xmm1
	movdqa	64(%rsp), %xmm0
	movq	96(%rsp), %rsi
	punpcklbw	%xmm9, %xmm1
	leaq	(%rsi,%rax), %r11
	pcmpgtw	%xmm1, %xmm2
	movdqa	%xmm1, %xmm6
	leaq	(%r11,%rax), %rbx
	punpckhbw	%xmm9, %xmm0
	leaq	(%rbx,%rax), %rcx
	movzbl	(%rbx), %ebx
	movdqa	%xmm0, %xmm3
	leaq	(%rcx,%rax), %r12
	movq	%rcx, 64(%rsp)
	punpcklwd	%xmm2, %xmm6
	punpckhwd	%xmm2, %xmm1
	leaq	(%r12,%rax), %r13
	movzbl	(%r12), %r12d
	movdqa	%xmm7, %xmm2
	cvtdq2ps	%xmm6, %xmm6
	leaq	0(%r13,%rax), %r14
	pcmpgtw	%xmm0, %xmm2
	movzbl	0(%r13), %r13d
	movaps	%xmm6, %xmm13
	leaq	(%r14,%rax), %rdx
	movzbl	(%r14), %r14d
	cvtdq2ps	%xmm1, %xmm1
	leaq	(%rdx,%rax), %r10
	movzbl	(%rdx), %edx
	leaq	(%r10,%rax), %rcx
	movq	%r10, 200(%rsp)
	punpcklwd	%xmm2, %xmm3
	punpckhwd	%xmm2, %xmm0
	salq	$8, %rdx
	leaq	(%rcx,%rax), %rsi
	movzbl	(%rcx), %ecx
	cvtdq2ps	%xmm3, %xmm3
	orq	%r14, %rdx
	movq	64(%rsp), %r14
	leaq	(%rsi,%rax), %rdi
	movzbl	(%rsi), %esi
	salq	$8, %rdx
	leaq	(%rdi,%rax), %r8
	movzbl	(%rdi), %edi
	cvtdq2ps	%xmm0, %xmm0
	orq	%r13, %rdx
	leaq	(%r8,%rax), %r9
	movzbl	(%r8), %r8d
	salq	$8, %rdx
	leaq	(%r9,%rax), %r10
	movzbl	(%r9), %r9d
	orq	%r12, %rdx
	movzbl	(%r14), %r12d
	salq	$8, %rdx
	orq	%r12, %rdx
	salq	$8, %rdx
	orq	%rbx, %rdx
	movzbl	(%r11), %ebx
	salq	$8, %rdx
	movq	%rdx, %r11
	movq	96(%rsp), %rdx
	orq	%rbx, %r11
	movzbl	(%rdx), %ebx
	movzbl	(%r10,%rax), %edx
	salq	$8, %r11
	movzbl	(%r10), %r10d
	salq	$8, %rdx
	orq	%rbx, %r11
	orq	%r10, %rdx
	movq	200(%rsp), %r10
	movq	%r11, 64(%rsp)
	salq	$8, %rdx
	orq	%r9, %rdx
	salq	$8, %rdx
	orq	%r8, %rdx
	salq	$8, %rdx
	orq	%rdi, %rdx
	movq	160(%rsp), %rdi
	salq	$8, %rdx
	orq	%rsi, %rdx
	leaq	(%rdi,%rax), %r11
	salq	$8, %rdx
	leaq	(%r11,%rax), %rbx
	orq	%rcx, %rdx
	movzbl	(%r10), %ecx
	leaq	(%rbx,%rax), %rsi
	salq	$8, %rdx
	leaq	(%rsi,%rax), %r12
	orq	%rcx, %rdx
	leaq	(%r12,%rax), %r13
	movq	%rdx, 72(%rsp)
	movdqa	64(%rsp), %xmm5
	leaq	0(%r13,%rax), %r14
	movdqa	64(%rsp), %xmm2
	leaq	(%r14,%rax), %rdx
	movq	%rsi, 64(%rsp)
	punpcklbw	%xmm9, %xmm5
	leaq	(%rdx,%rax), %rcx
	pcmpgtw	%xmm5, %xmm4
	movdqa	%xmm5, %xmm10
	punpckhbw	%xmm9, %xmm2
	movq	%rcx, 200(%rsp)
	movdqa	%xmm2, %xmm8
	addq	%rax, %rcx
	leaq	(%rcx,%rax), %rsi
	punpcklwd	%xmm4, %xmm10
	punpckhwd	%xmm4, %xmm5
	movdqa	%xmm7, %xmm4
	pcmpgtw	%xmm2, %xmm4
	leaq	(%rsi,%rax), %rdi
	cvtdq2ps	%xmm10, %xmm10
	cvtdq2ps	%xmm5, %xmm5
	leaq	(%rdi,%rax), %r8
	leaq	(%r8,%rax), %r9
	punpckhwd	%xmm4, %xmm2
	leaq	(%r9,%rax), %r10
	punpcklwd	%xmm4, %xmm8
	cvtdq2ps	%xmm2, %xmm14
	movaps	%xmm14, 96(%rsp)
	movzbl	(%rdx), %edx
	movzbl	(%r14), %r14d
	movzbl	0(%r13), %r13d
	movzbl	(%r12), %r12d
	cvtdq2ps	%xmm8, %xmm8
	salq	$8, %rdx
	movzbl	(%rbx), %ebx
	movzbl	(%r9), %r9d
	orq	%r14, %rdx
	movq	64(%rsp), %r14
	movzbl	(%r8), %r8d
	salq	$8, %rdx
	movzbl	(%rdi), %edi
	movzbl	(%rsi), %esi
	movss	.LC148(%rip), %xmm12
	orq	%r13, %rdx
	movzbl	(%rcx), %ecx
	salq	$8, %rdx
	orq	%r12, %rdx
	movzbl	(%r14), %r12d
	shufps	$0, %xmm12, %xmm12
	salq	$8, %rdx
	orq	%r12, %rdx
	salq	$8, %rdx
	orq	%rbx, %rdx
	movzbl	(%r11), %ebx
	salq	$8, %rdx
	movq	%rdx, %r11
	movq	160(%rsp), %rdx
	orq	%rbx, %r11
	movzbl	(%rdx), %ebx
	movzbl	(%r10,%rax), %edx
	salq	$8, %r11
	movzbl	(%r10), %r10d
	salq	$8, %rdx
	orq	%rbx, %r11
	orq	%r10, %rdx
	movq	%r11, 64(%rsp)
	salq	$8, %rdx
	orq	%r9, %rdx
	salq	$8, %rdx
	orq	%r8, %rdx
	salq	$8, %rdx
	orq	%rdi, %rdx
	movq	112(%rsp), %rdi
	salq	$8, %rdx
	orq	%rsi, %rdx
	salq	$8, %rdx
	orq	%rcx, %rdx
	movq	200(%rsp), %rcx
	salq	$8, %rdx
	movzbl	(%rcx), %ecx
	orq	%rcx, %rdx
	movq	%rdx, 72(%rsp)
	movdqa	64(%rsp), %xmm4
	movdqa	64(%rsp), %xmm2
	punpcklbw	%xmm9, %xmm4
	punpckhbw	%xmm9, %xmm2
	pcmpgtw	%xmm4, %xmm11
	movdqa	%xmm4, %xmm9
	pcmpgtw	%xmm2, %xmm7
	punpcklwd	%xmm11, %xmm9
	punpckhwd	%xmm11, %xmm4
	movdqa	%xmm7, %xmm11
	movdqa	%xmm2, %xmm7
	cvtdq2ps	%xmm9, %xmm9
	cvtdq2ps	%xmm4, %xmm4
	punpckhwd	%xmm11, %xmm2
	punpcklwd	%xmm11, %xmm7
	movaps	%xmm10, %xmm11
	cvtdq2ps	%xmm2, %xmm15
	movss	.LC146(%rip), %xmm2
	movaps	%xmm15, 64(%rsp)
	cvtdq2ps	%xmm7, %xmm7
	shufps	$0, %xmm2, %xmm2
	mulps	%xmm2, %xmm13
	movaps	%xmm13, %xmm14
	movss	.LC144(%rip), %xmm13
	shufps	$0, %xmm13, %xmm13
	mulps	%xmm13, %xmm11
	addps	%xmm11, %xmm14
	movaps	%xmm9, %xmm11
	mulps	%xmm12, %xmm11
	addps	%xmm14, %xmm11
	movss	.LC150(%rip), %xmm14
	shufps	$0, %xmm14, %xmm14
	addps	%xmm14, %xmm11
	movaps	%xmm11, (%rdi)
	movaps	%xmm1, %xmm11
	mulps	%xmm2, %xmm11
	movaps	%xmm11, %xmm15
	movaps	%xmm5, %xmm11
	mulps	%xmm13, %xmm11
	addps	%xmm15, %xmm11
	movaps	%xmm4, %xmm15
	mulps	%xmm12, %xmm15
	addps	%xmm15, %xmm11
	addps	%xmm14, %xmm11
	movaps	%xmm11, 16(%rdi)
	movaps	%xmm3, %xmm11
	mulps	%xmm2, %xmm11
	mulps	%xmm0, %xmm2
	movaps	%xmm11, %xmm15
	movaps	%xmm8, %xmm11
	mulps	%xmm13, %xmm11
	addps	%xmm15, %xmm11
	movaps	%xmm7, %xmm15
	mulps	%xmm12, %xmm15
	addps	%xmm15, %xmm11
	addps	%xmm14, %xmm11
	movaps	%xmm11, 32(%rdi)
	mulps	96(%rsp), %xmm13
	movaps	64(%rsp), %xmm15
	movaps	%xmm10, %xmm11
	movq	40(%rsp), %rbx
	movl	332(%rsp), %esi
	mulps	%xmm15, %xmm12
	addps	%xmm13, %xmm2
	movaps	%xmm6, %xmm13
	addps	%xmm12, %xmm2
	movss	.LC154(%rip), %xmm12
	shufps	$0, %xmm12, %xmm12
	mulps	%xmm12, %xmm11
	addps	%xmm14, %xmm2
	movaps	%xmm9, %xmm14
	movaps	%xmm2, 48(%rdi)
	movss	.LC152(%rip), %xmm2
	movq	152(%rsp), %rdi
	shufps	$0, %xmm2, %xmm2
	mulps	%xmm2, %xmm13
	subps	%xmm11, %xmm13
	movss	.LC88(%rip), %xmm11
	shufps	$0, %xmm11, %xmm11
	mulps	%xmm11, %xmm14
	mulps	%xmm11, %xmm6
	addps	%xmm14, %xmm13
	movaps	%xmm5, %xmm14
	mulps	%xmm12, %xmm14
	movaps	%xmm13, (%rdi)
	movaps	%xmm1, %xmm13
	mulps	%xmm2, %xmm13
	mulps	%xmm11, %xmm1
	subps	%xmm14, %xmm13
	movaps	%xmm4, %xmm14
	mulps	%xmm11, %xmm14
	addps	%xmm14, %xmm13
	movaps	%xmm8, %xmm14
	mulps	%xmm12, %xmm14
	movaps	%xmm13, 16(%rdi)
	movaps	%xmm3, %xmm13
	mulps	%xmm2, %xmm13
	mulps	%xmm0, %xmm2
	mulps	%xmm11, %xmm3
	mulps	%xmm11, %xmm0
	subps	%xmm14, %xmm13
	movaps	%xmm7, %xmm14
	mulps	%xmm11, %xmm14
	addps	%xmm14, %xmm13
	movaps	96(%rsp), %xmm14
	mulps	%xmm14, %xmm12
	movaps	%xmm13, 32(%rdi)
	subps	%xmm12, %xmm2
	movaps	%xmm15, %xmm12
	mulps	%xmm11, %xmm12
	addps	%xmm12, %xmm2
	movss	.LC157(%rip), %xmm12
	shufps	$0, %xmm12, %xmm12
	mulps	%xmm12, %xmm5
	movaps	%xmm2, 48(%rdi)
	movss	.LC159(%rip), %xmm2
	mulps	%xmm12, %xmm8
	movq	8(%rsp), %rdi
	mulps	%xmm12, %xmm10
	shufps	$0, %xmm2, %xmm2
	mulps	%xmm2, %xmm4
	mulps	%xmm2, %xmm7
	subps	%xmm5, %xmm1
	mulps	%xmm2, %xmm9
	mulps	%xmm2, %xmm15
	subps	%xmm10, %xmm6
	subps	%xmm4, %xmm1
	subps	%xmm9, %xmm6
	movups	%xmm1, 16(%rdi,%rbx,4)
	movaps	%xmm3, %xmm1
	subps	%xmm8, %xmm1
	movups	%xmm6, (%rdi,%rbx,4)
	subps	%xmm7, %xmm1
	movups	%xmm1, 32(%rdi,%rbx,4)
	movaps	%xmm14, %xmm1
	mulps	%xmm12, %xmm1
	subps	%xmm1, %xmm0
	subps	%xmm15, %xmm0
	movups	%xmm0, 48(%rdi,%rbx,4)
	leal	0(%rbp,%rsi), %ebx
	movl	%ebx, 96(%rsp)
	movl	336(%rsp), %ebx
	movl	%ebx, 64(%rsp)
	testb	$15, 196(%rsp)
	je	.L3863
.L3779:
	movl	196(%rsp), %edi
	subl	%esi, %edi
	leal	-1(%rdi), %edx
	movl	%edi, 160(%rsp)
	cmpl	$6, %edx
	jbe	.L3826
	movl	80(%rsp), %ebx
	movq	%rax, %r8
	pxor	%xmm9, %xmm9
	pxor	%xmm4, %xmm4
	movl	148(%rsp), %ecx
	imulq	%rsi, %r8
	leal	(%rbx,%rcx), %edx
	movl	168(%rsp), %ebx
	imull	%ebx, %edx
	movq	216(%rsp), %rbx
	movslq	%edx, %rdx
	leaq	(%rbx,%rdx), %rcx
	movq	224(%rsp), %rbx
	leaq	(%rdx,%r8), %rdi
	addq	%r15, %rdi
	addq	%r8, %rcx
	addq	%rbx, %rdx
	movq	40(%rsp), %rbx
	addq	%r15, %rcx
	addq	%r8, %rdx
	leaq	(%rdi,%rax), %r8
	movzbl	(%rdi), %edi
	leaq	(%r15,%rdx), %r14
	leaq	(%rbx,%rsi), %rdx
	movq	16(%rsp), %rbx
	salq	$2, %rdx
	leaq	(%r8,%rax), %r9
	movzbl	(%r8), %r8d
	leaq	(%rbx,%rdx), %rsi
	movq	32(%rsp), %rbx
	leaq	(%r9,%rax), %r10
	movzbl	(%r9), %r9d
	leaq	(%r10,%rax), %r11
	movzbl	(%r10), %r10d
	leaq	(%rbx,%rdx), %r12
	movq	8(%rsp), %rbx
	leaq	(%rbx,%rdx), %r13
	leaq	(%r11,%rax), %rbx
	movzbl	(%r11), %r11d
	leaq	(%rbx,%rax), %rbp
	movzbl	(%rbx), %ebx
	movzbl	0(%rbp,%rax), %edx
	movzbl	0(%rbp), %ebp
	salq	$8, %rdx
	orq	%rbp, %rdx
	salq	$8, %rdx
	orq	%rbx, %rdx
	salq	$8, %rdx
	orq	%r11, %rdx
	salq	$8, %rdx
	orq	%r10, %rdx
	salq	$8, %rdx
	orq	%r9, %rdx
	salq	$8, %rdx
	orq	%r8, %rdx
	salq	$8, %rdx
	orq	%rdi, %rdx
	leaq	(%rcx,%rax), %rdi
	movzbl	(%rcx), %ecx
	leaq	(%rdi,%rax), %r8
	movq	%rdx, %xmm0
	movzbl	(%rdi), %edi
	leaq	(%r8,%rax), %r9
	movzbl	(%r8), %r8d
	movdqa	%xmm0, %xmm3
	punpcklbw	%xmm9, %xmm0
	leaq	(%r9,%rax), %r10
	movzbl	(%r9), %r9d
	pshufd	$78, %xmm0, %xmm0
	punpcklbw	%xmm9, %xmm3
	leaq	(%r10,%rax), %r11
	movzbl	(%r10), %r10d
	movdqa	%xmm0, %xmm5
	punpcklwd	%xmm4, %xmm0
	leaq	(%r11,%rax), %rbx
	movzbl	(%r11), %r11d
	movdqa	%xmm3, %xmm6
	punpcklwd	%xmm4, %xmm5
	movzbl	(%rbx,%rax), %edx
	movzbl	(%rbx), %ebx
	pshufd	$78, %xmm0, %xmm0
	punpcklwd	%xmm4, %xmm6
	cvtdq2ps	%xmm0, %xmm7
	punpcklwd	%xmm4, %xmm3
	cvtdq2ps	%xmm6, %xmm6
	movaps	%xmm6, %xmm13
	salq	$8, %rdx
	movq	%xmm7, %rbp
	pshufd	$78, %xmm3, %xmm3
	cvtdq2ps	%xmm5, %xmm5
	orq	%rbx, %rdx
	cvtdq2ps	%xmm3, %xmm3
	salq	$8, %rdx
	orq	%r11, %rdx
	salq	$8, %rdx
	orq	%r10, %rdx
	salq	$8, %rdx
	orq	%r9, %rdx
	salq	$8, %rdx
	orq	%r8, %rdx
	salq	$8, %rdx
	orq	%rdi, %rdx
	salq	$8, %rdx
	orq	%rcx, %rdx
	leaq	(%r14,%rax), %rcx
	leaq	(%rcx,%rax), %rdi
	movq	%rdx, %xmm2
	movzbl	(%rcx), %ecx
	leaq	(%rdi,%rax), %r8
	movzbl	(%rdi), %edi
	movdqa	%xmm2, %xmm8
	punpcklbw	%xmm9, %xmm2
	leaq	(%r8,%rax), %r9
	movzbl	(%r8), %r8d
	punpcklbw	%xmm9, %xmm8
	pshufd	$78, %xmm2, %xmm2
	leaq	(%r9,%rax), %r10
	movzbl	(%r9), %r9d
	movdqa	%xmm8, %xmm12
	movdqa	%xmm2, %xmm10
	leaq	(%r10,%rax), %r11
	movzbl	(%r10), %r10d
	punpcklwd	%xmm4, %xmm12
	punpcklwd	%xmm4, %xmm8
	movzbl	(%r11,%rax), %edx
	movzbl	(%r11), %r11d
	punpcklwd	%xmm4, %xmm10
	punpcklwd	%xmm4, %xmm2
	cvtdq2ps	%xmm12, %xmm12
	pshufd	$78, %xmm8, %xmm8
	cvtdq2ps	%xmm10, %xmm10
	pshufd	$78, %xmm2, %xmm2
	salq	$8, %rdx
	cvtdq2ps	%xmm8, %xmm8
	cvtdq2ps	%xmm2, %xmm2
	orq	%r11, %rdx
	salq	$8, %rdx
	orq	%r10, %rdx
	salq	$8, %rdx
	orq	%r9, %rdx
	salq	$8, %rdx
	orq	%r8, %rdx
	salq	$8, %rdx
	orq	%rdi, %rdx
	salq	$8, %rdx
	orq	%rcx, %rdx
	movzbl	(%r14), %ecx
	movl	160(%rsp), %edi
	movq	.LC160(%rip), %xmm15
	salq	$8, %rdx
	movq	.LC162(%rip), %xmm14
	orq	%rcx, %rdx
	movq	%rdx, %xmm1
	movdqa	%xmm1, %xmm7
	punpcklbw	%xmm9, %xmm1
	punpcklbw	%xmm9, %xmm7
	pshufd	$78, %xmm1, %xmm1
	movdqa	%xmm7, %xmm11
	movdqa	%xmm1, %xmm9
	punpcklwd	%xmm4, %xmm7
	punpcklwd	%xmm4, %xmm9
	punpcklwd	%xmm4, %xmm11
	punpcklwd	%xmm4, %xmm1
	movq	.LC161(%rip), %xmm4
	cvtdq2ps	%xmm9, %xmm0
	movq	%xmm0, %rbx
	movaps	%xmm12, %xmm0
	cvtdq2ps	%xmm11, %xmm11
	mulps	%xmm4, %xmm13
	pshufd	$78, %xmm7, %xmm7
	pshufd	$78, %xmm1, %xmm1
	mulps	%xmm15, %xmm0
	cvtdq2ps	%xmm7, %xmm7
	cvtdq2ps	%xmm1, %xmm1
	addps	%xmm13, %xmm0
	movaps	%xmm11, %xmm13
	mulps	%xmm14, %xmm13
	addps	%xmm0, %xmm13
	movq	.LC163(%rip), %xmm0
	addps	%xmm0, %xmm13
	movlps	%xmm13, (%rsi)
	movaps	%xmm3, %xmm13
	mulps	%xmm4, %xmm13
	movq	%xmm13, %rcx
	movaps	%xmm8, %xmm13
	mulps	%xmm15, %xmm13
	movq	%rcx, %xmm9
	movl	%edi, %ecx
	andl	$-8, %ecx
	addps	%xmm9, %xmm13
	movaps	%xmm7, %xmm9
	mulps	%xmm14, %xmm9
	addps	%xmm9, %xmm13
	movaps	%xmm5, %xmm9
	mulps	%xmm4, %xmm9
	addps	%xmm0, %xmm13
	movlps	%xmm13, 8(%rsi)
	movaps	%xmm10, %xmm13
	mulps	%xmm15, %xmm13
	mulps	%xmm2, %xmm15
	addps	%xmm9, %xmm13
	movq	%rbx, %xmm9
	mulps	%xmm14, %xmm9
	mulps	%xmm1, %xmm14
	addps	%xmm9, %xmm13
	movq	%rbp, %xmm9
	mulps	%xmm9, %xmm4
	movq	%rbx, %xmm9
	addps	%xmm0, %xmm13
	addps	%xmm15, %xmm4
	movlps	%xmm13, 16(%rsi)
	movaps	%xmm6, %xmm15
	movaps	%xmm12, %xmm13
	addps	%xmm14, %xmm4
	movq	.LC165(%rip), %xmm14
	mulps	%xmm14, %xmm13
	addps	%xmm0, %xmm4
	movaps	%xmm11, %xmm0
	movlps	%xmm4, 24(%rsi)
	movq	.LC164(%rip), %xmm4
	mulps	%xmm4, %xmm15
	subps	%xmm13, %xmm15
	movq	.LC166(%rip), %xmm13
	mulps	%xmm13, %xmm0
	mulps	%xmm13, %xmm9
	mulps	%xmm13, %xmm6
	addps	%xmm0, %xmm15
	movaps	%xmm8, %xmm0
	mulps	%xmm14, %xmm0
	movlps	%xmm15, (%r12)
	movaps	%xmm3, %xmm15
	mulps	%xmm4, %xmm15
	mulps	%xmm13, %xmm3
	subps	%xmm0, %xmm15
	movaps	%xmm7, %xmm0
	mulps	%xmm13, %xmm0
	addps	%xmm0, %xmm15
	movaps	%xmm10, %xmm0
	mulps	%xmm14, %xmm0
	mulps	%xmm2, %xmm14
	movlps	%xmm15, 8(%r12)
	movaps	%xmm5, %xmm15
	mulps	%xmm4, %xmm15
	mulps	%xmm13, %xmm5
	subps	%xmm0, %xmm15
	movq	%rbp, %xmm0
	mulps	%xmm0, %xmm4
	mulps	%xmm13, %xmm0
	addps	%xmm9, %xmm15
	movq	%rbx, %xmm9
	movl	64(%rsp), %ebx
	leal	(%rbx,%rcx), %esi
	movl	96(%rsp), %ebx
	subps	%xmm14, %xmm4
	movaps	%xmm1, %xmm14
	movlps	%xmm15, 16(%r12)
	mulps	%xmm13, %xmm14
	addl	%ebx, %ecx
	andl	$7, %edi
	addps	%xmm14, %xmm4
	movq	.LC167(%rip), %xmm14
	mulps	%xmm14, %xmm12
	mulps	%xmm14, %xmm8
	movlps	%xmm4, 24(%r12)
	movq	.LC168(%rip), %xmm4
	mulps	%xmm14, %xmm10
	mulps	%xmm14, %xmm2
	mulps	%xmm4, %xmm11
	mulps	%xmm4, %xmm7
	subps	%xmm12, %xmm6
	mulps	%xmm4, %xmm9
	subps	%xmm8, %xmm3
	mulps	%xmm4, %xmm1
	subps	%xmm10, %xmm5
	subps	%xmm2, %xmm0
	subps	%xmm11, %xmm6
	subps	%xmm7, %xmm3
	subps	%xmm9, %xmm5
	subps	%xmm1, %xmm0
	movlps	%xmm6, 0(%r13)
	movlps	%xmm3, 8(%r13)
	movlps	%xmm5, 16(%r13)
	movlps	%xmm0, 24(%r13)
	je	.L3864
.L3781:
	movl	80(%rsp), %ebx
	pxor	%xmm3, %xmm3
	pxor	%xmm5, %xmm5
	pxor	%xmm7, %xmm7
	movl	168(%rsp), %r14d
	leal	1(%rcx), %ebp
	movq	176(%rsp), %r10
	leal	(%rbx,%rsi), %edx
	movq	184(%rsp), %r9
	movss	.LC144(%rip), %xmm11
	imull	%r14d, %edx
	movss	.LC146(%rip), %xmm0
	movss	.LC148(%rip), %xmm10
	movss	.LC154(%rip), %xmm4
	movl	340(%rsp), %r8d
	movss	.LC169(%rip), %xmm9
	movslq	%edx, %rdx
	movzbl	(%r15,%rdx), %edi
	cvtsi2ssl	%edi, %xmm3
	movzbl	(%r10,%rdx), %edi
	movzbl	(%r9,%rdx), %edx
	cvtsi2ssl	%edi, %xmm5
	cvtsi2ssl	%edx, %xmm7
	movslq	%ecx, %rdx
	movaps	%xmm3, %xmm2
	movaps	%xmm3, %xmm6
	mulss	%xmm0, %xmm2
	movaps	%xmm5, %xmm1
	mulss	%xmm11, %xmm1
	movaps	%xmm7, %xmm8
	addss	%xmm2, %xmm1
	movaps	%xmm7, %xmm2
	mulss	%xmm10, %xmm2
	addss	%xmm2, %xmm1
	movss	.LC152(%rip), %xmm2
	mulss	%xmm2, %xmm6
	subss	%xmm9, %xmm1
	movss	%xmm1, 1440(%rsp,%rdx,4)
	movaps	%xmm5, %xmm1
	mulss	%xmm4, %xmm1
	subss	%xmm1, %xmm6
	movss	.LC88(%rip), %xmm1
	mulss	%xmm1, %xmm8
	mulss	%xmm1, %xmm3
	addss	%xmm8, %xmm6
	movss	%xmm6, 2464(%rsp,%rdx,4)
	movss	.LC157(%rip), %xmm6
	mulss	%xmm6, %xmm5
	subss	%xmm5, %xmm3
	movss	.LC159(%rip), %xmm5
	mulss	%xmm5, %xmm7
	subss	%xmm7, %xmm3
	movss	%xmm3, 3488(%rsp,%rdx,4)
	leal	1(%rsi), %edx
	cmpl	%r8d, %edx
	jl	.L3865
	.p2align 4,,10
	.p2align 3
.L3780:
	cmpl	%edx, 144(%rsp)
	jl	.L3786
.L3778:
	movl	172(%rsp), %esi
	leal	15(%rsi), %ebx
	subl	%edx, %esi
	movl	%esi, %ecx
	leal	16(%rsi), %edi
	cmpl	%ebx, %edx
	movl	$1, %esi
	cmovle	%edi, %esi
	addl	$15, %ecx
	movl	%esi, %r11d
	cmpl	$14, %ecx
	jbe	.L3827
	cmpl	%ebx, %edx
	jg	.L3827
	movq	8(%rsp), %r14
	movq	16(%rsp), %rsi
	movslq	%ebp, %rcx
	pxor	%xmm9, %xmm9
	movq	32(%rsp), %rdi
	salq	$2, %rcx
	pxor	%xmm7, %xmm7
	movss	.LC148(%rip), %xmm12
	leaq	(%r14,%rcx), %r8
	addq	%rcx, %rsi
	movl	80(%rsp), %r14d
	movdqa	%xmm7, %xmm2
	addq	%rcx, %rdi
	movl	52(%rsp), %ecx
	movdqa	%xmm7, %xmm4
	movdqa	%xmm7, %xmm11
	shufps	$0, %xmm12, %xmm12
	addl	%r14d, %ecx
	movl	168(%rsp), %r14d
	imull	%r14d, %ecx
	movslq	%ecx, %r9
	movzbl	(%r15,%r9), %ecx
	movd	%ecx, %xmm0
	movq	176(%rsp), %rcx
	punpcklbw	%xmm0, %xmm0
	punpcklwd	%xmm0, %xmm0
	movzbl	(%rcx,%r9), %ecx
	pshufd	$0, %xmm0, %xmm0
	movdqa	%xmm0, %xmm1
	punpckhbw	%xmm9, %xmm0
	punpcklbw	%xmm9, %xmm1
	movdqa	%xmm0, %xmm3
	pcmpgtw	%xmm1, %xmm2
	movdqa	%xmm1, %xmm6
	punpcklwd	%xmm2, %xmm6
	punpckhwd	%xmm2, %xmm1
	movdqa	%xmm7, %xmm2
	pcmpgtw	%xmm0, %xmm2
	cvtdq2ps	%xmm6, %xmm6
	movaps	%xmm6, %xmm13
	cvtdq2ps	%xmm1, %xmm1
	punpcklwd	%xmm2, %xmm3
	punpckhwd	%xmm2, %xmm0
	movd	%ecx, %xmm2
	movq	184(%rsp), %rcx
	punpcklbw	%xmm2, %xmm2
	cvtdq2ps	%xmm3, %xmm3
	cvtdq2ps	%xmm0, %xmm0
	punpcklwd	%xmm2, %xmm2
	movzbl	(%rcx,%r9), %ecx
	pshufd	$0, %xmm2, %xmm2
	movdqa	%xmm2, %xmm5
	punpckhbw	%xmm9, %xmm2
	punpcklbw	%xmm9, %xmm5
	movdqa	%xmm2, %xmm8
	pcmpgtw	%xmm5, %xmm4
	movdqa	%xmm5, %xmm10
	punpcklwd	%xmm4, %xmm10
	punpckhwd	%xmm4, %xmm5
	movdqa	%xmm7, %xmm4
	pcmpgtw	%xmm2, %xmm4
	cvtdq2ps	%xmm10, %xmm10
	cvtdq2ps	%xmm5, %xmm5
	punpckhwd	%xmm4, %xmm2
	punpcklwd	%xmm4, %xmm8
	cvtdq2ps	%xmm2, %xmm14
	movd	%ecx, %xmm2
	cvtdq2ps	%xmm8, %xmm8
	movl	%r11d, %ecx
	punpcklbw	%xmm2, %xmm2
	movaps	%xmm14, 64(%rsp)
	andl	$-16, %ecx
	punpcklwd	%xmm2, %xmm2
	addl	%ecx, %edx
	leal	0(%rbp,%rcx), %r10d
	pshufd	$0, %xmm2, %xmm2
	movdqa	%xmm2, %xmm4
	punpckhbw	%xmm9, %xmm2
	punpcklbw	%xmm9, %xmm4
	pcmpgtw	%xmm2, %xmm7
	pcmpgtw	%xmm4, %xmm11
	movdqa	%xmm4, %xmm9
	punpcklwd	%xmm11, %xmm9
	punpckhwd	%xmm11, %xmm4
	movdqa	%xmm7, %xmm11
	movdqa	%xmm2, %xmm7
	punpckhwd	%xmm11, %xmm2
	cvtdq2ps	%xmm9, %xmm9
	cvtdq2ps	%xmm4, %xmm4
	cvtdq2ps	%xmm2, %xmm15
	punpcklwd	%xmm11, %xmm7
	movaps	%xmm10, %xmm11
	movss	.LC146(%rip), %xmm2
	movaps	%xmm15, 96(%rsp)
	cvtdq2ps	%xmm7, %xmm7
	shufps	$0, %xmm2, %xmm2
	mulps	%xmm2, %xmm13
	movaps	%xmm13, %xmm14
	movss	.LC144(%rip), %xmm13
	shufps	$0, %xmm13, %xmm13
	mulps	%xmm13, %xmm11
	addps	%xmm11, %xmm14
	movaps	%xmm9, %xmm11
	mulps	%xmm12, %xmm11
	addps	%xmm14, %xmm11
	movss	.LC150(%rip), %xmm14
	shufps	$0, %xmm14, %xmm14
	addps	%xmm14, %xmm11
	movups	%xmm11, (%rsi)
	movaps	%xmm1, %xmm11
	mulps	%xmm2, %xmm11
	movaps	%xmm11, %xmm15
	movaps	%xmm5, %xmm11
	mulps	%xmm13, %xmm11
	addps	%xmm15, %xmm11
	movaps	%xmm4, %xmm15
	mulps	%xmm12, %xmm15
	addps	%xmm15, %xmm11
	addps	%xmm14, %xmm11
	movups	%xmm11, 16(%rsi)
	movaps	%xmm3, %xmm11
	mulps	%xmm2, %xmm11
	mulps	%xmm0, %xmm2
	movaps	%xmm11, %xmm15
	movaps	%xmm8, %xmm11
	mulps	%xmm13, %xmm11
	mulps	64(%rsp), %xmm13
	addps	%xmm15, %xmm11
	movaps	%xmm7, %xmm15
	mulps	%xmm12, %xmm15
	addps	%xmm13, %xmm2
	movaps	%xmm6, %xmm13
	addps	%xmm15, %xmm11
	movaps	96(%rsp), %xmm15
	mulps	%xmm15, %xmm12
	addps	%xmm14, %xmm11
	movups	%xmm11, 32(%rsi)
	movaps	%xmm10, %xmm11
	addps	%xmm12, %xmm2
	movss	.LC154(%rip), %xmm12
	shufps	$0, %xmm12, %xmm12
	mulps	%xmm12, %xmm11
	addps	%xmm14, %xmm2
	movaps	%xmm9, %xmm14
	movups	%xmm2, 48(%rsi)
	movss	.LC152(%rip), %xmm2
	shufps	$0, %xmm2, %xmm2
	mulps	%xmm2, %xmm13
	subps	%xmm11, %xmm13
	movss	.LC88(%rip), %xmm11
	shufps	$0, %xmm11, %xmm11
	mulps	%xmm11, %xmm14
	mulps	%xmm11, %xmm6
	addps	%xmm14, %xmm13
	movaps	%xmm5, %xmm14
	mulps	%xmm12, %xmm14
	movups	%xmm13, (%rdi)
	movaps	%xmm1, %xmm13
	mulps	%xmm2, %xmm13
	mulps	%xmm11, %xmm1
	subps	%xmm14, %xmm13
	movaps	%xmm4, %xmm14
	mulps	%xmm11, %xmm14
	addps	%xmm14, %xmm13
	movaps	%xmm8, %xmm14
	mulps	%xmm12, %xmm14
	movups	%xmm13, 16(%rdi)
	movaps	%xmm3, %xmm13
	mulps	%xmm2, %xmm13
	mulps	%xmm0, %xmm2
	mulps	%xmm11, %xmm3
	mulps	%xmm11, %xmm0
	subps	%xmm14, %xmm13
	movaps	%xmm7, %xmm14
	mulps	%xmm11, %xmm14
	addps	%xmm14, %xmm13
	movaps	64(%rsp), %xmm14
	mulps	%xmm14, %xmm12
	movups	%xmm13, 32(%rdi)
	subps	%xmm12, %xmm2
	movaps	%xmm15, %xmm12
	mulps	%xmm11, %xmm12
	addps	%xmm12, %xmm2
	movss	.LC157(%rip), %xmm12
	shufps	$0, %xmm12, %xmm12
	mulps	%xmm12, %xmm5
	movups	%xmm2, 48(%rdi)
	movss	.LC159(%rip), %xmm2
	mulps	%xmm12, %xmm8
	mulps	%xmm12, %xmm10
	shufps	$0, %xmm2, %xmm2
	mulps	%xmm2, %xmm4
	mulps	%xmm2, %xmm7
	subps	%xmm5, %xmm1
	mulps	%xmm2, %xmm9
	mulps	%xmm2, %xmm15
	subps	%xmm10, %xmm6
	subps	%xmm4, %xmm1
	subps	%xmm9, %xmm6
	movups	%xmm1, 16(%r8)
	movaps	%xmm3, %xmm1
	subps	%xmm8, %xmm1
	movups	%xmm6, (%r8)
	subps	%xmm7, %xmm1
	movups	%xmm1, 32(%r8)
	movaps	%xmm14, %xmm1
	mulps	%xmm12, %xmm1
	subps	%xmm1, %xmm0
	subps	%xmm15, %xmm0
	movups	%xmm0, 48(%r8)
	testb	$15, %r11b
	je	.L3786
.L3784:
	subl	%ecx, %r11d
	leal	-1(%r11), %esi
	cmpl	$6, %esi
	jbe	.L3787
	movslq	%ebp, %rsi
	movq	16(%rsp), %rdi
	pxor	%xmm8, %xmm8
	pxor	%xmm12, %xmm12
	movq	.LC160(%rip), %xmm14
	addq	%rcx, %rsi
	movl	80(%rsp), %ecx
	salq	$2, %rsi
	leaq	(%rdi,%rsi), %r9
	movq	32(%rsp), %rdi
	leaq	(%rdi,%rsi), %r8
	movq	8(%rsp), %rdi
	addq	%rdi, %rsi
	movl	52(%rsp), %edi
	addl	%ecx, %edi
	movl	168(%rsp), %ecx
	imull	%ecx, %edi
	movslq	%edi, %rdi
	movzbl	(%r15,%rdi), %ecx
	movb	%cl, %ch
	movd	%ecx, %xmm6
	movq	176(%rsp), %rcx
	pshuflw	$0, %xmm6, %xmm0
	movzbl	(%rcx,%rdi), %ecx
	movdqa	%xmm0, %xmm3
	punpcklbw	%xmm8, %xmm0
	punpcklbw	%xmm8, %xmm3
	pshufd	$78, %xmm0, %xmm0
	movb	%cl, %ch
	movdqa	%xmm3, %xmm5
	movdqa	%xmm0, %xmm4
	movd	%ecx, %xmm6
	punpcklwd	%xmm12, %xmm5
	punpcklwd	%xmm12, %xmm3
	movq	184(%rsp), %rcx
	pshuflw	$0, %xmm6, %xmm2
	punpcklwd	%xmm12, %xmm4
	punpcklwd	%xmm12, %xmm0
	cvtdq2ps	%xmm5, %xmm5
	movzbl	(%rcx,%rdi), %ecx
	movdqa	%xmm2, %xmm7
	punpcklbw	%xmm8, %xmm2
	pshufd	$78, %xmm3, %xmm3
	punpcklbw	%xmm8, %xmm7
	pshufd	$78, %xmm2, %xmm2
	cvtdq2ps	%xmm3, %xmm3
	cvtdq2ps	%xmm4, %xmm4
	movb	%cl, %ch
	movdqa	%xmm7, %xmm11
	movdqa	%xmm2, %xmm9
	movd	%ecx, %xmm6
	punpcklwd	%xmm12, %xmm11
	punpcklwd	%xmm12, %xmm7
	pshuflw	$0, %xmm6, %xmm1
	punpcklwd	%xmm12, %xmm9
	punpcklwd	%xmm12, %xmm2
	cvtdq2ps	%xmm11, %xmm11
	movdqa	%xmm1, %xmm6
	punpcklbw	%xmm8, %xmm1
	movaps	%xmm11, %xmm13
	cvtdq2ps	%xmm9, %xmm9
	punpcklbw	%xmm8, %xmm6
	pshufd	$78, %xmm1, %xmm1
	pshufd	$78, %xmm7, %xmm7
	movdqa	%xmm6, %xmm10
	movdqa	%xmm1, %xmm8
	punpcklwd	%xmm12, %xmm6
	cvtdq2ps	%xmm7, %xmm7
	punpcklwd	%xmm12, %xmm10
	punpcklwd	%xmm12, %xmm8
	punpcklwd	%xmm12, %xmm1
	movq	.LC161(%rip), %xmm12
	mulps	%xmm14, %xmm13
	cvtdq2ps	%xmm10, %xmm10
	movaps	%xmm10, %xmm15
	cvtdq2ps	%xmm8, %xmm8
	mulps	%xmm5, %xmm12
	movq	%xmm8, %rdi
	pshufd	$78, %xmm6, %xmm6
	cvtdq2ps	%xmm6, %xmm6
	pshufd	$78, %xmm0, %xmm0
	pshufd	$78, %xmm2, %xmm2
	pshufd	$78, %xmm1, %xmm1
	cvtdq2ps	%xmm0, %xmm0
	cvtdq2ps	%xmm2, %xmm2
	cvtdq2ps	%xmm1, %xmm1
	addps	%xmm13, %xmm12
	movq	.LC162(%rip), %xmm13
	mulps	%xmm13, %xmm15
	addps	%xmm15, %xmm12
	movq	.LC163(%rip), %xmm15
	addps	%xmm15, %xmm12
	movlps	%xmm12, (%r9)
	movq	.LC161(%rip), %xmm12
	mulps	%xmm3, %xmm12
	movq	%xmm12, %rcx
	movaps	%xmm7, %xmm12
	mulps	%xmm14, %xmm12
	movq	%rcx, %xmm8
	movl	%r11d, %ecx
	andl	$-8, %ecx
	addl	%ecx, %edx
	addl	%ecx, %r10d
	andl	$7, %r11d
	addps	%xmm8, %xmm12
	movaps	%xmm6, %xmm8
	mulps	%xmm13, %xmm8
	addps	%xmm8, %xmm12
	movq	.LC161(%rip), %xmm8
	mulps	%xmm4, %xmm8
	addps	%xmm15, %xmm12
	movlps	%xmm12, 8(%r9)
	movaps	%xmm9, %xmm12
	mulps	%xmm14, %xmm12
	mulps	%xmm2, %xmm14
	addps	%xmm8, %xmm12
	movq	%rdi, %xmm8
	mulps	%xmm13, %xmm8
	mulps	%xmm1, %xmm13
	addps	%xmm8, %xmm12
	movaps	%xmm10, %xmm8
	addps	%xmm15, %xmm12
	movlps	%xmm12, 16(%r9)
	movq	.LC161(%rip), %xmm12
	mulps	%xmm0, %xmm12
	addps	%xmm12, %xmm14
	movq	.LC164(%rip), %xmm12
	addps	%xmm14, %xmm13
	movq	.LC165(%rip), %xmm14
	addps	%xmm15, %xmm13
	movaps	%xmm5, %xmm15
	mulps	%xmm12, %xmm15
	movlps	%xmm13, 24(%r9)
	movaps	%xmm11, %xmm13
	mulps	%xmm14, %xmm13
	subps	%xmm13, %xmm15
	movq	.LC166(%rip), %xmm13
	mulps	%xmm13, %xmm8
	mulps	%xmm13, %xmm5
	addps	%xmm8, %xmm15
	movaps	%xmm7, %xmm8
	mulps	%xmm14, %xmm8
	movlps	%xmm15, (%r8)
	movaps	%xmm3, %xmm15
	mulps	%xmm12, %xmm15
	mulps	%xmm13, %xmm3
	subps	%xmm8, %xmm15
	movaps	%xmm6, %xmm8
	mulps	%xmm13, %xmm8
	addps	%xmm8, %xmm15
	movaps	%xmm9, %xmm8
	mulps	%xmm14, %xmm8
	mulps	%xmm2, %xmm14
	movlps	%xmm15, 8(%r8)
	movaps	%xmm4, %xmm15
	mulps	%xmm12, %xmm15
	mulps	%xmm0, %xmm12
	mulps	%xmm13, %xmm4
	mulps	%xmm13, %xmm0
	subps	%xmm8, %xmm15
	movq	%rdi, %xmm8
	subps	%xmm14, %xmm12
	mulps	%xmm13, %xmm8
	movaps	%xmm1, %xmm14
	mulps	%xmm13, %xmm14
	addps	%xmm8, %xmm15
	movq	%rdi, %xmm8
	addps	%xmm14, %xmm12
	movlps	%xmm15, 16(%r8)
	movlps	%xmm12, 24(%r8)
	movq	.LC167(%rip), %xmm12
	mulps	%xmm12, %xmm11
	mulps	%xmm12, %xmm7
	mulps	%xmm12, %xmm9
	mulps	%xmm12, %xmm2
	subps	%xmm11, %xmm5
	movq	.LC168(%rip), %xmm11
	subps	%xmm7, %xmm3
	mulps	%xmm11, %xmm10
	subps	%xmm9, %xmm4
	mulps	%xmm11, %xmm6
	subps	%xmm2, %xmm0
	mulps	%xmm11, %xmm8
	mulps	%xmm11, %xmm1
	subps	%xmm10, %xmm5
	subps	%xmm6, %xmm3
	subps	%xmm8, %xmm4
	subps	%xmm1, %xmm0
	movlps	%xmm5, (%rsi)
	movlps	%xmm3, 8(%rsi)
	movlps	%xmm4, 16(%rsi)
	movlps	%xmm0, 24(%rsi)
	je	.L3786
.L3787:
	movl	52(%rsp), %esi
	movl	80(%rsp), %ecx
	pxor	%xmm0, %xmm0
	pxor	%xmm4, %xmm4
	movss	.LC146(%rip), %xmm1
	movss	.LC144(%rip), %xmm2
	pxor	%xmm3, %xmm3
	addl	%esi, %ecx
	movl	168(%rsp), %esi
	movss	.LC154(%rip), %xmm5
	imull	%esi, %ecx
	movslq	%ecx, %rcx
	movzbl	(%r15,%rcx), %esi
	cvtsi2ssl	%esi, %xmm0
	movq	176(%rsp), %rsi
	movzbl	(%rsi,%rcx), %esi
	cvtsi2ssl	%esi, %xmm4
	movq	184(%rsp), %rsi
	mulss	%xmm0, %xmm1
	movzbl	(%rsi,%rcx), %ecx
	mulss	%xmm4, %xmm2
	cvtsi2ssl	%ecx, %xmm3
	movslq	%r10d, %rcx
	mulss	%xmm4, %xmm5
	mulss	.LC157(%rip), %xmm4
	addss	%xmm2, %xmm1
	movss	.LC148(%rip), %xmm2
	mulss	%xmm3, %xmm2
	addss	%xmm2, %xmm1
	movss	.LC152(%rip), %xmm2
	subss	.LC169(%rip), %xmm1
	mulss	%xmm0, %xmm2
	mulss	.LC88(%rip), %xmm0
	movss	%xmm1, 1440(%rsp,%rcx,4)
	subss	%xmm5, %xmm2
	movss	.LC88(%rip), %xmm5
	subss	%xmm4, %xmm0
	mulss	%xmm3, %xmm5
	mulss	.LC159(%rip), %xmm3
	addss	%xmm5, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 2464(%rsp,%rcx,4)
	movss	%xmm0, 3488(%rsp,%rcx,4)
	cmpl	%edx, %ebx
	jle	.L3786
	leal	1(%r10), %ecx
	movl	144(%rsp), %ebx
	movslq	%ecx, %rcx
	movss	%xmm1, 1440(%rsp,%rcx,4)
	movss	%xmm2, 2464(%rsp,%rcx,4)
	movss	%xmm0, 3488(%rsp,%rcx,4)
	leal	2(%rdx), %ecx
	cmpl	%ecx, %ebx
	jl	.L3786
	leal	2(%r10), %ecx
	movslq	%ecx, %rcx
	movss	%xmm1, 1440(%rsp,%rcx,4)
	movss	%xmm2, 2464(%rsp,%rcx,4)
	movss	%xmm0, 3488(%rsp,%rcx,4)
	leal	3(%rdx), %ecx
	cmpl	%ecx, %ebx
	jl	.L3786
	leal	3(%r10), %ecx
	movslq	%ecx, %rcx
	movss	%xmm1, 1440(%rsp,%rcx,4)
	movss	%xmm2, 2464(%rsp,%rcx,4)
	movss	%xmm0, 3488(%rsp,%rcx,4)
	leal	4(%rdx), %ecx
	cmpl	%ecx, %ebx
	jl	.L3786
	leal	4(%r10), %ecx
	movslq	%ecx, %rcx
	movss	%xmm1, 1440(%rsp,%rcx,4)
	movss	%xmm2, 2464(%rsp,%rcx,4)
	movss	%xmm0, 3488(%rsp,%rcx,4)
	leal	5(%rdx), %ecx
	cmpl	%ecx, %ebx
	jl	.L3786
	leal	5(%r10), %ecx
	addl	$6, %edx
	movslq	%ecx, %rcx
	movss	%xmm1, 1440(%rsp,%rcx,4)
	movss	%xmm2, 2464(%rsp,%rcx,4)
	movss	%xmm0, 3488(%rsp,%rcx,4)
	cmpl	%edx, %ebx
	jl	.L3786
	leal	6(%r10), %edx
	movslq	%edx, %rdx
	movss	%xmm1, 1440(%rsp,%rdx,4)
	movss	%xmm2, 2464(%rsp,%rdx,4)
	movss	%xmm0, 3488(%rsp,%rdx,4)
	.p2align 4,,10
	.p2align 3
.L3786:
	addq	$16, 40(%rsp)
	movq	40(%rsp), %rdi
	addl	$1, 88(%rsp)
	addq	$64, 112(%rsp)
	addq	$64, 152(%rsp)
	cmpq	$256, %rdi
	je	.L3866
.L3789:
	movl	140(%rsp), %edi
	movl	88(%rsp), %esi
	cmpl	%esi, 136(%rsp)
	movl	128(%rsp), %r8d
	movl	%edi, %edx
	movl	192(%rsp), %ecx
	movl	40(%rsp), %ebp
	cmovg	%esi, %edx
	movl	48(%rsp), %esi
	subl	%edx, %edi
	testl	%r8d, %r8d
	cmovne	%edi, %edx
	movl	%edx, %edi
	imull	%esi, %edi
	movl	%edi, 80(%rsp)
	cmpl	%ecx, %esi
	jg	.L3867
	movl	148(%rsp), %edx
	jmp	.L3778
.L3865:
	pxor	%xmm3, %xmm3
	pxor	%xmm12, %xmm12
	pxor	%xmm8, %xmm8
	addl	%ebx, %edx
	imull	%r14d, %edx
	movslq	%edx, %rdx
	movzbl	(%r15,%rdx), %edi
	cvtsi2ssl	%edi, %xmm3
	movzbl	(%r10,%rdx), %edi
	movzbl	(%r9,%rdx), %edx
	cvtsi2ssl	%edi, %xmm12
	cvtsi2ssl	%edx, %xmm8
	movslq	%ebp, %rdx
	leal	2(%rcx), %ebp
	movaps	%xmm3, %xmm13
	mulss	%xmm0, %xmm13
	movaps	%xmm12, %xmm7
	mulss	%xmm11, %xmm7
	addss	%xmm13, %xmm7
	movaps	%xmm8, %xmm13
	mulss	%xmm10, %xmm13
	addss	%xmm13, %xmm7
	movaps	%xmm12, %xmm13
	mulss	%xmm4, %xmm13
	mulss	%xmm6, %xmm12
	subss	%xmm9, %xmm7
	movss	%xmm7, 1440(%rsp,%rdx,4)
	movaps	%xmm3, %xmm7
	mulss	%xmm2, %xmm7
	mulss	%xmm1, %xmm3
	subss	%xmm13, %xmm7
	movaps	%xmm8, %xmm13
	mulss	%xmm1, %xmm13
	subss	%xmm12, %xmm3
	mulss	%xmm5, %xmm8
	addss	%xmm13, %xmm7
	subss	%xmm8, %xmm3
	movss	%xmm7, 2464(%rsp,%rdx,4)
	movss	%xmm3, 3488(%rsp,%rdx,4)
	leal	2(%rsi), %edx
	cmpl	%r8d, %edx
	jge	.L3780
	pxor	%xmm3, %xmm3
	pxor	%xmm12, %xmm12
	pxor	%xmm8, %xmm8
	addl	%ebx, %edx
	imull	%r14d, %edx
	movslq	%edx, %rdx
	movzbl	(%r15,%rdx), %edi
	cvtsi2ssl	%edi, %xmm3
	movzbl	(%r10,%rdx), %edi
	movzbl	(%r9,%rdx), %edx
	cvtsi2ssl	%edi, %xmm12
	cvtsi2ssl	%edx, %xmm8
	movslq	%ebp, %rdx
	leal	3(%rcx), %ebp
	movaps	%xmm3, %xmm7
	mulss	%xmm0, %xmm7
	movaps	%xmm12, %xmm13
	mulss	%xmm11, %xmm13
	addss	%xmm13, %xmm7
	movaps	%xmm8, %xmm13
	mulss	%xmm10, %xmm13
	addss	%xmm13, %xmm7
	movaps	%xmm12, %xmm13
	mulss	%xmm4, %xmm13
	mulss	%xmm6, %xmm12
	subss	%xmm9, %xmm7
	movss	%xmm7, 1440(%rsp,%rdx,4)
	movaps	%xmm3, %xmm7
	mulss	%xmm2, %xmm7
	mulss	%xmm1, %xmm3
	subss	%xmm13, %xmm7
	movaps	%xmm8, %xmm13
	mulss	%xmm1, %xmm13
	subss	%xmm12, %xmm3
	mulss	%xmm5, %xmm8
	addss	%xmm13, %xmm7
	subss	%xmm8, %xmm3
	movss	%xmm7, 2464(%rsp,%rdx,4)
	movss	%xmm3, 3488(%rsp,%rdx,4)
	leal	3(%rsi), %edx
	cmpl	%r8d, %edx
	jge	.L3780
	pxor	%xmm3, %xmm3
	pxor	%xmm12, %xmm12
	pxor	%xmm8, %xmm8
	addl	%ebx, %edx
	imull	%r14d, %edx
	movslq	%edx, %rdx
	movzbl	(%r15,%rdx), %edi
	cvtsi2ssl	%edi, %xmm3
	movzbl	(%r10,%rdx), %edi
	movzbl	(%r9,%rdx), %edx
	cvtsi2ssl	%edi, %xmm12
	cvtsi2ssl	%edx, %xmm8
	movslq	%ebp, %rdx
	leal	4(%rcx), %ebp
	movaps	%xmm3, %xmm7
	mulss	%xmm0, %xmm7
	movaps	%xmm12, %xmm13
	mulss	%xmm11, %xmm13
	addss	%xmm13, %xmm7
	movaps	%xmm8, %xmm13
	mulss	%xmm10, %xmm13
	addss	%xmm13, %xmm7
	movaps	%xmm12, %xmm13
	mulss	%xmm4, %xmm13
	mulss	%xmm6, %xmm12
	subss	%xmm9, %xmm7
	movss	%xmm7, 1440(%rsp,%rdx,4)
	movaps	%xmm3, %xmm7
	mulss	%xmm2, %xmm7
	mulss	%xmm1, %xmm3
	subss	%xmm13, %xmm7
	movaps	%xmm8, %xmm13
	mulss	%xmm1, %xmm13
	subss	%xmm12, %xmm3
	mulss	%xmm5, %xmm8
	addss	%xmm13, %xmm7
	subss	%xmm8, %xmm3
	movss	%xmm7, 2464(%rsp,%rdx,4)
	movss	%xmm3, 3488(%rsp,%rdx,4)
	leal	4(%rsi), %edx
	cmpl	%r8d, %edx
	jge	.L3780
	pxor	%xmm3, %xmm3
	pxor	%xmm12, %xmm12
	pxor	%xmm8, %xmm8
	addl	%ebx, %edx
	imull	%r14d, %edx
	movslq	%edx, %rdx
	movzbl	(%r15,%rdx), %edi
	cvtsi2ssl	%edi, %xmm3
	movzbl	(%r10,%rdx), %edi
	movzbl	(%r9,%rdx), %edx
	cvtsi2ssl	%edi, %xmm12
	cvtsi2ssl	%edx, %xmm8
	movslq	%ebp, %rdx
	leal	5(%rcx), %ebp
	movaps	%xmm3, %xmm7
	mulss	%xmm0, %xmm7
	movaps	%xmm12, %xmm13
	mulss	%xmm11, %xmm13
	addss	%xmm13, %xmm7
	movaps	%xmm8, %xmm13
	mulss	%xmm10, %xmm13
	addss	%xmm13, %xmm7
	movaps	%xmm12, %xmm13
	mulss	%xmm4, %xmm13
	mulss	%xmm6, %xmm12
	subss	%xmm9, %xmm7
	movss	%xmm7, 1440(%rsp,%rdx,4)
	movaps	%xmm3, %xmm7
	mulss	%xmm2, %xmm7
	mulss	%xmm1, %xmm3
	subss	%xmm13, %xmm7
	movaps	%xmm8, %xmm13
	mulss	%xmm1, %xmm13
	subss	%xmm12, %xmm3
	mulss	%xmm5, %xmm8
	addss	%xmm13, %xmm7
	subss	%xmm8, %xmm3
	movss	%xmm7, 2464(%rsp,%rdx,4)
	movss	%xmm3, 3488(%rsp,%rdx,4)
	leal	5(%rsi), %edx
	cmpl	%r8d, %edx
	jge	.L3780
	pxor	%xmm3, %xmm3
	pxor	%xmm12, %xmm12
	pxor	%xmm8, %xmm8
	addl	%ebx, %edx
	imull	%r14d, %edx
	movslq	%edx, %rdx
	movzbl	(%r15,%rdx), %edi
	cvtsi2ssl	%edi, %xmm3
	movzbl	(%r10,%rdx), %edi
	movzbl	(%r9,%rdx), %edx
	cvtsi2ssl	%edi, %xmm12
	cvtsi2ssl	%edx, %xmm8
	movslq	%ebp, %rdx
	leal	6(%rcx), %ebp
	movaps	%xmm3, %xmm7
	mulss	%xmm0, %xmm7
	movaps	%xmm12, %xmm13
	mulss	%xmm11, %xmm13
	addss	%xmm13, %xmm7
	movaps	%xmm8, %xmm13
	mulss	%xmm10, %xmm13
	addss	%xmm13, %xmm7
	movaps	%xmm12, %xmm13
	mulss	%xmm4, %xmm13
	mulss	%xmm6, %xmm12
	subss	%xmm9, %xmm7
	movss	%xmm7, 1440(%rsp,%rdx,4)
	movaps	%xmm3, %xmm7
	mulss	%xmm2, %xmm7
	mulss	%xmm1, %xmm3
	subss	%xmm13, %xmm7
	movaps	%xmm8, %xmm13
	mulss	%xmm1, %xmm13
	subss	%xmm12, %xmm3
	mulss	%xmm5, %xmm8
	addss	%xmm13, %xmm7
	subss	%xmm8, %xmm3
	movss	%xmm7, 2464(%rsp,%rdx,4)
	movss	%xmm3, 3488(%rsp,%rdx,4)
	leal	6(%rsi), %edx
	cmpl	%r8d, %edx
	jge	.L3780
	pxor	%xmm3, %xmm3
	pxor	%xmm8, %xmm8
	pxor	%xmm7, %xmm7
	addl	%ebx, %edx
	imull	%r14d, %edx
	movslq	%edx, %rdx
	movzbl	(%r15,%rdx), %edi
	cvtsi2ssl	%edi, %xmm3
	movzbl	(%r10,%rdx), %edi
	movzbl	(%r9,%rdx), %edx
	cvtsi2ssl	%edi, %xmm8
	cvtsi2ssl	%edx, %xmm7
	movslq	%ebp, %rdx
	leal	7(%rcx), %ebp
	mulss	%xmm3, %xmm0
	mulss	%xmm3, %xmm2
	mulss	%xmm8, %xmm11
	mulss	%xmm7, %xmm10
	mulss	%xmm8, %xmm4
	mulss	%xmm1, %xmm3
	mulss	%xmm6, %xmm8
	addss	%xmm11, %xmm0
	subss	%xmm4, %xmm2
	addss	%xmm10, %xmm0
	subss	%xmm8, %xmm3
	subss	%xmm9, %xmm0
	movss	%xmm0, 1440(%rsp,%rdx,4)
	movaps	%xmm7, %xmm0
	mulss	%xmm1, %xmm0
	mulss	%xmm5, %xmm7
	addss	%xmm0, %xmm2
	subss	%xmm7, %xmm3
	movss	%xmm2, 2464(%rsp,%rdx,4)
	movss	%xmm3, 3488(%rsp,%rdx,4)
	leal	7(%rsi), %edx
	jmp	.L3780
.L3864:
	movq	.LC171(%rip), %xmm1
	leal	1(%rbx), %edx
	movd	%ebx, %xmm0
	movl	64(%rsp), %ebx
	movd	%edx, %xmm6
	punpckldq	%xmm6, %xmm0
	leal	1(%rbx), %edx
	paddd	%xmm1, %xmm0
	movd	%edx, %xmm6
	pshufd	$0xe5, %xmm0, %xmm5
	movd	%ebx, %xmm0
	movd	%xmm5, %ebp
	punpckldq	%xmm6, %xmm0
	paddd	%xmm1, %xmm0
	pshufd	$0xe5, %xmm0, %xmm5
	movd	%xmm5, %edx
	jmp	.L3780
.L3866:
	movq	392(%rsp), %rbx
	jmp	.L3775
.L3826:
	movl	96(%rsp), %ecx
	movl	64(%rsp), %esi
	jmp	.L3781
.L3827:
	movl	%ebp, %r10d
	xorl	%ecx, %ecx
	jmp	.L3784
.L3824:
	movl	148(%rsp), %ebx
	movl	%ebp, 96(%rsp)
	xorl	%esi, %esi
	movl	%ebx, 64(%rsp)
	jmp	.L3779
.L3863:
	movq	40(%rsp), %rbx
	movd	%ebp, %xmm0
	leal	1(%rbx), %edx
	leal	2(%rbx), %esi
	leal	3(%rbx), %ecx
	movd	%edx, %xmm5
	movd	%esi, %xmm1
	movl	172(%rsp), %ebx
	movd	%ecx, %xmm6
	punpckldq	%xmm5, %xmm0
	punpckldq	%xmm6, %xmm1
	leal	1(%rbx), %edx
	leal	2(%rbx), %esi
	punpcklqdq	%xmm1, %xmm0
	paddd	.LC170(%rip), %xmm0
	leal	3(%rbx), %ecx
	movd	%edx, %xmm5
	movd	%esi, %xmm1
	movd	%ecx, %xmm6
	pshufd	$255, %xmm0, %xmm0
	punpckldq	%xmm6, %xmm1
	movd	%xmm0, %ebp
	movd	148(%rsp), %xmm0
	punpckldq	%xmm5, %xmm0
	punpcklqdq	%xmm1, %xmm0
	paddd	.LC170(%rip), %xmm0
	pshufd	$255, %xmm0, %xmm0
	movd	%xmm0, %edx
	jmp	.L3780
.L3855:
	movq	%rcx, %rax
	jmp	.L3799
.L3854:
	movl	$100, %eax
	subl	%ecx, %eax
	addl	%eax, %eax
	jmp	.L3750
.L3856:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE816:
	.size	stbi_write_jpg_core.part.0, .-stbi_write_jpg_core.part.0
	.p2align 4
	.type	stbi__hdr_gettoken, @function
stbi__hdr_gettoken:
.LFB733:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	movq	192(%rdi), %rax
	movq	16(%rdi), %rcx
	cmpq	200(%rdi), %rax
	jb	.L3906
	movl	48(%rdi), %edi
	xorl	%r12d, %r12d
	testl	%edi, %edi
	jne	.L3907
.L3870:
	xorl	%ebp, %ebp
	cmpq	$0, 16(%rbx)
	movl	%ebp, %r14d
	je	.L3895
.L3910:
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L3896
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L3905
.L3895:
	movq	200(%rbx), %rax
	cmpq	%rax, 192(%rbx)
	jnb	.L3905
.L3896:
	cmpb	$10, %r12b
	je	.L3880
	movb	%r12b, 0(%r13,%rbp)
	cmpq	$1022, %rbp
	je	.L3888
	movq	192(%rbx), %rax
	movq	16(%rbx), %rcx
	cmpq	200(%rbx), %rax
	jb	.L3908
	movl	48(%rbx), %edx
	xorl	%r12d, %r12d
	testl	%edx, %edx
	jne	.L3909
.L3892:
	addq	$1, %rbp
	cmpq	$0, 16(%rbx)
	movl	%ebp, %r14d
	jne	.L3910
	jmp	.L3895
	.p2align 4,,10
	.p2align 3
.L3908:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r12d
	jmp	.L3892
	.p2align 4,,10
	.p2align 3
.L3905:
	movslq	%r14d, %rbp
.L3880:
	movb	$0, 0(%r13,%rbp)
	movq	%r13, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3909:
	.cfi_restore_state
	leaq	56(%rbx), %r14
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r14, %rsi
	call	*%rcx
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L3911
	cltq
	movzbl	56(%rbx), %r12d
	addq	%rax, %r14
.L3894:
	movq	%r14, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L3892
	.p2align 4,,10
	.p2align 3
.L3911:
	movl	$0, 48(%rbx)
	movq	%rdx, %r14
	movb	$0, 56(%rbx)
	jmp	.L3894
	.p2align 4,,10
	.p2align 3
.L3906:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rdi)
	movzbl	(%rax), %r12d
	jmp	.L3870
	.p2align 4,,10
	.p2align 3
.L3907:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*%rcx
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L3871
	movl	$0, 48(%rbx)
	movq	%rdx, %rbp
	movb	$0, 56(%rbx)
.L3872:
	movq	%rbp, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L3870
.L3878:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L3912
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	jne	.L3913
.L3888:
	movq	16(%rbx), %rbp
	testq	%rbp, %rbp
	je	.L3879
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L3878
	movl	48(%rbx), %esi
	testl	%esi, %esi
	je	.L3877
.L3879:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L3877
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	cmpb	$10, (%rax)
	je	.L3877
	testq	%rbp, %rbp
	jne	.L3888
	movq	200(%rbx), %rcx
.L3890:
	movq	192(%rbx), %rax
	cmpq	%rcx, %rax
	jnb	.L3877
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	cmpb	$10, (%rax)
	jne	.L3890
.L3877:
	movl	$1023, %ebp
	jmp	.L3880
	.p2align 4,,10
	.p2align 3
.L3871:
	cltq
	movzbl	56(%rbx), %r12d
	addq	%rax, %rbp
	jmp	.L3872
.L3913:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L3886
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L3888
.L3886:
	cltq
	movq	%rdx, 192(%rbx)
	addq	%rax, %rbp
	cmpb	$10, 56(%rbx)
	movq	%rbp, 200(%rbx)
	je	.L3877
	jmp	.L3888
.L3912:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	cmpb	$10, (%rax)
	jne	.L3888
	jmp	.L3877
	.cfi_endproc
.LFE733:
	.size	stbi__hdr_gettoken, .-stbi__hdr_gettoken
	.section	.rodata.str1.1
.LC174:
	.string	"FORMAT=32-bit_rle_rgbe"
	.text
	.p2align 4
	.type	stbi__hdr_info, @function
stbi__hdr_info:
.LFB736:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.LC174(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$1080, %rsp
	.cfi_def_cfa_offset 1136
	movq	%fs:40, %rax
	movq	%rax, 1064(%rsp)
	xorl	%eax, %eax
	leaq	20(%rsp), %rax
	testq	%rsi, %rsi
	leaq	32(%rsp), %r12
	cmove	%rax, %r15
	testq	%rdx, %rdx
	cmove	%rax, %r14
	testq	%rcx, %rcx
	cmovne	%rcx, %rax
	xorl	%ebx, %ebx
	movq	%rax, 8(%rsp)
	call	stbi__hdr_test
	testl	%eax, %eax
	jne	.L3918
	jmp	.L3940
	.p2align 4,,10
	.p2align 3
.L3941:
	movq	%r13, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	movl	$1, %eax
	cmove	%eax, %ebx
.L3918:
	movq	%rbp, %rdi
	movq	%r12, %rsi
	call	stbi__hdr_gettoken
	movq	%rax, 24(%rsp)
	cmpb	$0, (%rax)
	movq	%rax, %rdi
	jne	.L3941
	testl	%ebx, %ebx
	jne	.L3923
.L3940:
	movdqu	208(%rbp), %xmm0
	xorl	%ebx, %ebx
	movups	%xmm0, 192(%rbp)
.L3914:
	movq	1064(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L3942
	addq	$1080, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3923:
	.cfi_restore_state
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	stbi__hdr_gettoken
	movq	%rax, 24(%rsp)
	cmpb	$45, (%rax)
	jne	.L3940
	cmpb	$89, 1(%rax)
	jne	.L3940
	cmpb	$32, 2(%rax)
	jne	.L3940
	leaq	3(%rax), %rdi
	movl	$10, %edx
	leaq	24(%rsp), %rsi
	movq	%rdi, 24(%rsp)
	call	strtol@PLT
	movq	24(%rsp), %rdx
	movl	%eax, (%r14)
	cmpb	$32, (%rdx)
	jne	.L3927
	leaq	1(%rdx), %rax
	.p2align 4,,10
	.p2align 3
.L3928:
	movq	%rax, 24(%rsp)
	movq	%rax, %rdx
	addq	$1, %rax
	cmpb	$32, -1(%rax)
	je	.L3928
.L3927:
	cmpb	$43, (%rdx)
	jne	.L3940
	cmpb	$88, 1(%rdx)
	jne	.L3940
	cmpb	$32, 2(%rdx)
	jne	.L3940
	leaq	3(%rdx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movq	%rdi, 24(%rsp)
	call	strtol@PLT
	movl	%eax, (%r15)
	movq	8(%rsp), %rax
	movl	$3, (%rax)
	jmp	.L3914
.L3942:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE736:
	.size	stbi__hdr_info, .-stbi__hdr_info
	.section	.rodata.str1.1
.LC175:
	.string	"unsupported format"
.LC176:
	.string	"not HDR"
.LC177:
	.string	"corrupt"
	.section	.rodata.str1.8
	.align 8
.LC178:
	.string	"invalid decoded scanline length"
	.section	.rodata.str1.1
.LC179:
	.string	"unsupported data layout"
.LC180:
	.string	"#?RADIANCE"
.LC181:
	.string	"#?RGBE"
	.text
	.p2align 4
	.type	stbi__hdr_load.constprop.0, @function
stbi__hdr_load.constprop.0:
.LFB856:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$1160, %rsp
	.cfi_def_cfa_offset 1216
	movq	%rdx, 8(%rsp)
	leaq	112(%rsp), %rbx
	movl	%r8d, 56(%rsp)
	movq	%rbx, %rsi
	movq	%fs:40, %rax
	movq	%rax, 1144(%rsp)
	xorl	%eax, %eax
	call	stbi__hdr_gettoken
	leaq	.LC180(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L4050
	leaq	.LC181(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	movl	%eax, %ebp
	testl	%eax, %eax
	jne	.L4010
.L3944:
	leaq	.LC174(%rip), %r12
	jmp	.L3946
	.p2align 4,,10
	.p2align 3
.L4053:
	movq	%r12, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	movl	$1, %eax
	cmove	%eax, %ebp
.L3946:
	movq	%r13, %rdi
	movq	%rbx, %rsi
	call	stbi__hdr_gettoken
	movq	%rax, 96(%rsp)
	cmpb	$0, (%rax)
	movq	%rax, %rdi
	jne	.L4053
	leaq	.LC175(%rip), %rax
	testl	%ebp, %ebp
	je	.L3945
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	stbi__hdr_gettoken
	movq	%rax, 96(%rsp)
	cmpb	$45, (%rax)
	je	.L4054
.L3957:
	leaq	.LC179(%rip), %rax
	.p2align 4,,10
	.p2align 3
.L3945:
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%r15d, %r15d
.L3943:
	movq	1144(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L4055
	addq	$1160, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r15, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4050:
	.cfi_restore_state
	movl	%eax, %ebp
	jmp	.L3944
	.p2align 4,,10
	.p2align 3
.L4054:
	cmpb	$89, 1(%rax)
	jne	.L3957
	cmpb	$32, 2(%rax)
	jne	.L3957
	leaq	3(%rax), %rdi
	leaq	96(%rsp), %rsi
	movl	$10, %edx
	movq	%rdi, 96(%rsp)
	call	strtol@PLT
	movq	96(%rsp), %rdi
	movq	%rax, %rbx
	cmpb	$32, (%rdi)
	jne	.L3954
	leaq	1(%rdi), %rax
	.p2align 4,,10
	.p2align 3
.L3955:
	movq	%rax, 96(%rsp)
	movq	%rax, %rdi
	addq	$1, %rax
	cmpb	$32, -1(%rax)
	je	.L3955
.L3954:
	cmpb	$43, (%rdi)
	jne	.L3957
	cmpb	$88, 1(%rdi)
	jne	.L3957
	cmpb	$32, 2(%rdi)
	jne	.L3957
	addq	$3, %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%ebx, 60(%rsp)
	movq	%rdi, 96(%rsp)
	call	strtol@PLT
	movl	%eax, (%rsp)
	movq	%rax, %r10
	cmpl	$16777216, %ebx
	jg	.L3959
	cmpl	$16777216, %eax
	jg	.L3959
	movl	%eax, (%r15)
	movq	8(%rsp), %rax
	movl	%ebx, (%rax)
	testq	%r14, %r14
	je	.L3960
	movl	$3, (%r14)
.L3960:
	movl	56(%rsp), %r11d
	movl	%r10d, %eax
	orl	%ebx, %eax
	testl	%r11d, %r11d
	jne	.L3961
	testl	%eax, %eax
	js	.L3959
	testl	%ebx, %ebx
	je	.L4056
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	60(%rsp)
	movl	%eax, %ecx
	cmpl	%eax, %r10d
	jg	.L3959
	movl	%r10d, %edi
	movl	$3, 56(%rsp)
	movl	$715827882, %eax
	imull	%ebx, %edi
	jmp	.L4007
	.p2align 4,,10
	.p2align 3
.L4010:
	leaq	.LC176(%rip), %rax
	jmp	.L3945
	.p2align 4,,10
	.p2align 3
.L3961:
	testl	%eax, %eax
	js	.L3959
	testl	%ebx, %ebx
	jne	.L3964
	movl	56(%rsp), %r9d
	xorl	%edi, %edi
	testl	%r9d, %r9d
	jns	.L3962
	.p2align 4,,10
	.p2align 3
.L3959:
	leaq	.LC66(%rip), %rax
	jmp	.L3945
.L3964:
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	60(%rsp)
	movl	%eax, %ecx
	cmpl	%eax, %r10d
	jg	.L3959
	movl	56(%rsp), %r8d
	testl	%r8d, %r8d
	js	.L3959
	movl	$2147483647, %eax
	xorl	%edx, %edx
	movl	%r10d, %edi
	idivl	56(%rsp)
	imull	%ebx, %edi
.L4007:
	cmpl	%eax, %edi
	jg	.L3959
	movl	56(%rsp), %eax
	imull	%eax, %edi
	cmpl	$536870911, %edi
	jg	.L3959
	testl	%ebx, %ebx
	je	.L3962
	cmpl	%ecx, %r10d
	jle	.L3962
.L4052:
	leaq	.LC18(%rip), %rax
	jmp	.L3945
.L4056:
	movl	$3, 56(%rsp)
	xorl	%edi, %edi
.L3962:
	sall	$2, %edi
	movq	%r10, 8(%rsp)
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L4052
	movq	8(%rsp), %r10
	leal	-8(%r10), %eax
	cmpl	$32759, %eax
	ja	.L4013
	testl	%ebx, %ebx
	jle	.L3943
	movl	56(%rsp), %eax
	movl	$0, 64(%rsp)
	xorl	%r12d, %r12d
	movl	$0, 68(%rsp)
	imull	%r10d, %eax
	movq	%rbx, 80(%rsp)
	movq	%r10, 72(%rsp)
	movl	%ebp, 92(%rsp)
	movq	%r13, %rbp
	movl	%eax, 88(%rsp)
	leaq	56(%r13), %rax
	movq	%rax, 8(%rsp)
.L4003:
	movq	%rbp, %rdi
	call	stbi__get8
	movq	%rbp, %rdi
	movl	%eax, %r13d
	call	stbi__get8
	movq	%rbp, %rdi
	movl	%eax, %r14d
	call	stbi__get8
	movzbl	%al, %ebx
	cmpb	$2, %r13b
	jne	.L4045
	cmpb	$2, %r14b
	jne	.L4045
	testb	%al, %al
	js	.L4057
	movq	%rbp, %rdi
	sall	$8, %ebx
	call	stbi__get8
	movzbl	%al, %eax
	orl	%ebx, %eax
	cmpl	%eax, (%rsp)
	jne	.L4058
	testq	%r12, %r12
	je	.L4059
.L3976:
	movq	$0, 40(%rsp)
	movl	(%rsp), %edi
	testl	%edi, %edi
	je	.L4046
	movq	%r12, %r13
.L3999:
	movq	40(%rsp), %rcx
	leaq	57(%rbp), %r12
	xorl	%r14d, %r14d
	movl	(%rsp), %r10d
	movq	192(%rbp), %rax
	movq	200(%rbp), %rsi
	leaq	4(%r13,%rcx), %rcx
	movq	%rcx, 48(%rsp)
	movq	%r12, %rcx
	movl	%r14d, %r12d
	movq	%r13, %r14
	movq	%rcx, %r13
	.p2align 4,,10
	.p2align 3
.L3998:
	cmpq	%rsi, %rax
	jb	.L4060
	movl	48(%rbp), %esi
	testl	%esi, %esi
	jne	.L3980
.L4048:
	movq	%r14, %r12
.L3982:
	movq	%r15, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	leaq	.LC177(%rip), %rax
	jmp	.L3945
	.p2align 4,,10
	.p2align 3
.L4060:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rax), %ebx
	movq	%rdx, %rax
.L3979:
	cmpb	$-128, %bl
	jbe	.L3983
	cmpq	%rsi, %rax
	jb	.L4061
	movl	48(%rbp), %ecx
	xorl	%r11d, %r11d
	testl	%ecx, %ecx
	jne	.L4062
.L3985:
	addl	$-128, %ebx
	movzbl	%bl, %ebx
	cmpl	%r10d, %ebx
	jg	.L4048
	movq	40(%rsp), %rcx
	leal	0(,%r12,4), %edx
	leal	-1(%rbx), %edi
	movslq	%r12d, %r10
	movslq	%edx, %rdx
	addq	%r10, %rdi
	addq	%rcx, %rdx
	movq	48(%rsp), %rcx
	addq	%r14, %rdx
	leaq	(%rcx,%rdi,4), %rdi
	.p2align 4,,10
	.p2align 3
.L3989:
	movb	%r11b, (%rdx)
	addq	$4, %rdx
	cmpq	%rdx, %rdi
	jne	.L3989
	addl	%ebx, %r12d
.L3997:
	movl	(%rsp), %r10d
	subl	%r12d, %r10d
	testl	%r10d, %r10d
	jg	.L3998
	addq	$1, 40(%rsp)
	movq	40(%rsp), %rax
	movq	%r14, %r13
	cmpq	$4, %rax
	jne	.L3999
	movl	(%rsp), %eax
	movq	%r14, %r12
	testl	%eax, %eax
	je	.L4006
	movslq	56(%rsp), %rbx
	movslq	68(%rsp), %rax
	movq	%r14, 16(%rsp)
	movl	72(%rsp), %edx
	movq	%rbp, 24(%rsp)
	leaq	(%r15,%rax,4), %r13
	movq	%rbx, %rcx
	salq	$2, %rbx
	leaq	(%r14,%rdx,4), %rax
	movq	%r13, %rbp
	movl	%ecx, %r14d
	movq	%rbx, %r13
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L4005:
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	%r14d, %edx
	addq	$4, %r12
	call	stbi__hdr_convert
	addq	%r13, %rbp
	cmpq	%r12, %rbx
	jne	.L4005
	movq	16(%rsp), %r12
	movq	24(%rsp), %rbp
.L4006:
	addl	$1, 64(%rsp)
	movl	88(%rsp), %edx
	movl	64(%rsp), %eax
	addl	%edx, 68(%rsp)
	cmpl	%eax, 60(%rsp)
	jne	.L4003
	movq	%r12, %rdi
	call	free@PLT
	jmp	.L3943
	.p2align 4,,10
	.p2align 3
.L3983:
	testb	%bl, %bl
	je	.L4048
	movzbl	%bl, %edx
	cmpl	%r10d, %edx
	jg	.L4048
	movq	40(%rsp), %rcx
	movslq	%r12d, %r10
	leal	-1(%rdx), %edi
	movl	%r12d, 24(%rsp)
	leal	0(,%r12,4), %ebx
	addq	%r10, %rdi
	movq	%r14, 16(%rsp)
	movslq	%ebx, %rbx
	movl	%edx, 36(%rsp)
	addq	%rcx, %rbx
	movq	48(%rsp), %rcx
	addq	%r14, %rbx
	leaq	(%rcx,%rdi,4), %r10
	movq	%r10, %r12
	jmp	.L3996
	.p2align 4,,10
	.p2align 3
.L3992:
	movl	48(%rbp), %edx
	xorl	%r14d, %r14d
	testl	%edx, %edx
	jne	.L4063
.L3993:
	movb	%r14b, (%rbx)
	addq	$4, %rbx
	cmpq	%r12, %rbx
	je	.L4064
.L3996:
	cmpq	%rsi, %rax
	jnb	.L3992
	leaq	1(%rax), %rdx
	addq	$4, %rbx
	movq	%rdx, 192(%rbp)
	movzbl	(%rax), %r14d
	movq	%rdx, %rax
	movb	%r14b, -4(%rbx)
	cmpq	%r12, %rbx
	jne	.L3996
.L4064:
	movl	24(%rsp), %r12d
	movl	36(%rsp), %edx
	movq	16(%rsp), %r14
	addl	%edx, %r12d
	jmp	.L3997
	.p2align 4,,10
	.p2align 3
.L4063:
	movq	8(%rsp), %rsi
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	call	*16(%rbp)
	movslq	%eax, %rsi
	movq	192(%rbp), %rax
	subq	208(%rbp), %rax
	addl	%eax, 184(%rbp)
	movq	%r13, %rax
	testl	%esi, %esi
	jne	.L3994
	movl	$0, 48(%rbp)
	movq	%r13, %rsi
	movb	$0, 56(%rbp)
.L3995:
	movq	%rsi, 200(%rbp)
	movq	%r13, 192(%rbp)
	jmp	.L3993
	.p2align 4,,10
	.p2align 3
.L3994:
	movq	8(%rsp), %rcx
	movzbl	56(%rbp), %r14d
	addq	%rcx, %rsi
	jmp	.L3995
	.p2align 4,,10
	.p2align 3
.L3980:
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movl	%r10d, 16(%rsp)
	movq	8(%rsp), %rsi
	call	*16(%rbp)
	movl	16(%rsp), %r10d
	movslq	%eax, %rdx
	movq	192(%rbp), %rax
	subq	208(%rbp), %rax
	addl	%eax, 184(%rbp)
	testl	%edx, %edx
	movq	%r13, %rax
	jne	.L3981
	movl	$0, 48(%rbp)
	movq	%r14, %r12
	movb	$0, 56(%rbp)
	movq	%rax, 200(%rbp)
	movq	%rax, 192(%rbp)
	jmp	.L3982
	.p2align 4,,10
	.p2align 3
.L4061:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rax), %r11d
	movq	%rdx, %rax
	jmp	.L3985
	.p2align 4,,10
	.p2align 3
.L3981:
	movq	8(%rsp), %rcx
	movzbl	56(%rbp), %ebx
	movq	%r13, 192(%rbp)
	leaq	(%rcx,%rdx), %rsi
	movq	%rsi, 200(%rbp)
	jmp	.L3979
.L4013:
	xorl	%r12d, %r12d
	cmpl	%r12d, %ebx
	jle	.L3943
.L4065:
	leal	1(%r12), %ebp
	xorl	%r8d, %r8d
.L3972:
	cmpl	%r8d, %r10d
	jg	.L3971
	movl	%ebp, %r12d
	cmpl	%r12d, %ebx
	jle	.L3943
	jmp	.L4065
.L4062:
	leaq	56(%rbp), %rsi
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movl	%r10d, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movb	%r11b, 36(%rsp)
	call	*16(%rbp)
	movq	16(%rsp), %rsi
	movl	24(%rsp), %r10d
	movslq	%eax, %rdx
	movq	192(%rbp), %rax
	subq	208(%rbp), %rax
	addl	%eax, 184(%rbp)
	testl	%edx, %edx
	leaq	57(%rbp), %rax
	jne	.L3986
	movl	$0, 48(%rbp)
	movzbl	36(%rsp), %r11d
	movq	%rax, %rsi
	movb	$0, 56(%rbp)
.L3987:
	movq	%rsi, 200(%rbp)
	movq	%rax, 192(%rbp)
	jmp	.L3985
.L3986:
	movzbl	56(%rbp), %r11d
	addq	%rdx, %rsi
	jmp	.L3987
.L3971:
	movl	%r12d, %r14d
	movl	56(%rsp), %eax
	leaq	108(%rsp), %rsi
	imull	%r10d, %r14d
	imull	%eax, %r14d
	imull	%r8d, %eax
	addl	$1, %r8d
	movslq	%r14d, %r14
	movl	%eax, %ecx
.L3970:
	movl	$4, %edx
	movq	%r13, %rdi
	movl	%r8d, 16(%rsp)
	movq	%r10, 8(%rsp)
	movl	%ecx, 24(%rsp)
	movq	%rsi, (%rsp)
	call	stbi__getn
	movslq	24(%rsp), %rax
	movl	56(%rsp), %edx
	movq	(%rsp), %rsi
	addq	%r14, %rax
	leaq	(%r15,%rax,4), %rdi
	call	stbi__hdr_convert
	movl	16(%rsp), %r8d
	movq	8(%rsp), %r10
	jmp	.L3972
.L4059:
	movl	(%rsp), %eax
	leal	0(,%rax,4), %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L3976
	movq	%r15, %rdi
	call	free@PLT
	jmp	.L4052
	.p2align 4,,10
	.p2align 3
.L4046:
	xorl	%eax, %eax
.L4040:
	addq	$1, %rax
	cmpq	$4, %rax
	jne	.L4040
	jmp	.L4006
.L4058:
	movq	%r15, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	leaq	.LC178(%rip), %rax
	jmp	.L3945
.L4057:
	movq	%rbp, %r13
	movq	80(%rsp), %rbx
	movq	72(%rsp), %r10
	movl	$2, %edx
	movl	92(%rsp), %ebp
.L3973:
	movq	%r13, %rdi
	movq	%r10, 8(%rsp)
	movb	%dl, 108(%rsp)
	movb	%r14b, 109(%rsp)
	movb	%al, 110(%rsp)
	call	stbi__get8
	movl	56(%rsp), %r14d
	leaq	108(%rsp), %rsi
	movq	%r15, %rdi
	movq	%rsi, (%rsp)
	movl	%r14d, %edx
	movb	%al, 111(%rsp)
	call	stbi__hdr_convert
	movq	%r12, %rdi
	xorl	%r12d, %r12d
	call	free@PLT
	movl	%r14d, %ecx
	movq	(%rsp), %rsi
	movq	8(%rsp), %r10
	movl	$2, %r8d
	xorl	%r14d, %r14d
	jmp	.L3970
.L4045:
	movl	%r13d, %edx
	movq	80(%rsp), %rbx
	movq	%rbp, %r13
	movq	72(%rsp), %r10
	movl	92(%rsp), %ebp
	jmp	.L3973
.L4055:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE856:
	.size	stbi__hdr_load.constprop.0, .-stbi__hdr_load.constprop.0
	.section	.rodata.str1.1
.LC182:
	.string	"not PSD"
.LC183:
	.string	"wrong version"
.LC184:
	.string	"wrong channel count"
.LC185:
	.string	"unsupported bit depth"
.LC186:
	.string	"wrong color format"
	.text
	.p2align 4
	.type	stbi__psd_load, @function
stbi__psd_load:
.LFB711:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r8d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r9, %rbx
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%rdx, 8(%rsp)
	call	stbi__get32be
	cmpl	$943870035, %eax
	jne	.L4205
	movq	%r14, %rdi
	call	stbi__get16be
	cmpl	$1, %eax
	jne	.L4206
	cmpq	$0, 16(%r14)
	movq	192(%r14), %rax
	je	.L4071
	movq	200(%r14), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	$5, %edx
	jle	.L4207
.L4071:
	addq	$6, %rax
	movq	%rax, 192(%r14)
.L4072:
	movq	%r14, %rdi
	call	stbi__get16be
	movl	%eax, 20(%rsp)
	cmpl	$16, %eax
	ja	.L4208
	movq	%r14, %rdi
	call	stbi__get32be
	movq	%r14, %rdi
	movl	%eax, 48(%rsp)
	movl	%eax, %r13d
	call	stbi__get32be
	movl	%eax, 16(%rsp)
	cmpl	$16777216, %r13d
	jg	.L4075
	cmpl	$16777216, 16(%rsp)
	jg	.L4075
	movq	%r14, %rdi
	call	stbi__get16be
	movl	%eax, %r13d
	leal	-8(%rax), %eax
	andl	$-9, %eax
	jne	.L4209
	movq	%r14, %rdi
	call	stbi__get16be
	cmpl	$3, %eax
	jne	.L4210
	movq	%r14, %rdi
	call	stbi__get32be
	testl	%eax, %eax
	je	.L4078
	js	.L4211
	movl	%eax, %esi
	movq	%r14, %rdi
	call	stbi__skip.part.0
.L4078:
	movq	%r14, %rdi
	call	stbi__get32be
	testl	%eax, %eax
	je	.L4080
	js	.L4212
	movl	%eax, %esi
	movq	%r14, %rdi
	call	stbi__skip.part.0
.L4080:
	movq	%r14, %rdi
	call	stbi__get32be
	testl	%eax, %eax
	je	.L4082
	js	.L4213
	movl	%eax, %esi
	movq	%r14, %rdi
	call	stbi__skip.part.0
.L4082:
	movq	%r14, %rdi
	call	stbi__get16be
	movl	%eax, %ecx
	cmpl	$1, %eax
	jg	.L4214
	movl	16(%rsp), %edi
	testl	%edi, %edi
	js	.L4075
	je	.L4215
	movl	48(%rsp), %eax
	testl	%eax, %eax
	js	.L4075
	je	.L4086
	movl	%eax, %edi
	xorl	%edx, %edx
	movl	$2147483647, %eax
	movl	16(%rsp), %esi
	idivl	%edi
	sall	$2, %esi
	cmpl	%eax, %esi
	jg	.L4075
.L4086:
	cmpl	$16, %r13d
	sete	%dl
	cmpl	$16, 160(%rsp)
	sete	%al
	andl	%eax, %edx
	movb	%dl, 24(%rsp)
	testl	%ecx, %ecx
	jne	.L4087
	testb	%dl, %dl
	jne	.L4216
.L4087:
	movl	48(%rsp), %r9d
	movl	16(%rsp), %eax
	movl	%ecx, 40(%rsp)
	imull	%eax, %r9d
	leal	0(,%r9,4), %edi
	movl	%r9d, 32(%rsp)
	movslq	%edi, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L4090
	movl	40(%rsp), %ecx
	movl	32(%rsp), %r9d
	testl	%ecx, %ecx
	je	.L4089
	movl	20(%rsp), %esi
	movl	48(%rsp), %ecx
	imull	%ecx, %esi
	testl	%esi, %esi
	je	.L4093
	addl	%esi, %esi
	js	.L4217
	movq	%r14, %rdi
	movq	%rax, 32(%rsp)
	movl	%r9d, 24(%rsp)
	call	stbi__skip.part.0
	movq	32(%rsp), %rax
	movl	24(%rsp), %r9d
.L4093:
	movslq	%r9d, %r8
	leaq	56(%r14), %rsi
	movl	%r9d, 32(%rsp)
	xorl	%edx, %edx
	movq	%rsi, 24(%rsp)
	leaq	(%rax,%r8,4), %rcx
	movq	%rbp, 64(%rsp)
	movq	%r8, 88(%rsp)
	movq	%r15, 56(%rsp)
	movq	%r14, %r15
	movl	%r12d, 72(%rsp)
	movq	%rcx, %r12
	movq	%rbx, 80(%rsp)
	movq	%rdx, %rbx
.L4097:
	leaq	(%rax,%rbx), %r14
	xorl	%ebp, %ebp
	cmpl	%ebx, 20(%rsp)
	jle	.L4218
	movq	%rbx, 40(%rsp)
	movq	%r15, %rbx
	movq	%rax, %r15
.L4095:
	movl	32(%rsp), %r13d
	subl	%ebp, %r13d
	testl	%r13d, %r13d
	jle	.L4198
.L4104:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4219
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L4220
.L4102:
	movl	$1, %edx
	movl	$1, %eax
.L4140:
	cltq
	addl	%edx, %ebp
	leaq	(%r14,%rax,4), %r13
	.p2align 4,,10
	.p2align 3
.L4107:
	movq	%rbx, %rdi
	addq	$4, %r14
	call	stbi__get8
	movb	%al, -4(%r14)
	cmpq	%r14, %r13
	jne	.L4107
	jmp	.L4095
	.p2align 4,,10
	.p2align 3
.L4206:
	leaq	.LC183(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L4068:
	xorl	%eax, %eax
.L4066:
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4205:
	.cfi_restore_state
	leaq	.LC182(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4068
	.p2align 4,,10
	.p2align 3
.L4207:
	movl	$6, %esi
	movq	%rcx, 192(%r14)
	movq	40(%r14), %rdi
	subl	%edx, %esi
	call	*24(%r14)
	jmp	.L4072
.L4215:
	movl	48(%rsp), %esi
	testl	%esi, %esi
	jns	.L4086
	.p2align 4,,10
	.p2align 3
.L4075:
	leaq	.LC66(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4068
	.p2align 4,,10
	.p2align 3
.L4208:
	leaq	.LC184(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4068
	.p2align 4,,10
	.p2align 3
.L4210:
	leaq	.LC186(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4068
	.p2align 4,,10
	.p2align 3
.L4219:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %ecx
.L4101:
	cmpl	$128, %ecx
	je	.L4104
	movl	%ecx, %eax
	cmpl	$127, %ecx
	jle	.L4221
	movl	$257, %edx
	subl	%ecx, %edx
	cmpl	%edx, %r13d
	movl	%edx, 52(%rsp)
	jl	.L4106
	movq	%rbx, %rdi
	call	stbi__get8
	movl	52(%rsp), %edx
	addl	%edx, %ebp
	leaq	(%r14,%rdx,4), %rdx
	.p2align 4,,10
	.p2align 3
.L4109:
	movb	%al, (%r14)
	addq	$4, %r14
	cmpq	%r14, %rdx
	jne	.L4109
	jmp	.L4095
	.p2align 4,,10
	.p2align 3
.L4220:
	movl	52(%rbx), %edx
	movq	24(%rsp), %rsi
	movq	40(%rbx), %rdi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rsi
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L4103
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rsi, 200(%rbx)
	movq	%rsi, 192(%rbx)
	jmp	.L4102
	.p2align 4,,10
	.p2align 3
.L4209:
	leaq	.LC185(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4068
	.p2align 4,,10
	.p2align 3
.L4103:
	movslq	%eax, %rdx
	movq	24(%rsp), %rax
	movq	%rsi, 192(%rbx)
	movzbl	56(%rbx), %ecx
	addq	%rax, %rdx
	movq	%rdx, 200(%rbx)
	jmp	.L4101
	.p2align 4,,10
	.p2align 3
.L4218:
	cmpl	$3, %ebx
	movl	32(%rsp), %edx
	sete	%sil
	negl	%esi
	testl	%edx, %edx
	jle	.L4100
	.p2align 4,,10
	.p2align 3
.L4099:
	movb	%sil, (%r14)
	addq	$4, %r14
	cmpq	%r12, %r14
	jne	.L4099
.L4100:
	addq	$1, %rbx
	addq	$1, %r12
	cmpq	$4, %rbx
	jne	.L4097
	movl	32(%rsp), %r9d
	movq	56(%rsp), %r15
	movq	64(%rsp), %rbp
	movl	72(%rsp), %r12d
	movq	80(%rsp), %rbx
	movq	88(%rsp), %r8
.L4098:
	movl	%r12d, %esi
	andl	$-5, %esi
	cmpl	$3, 20(%rsp)
	jg	.L4122
	testl	%esi, %esi
	je	.L4124
	cmpl	$16, (%rbx)
	je	.L4138
.L4135:
	movl	48(%rsp), %r8d
	movl	16(%rsp), %ecx
	movl	%r12d, %edx
	movq	%rax, %rdi
	movl	$4, %esi
	call	stbi__convert_format
.L4136:
	testq	%rax, %rax
	je	.L4068
.L4124:
	testq	%rbp, %rbp
	je	.L4137
	movl	$4, 0(%rbp)
.L4137:
	movq	8(%rsp), %rsi
	movl	48(%rsp), %ecx
	movl	%ecx, (%rsi)
	movl	16(%rsp), %esi
	movl	%esi, (%r15)
	jmp	.L4066
.L4216:
	movl	48(%rsp), %edx
	movl	16(%rsp), %esi
	movl	$8, %edi
	call	stbi__malloc_mad3
	movl	$16, (%rbx)
	testq	%rax, %rax
	je	.L4090
	movl	48(%rsp), %r9d
	movl	16(%rsp), %esi
	imull	%esi, %r9d
.L4089:
	movslq	%r9d, %r8
	movl	%r12d, 80(%rsp)
	xorl	%ecx, %ecx
	movq	%rbx, %r10
	movq	%r8, 88(%rsp)
	leaq	(%rax,%r8,4), %rdx
	leaq	(%rax,%r8,8), %rsi
	movq	%rcx, %rbx
	movl	%r13d, 32(%rsp)
	movq	%rsi, %r13
	movq	%r15, 64(%rsp)
	movq	%rax, %r15
	movq	%rbp, 72(%rsp)
	movq	%rdx, %rbp
	movl	%r9d, %edx
.L4092:
	cmpl	%ebx, 20(%rsp)
	jg	.L4112
	cmpl	$3, %ebx
	sete	%r11b
	cmpb	$0, 24(%rsp)
	je	.L4113
	movzbl	%r11b, %r11d
	movq	%r15, %r8
	negl	%r11d
	testl	%edx, %edx
	jle	.L4115
	.p2align 4,,10
	.p2align 3
.L4114:
	movw	%r11w, (%r8)
	addq	$8, %r8
	cmpq	%r13, %r8
	jne	.L4114
.L4115:
	addq	$1, %rbx
	addq	$2, %r15
	addq	$2, %r13
	addq	$1, %rbp
	cmpq	$4, %rbx
	jne	.L4092
	movq	64(%rsp), %r15
	movq	72(%rsp), %rbp
	movl	%edx, %r9d
	movq	%r10, %rbx
	movl	80(%rsp), %r12d
	movq	88(%rsp), %r8
	jmp	.L4098
	.p2align 4,,10
	.p2align 3
.L4112:
	cmpl	$16, (%r10)
	je	.L4222
	cmpl	$16, 32(%rsp)
	leaq	(%rax,%rbx), %r12
	je	.L4119
	testl	%edx, %edx
	jle	.L4115
	movl	%edx, 52(%rsp)
	movq	%r10, 56(%rsp)
	movq	%rbx, 40(%rsp)
	movq	%r12, %rbx
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L4120:
	movq	%r14, %rdi
	addq	$4, %rbx
	call	stbi__get8
	movb	%al, -4(%rbx)
	cmpq	%rbp, %rbx
	jne	.L4120
.L4203:
	movq	40(%rsp), %rbx
	movl	52(%rsp), %edx
	movq	%r12, %rax
	movq	56(%rsp), %r10
	jmp	.L4115
	.p2align 4,,10
	.p2align 3
.L4113:
	leaq	(%rax,%rbx), %r8
	negl	%r11d
	testl	%edx, %edx
	jle	.L4115
	.p2align 4,,10
	.p2align 3
.L4116:
	movb	%r11b, (%r8)
	addq	$4, %r8
	cmpq	%rbp, %r8
	jne	.L4116
	jmp	.L4115
	.p2align 4,,10
	.p2align 3
.L4122:
	cmpl	$16, (%rbx)
	je	.L4125
	movss	.LC188(%rip), %xmm4
	movss	.LC42(%rip), %xmm3
	movq	%rax, %rdx
	leaq	(%rax,%r8,4), %rdi
	testl	%r9d, %r9d
	jle	.L4194
	.p2align 4,,10
	.p2align 3
.L4133:
	movzbl	3(%rdx), %ecx
	leal	-1(%rcx), %r8d
	cmpb	$-3, %r8b
	ja	.L4132
	pxor	%xmm0, %xmm0
	movaps	%xmm3, %xmm2
	movaps	%xmm3, %xmm1
	cvtsi2ssl	%ecx, %xmm0
	movzbl	(%rdx), %ecx
	divss	%xmm4, %xmm0
	divss	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	subss	%xmm2, %xmm1
	mulss	%xmm2, %xmm0
	mulss	%xmm4, %xmm1
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %ecx
	pxor	%xmm0, %xmm0
	movb	%cl, (%rdx)
	movzbl	1(%rdx), %ecx
	cvtsi2ssl	%ecx, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %ecx
	pxor	%xmm0, %xmm0
	movb	%cl, 1(%rdx)
	movzbl	2(%rdx), %ecx
	cvtsi2ssl	%ecx, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %ecx
	movb	%cl, 2(%rdx)
.L4132:
	addq	$4, %rdx
	cmpq	%rdx, %rdi
	jne	.L4133
.L4194:
	testl	%esi, %esi
	jne	.L4135
	jmp	.L4124
	.p2align 4,,10
	.p2align 3
.L4214:
	leaq	.LC81(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4068
.L4119:
	testl	%edx, %edx
	jle	.L4115
	movl	%edx, 52(%rsp)
	movq	%r10, 56(%rsp)
	movq	%rbx, 40(%rsp)
	movq	%r12, %rbx
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L4121:
	movq	%r14, %rdi
	addq	$4, %rbx
	call	stbi__get16be
	movb	%ah, -4(%rbx)
	cmpq	%rbp, %rbx
	jne	.L4121
	jmp	.L4203
.L4211:
	movq	200(%r14), %rax
	movq	%rax, 192(%r14)
	jmp	.L4078
.L4212:
	movq	200(%r14), %rax
	movq	%rax, 192(%r14)
	jmp	.L4080
.L4213:
	movq	200(%r14), %rax
	movq	%rax, 192(%r14)
	jmp	.L4082
.L4222:
	testl	%edx, %edx
	jle	.L4115
	movl	%edx, 52(%rsp)
	movq	%rax, %r12
	movq	%r10, 56(%rsp)
	movq	%rbx, 40(%rsp)
	movq	%r15, %rbx
	.p2align 4,,10
	.p2align 3
.L4118:
	movq	%r14, %rdi
	addq	$8, %rbx
	call	stbi__get16be
	movw	%ax, -8(%rbx)
	cmpq	%r13, %rbx
	jne	.L4118
	jmp	.L4203
.L4125:
	testl	%r9d, %r9d
	jle	.L4193
	movss	.LC187(%rip), %xmm4
	movss	.LC42(%rip), %xmm3
	movq	%rax, %rdx
	leaq	(%rax,%r8,8), %rdi
	.p2align 4,,10
	.p2align 3
.L4130:
	movzwl	6(%rdx), %ecx
	leal	-1(%rcx), %r8d
	cmpw	$-3, %r8w
	ja	.L4129
	pxor	%xmm0, %xmm0
	movaps	%xmm3, %xmm2
	movaps	%xmm3, %xmm1
	cvtsi2ssl	%ecx, %xmm0
	movzwl	(%rdx), %ecx
	divss	%xmm4, %xmm0
	divss	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	subss	%xmm2, %xmm1
	mulss	%xmm2, %xmm0
	mulss	%xmm4, %xmm1
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %ecx
	pxor	%xmm0, %xmm0
	movw	%cx, (%rdx)
	movzwl	2(%rdx), %ecx
	cvtsi2ssl	%ecx, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %ecx
	pxor	%xmm0, %xmm0
	movw	%cx, 2(%rdx)
	movzwl	4(%rdx), %ecx
	cvtsi2ssl	%ecx, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %ecx
	movw	%cx, 4(%rdx)
.L4129:
	addq	$8, %rdx
	cmpq	%rdi, %rdx
	jne	.L4130
.L4193:
	testl	%esi, %esi
	je	.L4124
.L4138:
	movl	48(%rsp), %r8d
	movl	16(%rsp), %ecx
	movl	%r12d, %edx
	movq	%rax, %rdi
	movl	$4, %esi
	call	stbi__convert_format16
	jmp	.L4136
.L4198:
	movq	%r15, %rax
	movq	%rbx, %r15
	movq	40(%rsp), %rbx
	jmp	.L4100
.L4217:
	movq	200(%r14), %rdx
	movq	%rdx, 192(%r14)
	jmp	.L4093
.L4221:
	addl	$1, %eax
	movl	%eax, %edx
	cmpl	%r13d, %eax
	jle	.L4140
.L4106:
	movq	%r15, %rdi
	call	free@PLT
	leaq	.LC177(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4068
.L4090:
	leaq	.LC18(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4068
	.cfi_endproc
.LFE711:
	.size	stbi__psd_load, .-stbi__psd_load
	.p2align 4
	.type	stbi__gif_test_raw, @function
stbi__gif_test_raw:
.LFB719:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L4238
	movl	48(%rdi), %ecx
	testl	%ecx, %ecx
	jne	.L4226
.L4229:
	xorl	%eax, %eax
.L4223:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4238:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %edx
.L4225:
	cmpb	$71, %dl
	jne	.L4229
	cmpq	%rax, %rcx
	jb	.L4239
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L4229
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L4232
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L4229
	.p2align 4,,10
	.p2align 3
.L4226:
	leaq	56(%rdi), %rbp
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L4237
	cltq
	movq	%rcx, 192(%rbx)
	movzbl	56(%rbx), %edx
	addq	%rbp, %rax
	movq	%rax, 200(%rbx)
	jmp	.L4225
	.p2align 4,,10
	.p2align 3
.L4239:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rcx), %ecx
.L4231:
	cmpb	$73, %cl
	jne	.L4229
	cmpq	%rax, %rdx
	jb	.L4240
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L4229
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L4237
	cltq
	movq	%rcx, 192(%rbx)
	movzbl	56(%rbx), %edx
	addq	%rax, %rbp
	movq	%rbp, 200(%rbx)
	.p2align 4,,10
	.p2align 3
.L4234:
	cmpb	$70, %dl
	jne	.L4229
	movq	%rbx, %rdi
	call	stbi__get8
	cmpb	$56, %al
	jne	.L4229
	movq	%rbx, %rdi
	call	stbi__get8
	subl	$55, %eax
	testb	$-3, %al
	jne	.L4229
	movq	%rbx, %rdi
	call	stbi__get8
	cmpb	$97, %al
	sete	%al
	movzbl	%al, %eax
	jmp	.L4223
	.p2align 4,,10
	.p2align 3
.L4237:
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
	jmp	.L4229
	.p2align 4,,10
	.p2align 3
.L4240:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %edx
	jmp	.L4234
	.p2align 4,,10
	.p2align 3
.L4232:
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %ecx
	addq	%rbp, %rax
	movq	%rax, 200(%rbx)
	jmp	.L4231
	.cfi_endproc
.LFE719:
	.size	stbi__gif_test_raw, .-stbi__gif_test_raw
	.section	.rodata.str1.1
.LC190:
	.string	"no SOI"
.LC191:
	.string	"no SOF"
.LC192:
	.string	"bad SOF len"
.LC193:
	.string	"only 8-bit"
.LC194:
	.string	"no header height"
.LC195:
	.string	"0 width"
.LC196:
	.string	"bad component count"
.LC197:
	.string	"bad H"
.LC198:
	.string	"bad V"
.LC199:
	.string	"bad TQ"
	.text
	.p2align 4
	.type	stbi__decode_jpeg_header, @function
stbi__decode_jpeg_header:
.LFB635:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	.LC189(%rip), %rax
	movq	(%rdi), %r12
	movb	$-1, 18472(%rdi)
	movq	%rax, 18504(%rdi)
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L4372
	movl	48(%r12), %edi
	testl	%edi, %edi
	jne	.L4244
	.p2align 4,,10
	.p2align 3
.L4247:
	leaq	.LC190(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L4245:
	xorl	%eax, %eax
	jmp	.L4241
	.p2align 4,,10
	.p2align 3
.L4372:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
.L4243:
	cmpb	$-1, %dl
	jne	.L4247
	.p2align 4,,10
	.p2align 3
.L4251:
	movq	(%rbx), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L4373
	movl	48(%r12), %esi
	testl	%esi, %esi
	je	.L4247
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	je	.L4365
	cltq
	movq	%rcx, 192(%r12)
	movzbl	56(%r12), %edx
	addq	%rax, %r13
	movq	%r13, 200(%r12)
	.p2align 4,,10
	.p2align 3
.L4249:
	cmpb	$-1, %dl
	je	.L4251
	cmpb	$-40, %dl
	jne	.L4247
	cmpl	$1, %ebp
	je	.L4321
	movzbl	18472(%rbx), %esi
	cmpb	$-1, %sil
	je	.L4254
	movb	$-1, 18472(%rbx)
.L4363:
	leal	-192(%rsi), %eax
	.p2align 4,,10
	.p2align 3
.L4266:
	cmpl	$2, %eax
	ja	.L4290
	movq	(%rbx), %r12
	xorl	%eax, %eax
	cmpl	$194, %esi
	sete	%al
	movl	%eax, 18480(%rbx)
	movq	192(%r12), %rdx
	movq	200(%r12), %rax
	cmpq	%rax, %rdx
	jb	.L4374
	movl	48(%r12), %eax
	testl	%eax, %eax
	jne	.L4375
.L4314:
	leaq	.LC192(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4241
	.p2align 4,,10
	.p2align 3
.L4265:
	movq	(%rbx), %rdi
	call	stbi__get8
	cmpb	$-1, %al
	jne	.L4368
.L4274:
	movq	(%rbx), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L4376
	movl	48(%r12), %edx
	testl	%edx, %edx
	jne	.L4270
	.p2align 4,,10
	.p2align 3
.L4273:
	xorl	%esi, %esi
.L4290:
	movq	%rbx, %rdi
	call	stbi__process_marker
	testl	%eax, %eax
	je	.L4245
	movzbl	18472(%rbx), %esi
	cmpb	$-1, %sil
	je	.L4265
.L4369:
	movb	$-1, 18472(%rbx)
	leal	-192(%rsi), %eax
	jmp	.L4266
	.p2align 4,,10
	.p2align 3
.L4373:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
	jmp	.L4249
	.p2align 4,,10
	.p2align 3
.L4321:
	movl	$1, %eax
.L4241:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4365:
	.cfi_restore_state
	leaq	.LC190(%rip), %rax
	movb	$0, 56(%r12)
	movl	$0, 48(%r12)
	movq	%rcx, 200(%r12)
	movq	%rcx, 192(%r12)
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4245
	.p2align 4,,10
	.p2align 3
.L4270:
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	jne	.L4272
	.p2align 4,,10
	.p2align 3
.L4367:
	movl	$0, 48(%r12)
	xorl	%esi, %esi
	movb	$0, 56(%r12)
	movq	%rdx, 200(%r12)
	movq	%rdx, 192(%r12)
	jmp	.L4290
	.p2align 4,,10
	.p2align 3
.L4378:
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	jne	.L4283
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rcx, 200(%r12)
	movq	%rcx, 192(%r12)
.L4368:
	movq	(%rbx), %r12
.L4267:
	cmpq	$0, 16(%r12)
	je	.L4278
	movq	40(%r12), %rdi
	call	*32(%r12)
	testl	%eax, %eax
	je	.L4277
	movl	48(%r12), %eax
	testl	%eax, %eax
	je	.L4276
.L4278:
	movq	200(%r12), %rax
	cmpq	%rax, 192(%r12)
	jnb	.L4276
.L4277:
	movzbl	18472(%rbx), %esi
	cmpb	$-1, %sil
	jne	.L4369
	movq	(%rbx), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L4377
	movl	48(%r12), %eax
	testl	%eax, %eax
	je	.L4267
	jmp	.L4378
	.p2align 4,,10
	.p2align 3
.L4276:
	leaq	.LC191(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4241
	.p2align 4,,10
	.p2align 3
.L4376:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %esi
.L4269:
	cmpb	$-1, %sil
	je	.L4274
	jmp	.L4363
	.p2align 4,,10
	.p2align 3
.L4377:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
.L4281:
	cmpb	$-1, %dl
	jne	.L4267
	.p2align 4,,10
	.p2align 3
.L4289:
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L4379
	movl	48(%r12), %eax
	testl	%eax, %eax
	je	.L4273
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	je	.L4367
	cltq
	movq	%rdx, 192(%r12)
	movzbl	56(%r12), %esi
	addq	%rax, %r13
	movq	%r13, 200(%r12)
	.p2align 4,,10
	.p2align 3
.L4286:
	cmpb	$-1, %sil
	jne	.L4363
	movq	(%rbx), %r12
	jmp	.L4289
	.p2align 4,,10
	.p2align 3
.L4379:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %esi
	jmp	.L4286
	.p2align 4,,10
	.p2align 3
.L4254:
	movq	(%rbx), %rdi
	call	stbi__get8
	cmpb	$-1, %al
	jne	.L4340
.L4262:
	movq	(%rbx), %r12
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L4380
	movl	48(%r12), %ecx
	testl	%ecx, %ecx
	je	.L4273
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	je	.L4367
	cltq
	movq	%rdx, 192(%r12)
	movzbl	56(%r12), %esi
	addq	%rax, %r13
	movq	%r13, 200(%r12)
	jmp	.L4258
	.p2align 4,,10
	.p2align 3
.L4380:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %esi
.L4258:
	cmpb	$-1, %sil
	je	.L4262
	jmp	.L4363
	.p2align 4,,10
	.p2align 3
.L4244:
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	je	.L4365
	cltq
	movq	%rcx, 192(%r12)
	movzbl	56(%r12), %edx
	addq	%rax, %r13
	movq	%r13, 200(%r12)
	jmp	.L4243
	.p2align 4,,10
	.p2align 3
.L4272:
	cltq
	movq	%rdx, 192(%r12)
	movzbl	56(%r12), %esi
	addq	%rax, %r13
	movq	%r13, 200(%r12)
	jmp	.L4269
	.p2align 4,,10
	.p2align 3
.L4283:
	cltq
	movq	%rcx, 192(%r12)
	movzbl	56(%r12), %edx
	addq	%rax, %r13
	movq	%r13, 200(%r12)
	movq	(%rbx), %r12
	jmp	.L4281
	.p2align 4,,10
	.p2align 3
.L4340:
	movl	$255, %esi
	jmp	.L4290
.L4374:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r12)
	movzbl	(%rdx), %edx
.L4292:
	sall	$8, %edx
	movl	%edx, %r14d
	cmpq	%rax, %rcx
	jnb	.L4296
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rcx), %ecx
.L4297:
	leal	(%rcx,%r14), %r13d
	cmpl	$10, %r13d
	jle	.L4314
	cmpq	%rax, %rdx
	jnb	.L4302
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r12)
	movzbl	(%rdx), %eax
.L4303:
	cmpb	$8, %al
	jne	.L4307
	movq	%r12, %rdi
	call	stbi__get16be
	movl	%eax, 4(%r12)
	testl	%eax, %eax
	jne	.L4308
	leaq	.LC194(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4241
.L4296:
	movl	48(%r12), %r15d
	testl	%r15d, %r15d
	jne	.L4381
	cmpl	$10, %edx
	jle	.L4314
.L4307:
	leaq	.LC193(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4241
.L4302:
	movl	48(%r12), %r11d
	testl	%r11d, %r11d
	je	.L4307
	leaq	56(%r12), %r14
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r14, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	jne	.L4305
	xorl	%r10d, %r10d
	movb	$0, 56(%r12)
	movq	%rdx, %r14
	movl	%r10d, 48(%r12)
.L4306:
	movq	%r14, 200(%r12)
	movzbl	56(%r12), %eax
	movq	%rdx, 192(%r12)
	jmp	.L4303
.L4375:
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	jne	.L4294
	movb	$0, 56(%r12)
	xorl	%eax, %eax
	movl	%eax, 48(%r12)
	movq	%rcx, %rax
.L4295:
	movq	%rax, 200(%r12)
	movzbl	56(%r12), %edx
	movq	%rcx, 192(%r12)
	jmp	.L4292
.L4381:
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	jne	.L4299
	xorl	%r13d, %r13d
	movb	$0, 56(%r12)
	movq	%rdx, %rax
	movl	%r13d, 48(%r12)
.L4300:
	movq	%rax, 200(%r12)
	movzbl	56(%r12), %ecx
	movq	%rdx, 192(%r12)
	jmp	.L4297
.L4308:
	movq	%r12, %rdi
	call	stbi__get16be
	movl	%eax, (%r12)
	testl	%eax, %eax
	je	.L4382
	cmpl	$16777216, 4(%r12)
	ja	.L4311
	cmpl	$16777216, %eax
	ja	.L4311
	movq	%r12, %rdi
	call	stbi__get8
	movl	%eax, %edx
	movzbl	%al, %eax
	subl	$3, %edx
	cmpb	$1, %dl
	jbe	.L4312
	cmpl	$1, %eax
	jne	.L4383
.L4312:
	movl	%eax, 8(%r12)
	leaq	18128(%rbx), %rdx
	xorl	%ecx, %ecx
.L4313:
	xorl	%r9d, %r9d
	addl	$1, %ecx
	addq	$96, %rdx
	movq	%r9, -96(%rdx)
	movq	%r9, -72(%rdx)
	cmpl	%ecx, %eax
	jg	.L4313
	leal	(%rax,%rax,2), %eax
	addl	$8, %eax
	cmpl	%r13d, %eax
	jne	.L4314
	xorl	%r8d, %r8d
	leaq	18080(%rbx), %r14
	xorl	%r13d, %r13d
	movl	%r8d, 18512(%rbx)
	jmp	.L4315
.L4316:
	movq	%r12, %rdi
	call	stbi__get8
	movzbl	%al, %edx
	sarl	$4, %edx
	movl	%edx, 4(%r14)
	je	.L4328
	cmpl	$4, %edx
	jg	.L4328
	movl	%eax, %edx
	andl	$15, %eax
	andl	$15, %edx
	movl	%eax, 8(%r14)
	leal	-1(%rdx), %eax
	cmpb	$3, %al
	ja	.L4329
	movq	%r12, %rdi
	addq	$1, %r13
	addq	$96, %r14
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, -84(%r14)
	cmpl	$3, %eax
	jg	.L4384
.L4315:
	movl	8(%r12), %r15d
	cmpl	%r13d, %r15d
	jle	.L4385
	movq	%r12, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, (%r14)
	cmpl	$3, 8(%r12)
	jne	.L4316
	leaq	rgb.36(%rip), %rcx
	movzbl	(%rcx,%r13), %edx
	cmpl	%edx, %eax
	jne	.L4316
	addl	$1, 18512(%rbx)
	jmp	.L4316
.L4294:
	cltq
	addq	%r13, %rax
	jmp	.L4295
.L4299:
	cltq
	addq	%r13, %rax
	jmp	.L4300
.L4386:
	testl	%r15d, %r15d
	jns	.L4323
.L4311:
	leaq	.LC66(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4241
.L4382:
	leaq	.LC195(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4241
.L4305:
	cltq
	addq	%rax, %r14
	jmp	.L4306
.L4385:
	testl	%ebp, %ebp
	jne	.L4321
	movl	4(%r12), %esi
	movl	(%r12), %r11d
	movl	%esi, %eax
	orl	%r11d, %eax
	js	.L4311
	testl	%esi, %esi
	je	.L4386
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%esi
	cmpl	%eax, %r11d
	jg	.L4311
	testl	%r15d, %r15d
	js	.L4311
	je	.L4323
	movl	$2147483647, %eax
	xorl	%edx, %edx
	movl	%esi, %ecx
	idivl	%r15d
	imull	%r11d, %ecx
	cmpl	%eax, %ecx
	jg	.L4311
.L4323:
	leaq	18084(%rbx), %r12
	xorl	%edx, %edx
	movl	$1, %r14d
	movl	$1, %r13d
	movq	%r12, %rax
	jmp	.L4325
.L4326:
	movl	(%rax), %ecx
	cmpl	%ecx, %r13d
	cmovl	%ecx, %r13d
	movl	4(%rax), %ecx
	cmpl	%ecx, %r14d
	cmovl	%ecx, %r14d
	addl	$1, %edx
	addq	$96, %rax
.L4325:
	cmpl	%edx, %r15d
	jg	.L4326
	movq	%r12, %rcx
	xorl	%edi, %edi
	jmp	.L4327
.L4330:
	movl	%r13d, %eax
	movq	%rcx, %r8
	cltd
	idivl	(%rcx)
	testl	%edx, %edx
	jne	.L4328
	movl	%r14d, %eax
	addq	$96, %rcx
	cltd
	idivl	4(%r8)
	testl	%edx, %edx
	jne	.L4329
	addl	$1, %edi
.L4327:
	cmpl	%edi, %r15d
	jg	.L4330
	leal	0(,%r13,8), %edi
	xorl	%edx, %edx
	movd	%r13d, %xmm0
	movl	%r15d, 24(%rsp)
	leal	-1(%r11,%rdi), %eax
	movd	%r14d, %xmm3
	movl	%r13d, 28(%rsp)
	leal	0(,%r14,8), %ecx
	divl	%edi
	movl	%edi, 18072(%rbx)
	movl	%ecx, 18076(%rbx)
	xorl	%edx, %edx
	punpckldq	%xmm3, %xmm0
	movl	%ebp, %r15d
	movl	%r11d, %ebp
	movl	%eax, 12(%rsp)
	leal	-1(%rsi,%rcx), %eax
	movd	12(%rsp), %xmm1
	divl	%ecx
	movd	%eax, %xmm2
	movl	%eax, 16(%rsp)
	leal	-1(%r13), %eax
	movq	%r12, %r13
	punpckldq	%xmm2, %xmm1
	movq	%rbx, %r12
	movl	%eax, 20(%rsp)
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 18056(%rbx)
	movl	%esi, %ebx
	jmp	.L4331
.L4332:
	testl	%ecx, %ecx
	je	.L4334
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%esi
	cmpl	%eax, %r9d
	jg	.L4370
.L4334:
	movl	%r9d, %edi
	movl	%ecx, 44(%rsp)
	imull	%esi, %edi
	movl	%r11d, 40(%rsp)
	movl	%r9d, 36(%rsp)
	movl	%esi, 32(%rsp)
	addl	$15, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movl	32(%rsp), %esi
	movl	36(%rsp), %r9d
	testq	%rax, %rax
	movl	40(%rsp), %r11d
	movl	44(%rsp), %ecx
	movq	%rax, 52(%r13)
	je	.L4371
	addq	$15, %rax
	andq	$-16, %rax
	cmpl	$0, 18480(%r12)
	movq	%rax, 44(%r13)
	jne	.L4387
.L4337:
	addl	$1, %r15d
	addq	$96, %r13
.L4331:
	cmpl	%r15d, 24(%rsp)
	jle	.L4388
	movl	0(%r13), %eax
	movl	12(%rsp), %r11d
	movl	20(%rsp), %edx
	movl	4(%r13), %edi
	imull	%eax, %r11d
	movl	16(%rsp), %ecx
	imull	%ebp, %eax
	imull	%edi, %ecx
	imull	%ebx, %edi
	leal	0(,%r11,8), %r9d
	addl	%edx, %eax
	xorl	%edx, %edx
	movd	%r9d, %xmm1
	divl	28(%rsp)
	xorl	%edx, %edx
	leal	0(,%rcx,8), %esi
	movd	%esi, %xmm4
	punpckldq	%xmm4, %xmm1
	movl	%eax, %r8d
	leal	-1(%r14,%rdi), %eax
	xorl	%edi, %edi
	divl	%r14d
	movq	%rdi, 76(%r13)
	movd	%r8d, %xmm0
	movd	%eax, %xmm5
	movl	%r9d, %eax
	punpckldq	%xmm5, %xmm0
	orl	%esi, %eax
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 24(%r13)
	pxor	%xmm0, %xmm0
	movups	%xmm0, 60(%r13)
	jns	.L4332
.L4370:
	movslq	%r15d, %rax
	xorl	%edx, %edx
	movq	%r12, %rbx
	movq	%rax, %rbp
	imulq	$96, %rax, %rax
	movq	%rdx, 18136(%r12,%rax)
.L4333:
	leaq	.LC18(%rip), %rax
	leal	1(%rbp), %esi
	movq	%rbx, %rdi
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	call	stbi__free_jpeg_components.constprop.0
.L4336:
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	jmp	.L4241
.L4383:
	leaq	.LC196(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4241
.L4329:
	leaq	.LC198(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4241
.L4328:
	leaq	.LC197(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4241
.L4384:
	leaq	.LC199(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L4241
.L4388:
	movl	$1, %eax
	jmp	.L4336
.L4387:
	movl	%ecx, 88(%r13)
	movl	$2, %edx
	movl	$15, %ecx
	movl	%r9d, %edi
	movl	%r11d, 84(%r13)
	call	stbi__malloc_mad3
	movq	%rax, 60(%r13)
	testq	%rax, %rax
	je	.L4371
	addq	$15, %rax
	andq	$-16, %rax
	movq	%rax, 76(%r13)
	jmp	.L4337
.L4371:
	movq	%r12, %rbx
	movl	%r15d, %ebp
	jmp	.L4333
	.cfi_endproc
.LFE635:
	.size	stbi__decode_jpeg_header, .-stbi__decode_jpeg_header
	.section	.rodata.str1.1
.LC200:
	.string	"not GIF"
.LC201:
	.string	""
	.text
	.p2align 4
	.type	stbi__gif_header, @function
stbi__gif_header:
.LFB722:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	192(%rdi), %rdx
	movq	%rdi, %rbx
	movq	200(%rdi), %rax
	cmpq	%rax, %rdx
	jb	.L4418
	movl	48(%rdi), %ecx
	testl	%ecx, %ecx
	jne	.L4419
.L4393:
	leaq	.LC200(%rip), %rax
.L4403:
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
.L4389:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4418:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %edx
.L4391:
	cmpb	$71, %dl
	jne	.L4393
	cmpq	%rax, %rcx
	jb	.L4420
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L4393
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L4398
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L4393
	.p2align 4,,10
	.p2align 3
.L4419:
	leaq	56(%rdi), %rbp
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L4417
	cltq
	movq	%rcx, 192(%rbx)
	movzbl	56(%rbx), %edx
	addq	%rbp, %rax
	movq	%rax, 200(%rbx)
	jmp	.L4391
	.p2align 4,,10
	.p2align 3
.L4420:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rcx), %ecx
.L4397:
	cmpb	$73, %cl
	jne	.L4393
	cmpq	%rax, %rdx
	jb	.L4421
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L4393
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	je	.L4417
	cltq
	movq	%rcx, 192(%rbx)
	movzbl	56(%rbx), %edx
	addq	%rax, %rbp
	movq	%rbp, 200(%rbx)
	.p2align 4,,10
	.p2align 3
.L4400:
	cmpb	$70, %dl
	jne	.L4393
	movq	%rbx, %rdi
	call	stbi__get8
	cmpb	$56, %al
	jne	.L4393
	movq	%rbx, %rdi
	call	stbi__get8
	subl	$55, %eax
	testb	$-3, %al
	jne	.L4393
	movq	%rbx, %rdi
	call	stbi__get8
	cmpb	$97, %al
	jne	.L4393
	leaq	.LC201(%rip), %rax
	movq	%rbx, %rdi
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, (%r14)
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, 4(%r14)
	call	stbi__get8
	movq	%rbx, %rdi
	movzbl	%al, %eax
	movl	%eax, 32(%r14)
	call	stbi__get8
	movq	%rbx, %rdi
	movzbl	%al, %eax
	movl	%eax, 36(%r14)
	call	stbi__get8
	cmpl	$16777216, (%r14)
	movl	$-1, 44(%r14)
	movzbl	%al, %eax
	movl	%eax, 40(%r14)
	jg	.L4408
	cmpl	$16777216, 4(%r14)
	jg	.L4408
	testq	%r13, %r13
	je	.L4406
	movl	$4, 0(%r13)
.L4406:
	testl	%r12d, %r12d
	jne	.L4407
	movl	32(%r14), %eax
	testb	$-128, %al
	jne	.L4422
.L4407:
	movl	$1, %eax
	jmp	.L4389
	.p2align 4,,10
	.p2align 3
.L4417:
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
	jmp	.L4393
	.p2align 4,,10
	.p2align 3
.L4421:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %edx
	jmp	.L4400
	.p2align 4,,10
	.p2align 3
.L4398:
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %ecx
	addq	%rbp, %rax
	movq	%rax, 200(%rbx)
	jmp	.L4397
.L4408:
	leaq	.LC66(%rip), %rax
	jmp	.L4403
.L4422:
	andl	$7, %eax
	movl	$2, %edx
	leaq	52(%r14), %rsi
	movq	%rbx, %rdi
	movl	%eax, %ecx
	sall	%cl, %edx
	orl	$-1, %ecx
	call	stbi__gif_parse_colortable
	jmp	.L4407
	.cfi_endproc
.LFE722:
	.size	stbi__gif_header, .-stbi__gif_header
	.section	.rodata.str1.1
.LC202:
	.string	"S\200\3664"
.LC203:
	.string	"unknown image type"
	.text
	.p2align 4
	.type	stbi__info_main, @function
stbi__info_main:
.LFB749:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	movl	$1, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movl	$18568, %edi
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	call	calloc@PLT
	testq	%rax, %rax
	je	.L4572
	movq	%rbx, (%rax)
	movl	$2, %esi
	movq	%rax, %rdi
	movq	%rax, %r14
	call	stbi__decode_jpeg_header
	testl	%eax, %eax
	je	.L4573
	testq	%rbp, %rbp
	je	.L4427
	movq	(%r14), %rax
	movl	(%rax), %eax
	movl	%eax, 0(%rbp)
.L4427:
	testq	%r12, %r12
	je	.L4428
	movq	(%r14), %rax
	movl	4(%rax), %eax
	movl	%eax, (%r12)
.L4428:
	testq	%r13, %r13
	je	.L4574
	movq	(%r14), %rax
	movq	%r14, %rdi
	cmpl	$3, 8(%rax)
	setge	%al
	movzbl	%al, %eax
	leal	1(%rax,%rax), %eax
	movl	%eax, 0(%r13)
	call	free@PLT
.L4432:
	movl	$1, %r14d
.L4423:
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L4575
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r14d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4573:
	.cfi_restore_state
	movq	(%r14), %rax
	movq	%r14, %rdi
	movdqu	208(%rax), %xmm0
	movups	%xmm0, 192(%rax)
	call	free@PLT
.L4425:
	leaq	32(%rsp), %r15
	xorl	%edx, %edx
	movl	$2, %esi
	movq	%rbx, 32(%rsp)
	movq	%r15, %rdi
	call	stbi__parse_png_file
	movl	%eax, %r14d
	testl	%eax, %eax
	je	.L4576
	testq	%rbp, %rbp
	je	.L4436
	movq	32(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 0(%rbp)
.L4436:
	testq	%r12, %r12
	je	.L4437
	movq	32(%rsp), %rax
	movl	4(%rax), %eax
	movl	%eax, (%r12)
.L4437:
	testq	%r13, %r13
	je	.L4432
	movq	32(%rsp), %rax
	movl	8(%rax), %eax
	movl	%eax, 0(%r13)
	jmp	.L4432
	.p2align 4,,10
	.p2align 3
.L4576:
	movq	32(%rsp), %rax
	movl	$34928, %edi
	movdqu	208(%rax), %xmm1
	movups	%xmm1, 192(%rax)
	call	malloc@PLT
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L4577
	movl	$1, %ecx
	movq	%r13, %rdx
	movq	%rbx, %rdi
	movq	%rax, (%rsp)
	call	stbi__gif_header
	movq	(%rsp), %rsi
	testl	%eax, %eax
	je	.L4578
	testq	%rbp, %rbp
	je	.L4441
	movl	(%rsi), %eax
	movl	%eax, 0(%rbp)
.L4441:
	testq	%r12, %r12
	je	.L4442
	movl	4(%rsi), %eax
	movl	%eax, (%r12)
.L4442:
	movq	%rsi, %rdi
	call	free@PLT
	jmp	.L4432
	.p2align 4,,10
	.p2align 3
.L4574:
	movq	%r14, %rdi
	call	free@PLT
	jmp	.L4432
	.p2align 4,,10
	.p2align 3
.L4578:
	movq	%rsi, %rdi
	call	free@PLT
	movdqu	208(%rbx), %xmm3
	movups	%xmm3, 192(%rbx)
.L4439:
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movl	$255, 60(%rsp)
	call	stbi__bmp_parse_header.constprop.0
	testq	%rax, %rax
	je	.L4579
	testq	%rbp, %rbp
	je	.L4568
	movl	(%rbx), %eax
	movl	%eax, 0(%rbp)
.L4568:
	testq	%r12, %r12
	je	.L4580
	movl	4(%rbx), %eax
	movl	%eax, (%r12)
	testq	%r13, %r13
	je	.L4432
.L4451:
	cmpl	$24, 32(%rsp)
	movl	56(%rsp), %eax
	je	.L4581
.L4449:
	cmpl	$1, %eax
	movl	$3, %eax
	sbbl	$-1, %eax
	movl	%eax, 0(%r13)
	jmp	.L4432
	.p2align 4,,10
	.p2align 3
.L4579:
	testq	%rbp, %rbp
	movq	%rbp, %rax
	movdqu	208(%rbx), %xmm2
	movq	%rbx, %rdi
	cmove	%r15, %rax
	testq	%r12, %r12
	movups	%xmm2, 192(%rbx)
	movq	%rax, 8(%rsp)
	movq	%r15, %rax
	cmovne	%r12, %rax
	testq	%r13, %r13
	movq	%rax, (%rsp)
	movq	%r15, %rax
	cmovne	%r13, %rax
	movq	%rax, 16(%rsp)
	call	stbi__get32be
	cmpl	$943870035, %eax
	je	.L4582
.L4570:
	movq	208(%rbx), %rax
	testq	%rbp, %rbp
	movq	%rax, 192(%rbx)
	movq	216(%rbx), %rax
	movq	%rax, 200(%rbx)
	movq	%r15, %rax
	cmovne	%rbp, %rax
	testq	%r12, %r12
	movq	%rax, (%rsp)
	movq	%r15, %rax
	cmovne	%r12, %rax
	testq	%r13, %r13
	cmovne	%r13, %r15
	movq	%rax, 8(%rsp)
	movq	%r15, 16(%rsp)
	leaq	.LC202(%rip), %r15
.L4465:
	movq	%rbx, %rdi
	call	stbi__get8
	cmpb	(%r15), %al
	jne	.L4464
	addq	$1, %r15
	leaq	4+.LC202(%rip), %rax
	cmpq	%r15, %rax
	jne	.L4465
	movl	$88, %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	movq	%rbx, %rdi
	call	stbi__get16be
	movq	(%rsp), %rcx
	movq	%rbx, %rdi
	movl	%eax, (%rcx)
	call	stbi__get16be
	movq	8(%rsp), %rcx
	cmpq	$0, 16(%rbx)
	movl	%eax, (%rcx)
	je	.L4469
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L4468
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L4467
.L4469:
	movq	200(%rbx), %rax
	cmpq	%rax, 192(%rbx)
	jnb	.L4467
.L4468:
	movq	(%rsp), %rax
	movl	(%rax), %ecx
	testl	%ecx, %ecx
	je	.L4471
	movl	$268435456, %eax
	xorl	%edx, %edx
	idivl	%ecx
	movq	8(%rsp), %rcx
	cmpl	(%rcx), %eax
	jl	.L4571
.L4471:
	movl	$8, %esi
	movq	%rbx, %rdi
	movl	$11, %r15d
	call	stbi__skip.part.0
.L4477:
	subl	$1, %r15d
	je	.L4470
	movq	%rbx, %rdi
	call	stbi__get8
	movq	%rbx, %rdi
	movb	%al, 8(%rsp)
	call	stbi__get8
	movq	%rbx, %rdi
	movb	%al, (%rsp)
	call	stbi__get8
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	orl	%eax, %r14d
	cmpq	$0, 16(%rbx)
	je	.L4475
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L4474
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L4473
.L4475:
	movq	200(%rbx), %rax
	cmpq	%rax, 192(%rbx)
	jnb	.L4473
.L4474:
	cmpb	$8, (%rsp)
	jne	.L4571
	cmpb	$0, 8(%rsp)
	jne	.L4477
	andl	$16, %r14d
	movq	16(%rsp), %rcx
	cmpl	$1, %r14d
	sbbl	%eax, %eax
	addl	$4, %eax
	movl	%eax, (%rcx)
	jmp	.L4432
	.p2align 4,,10
	.p2align 3
.L4580:
	testq	%r13, %r13
	jne	.L4451
	jmp	.L4432
	.p2align 4,,10
	.p2align 3
.L4581:
	cmpl	$-16777216, %eax
	jne	.L4449
	movl	$3, 0(%r13)
	jmp	.L4432
	.p2align 4,,10
	.p2align 3
.L4582:
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$1, %eax
	jne	.L4570
	movq	%rbx, %rdi
	movl	$6, %esi
	call	stbi__skip.part.0
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	ja	.L4570
	movq	%rbx, %rdi
	call	stbi__get32be
	movq	(%rsp), %rcx
	movq	%rbx, %rdi
	movl	%eax, (%rcx)
	call	stbi__get32be
	movq	8(%rsp), %rcx
	movq	%rbx, %rdi
	movl	%eax, (%rcx)
	call	stbi__get16be
	subl	$8, %eax
	andl	$-9, %eax
	jne	.L4570
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$3, %eax
	jne	.L4570
	movq	16(%rsp), %rax
	movl	$4, (%rax)
	jmp	.L4432
	.p2align 4,,10
	.p2align 3
.L4464:
	movdqu	208(%rbx), %xmm4
	movups	%xmm4, 192(%rbx)
.L4470:
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	stbi__pnm_info
	testl	%eax, %eax
	jne	.L4432
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	stbi__hdr_info
	movl	%eax, %r14d
	testl	%eax, %eax
	jne	.L4432
	movq	%rbx, %rdi
	call	stbi__get8
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %r15d
	cmpl	$1, %r15d
	jle	.L4481
.L4495:
	movq	208(%rbx), %rax
	movq	%rax, 192(%rbx)
	movq	216(%rbx), %rax
	movq	%rax, 200(%rbx)
	leaq	.LC203(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4423
.L4467:
	movdqu	208(%rbx), %xmm5
	movups	%xmm5, 192(%rbx)
	jmp	.L4470
.L4473:
	movdqu	208(%rbx), %xmm6
	movups	%xmm6, 192(%rbx)
	jmp	.L4470
.L4571:
	movdqu	208(%rbx), %xmm7
	movups	%xmm7, 192(%rbx)
	jmp	.L4470
.L4481:
	movq	%rbx, %rdi
	call	stbi__get8
	movb	%al, (%rsp)
	cmpl	$1, %r15d
	je	.L4583
	movzbl	(%rsp), %eax
	andl	$-10, %eax
	cmpb	$2, %al
	jne	.L4495
	movl	$9, %esi
	movq	%rbx, %rdi
	xorl	%r15d, %r15d
	call	stbi__skip.part.0
.L4487:
	movq	%rbx, %rdi
	call	stbi__get16le
	movl	%eax, 8(%rsp)
	testl	%eax, %eax
	jle	.L4495
	movq	%rbx, %rdi
	call	stbi__get16le
	testl	%eax, %eax
	jle	.L4495
	movq	%rbx, %rdi
	movl	%eax, 28(%rsp)
	call	stbi__get8
	movq	%rbx, %rdi
	movb	%al, 16(%rsp)
	call	stbi__get8
	testl	%r15d, %r15d
	movzbl	16(%rsp), %ecx
	movl	28(%rsp), %esi
	je	.L4491
	subl	$8, %ecx
	andb	$-9, %cl
	jne	.L4495
	cmpl	$16, %r15d
	jg	.L4493
	cmpl	$14, %r15d
	jg	.L4515
	movl	$1, %eax
	cmpl	$8, %r15d
	jne	.L4495
.L4494:
	testq	%rbp, %rbp
	je	.L4500
	movl	8(%rsp), %ecx
	movl	%ecx, 0(%rbp)
.L4500:
	testq	%r12, %r12
	je	.L4501
	movl	%esi, (%r12)
.L4501:
	testq	%r13, %r13
	je	.L4432
	movl	%eax, 0(%r13)
	jmp	.L4432
.L4583:
	andl	$-9, %eax
	subb	$1, %al
	jne	.L4495
	movl	$4, %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	movq	%rbx, %rdi
	call	stbi__get8
	movl	%eax, %ecx
	cmpb	$32, %al
	ja	.L4495
	movzbl	%al, %r15d
	movabsq	$-4311843073, %rax
	sarq	%cl, %rax
	testb	$1, %al
	jne	.L4495
	movl	$4, %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	jmp	.L4487
.L4572:
	leaq	.LC18(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4425
.L4575:
	call	__stack_chk_fail@PLT
.L4493:
	leal	-24(%r15), %eax
	andl	$-9, %eax
	jne	.L4495
	movl	%r15d, %eax
	sarl	$3, %eax
	jmp	.L4494
.L4491:
	leal	-8(%rcx), %eax
	cmpb	$24, %al
	ja	.L4495
	leaq	.L4497(%rip), %rdi
	movzbl	%al, %eax
	movslq	(%rdi,%rax,4), %rax
	addq	%rdi, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L4497:
	.long	.L4499-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4515-.L4497
	.long	.L4498-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4496-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4495-.L4497
	.long	.L4496-.L4497
	.text
.L4577:
	leaq	.LC18(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4439
.L4515:
	movl	$3, %eax
	jmp	.L4494
.L4496:
	movzbl	%cl, %eax
	sarl	$3, %eax
	jmp	.L4494
.L4498:
	movzbl	(%rsp), %r14d
	xorl	%edx, %edx
	movl	$3, %eax
	andl	$-9, %r14d
	cmpb	$3, %r14b
	sete	%dl
	subl	%edx, %eax
	jmp	.L4494
.L4499:
	movl	$1, %eax
	jmp	.L4494
	.cfi_endproc
.LFE749:
	.size	stbi__info_main, .-stbi__info_main
	.section	.rodata.str1.1
.LC204:
	.string	"bad SOS component count"
.LC205:
	.string	"bad SOS len"
.LC206:
	.string	"bad DC huff"
.LC207:
	.string	"bad AC huff"
.LC208:
	.string	"bad SOS"
.LC209:
	.string	"bad DNL len"
.LC210:
	.string	"bad DNL height"
	.text
	.p2align 4
	.type	stbi__decode_jpeg_image, @function
stbi__decode_jpeg_image:
.LFB637:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pxor	%xmm0, %xmm0
	xorl	%esi, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	movq	%fs:40, %rax
	movq	%rax, 216(%rsp)
	xorl	%eax, %eax
	movups	%xmm0, 18136(%rdi)
	movl	$0, 18536(%rdi)
	movups	%xmm0, 18232(%rdi)
	movups	%xmm0, 18328(%rdi)
	movups	%xmm0, 18424(%rdi)
	call	stbi__decode_jpeg_header
	testl	%eax, %eax
	jne	.L4977
.L4605:
	xorl	%eax, %eax
.L4584:
	movq	216(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L4978
	addq	$232, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L4977:
	.cfi_restore_state
	movzbl	18472(%r14), %esi
	cmpb	$-1, %sil
	je	.L4586
	movb	$-1, 18472(%r14)
.L4587:
	cmpb	$-39, %sil
	jne	.L4811
.L4592:
	movl	18480(%r14), %edi
	testl	%edi, %edi
	jne	.L4979
.L4594:
	movl	$1, %eax
	jmp	.L4584
.L4824:
	movl	$255, %esi
.L4811:
	cmpl	$218, %esi
	jne	.L4822
	movq	(%r14), %rdi
	call	stbi__get16be
	movq	(%r14), %rbx
	movl	%eax, %ebp
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4980
	movl	48(%rbx), %esi
	testl	%esi, %esi
	jne	.L4601
.L4966:
	movl	$0, 18516(%r14)
.L4602:
	leaq	.LC204(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4605
.L4986:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %ecx
.L4803:
	cmpb	$-1, %cl
	jne	.L4806
.L4810:
	movq	(%r14), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4981
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L4982
.L4754:
	xorl	%esi, %esi
.L4822:
	cmpl	$220, %esi
	je	.L4983
.L4765:
	movq	%r14, %rdi
	call	stbi__process_marker
	testl	%eax, %eax
	je	.L4594
	movzbl	18472(%r14), %esi
	cmpb	$-1, %sil
	je	.L4800
.L4975:
	movb	$-1, 18472(%r14)
.L4746:
	cmpl	$217, %esi
	je	.L4592
	jmp	.L4811
	.p2align 4,,10
	.p2align 3
.L4983:
	movq	(%r14), %rbx
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rax
	cmpq	%rax, %rdx
	jb	.L4984
	movl	48(%rbx), %r9d
	testl	%r9d, %r9d
	jne	.L4985
.L4770:
	leaq	.LC209(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4605
	.p2align 4,,10
	.p2align 3
.L4800:
	movq	(%r14), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4986
	movl	48(%rbx), %edx
	testl	%edx, %edx
	jne	.L4804
.L4806:
	movl	$255, %esi
	jmp	.L4765
.L4984:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rdx), %r12d
	sall	$8, %r12d
.L4767:
	cmpq	%rax, %rcx
	jnb	.L4772
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rcx), %eax
	addl	%eax, %r12d
.L4773:
	movq	(%r14), %rbx
	movq	192(%rbx), %rcx
	movq	200(%rbx), %rax
	cmpq	%rax, %rcx
	jnb	.L4776
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rcx), %ebp
	sall	$8, %ebp
.L4777:
	cmpq	%rax, %rdx
	jnb	.L4781
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %eax
	addl	%eax, %ebp
.L4778:
	cmpl	$4, %r12d
	jne	.L4770
	movq	(%r14), %rbx
	cmpl	%ebp, 4(%rbx)
	jne	.L4987
	movzbl	18472(%r14), %esi
	cmpb	$-1, %sil
	jne	.L4975
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4988
	movl	48(%rbx), %esi
	testl	%esi, %esi
	je	.L4806
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L4976
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %ecx
	addq	%rax, %rbp
	movq	%rbp, 200(%rbx)
	jmp	.L4789
	.p2align 4,,10
	.p2align 3
.L4980:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
	leal	-1(%rax), %esi
.L4600:
	movl	%eax, 18516(%r14)
	cmpl	$3, %esi
	ja	.L4602
	movq	(%r14), %rbx
	cmpl	%eax, 8(%rbx)
	jl	.L4602
	leal	6(%rax,%rax), %eax
	cmpl	%eax, %ebp
	je	.L4825
	leaq	.LC205(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4605
.L4982:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L4973
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %esi
	addq	%rax, %rbp
	movq	%rbp, 200(%rbx)
.L4808:
	cmpb	$-1, %sil
	je	.L4810
	jmp	.L4746
	.p2align 4,,10
	.p2align 3
.L4981:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %esi
	jmp	.L4808
.L4973:
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, 200(%rbx)
	movq	%rdx, 192(%rbx)
.L4974:
	xorl	%esi, %esi
	jmp	.L4765
.L4825:
	xorl	%r12d, %r12d
	jmp	.L4606
.L4607:
	movl	48(%rbx), %ebp
	xorl	%edx, %edx
	xorl	%r13d, %r13d
	testl	%ebp, %ebp
	jne	.L4989
.L4609:
	movl	8(%rbx), %eax
	testl	%eax, %eax
	jle	.L4828
.L4993:
	cmpl	18080(%r14), %ebp
	je	.L4829
	cmpl	$1, %eax
	je	.L4605
	cmpl	18176(%r14), %ebp
	je	.L4830
	cmpl	$2, %eax
	je	.L4605
	cmpl	18272(%r14), %ebp
	je	.L4831
	cmpl	$3, %eax
	je	.L4605
	cmpl	%ebp, 18368(%r14)
	je	.L4832
	movl	$4, %ecx
.L4615:
	cmpl	%ecx, %eax
	je	.L4605
.L4616:
	movslq	%ecx, %rax
	sarl	$4, %edx
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	addq	%r14, %rax
	movl	%edx, 18096(%rax)
	cmpl	$3, %edx
	jg	.L4990
	movl	%r13d, %edx
	andl	$15, %edx
	andl	$12, %r13d
	movl	%edx, 18100(%rax)
	jne	.L4991
	movl	%ecx, 18520(%r14,%r12,4)
	addq	$1, %r12
	cmpl	%r12d, 18516(%r14)
	jle	.L4992
.L4606:
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rax
	cmpq	%rax, %rdx
	jnb	.L4607
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rdx), %ebp
	cmpq	%rax, %rcx
	jnb	.L4612
.L4994:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%rbx)
	movl	8(%rbx), %eax
	movzbl	(%rcx), %edx
	movl	%edx, %r13d
	testl	%eax, %eax
	jg	.L4993
.L4828:
	xorl	%ecx, %ecx
	jmp	.L4615
.L4989:
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	leaq	57(%rbx), %rax
	testl	%ebp, %ebp
	jne	.L4610
	movl	$0, 48(%rbx)
	movq	%rax, %r13
	movb	$0, 56(%rbx)
.L4611:
	movq	%rax, 192(%rbx)
	movq	%r13, 200(%rbx)
	movq	(%r14), %rbx
	movq	192(%rbx), %rcx
	movq	200(%rbx), %rax
	cmpq	%rax, %rcx
	jb	.L4994
.L4612:
	movl	48(%rbx), %edx
	xorl	%r13d, %r13d
	testl	%edx, %edx
	je	.L4609
	leaq	56(%rbx), %r15
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r15, %rsi
	call	*16(%rbx)
	movslq	%eax, %rdx
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	leaq	57(%rbx), %rax
	testl	%edx, %edx
	jne	.L4613
	movl	$0, 48(%rbx)
	movq	%rax, %r15
	movb	$0, 56(%rbx)
.L4614:
	movq	%r15, 200(%rbx)
	movq	%rax, 192(%rbx)
	movq	(%r14), %rbx
	jmp	.L4609
.L4985:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rcx
	movslq	%eax, %r12
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%r12d, %r12d
	jne	.L4771
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
.L4772:
	movl	48(%rbx), %r8d
	testl	%r8d, %r8d
	je	.L4773
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L4995
	cltq
	addq	%rax, %rbp
	movzbl	56(%rbx), %eax
	addl	%eax, %r12d
.L4775:
	movq	%rbp, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L4773
.L4781:
	movl	48(%rbx), %edi
	testl	%edi, %edi
	je	.L4778
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L4996
	cltq
	addq	%rax, %r13
	movzbl	56(%rbx), %eax
	addl	%eax, %ebp
.L4783:
	movq	%r13, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L4778
.L4776:
	movl	48(%rbx), %ebp
	testl	%ebp, %ebp
	je	.L4778
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rdx
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ebp, %ebp
	je	.L4997
	leaq	0(%r13,%rbp), %rax
	movzbl	56(%rbx), %ebp
	sall	$8, %ebp
.L4780:
	movq	%rax, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L4777
.L4988:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %ecx
.L4789:
	cmpb	$-1, %cl
	jne	.L4806
.L4797:
	movq	(%r14), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4998
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L4974
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L4973
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %esi
	addq	%rax, %rbp
	movq	%rbp, 200(%rbx)
.L4794:
	cmpb	$-1, %sil
	je	.L4797
	jmp	.L4746
	.p2align 4,,10
	.p2align 3
.L4998:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %esi
	jmp	.L4794
.L4610:
	addq	%rbp, %r13
	movzbl	56(%rbx), %ebp
	jmp	.L4611
.L4601:
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rcx
	movslq	%eax, %rdx
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%edx, %edx
	jne	.L4603
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
	jmp	.L4966
.L4613:
	addq	%rdx, %r15
	movzbl	56(%rbx), %edx
	movl	%edx, %r13d
	jmp	.L4614
.L4804:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L4805
.L4976:
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L4806
.L4829:
	xorl	%ecx, %ecx
	jmp	.L4616
.L4995:
	movl	$0, 48(%rbx)
	movq	%rdx, %rbp
	movb	$0, 56(%rbx)
	jmp	.L4775
.L4997:
	movl	$0, 48(%rbx)
	movq	%rdx, %rax
	movb	$0, 56(%rbx)
	jmp	.L4780
.L4996:
	movl	$0, 48(%rbx)
	movq	%rdx, %r13
	movb	$0, 56(%rbx)
	jmp	.L4783
.L4771:
	leaq	0(%rbp,%r12), %rax
	movzbl	56(%rbx), %r12d
	movq	%rcx, 192(%rbx)
	movq	%rax, 200(%rbx)
	sall	$8, %r12d
	jmp	.L4767
.L4805:
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %ecx
	addq	%rax, %rbp
	movq	%rbp, 200(%rbx)
	jmp	.L4803
.L4603:
	movzbl	56(%rbx), %eax
	addq	%rdx, %r12
	movq	%rcx, 192(%rbx)
	movq	%r12, 200(%rbx)
	leal	-1(%rax), %esi
	jmp	.L4600
.L4979:
	movq	(%r14), %rdx
	movl	8(%rdx), %eax
	testl	%eax, %eax
	jle	.L4594
	leaq	18092(%r14), %r8
	xorl	%r12d, %r12d
	movq	%r8, %r15
.L4819:
	movl	20(%r15), %edi
	movl	16(%r15), %ebx
	leal	7(%rdi), %ebp
	addl	$7, %ebx
	sarl	$3, %ebp
	sarl	$3, %ebx
	movl	%ebp, 4(%rsp)
	testl	%ebp, %ebp
	jle	.L4813
	testl	%ebx, %ebx
	jle	.L4818
	xorl	%ebp, %ebp
	movslq	%ebx, %rbx
.L4817:
	xorl	%r13d, %r13d
	jmp	.L4816
	.p2align 4,,10
	.p2align 3
.L5000:
	movdqu	(%rsi), %xmm1
	movdqu	(%rax), %xmm0
	movdqu	16(%rax), %xmm2
	movdqu	32(%rax), %xmm3
	pmullw	%xmm1, %xmm0
	movdqu	48(%rax), %xmm4
	movdqu	64(%rax), %xmm5
	movdqu	80(%rax), %xmm6
	movdqu	96(%rax), %xmm7
	movdqu	112(%rax), %xmm1
	movups	%xmm0, (%rax)
	movdqu	16(%rsi), %xmm0
	pmullw	%xmm2, %xmm0
	movups	%xmm0, 16(%rax)
	movdqu	32(%rsi), %xmm0
	pmullw	%xmm3, %xmm0
	movups	%xmm0, 32(%rax)
	movdqu	48(%rsi), %xmm0
	pmullw	%xmm4, %xmm0
	movups	%xmm0, 48(%rax)
	movdqu	64(%rsi), %xmm0
	pmullw	%xmm5, %xmm0
	movups	%xmm0, 64(%rax)
	movdqu	80(%rsi), %xmm0
	pmullw	%xmm6, %xmm0
	movups	%xmm0, 80(%rax)
	movdqu	96(%rsi), %xmm0
	pmullw	%xmm7, %xmm0
	movups	%xmm0, 96(%rax)
	movdqu	112(%rsi), %xmm0
	pmullw	%xmm1, %xmm0
	movups	%xmm0, 112(%rax)
.L4815:
	movl	24(%r15), %esi
	movq	%rcx, %rdx
	movl	%esi, %eax
	imull	%ebp, %eax
	sall	$3, %eax
	cltq
	leaq	(%rax,%r13,8), %rdi
	addq	$1, %r13
	addq	36(%r15), %rdi
	call	*18544(%r14)
	cmpq	%rbx, %r13
	je	.L4999
.L4816:
	movl	76(%r15), %edx
	movslq	(%r15), %rdi
	movq	68(%r15), %rax
	imull	%ebp, %edx
	addq	$105, %rdi
	salq	$7, %rdi
	leaq	8(%r14,%rdi), %rsi
	leaq	10(%r14,%rdi), %rdi
	leal	(%rdx,%r13), %ecx
	movslq	%edx, %rdx
	sall	$6, %ecx
	addq	%r13, %rdx
	salq	$7, %rdx
	movslq	%ecx, %rcx
	leaq	(%rax,%rcx,2), %rcx
	addq	%rdx, %rax
	movq	%rax, %rdx
	subq	%rdi, %rdx
	cmpq	$12, %rdx
	ja	.L5000
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4814:
	movzwl	(%rcx,%rax), %edx
	imulw	(%rsi,%rax), %dx
	movw	%dx, (%rcx,%rax)
	addq	$2, %rax
	cmpq	$128, %rax
	jne	.L4814
	jmp	.L4815
.L4999:
	addl	$1, %ebp
	cmpl	%ebp, 4(%rsp)
	jne	.L4817
	movq	(%r14), %rdx
.L4818:
	movl	8(%rdx), %eax
.L4813:
	addl	$1, %r12d
	addq	$96, %r15
	cmpl	%eax, %r12d
	jl	.L4819
	jmp	.L4594
.L4830:
	movl	$1, %ecx
	jmp	.L4616
.L4586:
	movq	(%r14), %rdi
	call	stbi__get8
	cmpb	$-1, %al
	jne	.L4824
.L4591:
	movq	(%r14), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L4965
	movl	48(%rbx), %esi
	testl	%esi, %esi
	je	.L4811
	movq	%rbx, %rdi
	call	stbi__refill_buffer
	movq	192(%rbx), %rax
.L4965:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %esi
	cmpb	$-1, %sil
	je	.L4591
	jmp	.L4587
	.p2align 4,,10
	.p2align 3
.L4832:
	movl	$3, %ecx
	jmp	.L4616
.L4831:
	movl	$2, %ecx
	jmp	.L4616
.L4991:
	leaq	.LC207(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4605
.L4990:
	leaq	.LC206(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4605
.L4992:
	movq	%rbx, %rdi
	call	stbi__get8
	movq	(%r14), %rdi
	movzbl	%al, %eax
	movl	%eax, 18484(%r14)
	call	stbi__get8
	movq	(%r14), %rdi
	movzbl	%al, %eax
	movl	%eax, 18488(%r14)
	call	stbi__get8
	movl	18480(%r14), %ecx
	movzbl	%al, %edx
	movl	%eax, %esi
	andl	$15, %eax
	sarl	$4, %edx
	movl	%eax, 18496(%r14)
	andl	$15, %esi
	movl	%edx, 18492(%r14)
	testl	%ecx, %ecx
	je	.L4619
	movl	18484(%r14), %eax
	cmpl	$63, %eax
	jg	.L4620
	movl	18488(%r14), %edi
	cmpl	%edi, %eax
	setg	%cl
	cmpl	$63, %edi
	setg	%dil
	orl	%edi, %ecx
	cmpb	$13, %sil
	seta	%sil
	orb	%sil, %cl
	jne	.L4620
	cmpl	$13, %edx
	jg	.L4620
	movl	18536(%r14), %edx
	movl	$2147483647, %ecx
	movl	$0, 18476(%r14)
	movl	$0, 18392(%r14)
	testl	%edx, %edx
	movl	$0, 18296(%r14)
	cmove	%ecx, %edx
	cmpl	$1, 18516(%r14)
	movl	$0, 18200(%r14)
	movl	$0, 18104(%r14)
	movq	$0, 18464(%r14)
	movb	$-1, 18472(%r14)
	movl	%edx, 18540(%r14)
	movl	$0, 18500(%r14)
	je	.L5001
	movl	18068(%r14), %edx
	testl	%edx, %edx
	jle	.L4971
	movl	18064(%r14), %eax
	xorl	%ebx, %ebx
	movq	%r14, %r15
.L4660:
	xorl	%ebp, %ebp
	testl	%eax, %eax
	jle	.L4725
.L4724:
	movq	$0, 8(%rsp)
	movl	18516(%r15), %edx
	testl	%edx, %edx
	jle	.L4723
.L4718:
	movq	8(%rsp), %rax
	movslq	18520(%r15,%rax,4), %rax
	leaq	(%rax,%rax,2), %r14
	movl	%eax, 4(%rsp)
	salq	$5, %r14
	addq	%r15, %r14
	movl	18088(%r14), %eax
	testl	%eax, %eax
	jle	.L4714
	movl	18084(%r14), %ecx
	xorl	%r12d, %r12d
.L4715:
	testl	%ecx, %ecx
	jle	.L4717
	xorl	%r13d, %r13d
	jmp	.L4716
	.p2align 4,,10
	.p2align 3
.L5003:
	movl	18084(%r14), %ecx
	addl	$1, %r13d
	movl	18088(%r14), %eax
	cmpl	%r13d, %ecx
	jle	.L5002
.L4716:
	imull	%ebx, %eax
	movslq	18096(%r14), %rdx
	movq	%r15, %rdi
	imull	%ebp, %ecx
	imulq	$1680, %rdx, %rdx
	addl	%r12d, %eax
	imull	18168(%r14), %eax
	addl	%r13d, %ecx
	leaq	8(%r15,%rdx), %rdx
	addl	%ecx, %eax
	movq	18160(%r14), %rcx
	sall	$6, %eax
	cltq
	leaq	(%rcx,%rax,2), %rsi
	movl	4(%rsp), %ecx
	call	stbi__jpeg_decode_block_prog_dc
	testl	%eax, %eax
	jne	.L5003
	jmp	.L4605
.L4619:
	orl	18484(%r14), %edx
	movl	%edx, %r13d
	je	.L5004
.L4620:
	leaq	.LC208(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4605
.L4987:
	leaq	.LC210(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4605
.L5004:
	testb	%sil, %sil
	jne	.L4620
	movl	18536(%r14), %eax
	movl	$2147483647, %ecx
	movl	$63, 18488(%r14)
	movl	$0, 18476(%r14)
	testl	%eax, %eax
	movl	$0, 18392(%r14)
	cmove	%ecx, %eax
	cmpl	$1, 18516(%r14)
	movl	$0, 18296(%r14)
	movl	$0, 18200(%r14)
	movl	$0, 18104(%r14)
	movq	$0, 18464(%r14)
	movb	$-1, 18472(%r14)
	movl	%eax, 18540(%r14)
	movl	$0, 18500(%r14)
	je	.L4624
	movl	18068(%r14), %edx
	testl	%edx, %edx
	jle	.L4971
	leaq	6728(%r14), %rdi
	movl	$0, 8(%rsp)
	movl	18064(%r14), %eax
	movq	%r14, %r15
	movq	%rdi, 32(%rsp)
.L4626:
	movl	$0, 4(%rsp)
	movq	%r15, %r14
	testl	%eax, %eax
	jle	.L4657
.L4656:
	movl	18516(%r14), %eax
	xorl	%r12d, %r12d
	movq	%r12, %r13
	movq	%r14, %r12
	testl	%eax, %eax
	jle	.L4654
.L4648:
	movslq	18520(%r12,%r13,4), %rdx
	leaq	(%rdx,%rdx,2), %rbx
	movl	%edx, 56(%rsp)
	movq	%rbx, 48(%rsp)
	salq	$5, %rbx
	leaq	(%r12,%rbx), %r14
	movl	18088(%r14), %ebx
	testl	%ebx, %ebx
	jle	.L4641
	movq	%r13, 40(%rsp)
	movl	18084(%r14), %ebp
	xorl	%r8d, %r8d
.L4642:
	testl	%ebp, %ebp
	jle	.L4967
	leaq	8(%r12), %rax
	movl	%r8d, 16(%rsp)
	xorl	%r13d, %r13d
	leaq	80(%rsp), %r15
	movq	%rax, 24(%rsp)
	jmp	.L4645
	.p2align 4,,10
	.p2align 3
.L5005:
	movl	18116(%r14), %esi
	movslq	%ebp, %rbp
	movq	%r15, %rdx
	addl	$1, %r13d
	imull	%esi, %ebx
	leal	0(,%rbx,8), %edi
	movslq	%edi, %rdi
	addq	%rbp, %rdi
	addq	18128(%r14), %rdi
	call	*18544(%r12)
	movl	18084(%r14), %ebp
	cmpl	%r13d, %ebp
	jle	.L4644
	movl	18088(%r14), %ebx
.L4645:
	movl	4(%rsp), %eax
	movslq	18096(%r14), %rdx
	subq	$8, %rsp
	.cfi_def_cfa_offset 296
	movq	40(%rsp), %rdi
	imull	%eax, %ebp
	movl	16(%rsp), %eax
	imulq	$1680, %rdx, %rdx
	imull	%eax, %ebx
	movl	24(%rsp), %eax
	addl	%r13d, %ebp
	sall	$3, %ebp
	addl	%eax, %ebx
	movslq	18100(%r14), %rax
	movq	%rax, %rsi
	imulq	$1680, %rax, %rax
	salq	$10, %rsi
	leaq	13960(%r12,%rsi), %r8
	movq	%r15, %rsi
	leaq	(%rdi,%rax), %rcx
	movq	32(%rsp), %rax
	movq	%r12, %rdi
	addq	%rax, %rdx
	movslq	18092(%r14), %rax
	salq	$7, %rax
	leaq	13448(%r12,%rax), %rax
	pushq	%rax
	.cfi_def_cfa_offset 304
	movl	72(%rsp), %r9d
	call	stbi__jpeg_decode_block
	popq	%r9
	.cfi_def_cfa_offset 296
	popq	%r10
	.cfi_def_cfa_offset 288
	testl	%eax, %eax
	jne	.L5005
	jmp	.L4605
.L4644:
	movq	48(%rsp), %rax
	movl	16(%rsp), %r8d
	salq	$5, %rax
	addl	$1, %r8d
	movl	18088(%r12,%rax), %ebx
	cmpl	%ebx, %r8d
	jl	.L4642
.L4967:
	movq	40(%rsp), %r13
	movl	18516(%r12), %eax
.L4641:
	addq	$1, %r13
	cmpl	%r13d, %eax
	jg	.L4648
	movq	%r12, %r14
.L4654:
	movl	18540(%r14), %eax
	subl	$1, %eax
	movl	%eax, 18540(%r14)
	testl	%eax, %eax
	jle	.L5006
.L4649:
	addl	$1, 4(%rsp)
	movl	18064(%r14), %eax
	movl	4(%rsp), %ebx
	cmpl	%eax, %ebx
	jl	.L4656
	movl	18068(%r14), %edx
	movq	%r14, %r15
.L4657:
	addl	$1, 8(%rsp)
	movl	8(%rsp), %ebx
	cmpl	%edx, %ebx
	jl	.L4626
.L4970:
	movq	%r15, %r14
.L4969:
	movzbl	18472(%r14), %eax
.L4639:
	cmpb	$-1, %al
	je	.L4972
.L4727:
	leal	-208(%rax), %edx
	movb	$-1, 18472(%r14)
	cmpl	$7, %edx
	ja	.L5007
.L4745:
	movq	(%r14), %rdi
	call	stbi__get8
	cmpb	$-1, %al
	jne	.L4806
.L4764:
	movq	(%r14), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5008
	movl	48(%rbx), %r10d
	testl	%r10d, %r10d
	je	.L4754
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L4973
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %esi
	addq	%rax, %rbp
	movq	%rbp, 200(%rbx)
.L4761:
	cmpb	$-1, %sil
	je	.L4764
	jmp	.L4746
	.p2align 4,,10
	.p2align 3
.L5009:
	leaq	56(%rbx), %rbp
	movq	40(%rbx), %rdi
	movl	52(%rbx), %edx
	movq	%rbp, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rdi
	movslq	%eax, %rcx
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ecx, %ecx
	jne	.L4739
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdi, 200(%rbx)
	movq	%rdi, 192(%rbx)
.L4972:
	movq	(%r14), %rbx
	jmp	.L4726
.L4947:
	movl	48(%rbx), %r13d
	testl	%r13d, %r13d
	jne	.L5009
.L4726:
	cmpq	$0, 16(%rbx)
	movq	%rbx, %rbp
	je	.L4744
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L5010
	movl	48(%rbx), %r12d
	movq	(%r14), %rbx
	testl	%r12d, %r12d
	je	.L4730
.L4744:
	movq	200(%rbp), %rax
	cmpq	%rax, 192(%rbp)
	jnb	.L4730
.L4743:
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %esi
.L4728:
	movq	(%r14), %rbx
	movq	16(%rbx), %rax
	movq	%rbx, %rbp
	cmpl	$255, %esi
	jne	.L4726
	testq	%rax, %rax
	je	.L4735
	movq	40(%rbx), %rdi
	call	*32(%rbx)
	testl	%eax, %eax
	je	.L5011
	movl	48(%rbx), %r15d
	movq	(%r14), %rbx
	testl	%r15d, %r15d
	je	.L4730
.L4735:
	movq	200(%rbp), %rax
	cmpq	%rax, 192(%rbp)
	jnb	.L4730
.L4731:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L4947
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
	movl	%eax, %edx
	leal	-1(%rax), %r8d
	movl	%eax, %esi
.L4737:
	cmpb	$-3, %r8b
	ja	.L4728
	movb	%dl, 18472(%r14)
	cmpb	$-1, %dl
	jne	.L4727
	movq	(%r14), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5012
.L4747:
	movl	48(%rbx), %ebp
	testl	%ebp, %ebp
	jne	.L4749
.L4751:
	movl	$255, %esi
	jmp	.L4822
.L5002:
	addl	$1, %r12d
	cmpl	%eax, %r12d
	jl	.L4715
.L4717:
	movl	18516(%r15), %edx
.L4714:
	addq	$1, 8(%rsp)
	movq	8(%rsp), %rax
	cmpl	%eax, %edx
	jg	.L4718
.L4723:
	movl	18540(%r15), %eax
	subl	$1, %eax
	movl	%eax, 18540(%r15)
	testl	%eax, %eax
	jle	.L5013
.L4719:
	movl	18064(%r15), %eax
	addl	$1, %ebp
	cmpl	%eax, %ebp
	jl	.L4724
	movl	18068(%r15), %edx
.L4725:
	addl	$1, %ebx
	cmpl	%edx, %ebx
	jl	.L4660
	jmp	.L4970
	.p2align 4,,10
	.p2align 3
.L5008:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %esi
	jmp	.L4761
.L5011:
	movq	(%r14), %rbx
	jmp	.L4731
.L5001:
	movslq	18520(%r14), %rcx
	leaq	(%rcx,%rcx,2), %rdx
	movl	%ecx, 60(%rsp)
	salq	$5, %rdx
	addq	%r14, %rdx
	movl	18108(%rdx), %edi
	movl	18112(%rdx), %edx
	leal	7(%rdi), %esi
	addl	$7, %edx
	sarl	$3, %esi
	sarl	$3, %edx
	movl	%esi, 56(%rsp)
	movl	%edx, %ebp
	testl	%edx, %edx
	jle	.L4971
	movl	56(%rsp), %edx
	movl	$0, 24(%rsp)
	testl	%edx, %edx
	jle	.L4969
	leaq	(%rcx,%rcx,2), %rdx
	movq	%r14, %r15
	salq	$5, %rdx
	leaq	(%r14,%rdx), %r8
	movq	%r8, 64(%rsp)
.L4713:
	xorl	%r11d, %r11d
	movl	%ebp, 76(%rsp)
	movq	64(%rsp), %r13
	movl	%r11d, %r12d
	jmp	.L4712
.L5015:
	movslq	18096(%r13), %rax
	movl	60(%rsp), %ecx
	movq	%r14, %rsi
	movq	%r15, %rdi
	imulq	$1680, %rax, %rax
	leaq	8(%r15,%rax), %rdx
	call	stbi__jpeg_decode_block_prog_dc
	testl	%eax, %eax
	je	.L4605
.L4667:
	movl	18540(%r15), %eax
	subl	$1, %eax
	movl	%eax, 18540(%r15)
	testl	%eax, %eax
	jle	.L5014
	addl	$1, %r12d
	cmpl	%r12d, 56(%rsp)
	je	.L4945
.L5020:
	movl	18484(%r15), %eax
.L4712:
	movl	24(%rsp), %edx
	imull	18168(%r13), %edx
	movl	%eax, %ebx
	movq	18160(%r13), %rcx
	addl	%r12d, %edx
	sall	$6, %edx
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx,2), %r14
	testl	%eax, %eax
	je	.L5015
	movslq	18100(%r13), %rsi
	movl	18492(%r15), %r8d
	movl	18496(%r15), %ecx
	imulq	$1680, %rsi, %rdx
	leaq	6728(%r15,%rdx), %rdi
	movl	18500(%r15), %edx
	testl	%r8d, %r8d
	jne	.L4665
	testl	%edx, %edx
	jne	.L5016
	movl	$1, %eax
	salq	$10, %rsi
	movl	%r12d, 4(%rsp)
	movq	%rdi, %r12
	sall	%cl, %eax
	movq	%r13, 8(%rsp)
	leaq	13960(%rsi), %rbp
	movl	%ebx, %r13d
	movl	%eax, %ebx
	jmp	.L4681
	.p2align 4,,10
	.p2align 3
.L4668:
	movl	18464(%r15), %edi
	movl	%edi, %eax
	shrl	$23, %eax
	leaq	(%r15,%rax,2), %rax
	movswl	(%rax,%rbp), %eax
	movl	%eax, %ecx
	testl	%eax, %eax
	je	.L4669
	movl	%eax, %esi
	movl	18468(%r15), %r8d
	andl	$15, %ecx
	sarl	$4, %esi
	andl	$15, %esi
	addl	%r13d, %esi
	cmpl	%r8d, %ecx
	jg	.L4672
	sall	%cl, %edi
	sarl	$8, %eax
	leal	1(%rsi), %r13d
	movslq	%esi, %rsi
	movl	%edi, 18464(%r15)
	imull	%ebx, %eax
	subl	%ecx, %r8d
	leaq	stbi__jpeg_dezigzag(%rip), %rdi
	movzbl	(%rdi,%rsi), %ecx
	movl	%r8d, 18468(%r15)
	movw	%ax, (%r14,%rcx,2)
.L4671:
	cmpl	%r13d, 18488(%r15)
	jl	.L5017
.L4681:
	cmpl	$15, 18468(%r15)
	jg	.L4668
	movq	%r15, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L4668
.L4669:
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	stbi__jpeg_huff_decode
	testl	%eax, %eax
	js	.L4672
	movl	%eax, %ecx
	sarl	$4, %ecx
	andl	$15, %eax
	jne	.L4673
	cmpl	$14, %ecx
	jle	.L5018
	addl	$16, %r13d
	cmpl	%r13d, 18488(%r15)
	jge	.L4681
.L5017:
	movl	4(%rsp), %r12d
	movq	8(%rsp), %r13
	jmp	.L4667
.L5014:
	cmpl	$23, 18468(%r15)
	jle	.L5019
.L4709:
	movzbl	18472(%r15), %eax
	leal	48(%rax), %edx
	cmpb	$7, %dl
	ja	.L4958
	movl	18536(%r15), %eax
	movl	$2147483647, %edx
	movl	$0, 18476(%r15)
	movl	$0, 18392(%r15)
	testl	%eax, %eax
	movl	$0, 18296(%r15)
	cmove	%edx, %eax
	addl	$1, %r12d
	movl	$0, 18200(%r15)
	movl	$0, 18104(%r15)
	movq	$0, 18464(%r15)
	movb	$-1, 18472(%r15)
	movl	%eax, 18540(%r15)
	movl	$0, 18500(%r15)
	cmpl	%r12d, 56(%rsp)
	jne	.L5020
.L4945:
	addl	$1, 24(%rsp)
	movl	76(%rsp), %ebp
	movl	24(%rsp), %eax
	cmpl	%eax, %ebp
	je	.L4970
	movl	18484(%r15), %eax
	jmp	.L4713
.L4673:
	addl	%r13d, %ecx
	leaq	stbi__jpeg_dezigzag(%rip), %rdi
	leal	1(%rcx), %r13d
	movslq	%ecx, %rcx
	movzbl	(%rdi,%rcx), %r9d
	movl	18468(%r15), %edi
	cmpl	%edi, %eax
	jg	.L5021
.L4679:
	movl	18464(%r15), %esi
	movl	%eax, %ecx
	movslq	%eax, %r11
	subl	%eax, %edi
	movl	%edi, 18468(%r15)
	leaq	stbi__jbias(%rip), %rdi
	movl	%esi, %edx
	movl	%esi, %eax
	roll	%cl, %edx
	shrl	$31, %eax
	movl	%edx, %ecx
	leaq	stbi__bmask(%rip), %rdx
	subl	$1, %eax
	andl	(%rdi,%r11,4), %eax
	movl	(%rdx,%r11,4), %edx
	movl	%edx, %r10d
	notl	%r10d
	andl	%ecx, %r10d
	andl	%edx, %ecx
	addl	%ecx, %eax
	movl	%r10d, 18464(%r15)
	imull	%ebx, %eax
.L4680:
	movw	%ax, (%r14,%r9,2)
	jmp	.L4671
.L4665:
	movl	$1, %r8d
	sall	%cl, %r8d
	movw	%r8w, 4(%rsp)
	testl	%edx, %edx
	jne	.L4943
	movswl	%r8w, %eax
	movq	%rdi, 32(%rsp)
	movl	%eax, 72(%rsp)
	movl	%r12d, 40(%rsp)
	movq	%r13, 48(%rsp)
	movq	%r14, %r13
	movl	%r8d, %r14d
	.p2align 4,,10
	.p2align 3
.L4682:
	movq	32(%rsp), %rsi
	movq	%r15, %rdi
	call	stbi__jpeg_huff_decode
	movl	%eax, %r9d
	testl	%eax, %eax
	js	.L4672
	movl	%eax, %r12d
	sarl	$4, %r12d
	andl	$15, %r9d
	jne	.L4689
	cmpl	$14, %r12d
	jg	.L4690
	movl	$1, %eax
	movl	%r12d, %ecx
	sall	%cl, %eax
	subl	$1, %eax
	movl	%eax, 18500(%r15)
	testl	%r12d, %r12d
	jne	.L5022
.L4691:
	movl	$64, %r12d
	.p2align 4,,10
	.p2align 3
.L4690:
	movl	18488(%r15), %edi
	cmpl	%edi, %ebx
	jg	.L4968
	movslq	%ebx, %rbp
	leaq	stbi__jpeg_dezigzag(%rip), %rax
	movl	%r14d, %esi
	movl	%r9d, 8(%rsp)
	movq	%r13, %r14
	addq	%rax, %rbp
	movl	%r12d, %r13d
	jmp	.L4707
	.p2align 4,,10
	.p2align 3
.L4697:
	testl	%r13d, %r13d
	je	.L5023
	subl	$1, %r13d
.L4701:
	addq	$1, %rbp
	cmpl	%edi, %ebx
	jg	.L4968
.L4707:
	movzbl	0(%rbp), %eax
	addl	$1, %ebx
	leaq	(%r14,%rax,2), %r12
	cmpw	$0, (%r12)
	je	.L4697
	movl	18468(%r15), %eax
	testl	%eax, %eax
	jle	.L5024
.L4698:
	movl	18464(%r15), %ecx
	subl	$1, %eax
	movl	%eax, 18468(%r15)
	leal	(%rcx,%rcx), %r8d
	movl	%r8d, 18464(%r15)
	testl	%ecx, %ecx
	jns	.L4701
	movzwl	(%r12), %eax
	testw	%ax, 4(%rsp)
	jne	.L4701
	movl	%eax, %r8d
	leal	(%rax,%rsi), %ecx
	subl	%esi, %r8d
	testw	%ax, %ax
	movl	%r8d, %eax
	cmovg	%ecx, %eax
	movw	%ax, (%r12)
	jmp	.L4701
.L5023:
	movl	8(%rsp), %r9d
	movq	%r14, %r13
	movl	%esi, %r14d
	movw	%r9w, (%r12)
	cmpl	%edi, %ebx
	jle	.L4682
.L4968:
	movl	40(%rsp), %r12d
	movq	48(%rsp), %r13
	jmp	.L4667
	.p2align 4,,10
	.p2align 3
.L5024:
	movq	%r15, %rdi
	movl	%esi, 16(%rsp)
	call	stbi__grow_buffer_unsafe
	movl	18468(%r15), %eax
	movl	18488(%r15), %edi
	movl	16(%rsp), %esi
	testl	%eax, %eax
	jle	.L4701
	jmp	.L4698
	.p2align 4,,10
	.p2align 3
.L4689:
	cmpl	$1, %r9d
	jne	.L4672
	movl	18468(%r15), %eax
	testl	%eax, %eax
	jle	.L5025
.L4695:
	movl	18464(%r15), %esi
	subl	$1, %eax
	movl	72(%rsp), %r9d
	movl	%eax, 18468(%r15)
	leal	(%rsi,%rsi), %edi
	movl	%edi, 18464(%r15)
	testl	%esi, %esi
	js	.L4690
.L4696:
	movl	72(%rsp), %r9d
	negl	%r9d
	jmp	.L4690
.L5019:
	movq	%r15, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L4709
.L5025:
	movq	%r15, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18468(%r15), %eax
	testl	%eax, %eax
	jle	.L4696
	jmp	.L4695
	.p2align 4,,10
	.p2align 3
.L4672:
	leaq	.LC84(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L4605
.L4943:
	subl	$1, %edx
	movl	%edx, 18500(%r15)
	movl	18488(%r15), %edx
	cmpl	%edx, %eax
	jg	.L4667
	movq	%r13, 8(%rsp)
	movslq	%eax, %rbx
	movl	%r12d, %r13d
	movl	%r8d, %r12d
	jmp	.L4688
.L4683:
	addq	$1, %rbx
	cmpl	%ebx, %edx
	jl	.L5026
.L4688:
	leaq	stbi__jpeg_dezigzag(%rip), %rax
	movzbl	(%rax,%rbx), %eax
	leaq	(%r14,%rax,2), %rbp
	cmpw	$0, 0(%rbp)
	je	.L4683
	movl	18468(%r15), %eax
	testl	%eax, %eax
	jle	.L5027
.L4684:
	movl	18464(%r15), %ecx
	subl	$1, %eax
	movl	%eax, 18468(%r15)
	leal	(%rcx,%rcx), %edi
	movl	%edi, 18464(%r15)
	testl	%ecx, %ecx
	jns	.L4683
	movzwl	0(%rbp), %eax
	testw	%ax, 4(%rsp)
	jne	.L4683
	movl	%eax, %edi
	leal	(%rax,%r12), %ecx
	subl	%r12d, %edi
	testw	%ax, %ax
	movl	%edi, %eax
	cmovg	%ecx, %eax
	addq	$1, %rbx
	movw	%ax, 0(%rbp)
	cmpl	%ebx, %edx
	jge	.L4688
.L5026:
	movl	%r13d, %r12d
	movq	8(%rsp), %r13
	jmp	.L4667
.L5022:
	movl	18468(%r15), %edi
	cmpl	%edi, %r12d
	jg	.L5028
.L4692:
	leaq	stbi__bmask(%rip), %r10
	movslq	%r12d, %r11
	movl	%r12d, %ecx
	subl	%r12d, %edi
	movl	(%r10,%r11,4), %r11d
	movl	18464(%r15), %esi
	movl	%edi, 18468(%r15)
	movl	%r11d, %r10d
	roll	%cl, %esi
	notl	%r10d
	andl	%esi, %r10d
	andl	%r11d, %esi
	movl	%r10d, 18464(%r15)
	addl	%esi, %eax
.L4694:
	movl	%eax, 18500(%r15)
	jmp	.L4691
.L5021:
	movq	%r15, %rdi
	movb	%r9b, 32(%rsp)
	movl	%eax, 16(%rsp)
	call	stbi__grow_buffer_unsafe
	movl	18468(%r15), %edi
	movl	16(%rsp), %eax
	movzbl	32(%rsp), %r9d
	cmpl	%edi, %eax
	jle	.L4679
	xorl	%eax, %eax
	jmp	.L4680
.L5027:
	movq	%r15, %rdi
	call	stbi__grow_buffer_unsafe
	movl	18468(%r15), %eax
	movl	18488(%r15), %edx
	testl	%eax, %eax
	jle	.L4683
	jmp	.L4684
	.p2align 4,,10
	.p2align 3
.L5016:
	subl	$1, %edx
	movl	%edx, 18500(%r15)
	jmp	.L4667
.L4730:
	movb	$-1, 18472(%r14)
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jnb	.L4747
.L5012:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %ecx
.L4748:
	cmpb	$-1, %cl
	jne	.L4751
.L4757:
	movq	(%r14), %rbx
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5029
	movl	48(%rbx), %r11d
	testl	%r11d, %r11d
	je	.L4754
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L4973
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %esi
	addq	%rax, %rbp
	movq	%rbp, 200(%rbx)
.L4753:
	cmpb	$-1, %sil
	je	.L4757
	leal	-208(%rsi), %eax
	cmpl	$7, %eax
	ja	.L4746
	movzbl	18472(%r14), %esi
	cmpb	$-1, %sil
	jne	.L4975
	jmp	.L4745
	.p2align 4,,10
	.p2align 3
.L4624:
	movslq	18520(%r14), %rsi
	leaq	(%rsi,%rsi,2), %rcx
	movl	%esi, 4(%rsp)
	salq	$5, %rcx
	addq	%r14, %rcx
	movl	18108(%rcx), %eax
	movl	18112(%rcx), %ecx
	addl	$7, %ecx
	addl	$7, %eax
	sarl	$3, %ecx
	sarl	$3, %eax
	testl	%ecx, %ecx
	jle	.L4971
	movslq	%eax, %rdi
	leaq	0(,%rdi,8), %rbx
	movq	%rbx, 8(%rsp)
.L4628:
	testl	%eax, %eax
	jle	.L4942
	leaq	(%rsi,%rsi,2), %r10
	leaq	6728(%r14), %r15
	leaq	8(%r14), %rax
	salq	$5, %r10
	leaq	80(%rsp), %rbp
	leaq	(%r14,%r10), %r12
	movq	%rax, 16(%rsp)
	movq	%r15, %rax
	movq	%r12, %r15
	movq	%rbp, %r12
	movl	%r13d, %ebp
	movq	%rax, %r13
.L4636:
	movq	%r13, %rax
	movl	%ecx, 24(%rsp)
	movq	%r14, %r13
	xorl	%ebx, %ebx
	movq	%rax, %r14
	jmp	.L4635
.L4630:
	addq	$8, %rbx
	cmpq	%rbx, 8(%rsp)
	je	.L5030
.L4635:
	movslq	18100(%r15), %rax
	movslq	18096(%r15), %rdx
	subq	$8, %rsp
	.cfi_def_cfa_offset 296
	movq	%r13, %rdi
	movq	%rax, %rsi
	imulq	$1680, %rax, %rax
	imulq	$1680, %rdx, %rdx
	salq	$10, %rsi
	leaq	13960(%r13,%rsi), %r8
	movq	%r12, %rsi
	leaq	(%r14,%rax), %rcx
	movq	24(%rsp), %rax
	addq	%rax, %rdx
	movslq	18092(%r15), %rax
	salq	$7, %rax
	leaq	13448(%r13,%rax), %rax
	pushq	%rax
	.cfi_def_cfa_offset 304
	movl	20(%rsp), %r9d
	call	stbi__jpeg_decode_block
	popq	%r11
	.cfi_def_cfa_offset 296
	popq	%rdx
	.cfi_def_cfa_offset 288
	testl	%eax, %eax
	je	.L4605
	movl	18116(%r15), %esi
	movq	%r12, %rdx
	movl	%esi, %edi
	imull	%ebp, %edi
	sall	$3, %edi
	movslq	%edi, %rdi
	addq	%rbx, %rdi
	addq	18128(%r15), %rdi
	call	*18544(%r13)
	movl	18540(%r13), %eax
	subl	$1, %eax
	movl	%eax, 18540(%r13)
	testl	%eax, %eax
	jg	.L4630
	cmpl	$23, 18468(%r13)
	jle	.L5031
.L4631:
	movzbl	18472(%r13), %eax
	leal	48(%rax), %edx
	cmpb	$7, %dl
	ja	.L4953
	movl	18536(%r13), %eax
	movl	$2147483647, %edi
	movl	$0, 18476(%r13)
	movl	$0, 18392(%r13)
	testl	%eax, %eax
	movl	$0, 18296(%r13)
	cmove	%edi, %eax
	addq	$8, %rbx
	movl	$0, 18200(%r13)
	movl	$0, 18104(%r13)
	movq	$0, 18464(%r13)
	movb	$-1, 18472(%r13)
	movl	%eax, 18540(%r13)
	movl	$0, 18500(%r13)
	cmpq	%rbx, 8(%rsp)
	jne	.L4635
.L5030:
	movl	24(%rsp), %ecx
	movq	%r14, %rax
	addl	$1, %ebp
	movq	%r13, %r14
	movq	%rax, %r13
	cmpl	%ebp, %ecx
	jne	.L4636
	jmp	.L4969
	.p2align 4,,10
	.p2align 3
.L5031:
	movq	%r13, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L4631
.L5028:
	movq	%r15, %rdi
	movl	%r9d, 8(%rsp)
	call	stbi__grow_buffer_unsafe
	movl	18468(%r15), %edi
	movl	8(%rsp), %r9d
	movl	18500(%r15), %eax
	cmpl	%edi, %r12d
	jg	.L4694
	jmp	.L4692
	.p2align 4,,10
	.p2align 3
.L5029:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %esi
	jmp	.L4753
.L5010:
	movq	(%r14), %rbx
	jmp	.L4743
.L4739:
	movzbl	56(%rbx), %eax
	addq	%rcx, %rbp
	movq	%rdi, 192(%rbx)
	movq	%rbp, 200(%rbx)
	movl	%eax, %edx
	movl	%eax, %esi
	leal	-1(%rax), %r8d
	jmp	.L4737
.L5018:
	movl	$1, %esi
	movl	4(%rsp), %r12d
	movq	8(%rsp), %r13
	movl	$1, %eax
	sall	%cl, %esi
	movl	%esi, 18500(%r15)
	testl	%ecx, %ecx
	jne	.L5032
.L4675:
	subl	$1, %eax
	movl	%eax, 18500(%r15)
	jmp	.L4667
.L4953:
	movq	%r13, %r14
	jmp	.L4639
.L4958:
	movq	%r15, %r14
	jmp	.L4639
.L4971:
	movl	$255, %eax
	jmp	.L4639
.L4749:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%rbp, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L4750
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L4751
.L5032:
	movl	18468(%r15), %edx
	cmpl	%edx, %ecx
	jg	.L5033
.L4676:
	leaq	stbi__bmask(%rip), %rdi
	movslq	%ecx, %r8
	movl	18464(%r15), %eax
	subl	%ecx, %edx
	movl	(%rdi,%r8,4), %r8d
	movl	%edx, 18468(%r15)
	roll	%cl, %eax
	movl	%r8d, %edi
	notl	%edi
	andl	%eax, %edi
	andl	%r8d, %eax
	movl	%edi, 18464(%r15)
	addl	%esi, %eax
	jmp	.L4675
.L4750:
	cltq
	movq	%rdx, 192(%rbx)
	movzbl	56(%rbx), %ecx
	addq	%rax, %rbp
	movq	%rbp, 200(%rbx)
	jmp	.L4748
.L5013:
	cmpl	$23, 18468(%r15)
	jle	.L5034
.L4720:
	movzbl	18472(%r15), %eax
	leal	48(%rax), %edx
	cmpb	$7, %dl
	ja	.L4958
	movl	18536(%r15), %eax
	movl	$2147483647, %edx
	movl	$0, 18476(%r15)
	movl	$0, 18392(%r15)
	testl	%eax, %eax
	movl	$0, 18296(%r15)
	cmove	%edx, %eax
	movl	$0, 18200(%r15)
	movl	$0, 18104(%r15)
	movq	$0, 18464(%r15)
	movb	$-1, 18472(%r15)
	movl	%eax, 18540(%r15)
	movl	$0, 18500(%r15)
	jmp	.L4719
.L4942:
	addl	$1, %r13d
	cmpl	%r13d, %ecx
	jne	.L4628
	jmp	.L4969
	.p2align 4,,10
	.p2align 3
.L5033:
	movq	%r15, %rdi
	movl	%ecx, 4(%rsp)
	call	stbi__grow_buffer_unsafe
	movl	18468(%r15), %edx
	movl	4(%rsp), %ecx
	cmpl	%edx, %ecx
	jle	.L4677
	movl	18500(%r15), %eax
	jmp	.L4675
.L5034:
	movq	%r15, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L4720
.L4677:
	movl	18500(%r15), %esi
	jmp	.L4676
.L5007:
	movl	%eax, %esi
	jmp	.L4746
	.p2align 4,,10
	.p2align 3
.L5006:
	cmpl	$23, 18468(%r14)
	jle	.L5035
.L4650:
	movzbl	18472(%r14), %eax
	leal	48(%rax), %edx
	cmpb	$7, %dl
	ja	.L4639
	movl	18536(%r14), %eax
	movl	$2147483647, %edx
	movl	$0, 18476(%r14)
	movl	$0, 18392(%r14)
	testl	%eax, %eax
	movl	$0, 18296(%r14)
	cmove	%edx, %eax
	movl	$0, 18200(%r14)
	movl	$0, 18104(%r14)
	movq	$0, 18464(%r14)
	movb	$-1, 18472(%r14)
	movl	%eax, 18540(%r14)
	movl	$0, 18500(%r14)
	jmp	.L4649
.L4978:
	call	__stack_chk_fail@PLT
	.p2align 4,,10
	.p2align 3
.L5035:
	movq	%r14, %rdi
	call	stbi__grow_buffer_unsafe
	jmp	.L4650
	.cfi_endproc
.LFE637:
	.size	stbi__decode_jpeg_image, .-stbi__decode_jpeg_image
	.p2align 4
	.type	stbi__is_16_main, @function
stbi__is_16_main:
.LFB750:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%edx, %edx
	movl	$2, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	%rdi, (%rsp)
	movq	%rsp, %rdi
	call	stbi__parse_png_file
	testl	%eax, %eax
	je	.L5067
	cmpl	$16, 32(%rsp)
	je	.L5040
	movq	(%rsp), %rax
	movdqu	208(%rax), %xmm0
	movups	%xmm0, 192(%rax)
.L5038:
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rax
	cmpq	%rax, %rdx
	jb	.L5068
	movl	48(%rbx), %esi
	testl	%esi, %esi
	jne	.L5069
.L5063:
	movq	208(%rbx), %rax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%rax, 192(%rbx)
	movq	216(%rbx), %rax
	movq	%rax, 200(%rbx)
	call	stbi__pnm_info
	cmpl	$16, %eax
	sete	%al
	movzbl	%al, %eax
.L5036:
	movq	40(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L5070
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5067:
	.cfi_restore_state
	movq	(%rsp), %rax
	movdqu	208(%rax), %xmm1
	movups	%xmm1, 192(%rax)
	jmp	.L5038
	.p2align 4,,10
	.p2align 3
.L5068:
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rbx)
	movzbl	(%rdx), %ebp
	sall	$8, %ebp
.L5042:
	cmpq	%rax, %rsi
	jnb	.L5045
	leaq	1(%rsi), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rsi), %edx
	addl	%edx, %ebp
.L5046:
	sall	$16, %ebp
	movl	%ebp, %r12d
	cmpq	%rax, %rcx
	jnb	.L5048
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rcx), %ebp
	sall	$8, %ebp
.L5049:
	cmpq	%rax, %rdx
	jnb	.L5053
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %eax
	addl	%eax, %ebp
.L5054:
	addl	%r12d, %ebp
	cmpl	$943870035, %ebp
	jne	.L5063
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$1, %eax
	jne	.L5063
	cmpq	$0, 16(%rbx)
	movq	192(%rbx), %rax
	je	.L5060
	movq	200(%rbx), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	$5, %edx
	jle	.L5071
.L5060:
	addq	$6, %rax
	movq	%rax, 192(%rbx)
.L5061:
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	ja	.L5063
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	jne	.L5063
	.p2align 4,,10
	.p2align 3
.L5040:
	movl	$1, %eax
	jmp	.L5036
	.p2align 4,,10
	.p2align 3
.L5069:
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rsi
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ebp, %ebp
	jne	.L5044
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rsi, 200(%rbx)
	movq	%rsi, 192(%rbx)
.L5045:
	movl	48(%rbx), %ecx
	testl	%ecx, %ecx
	je	.L5063
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L5047
	movl	$0, 48(%rbx)
	sall	$16, %ebp
	movb	$0, 56(%rbx)
	movl	%ebp, %r12d
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
.L5048:
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L5063
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	leaq	57(%rbx), %rdx
	movslq	%eax, %rbp
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%ebp, %ebp
	jne	.L5052
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, 200(%rbx)
	movq	%rdx, 192(%rbx)
.L5053:
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L5054
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r13, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	je	.L5072
	cltq
	addq	%rax, %r13
	movzbl	56(%rbx), %eax
	addl	%eax, %ebp
.L5056:
	movq	%r13, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L5054
	.p2align 4,,10
	.p2align 3
.L5044:
	leaq	(%r12,%rbp), %rax
	movzbl	56(%rbx), %ebp
	movq	%rsi, 192(%rbx)
	movq	%rax, 200(%rbx)
	sall	$8, %ebp
	jmp	.L5042
	.p2align 4,,10
	.p2align 3
.L5052:
	leaq	0(%r13,%rbp), %rax
	movzbl	56(%rbx), %ebp
	movq	%rdx, 192(%rbx)
	movq	%rax, 200(%rbx)
	sall	$8, %ebp
	jmp	.L5049
	.p2align 4,,10
	.p2align 3
.L5072:
	movl	$0, 48(%rbx)
	movq	%rdx, %r13
	movb	$0, 56(%rbx)
	jmp	.L5056
	.p2align 4,,10
	.p2align 3
.L5047:
	movzbl	56(%rbx), %edx
	cltq
	movq	%rcx, 192(%rbx)
	addq	%r12, %rax
	movq	%rax, 200(%rbx)
	addl	%edx, %ebp
	jmp	.L5046
	.p2align 4,,10
	.p2align 3
.L5071:
	movl	$6, %esi
	movq	%rcx, 192(%rbx)
	movq	40(%rbx), %rdi
	subl	%edx, %esi
	call	*24(%rbx)
	jmp	.L5061
.L5070:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE750:
	.size	stbi__is_16_main, .-stbi__is_16_main
	.section	.rodata.str1.1
.LC211:
	.string	"bad header"
.LC212:
	.string	"bad offset"
.LC213:
	.string	"invalid"
.LC214:
	.string	"bad bpp"
.LC215:
	.string	"bad masks"
.LC216:
	.string	"v < 256"
	.text
	.p2align 4
	.type	stbi__bmp_load.constprop.0, @function
stbi__bmp_load.constprop.0:
.LFB862:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$1240, %rsp
	.cfi_def_cfa_offset 1296
	movq	%rsi, 96(%rsp)
	leaq	144(%rsp), %rsi
	movq	%rdx, 104(%rsp)
	movq	%rcx, 112(%rsp)
	movl	%r8d, 80(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 1224(%rsp)
	xorl	%eax, %eax
	movl	$255, 172(%rsp)
	call	stbi__bmp_parse_header.constprop.0
	testq	%rax, %rax
	je	.L5075
	movl	4(%rbx), %eax
	movl	%eax, %ecx
	movl	%eax, 120(%rsp)
	negl	%ecx
	cmovs	%eax, %ecx
	movl	%ecx, 4(%rbx)
	cmpl	$16777216, %ecx
	jg	.L5078
	movl	(%rbx), %edi
	cmpl	$16777216, %edi
	ja	.L5078
	movl	160(%rsp), %eax
	movl	152(%rsp), %r13d
	movl	156(%rsp), %r15d
	movl	144(%rsp), %r9d
	movl	%eax, 48(%rsp)
	movl	164(%rsp), %eax
	movl	%eax, 52(%rsp)
	movl	168(%rsp), %eax
	movl	%eax, 16(%rsp)
	movl	172(%rsp), %eax
	movl	%eax, 24(%rsp)
	cmpl	$12, %r13d
	je	.L5359
	cmpl	$15, %r9d
	jg	.L5080
	movl	148(%rsp), %r12d
	movl	%r12d, %eax
	subl	176(%rsp), %eax
	subl	%r13d, %eax
	sarl	$2, %eax
	movl	%eax, %r11d
.L5081:
	testl	%r11d, %r11d
	je	.L5080
	cmpl	$-16777216, 16(%rsp)
	sete	%r8b
	cmpl	$24, %r9d
	sete	%r14b
	jmp	.L5234
	.p2align 4,,10
	.p2align 3
.L5359:
	cmpl	$23, %r9d
	jle	.L5360
.L5080:
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	184(%rbx), %eax
	leal	-1(%rax), %edx
	cmpl	$1023, %edx
	ja	.L5361
	movl	148(%rsp), %r12d
	cmpl	%r12d, %eax
	jg	.L5083
	movl	%r12d, %esi
	subl	%eax, %esi
	cmpl	$1024, %esi
	jg	.L5083
	testl	%esi, %esi
	je	.L5085
	movq	%rbx, %rdi
	movl	%r9d, (%rsp)
	call	stbi__skip.part.0
	movl	4(%rbx), %ecx
	movl	(%rbx), %edi
	movl	(%rsp), %r9d
.L5085:
	cmpl	$-16777216, 16(%rsp)
	sete	%r8b
	cmpl	$24, %r9d
	sete	%r14b
	movl	%r8d, %eax
	andb	%r14b, %al
	jne	.L5237
	xorl	%r11d, %r11d
.L5234:
	cmpl	$1, 16(%rsp)
	movl	$3, %eax
	sbbl	$-1, %eax
	movl	%eax, %r10d
.L5086:
	movl	80(%rsp), %eax
	movl	%r10d, 8(%rbx)
	cmpl	$3, %eax
	cmovge	%eax, %r10d
	testl	%edi, %edi
	js	.L5078
	je	.L5362
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%edi
	cmpl	%eax, %r10d
	jg	.L5078
	testl	%ecx, %ecx
	js	.L5078
	imull	%r10d, %edi
	testl	%ecx, %ecx
	je	.L5090
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%ecx
	cmpl	%edi, %eax
	jge	.L5090
	.p2align 4,,10
	.p2align 3
.L5078:
	leaq	.LC66(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5075:
	xorl	%ebp, %ebp
.L5073:
	movq	1224(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L5363
	addq	$1240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5360:
	.cfi_restore_state
	movl	148(%rsp), %r12d
	movl	%r12d, %eax
	subl	176(%rsp), %eax
	subl	$24, %eax
	movslq	%eax, %rdx
	sarl	$31, %eax
	imulq	$1431655766, %rdx, %rdx
	shrq	$32, %rdx
	movl	%edx, %r11d
	subl	%eax, %r11d
	jmp	.L5081
.L5362:
	testl	%ecx, %ecx
	js	.L5078
.L5090:
	imull	%ecx, %edi
	movl	%r9d, 40(%rsp)
	movb	%r8b, 32(%rsp)
	movl	%r11d, 8(%rsp)
	movslq	%edi, %rdi
	movl	%r10d, (%rsp)
	call	malloc@PLT
	movl	(%rsp), %r10d
	movl	8(%rsp), %r11d
	testq	%rax, %rax
	movzbl	32(%rsp), %r8d
	movl	40(%rsp), %r9d
	movq	%rax, %rbp
	je	.L5364
	cmpl	$15, %r9d
	jg	.L5092
	testl	%r11d, %r11d
	je	.L5093
	cmpl	$256, %r11d
	jg	.L5093
	testl	%r11d, %r11d
	jle	.L5110
	leaq	192(%rsp), %r14
	movslq	%r11d, %rax
	movq	%rbp, 40(%rsp)
	movq	%rbx, %rbp
	movl	%r12d, (%rsp)
	leaq	(%r14,%rax,4), %r15
	movq	%r14, %rbx
	movl	%r10d, 8(%rsp)
	movl	%r11d, 16(%rsp)
	movl	%r9d, 32(%rsp)
	jmp	.L5109
	.p2align 4,,10
	.p2align 3
.L5096:
	movl	48(%rbp), %r11d
	testl	%r11d, %r11d
	jne	.L5365
	movb	$0, 2(%rbx)
.L5100:
	movl	48(%rbp), %r10d
	testl	%r10d, %r10d
	jne	.L5366
.L5102:
	movb	$0, 1(%rbx)
.L5104:
	movl	48(%rbp), %r9d
	xorl	%r12d, %r12d
	testl	%r9d, %r9d
	jne	.L5367
.L5105:
	movb	%r12b, (%rbx)
	cmpl	$12, %r13d
	je	.L5108
	movq	%rbp, %rdi
	call	stbi__get8
.L5108:
	addq	$4, %rbx
	cmpq	%rbx, %r15
	je	.L5368
.L5109:
	movq	192(%rbp), %rdx
	movq	200(%rbp), %rax
	cmpq	%rax, %rdx
	jnb	.L5096
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%rbp)
	movzbl	(%rdx), %edx
.L5097:
	movb	%dl, 2(%rbx)
	cmpq	%rax, %rdi
	jnb	.L5100
	leaq	1(%rdi), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rdi), %esi
.L5101:
	movb	%sil, 1(%rbx)
	cmpq	%rax, %rdx
	jnb	.L5104
	leaq	1(%rdx), %rax
	movq	%rax, 192(%rbp)
	movzbl	(%rdx), %r12d
	jmp	.L5105
	.p2align 4,,10
	.p2align 3
.L5092:
	subl	176(%rsp), %r12d
	subl	%r13d, %r12d
	je	.L5151
	js	.L5369
	movl	%r12d, %esi
	movq	%rbx, %rdi
	movl	%r9d, 32(%rsp)
	movb	%r8b, 8(%rsp)
	movl	%r10d, (%rsp)
	call	stbi__skip.part.0
	movl	32(%rsp), %r9d
	movzbl	8(%rsp), %r8d
	movl	(%rsp), %r10d
.L5151:
	testb	%r14b, %r14b
	jne	.L5370
	cmpl	$16, %r9d
	je	.L5371
	movl	$0, 84(%rsp)
	cmpl	$32, %r9d
	je	.L5372
.L5156:
	movl	48(%rsp), %esi
	testl	%r15d, %r15d
	sete	%al
	testl	%esi, %esi
	sete	%dl
	orb	%dl, %al
	jne	.L5182
	movl	52(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L5182
.L5160:
	movl	%r15d, %eax
	cmpl	$65535, %r15d
	ja	.L5373
	movl	$8, %edx
	xorl	%edi, %edi
.L5162:
	cmpl	$255, %eax
	jbe	.L5163
	shrl	$8, %eax
	movl	%edx, %edi
.L5163:
	cmpl	$15, %eax
	jbe	.L5164
	addl	$4, %edi
	shrl	$4, %eax
.L5164:
	cmpl	$3, %eax
	jbe	.L5165
	addl	$2, %edi
	shrl	$2, %eax
.L5165:
	cmpl	$1, %eax
	movl	%r15d, %edx
	setne	%al
	andl	$1431655765, %edx
	movzbl	%al, %eax
	addl	%eax, %edi
	movl	%r15d, %eax
	shrl	%eax
	andl	$1431655765, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$2, %eax
	andl	$858993459, %eax
	andl	$858993459, %edx
	addl	%eax, %edx
	movl	%edx, %eax
	shrl	$4, %eax
	addl	%edx, %eax
	andl	$252645135, %eax
	movl	%eax, %edx
	shrl	$8, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$16, %edx
	addl	%edx, %eax
	movzbl	%al, %eax
	movl	%eax, 56(%rsp)
	movl	48(%rsp), %eax
	testl	%eax, %eax
	je	.L5252
	cmpl	$65535, %eax
	jbe	.L5253
	shrl	$16, %eax
	movl	$24, %edx
	movl	$16, %esi
.L5168:
	cmpl	$255, %eax
	jbe	.L5169
	shrl	$8, %eax
	movl	%edx, %esi
.L5169:
	cmpl	$15, %eax
	jbe	.L5170
	addl	$4, %esi
	shrl	$4, %eax
.L5170:
	cmpl	$3, %eax
	jbe	.L5171
	addl	$2, %esi
	shrl	$2, %eax
.L5171:
	cmpl	$1, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %esi
.L5167:
	movl	48(%rsp), %eax
	movl	%eax, %edx
	andl	$1431655765, %eax
	shrl	%edx
	andl	$1431655765, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$2, %eax
	andl	$858993459, %edx
	andl	$858993459, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$4, %edx
	addl	%eax, %edx
	andl	$252645135, %edx
	movl	%edx, %eax
	shrl	$8, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$16, %edx
	addl	%edx, %eax
	movzbl	%al, %eax
	movl	%eax, 60(%rsp)
	movl	52(%rsp), %eax
	cmpl	$65535, %eax
	jbe	.L5254
	shrl	$16, %eax
	movl	$24, %edx
	movl	$16, %r8d
.L5172:
	cmpl	$255, %eax
	jbe	.L5173
	shrl	$8, %eax
	movl	%edx, %r8d
.L5173:
	cmpl	$15, %eax
	jbe	.L5174
	addl	$4, %r8d
	shrl	$4, %eax
.L5174:
	cmpl	$3, %eax
	jbe	.L5175
	addl	$2, %r8d
	shrl	$2, %eax
.L5175:
	cmpl	$1, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %r8d
	movl	52(%rsp), %eax
	movl	%eax, %edx
	andl	$1431655765, %eax
	shrl	%edx
	andl	$1431655765, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$2, %eax
	andl	$858993459, %edx
	andl	$858993459, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$4, %edx
	addl	%eax, %edx
	andl	$252645135, %edx
	movl	%edx, %eax
	shrl	$8, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$16, %edx
	addl	%edx, %eax
	movzbl	%al, %eax
	movl	%eax, 64(%rsp)
	movl	16(%rsp), %eax
	testl	%eax, %eax
	je	.L5255
	cmpl	$65535, %eax
	jbe	.L5256
	shrl	$16, %eax
	movl	$24, %ecx
	movl	%eax, %edx
	movl	$16, %eax
.L5178:
	cmpl	$255, %edx
	jbe	.L5179
	shrl	$8, %edx
	movl	%ecx, %eax
.L5179:
	cmpl	$15, %edx
	jbe	.L5180
	addl	$4, %eax
	shrl	$4, %edx
.L5180:
	cmpl	$3, %edx
	jbe	.L5181
	addl	$2, %eax
	shrl	$2, %edx
.L5181:
	cmpl	$1, %edx
	setne	%dl
	movzbl	%dl, %edx
	addl	%edx, %eax
.L5177:
	movl	16(%rsp), %edx
	movl	%edx, %ecx
	andl	$1431655765, %edx
	shrl	%ecx
	andl	$1431655765, %ecx
	addl	%ecx, %edx
	movl	%edx, %ecx
	shrl	$2, %edx
	andl	$858993459, %ecx
	andl	$858993459, %edx
	addl	%ecx, %edx
	movl	%edx, %ecx
	shrl	$4, %ecx
	addl	%edx, %ecx
	andl	$252645135, %ecx
	movl	%ecx, %edx
	shrl	$8, %edx
	addl	%ecx, %edx
	movl	%edx, %ecx
	shrl	$16, %ecx
	addl	%ecx, %edx
	cmpl	$8, 56(%rsp)
	movzbl	%dl, %edx
	movl	%edx, 88(%rsp)
	jg	.L5182
	cmpl	$8, 60(%rsp)
	jg	.L5182
	cmpl	$8, 64(%rsp)
	jg	.L5182
	cmpl	$8, %edx
	jg	.L5182
	subl	$7, %eax
	subl	$7, %edi
	subl	$7, %esi
	movl	$0, 40(%rsp)
	movl	%eax, 92(%rsp)
	movl	(%rbx), %eax
	movl	%edi, 132(%rsp)
	leal	-7(%r8), %edi
	movl	%edi, 140(%rsp)
	movl	%eax, %edi
	movl	%esi, 136(%rsp)
	jmp	.L5154
	.p2align 4,,10
	.p2align 3
.L5367:
	leaq	56(%rbp), %r14
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r14, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L5106
	movl	$0, 48(%rbp)
	movq	%rdx, %rsi
	movb	$0, 56(%rbp)
.L5107:
	movq	%rsi, 200(%rbp)
	movq	%rdx, 192(%rbp)
	jmp	.L5105
	.p2align 4,,10
	.p2align 3
.L5366:
	leaq	56(%rbp), %r12
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	leaq	57(%rbp), %rdx
	testl	%eax, %eax
	jne	.L5103
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdx, 200(%rbp)
	movq	%rdx, 192(%rbp)
	jmp	.L5102
	.p2align 4,,10
	.p2align 3
.L5365:
	leaq	56(%rbp), %r12
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r12, %rsi
	call	*16(%rbp)
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rdi
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L5099
	movl	$0, 48(%rbp)
	movb	$0, 56(%rbp)
	movq	%rdi, 200(%rbp)
	movq	%rdi, 192(%rbp)
	movb	$0, 2(%rbx)
	jmp	.L5100
	.p2align 4,,10
	.p2align 3
.L5368:
	movq	%rbp, %rbx
	movl	(%rsp), %r12d
	movl	8(%rsp), %r10d
	movl	16(%rsp), %r11d
	movl	32(%rsp), %r9d
	movq	40(%rsp), %rbp
.L5110:
	subl	176(%rsp), %r12d
	xorl	%eax, %eax
	subl	%r13d, %r12d
	cmpl	$12, %r13d
	setne	%al
	addl	$3, %eax
	imull	%r11d, %eax
	subl	%eax, %r12d
	je	.L5111
	js	.L5374
	movl	%r12d, %esi
	movq	%rbx, %rdi
	movl	%r9d, 8(%rsp)
	movl	%r10d, (%rsp)
	call	stbi__skip.part.0
	movl	8(%rsp), %r9d
	movl	(%rsp), %r10d
.L5111:
	cmpl	$1, %r9d
	je	.L5375
	cmpl	$4, %r9d
	je	.L5376
	cmpl	$8, %r9d
	jne	.L5118
	movl	(%rbx), %eax
	movl	%eax, %edx
	movl	%eax, %edi
	negl	%edx
	andl	$3, %edx
	movl	%edx, 48(%rsp)
.L5117:
	movl	4(%rbx), %r8d
	xorl	%r13d, %r13d
	xorl	%r11d, %r11d
	leaq	57(%rbx), %rcx
	testl	%r8d, %r8d
	jle	.L5115
	movl	%r11d, (%rsp)
	movq	%rbp, %r14
	movl	%r9d, %r15d
	movl	%r10d, %ebp
	movq	%rcx, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L5119:
	xorl	%r8d, %r8d
	leaq	192(%rsp), %r11
	testl	%eax, %eax
	jle	.L5138
	.p2align 4,,10
	.p2align 3
.L5146:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5377
	movl	48(%rbx), %eax
	xorl	%r12d, %r12d
	testl	%eax, %eax
	jne	.L5378
.L5133:
	xorl	%edx, %edx
	cmpl	$4, %r15d
	jne	.L5136
	movl	%r12d, %edx
	sarl	$4, %eax
	andl	$15, %edx
.L5136:
	cltq
	movslq	%r13d, %rcx
	leal	3(%r13), %r12d
	movzwl	(%r11,%rax,4), %esi
	movzbl	194(%rsp,%rax,4), %eax
	movw	%si, (%r14,%rcx)
	leal	2(%r13), %ecx
	movslq	%ecx, %rcx
	movb	%al, (%r14,%rcx)
	cmpl	$4, %ebp
	jne	.L5137
	movslq	%r12d, %r12
	movb	$-1, (%r14,%r12)
	leal	4(%r13), %r12d
.L5137:
	movl	(%rbx), %eax
	leal	1(%r8), %ecx
	movl	%eax, %edi
	cmpl	%ecx, %eax
	je	.L5246
	cmpl	$8, %r15d
	je	.L5379
.L5139:
	movslq	%edx, %rax
	movslq	%r12d, %rdx
	leal	3(%r12), %r13d
	movzwl	(%r11,%rax,4), %ecx
	movzbl	194(%rsp,%rax,4), %eax
	movw	%cx, (%r14,%rdx)
	leal	2(%r12), %edx
	movslq	%edx, %rdx
	movb	%al, (%r14,%rdx)
	cmpl	$4, %ebp
	je	.L5380
	movl	(%rbx), %eax
	addl	$2, %r8d
	movl	%eax, %edi
	cmpl	%eax, %r8d
	jl	.L5146
.L5138:
	movl	48(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L5148
	cmpq	$0, 16(%rbx)
	movq	192(%rbx), %rdx
	je	.L5149
	movq	200(%rbx), %r8
	movq	%r8, %rsi
	subq	%rdx, %rsi
	cmpl	%esi, %ecx
	jg	.L5381
.L5149:
	movslq	48(%rsp), %rsi
	addq	%rsi, %rdx
	movq	%rdx, 192(%rbx)
.L5148:
	addl	$1, (%rsp)
	movl	4(%rbx), %r8d
	movl	(%rsp), %esi
	cmpl	%r8d, %esi
	jl	.L5119
	movl	%ebp, %r10d
	movq	%r14, %rbp
	jmp	.L5115
	.p2align 4,,10
	.p2align 3
.L5083:
	leaq	.LC212(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5075
.L5361:
	leaq	.LC211(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5075
.L5099:
	cltq
	movq	%rdi, 192(%rbp)
	movzbl	56(%rbp), %edx
	addq	%r12, %rax
	movq	%rax, 200(%rbp)
	jmp	.L5097
.L5103:
	cltq
	movq	%rdx, 192(%rbp)
	movzbl	56(%rbp), %esi
	addq	%r12, %rax
	movq	%rax, 200(%rbp)
	jmp	.L5101
.L5106:
	cltq
	movzbl	56(%rbp), %r12d
	leaq	(%r14,%rax), %rsi
	jmp	.L5107
.L5370:
	movl	(%rbx), %eax
	movl	$1, 40(%rsp)
	leal	(%rax,%rax,2), %edx
	movl	%eax, %edi
	negl	%edx
	andl	$3, %edx
	movl	%edx, 84(%rsp)
.L5357:
	movl	$0, 88(%rsp)
	movl	$0, 64(%rsp)
	movl	$0, 60(%rsp)
	movl	$0, 56(%rsp)
	movl	$0, 92(%rsp)
	movl	$0, 140(%rsp)
	movl	$0, 136(%rsp)
	movl	$0, 132(%rsp)
.L5154:
	movl	4(%rbx), %r8d
	testl	%r8d, %r8d
	jle	.L5115
	movl	56(%rsp), %edx
	movl	$8, %esi
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	movl	%r15d, 72(%rsp)
	leaq	mul_table.40(%rip), %r14
	subl	%edx, %esi
	movl	%r9d, 76(%rsp)
	movl	%esi, 68(%rsp)
	movl	%r10d, 8(%rsp)
	movl	%r13d, %r10d
	.p2align 4,,10
	.p2align 3
.L5225:
	movl	40(%rsp), %edx
	testl	%edx, %edx
	jne	.L5183
	xorl	%r8d, %r8d
	testl	%eax, %eax
	jle	.L5185
	movq	%rbx, (%rsp)
	movl	132(%rsp), %r13d
	movl	%r10d, 124(%rsp)
	movl	140(%rsp), %r15d
	movl	136(%rsp), %ebx
	jmp	.L5184
	.p2align 4,,10
	.p2align 3
.L5206:
	call	stbi__get32le
	movl	32(%rsp), %r8d
	leaq	shift_table.39(%rip), %rsi
	movl	%eax, %edi
.L5207:
	movl	72(%rsp), %eax
	movl	%r13d, %ecx
	negl	%ecx
	andl	%edi, %eax
	movl	%eax, %r10d
	sall	%cl, %r10d
	movl	%r13d, %ecx
	shrl	%cl, %eax
	testl	%r13d, %r13d
	cmovs	%r10d, %eax
	cmpl	$255, %eax
	ja	.L5213
	movzbl	68(%rsp), %ecx
	movslq	%r12d, %r10
	leal	1(%r12), %r11d
	shrl	%cl, %eax
	movslq	56(%rsp), %rcx
	imull	(%r14,%rcx,4), %eax
	movl	(%rsi,%rcx,4), %ecx
	sarl	%cl, %eax
	movl	%ebx, %ecx
	movb	%al, 0(%rbp,%r10)
	movl	48(%rsp), %eax
	negl	%ecx
	andl	%edi, %eax
	movl	%eax, %r10d
	sall	%cl, %r10d
	movl	%ebx, %ecx
	shrl	%cl, %eax
	testl	%ebx, %ebx
	cmovs	%r10d, %eax
	cmpl	$255, %eax
	ja	.L5213
	movl	60(%rsp), %edx
	movl	$8, %ecx
	movslq	%r11d, %r11
	leal	2(%r12), %r10d
	subl	%edx, %ecx
	shrl	%cl, %eax
	movslq	%edx, %rcx
	imull	(%r14,%rcx,4), %eax
	movl	(%rsi,%rcx,4), %ecx
	sarl	%cl, %eax
	movl	%r15d, %ecx
	movb	%al, 0(%rbp,%r11)
	movl	52(%rsp), %eax
	negl	%ecx
	andl	%edi, %eax
	movl	%eax, %r11d
	sall	%cl, %r11d
	movl	%r15d, %ecx
	shrl	%cl, %eax
	testl	%r15d, %r15d
	cmovs	%r11d, %eax
	cmpl	$255, %eax
	ja	.L5213
	movl	64(%rsp), %edx
	movl	$8, %ecx
	movslq	%r10d, %r10
	leal	3(%r12), %r11d
	subl	%edx, %ecx
	shrl	%cl, %eax
	movslq	%edx, %rcx
	imull	(%r14,%rcx,4), %eax
	movl	(%rsi,%rcx,4), %ecx
	sarl	%cl, %eax
	movl	16(%rsp), %ecx
	movb	%al, 0(%rbp,%r10)
	movl	$255, %eax
	testl	%ecx, %ecx
	jne	.L5382
.L5216:
	orl	%eax, 24(%rsp)
	cmpl	$4, 8(%rsp)
	je	.L5383
	movq	(%rsp), %rax
	addl	$1, %r8d
	movl	(%rax), %eax
	movl	%eax, %edi
	cmpl	%eax, %r8d
	jge	.L5384
.L5220:
	movl	%r11d, %r12d
.L5184:
	cmpl	$16, 76(%rsp)
	movq	(%rsp), %rdi
	movl	%r8d, 32(%rsp)
	jne	.L5206
	call	stbi__get16le
	movl	32(%rsp), %r8d
	leaq	shift_table.39(%rip), %rsi
	movl	%eax, %edi
	jmp	.L5207
	.p2align 4,,10
	.p2align 3
.L5383:
	movslq	%r11d, %r11
	addl	$1, %r8d
	addl	$4, %r12d
	movb	%al, 0(%rbp,%r11)
	movq	(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	cmpl	%eax, %r8d
	jge	.L5385
	movl	%r12d, %r11d
	jmp	.L5220
	.p2align 4,,10
	.p2align 3
.L5382:
	movl	92(%rsp), %edx
	movl	16(%rsp), %eax
	movl	%edx, %ecx
	andl	%edi, %eax
	negl	%ecx
	movl	%eax, %edi
	sall	%cl, %edi
	movl	%edx, %ecx
	shrl	%cl, %eax
	testl	%edx, %edx
	cmovs	%edi, %eax
	cmpl	$255, %eax
	ja	.L5213
	movl	88(%rsp), %edi
	movl	$8, %ecx
	subl	%edi, %ecx
	shrl	%cl, %eax
	movslq	%edi, %rcx
	imull	(%r14,%rcx,4), %eax
	movl	(%rsi,%rcx,4), %ecx
	sarl	%cl, %eax
	jmp	.L5216
	.p2align 4,,10
	.p2align 3
.L5183:
	testl	%eax, %eax
	jle	.L5185
	movl	%r10d, 124(%rsp)
	movl	24(%rsp), %r15d
	xorl	%r13d, %r13d
	movq	%rbp, %r9
	.p2align 4,,10
	.p2align 3
.L5358:
	movl	%r12d, %ebp
	movslq	%r12d, %r12
	movq	192(%rbx), %rax
	leaq	2(%r9,%r12), %r11
	cmpq	200(%rbx), %rax
	jb	.L5386
	movl	48(%rbx), %eax
	xorl	%r8d, %r8d
	testl	%eax, %eax
	jne	.L5387
.L5187:
	movb	%r8b, (%r11)
	leaq	1(%r9,%r12), %r11
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5388
	movl	48(%rbx), %r10d
	xorl	%r8d, %r8d
	testl	%r10d, %r10d
	jne	.L5389
.L5191:
	movb	%r8b, (%r11)
	addq	%r9, %r12
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5390
	movl	48(%rbx), %edi
	xorl	%r8d, %r8d
	testl	%edi, %edi
	jne	.L5391
.L5195:
	cmpl	$2, 40(%rsp)
	movb	%r8b, (%r12)
	leal	3(%rbp), %r12d
	je	.L5198
.L5395:
	orb	$-1, %r15b
	movl	$-1, %r8d
.L5199:
	cmpl	$4, 8(%rsp)
	je	.L5392
	movl	(%rbx), %eax
	addl	$1, %r13d
	movl	%eax, %edi
	cmpl	%eax, %r13d
	jl	.L5358
	movl	%r15d, 24(%rsp)
	movl	124(%rsp), %r10d
	movq	%r9, %rbp
.L5185:
	movl	84(%rsp), %edx
	testl	%edx, %edx
	je	.L5222
	cmpq	$0, 16(%rbx)
	movq	192(%rbx), %rcx
	je	.L5223
	movq	200(%rbx), %r8
	movq	%r8, %rsi
	subq	%rcx, %rsi
	cmpl	%esi, %edx
	jg	.L5393
.L5223:
	movslq	84(%rsp), %rsi
	addq	%rsi, %rcx
	movq	%rcx, 192(%rbx)
.L5222:
	movl	4(%rbx), %r8d
	addl	$1, %r10d
	cmpl	%r8d, %r10d
	jl	.L5225
	movl	8(%rsp), %r10d
.L5115:
	cmpl	$4, %r10d
	jne	.L5226
	movl	24(%rsp), %edx
	testl	%edx, %edx
	jne	.L5226
	movl	%eax, %edx
	imull	%r8d, %edx
	leal	-1(,%rdx,4), %edx
	testl	%edx, %edx
	js	.L5226
	.p2align 4,,10
	.p2align 3
.L5227:
	movb	$-1, 0(%rbp,%rdx)
	subq	$4, %rdx
	testl	%edx, %edx
	jns	.L5227
	movl	%eax, %edi
.L5226:
	movl	120(%rsp), %eax
	testl	%eax, %eax
	jle	.L5228
	cmpl	$1, %r8d
	jle	.L5228
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L5230:
	movl	%edi, %eax
	leal	-1(%r8), %edx
	imull	%r10d, %eax
	subl	%r9d, %edx
	movl	%eax, %ecx
	imull	%eax, %edx
	imull	%r9d, %ecx
	testl	%eax, %eax
	jle	.L5228
	movl	(%rbx), %edi
	xorl	%eax, %eax
	addq	%rbp, %rcx
	addq	%rbp, %rdx
	movl	%edi, %r11d
	imull	%r10d, %r11d
	.p2align 4,,10
	.p2align 3
.L5229:
	movzbl	(%rcx,%rax), %esi
	movzbl	(%rdx,%rax), %r8d
	movb	%r8b, (%rcx,%rax)
	movb	%sil, (%rdx,%rax)
	addq	$1, %rax
	cmpl	%eax, %r11d
	jg	.L5229
	movl	4(%rbx), %r8d
	addl	$1, %r9d
	movl	%r8d, %eax
	sarl	%eax
	cmpl	%eax, %r9d
	jl	.L5230
.L5228:
	movl	80(%rsp), %eax
	testl	%eax, %eax
	je	.L5231
	cmpl	%r10d, %eax
	je	.L5231
	movl	%edi, %ecx
	movl	%eax, %edx
	movq	%rbp, %rdi
	movl	%r10d, %esi
	call	stbi__convert_format
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L5075
	movl	(%rbx), %edi
.L5231:
	movq	96(%rsp), %rax
	movq	104(%rsp), %rsi
	movl	%edi, (%rax)
	movq	112(%rsp), %rdi
	movl	4(%rbx), %eax
	movl	%eax, (%rsi)
	testq	%rdi, %rdi
	je	.L5073
	movl	8(%rbx), %eax
	movl	%eax, (%rdi)
	jmp	.L5073
	.p2align 4,,10
	.p2align 3
.L5392:
	movslq	%r12d, %r12
	addl	$1, %r13d
	addl	$4, %ebp
	movb	%r8b, (%r9,%r12)
	movl	(%rbx), %eax
	movl	%eax, %edi
	cmpl	%eax, %r13d
	jge	.L5394
	movl	%ebp, %r12d
	jmp	.L5358
	.p2align 4,,10
	.p2align 3
.L5390:
	leaq	1(%rax), %rdx
	cmpl	$2, 40(%rsp)
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r8d
	movb	%r8b, (%r12)
	leal	3(%rbp), %r12d
	jne	.L5395
.L5198:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5396
	movl	48(%rbx), %esi
	xorl	%r8d, %r8d
	testl	%esi, %esi
	je	.L5199
	leaq	56(%rbx), %rsi
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r9, 24(%rsp)
	movq	%rsi, (%rsp)
	movb	%r8b, 32(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	(%rsp), %rsi
	leaq	57(%rbx), %rdx
	movq	24(%rsp), %r9
	je	.L5397
	cltq
	addq	%rax, %rsi
	movzbl	56(%rbx), %eax
	movl	%eax, %r8d
	orl	%eax, %r15d
.L5202:
	movq	%rsi, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L5199
	.p2align 4,,10
	.p2align 3
.L5388:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r8d
	jmp	.L5191
	.p2align 4,,10
	.p2align 3
.L5386:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %r8d
	jmp	.L5187
	.p2align 4,,10
	.p2align 3
.L5391:
	leaq	56(%rbx), %rsi
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r9, 24(%rsp)
	movq	%rsi, (%rsp)
	movb	%r8b, 32(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	(%rsp), %rsi
	leaq	57(%rbx), %rdx
	movq	24(%rsp), %r9
	jne	.L5196
	movl	$0, 48(%rbx)
	movzbl	32(%rsp), %r8d
	movq	%rdx, %rsi
	movb	$0, 56(%rbx)
.L5197:
	movq	%rsi, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L5195
	.p2align 4,,10
	.p2align 3
.L5387:
	leaq	56(%rbx), %rsi
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r9, 32(%rsp)
	movq	%r11, 24(%rsp)
	movq	%rsi, (%rsp)
	movb	%r8b, 131(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	(%rsp), %rsi
	leaq	57(%rbx), %rdx
	movq	24(%rsp), %r11
	movq	32(%rsp), %r9
	jne	.L5188
	movzbl	131(%rsp), %r8d
	movl	$0, 48(%rbx)
	movq	%rdx, %rsi
	movb	$0, 56(%rbx)
.L5189:
	movq	%rsi, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L5187
	.p2align 4,,10
	.p2align 3
.L5389:
	leaq	56(%rbx), %rsi
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r9, 32(%rsp)
	movq	%r11, 24(%rsp)
	movq	%rsi, (%rsp)
	movb	%r8b, 131(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	(%rsp), %rsi
	leaq	57(%rbx), %rdx
	movq	24(%rsp), %r11
	movq	32(%rsp), %r9
	jne	.L5192
	movzbl	131(%rsp), %r8d
	movl	$0, 48(%rbx)
	movq	%rdx, %rsi
	movb	$0, 56(%rbx)
.L5193:
	movq	%rsi, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L5191
	.p2align 4,,10
	.p2align 3
.L5384:
	movl	124(%rsp), %r10d
	movq	(%rsp), %rbx
	movl	%r11d, %r12d
	jmp	.L5185
	.p2align 4,,10
	.p2align 3
.L5396:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
	movl	%eax, %r8d
	orl	%eax, %r15d
	jmp	.L5199
	.p2align 4,,10
	.p2align 3
.L5196:
	cltq
	movzbl	56(%rbx), %r8d
	addq	%rax, %rsi
	jmp	.L5197
	.p2align 4,,10
	.p2align 3
.L5188:
	cltq
	movzbl	56(%rbx), %r8d
	addq	%rax, %rsi
	jmp	.L5189
	.p2align 4,,10
	.p2align 3
.L5192:
	cltq
	movzbl	56(%rbx), %r8d
	addq	%rax, %rsi
	jmp	.L5193
	.p2align 4,,10
	.p2align 3
.L5393:
	movl	%edx, %eax
	movl	%r10d, (%rsp)
	movq	40(%rbx), %rdi
	subl	%esi, %eax
	movq	%r8, 192(%rbx)
	movl	%eax, %esi
	call	*24(%rbx)
	movl	(%rbx), %eax
	movl	(%rsp), %r10d
	movl	%eax, %edi
	jmp	.L5222
	.p2align 4,,10
	.p2align 3
.L5394:
	movl	%ebp, %r12d
	movl	%r15d, 24(%rsp)
	movl	124(%rsp), %r10d
	movq	%r9, %rbp
	jmp	.L5185
	.p2align 4,,10
	.p2align 3
.L5385:
	movl	124(%rsp), %r10d
	movq	(%rsp), %rbx
	jmp	.L5185
.L5397:
	movl	$0, 48(%rbx)
	movzbl	32(%rsp), %r8d
	movq	%rdx, %rsi
	movb	$0, 56(%rbx)
	jmp	.L5202
.L5372:
	cmpl	$255, 52(%rsp)
	jne	.L5250
	cmpl	$65280, 48(%rsp)
	jne	.L5250
	cmpl	$16711680, %r15d
	jne	.L5267
	testb	%r8b, %r8b
	je	.L5267
	movl	(%rbx), %eax
	movl	$2, 40(%rsp)
	movl	%eax, %edi
	jmp	.L5357
.L5373:
	shrl	$16, %eax
	movl	$24, %edx
	movl	$16, %edi
	jmp	.L5162
.L5118:
	movq	%rbp, %rdi
	call	free@PLT
	leaq	.LC214(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5075
	.p2align 4,,10
	.p2align 3
.L5377:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
	movl	%eax, %r12d
	jmp	.L5133
	.p2align 4,,10
	.p2align 3
.L5380:
	movslq	%r13d, %r13
	addl	$4, %r12d
	addl	$2, %r8d
	movb	$-1, (%r14,%r13)
	movl	(%rbx), %eax
	movl	%r12d, %r13d
	movl	%eax, %edi
	cmpl	%r8d, %eax
	jg	.L5146
	jmp	.L5138
	.p2align 4,,10
	.p2align 3
.L5379:
	movq	192(%rbx), %rax
	cmpq	200(%rbx), %rax
	jb	.L5398
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L5139
	leaq	56(%rbx), %r13
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r11, 16(%rsp)
	movl	%r8d, 8(%rsp)
	movq	%r13, %rsi
	call	*16(%rbx)
	movl	8(%rsp), %r8d
	movq	16(%rsp), %r11
	movl	%eax, %edx
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%edx, %edx
	jne	.L5142
	movl	$0, 48(%rbx)
	movq	40(%rsp), %r13
	movb	$0, 56(%rbx)
.L5143:
	movq	40(%rsp), %rax
	movq	%r13, 200(%rbx)
	movq	%rax, 192(%rbx)
	jmp	.L5139
	.p2align 4,,10
	.p2align 3
.L5378:
	leaq	56(%rbx), %rcx
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r11, 32(%rsp)
	movl	%r8d, 16(%rsp)
	movq	%rcx, %rsi
	movq	%rcx, 8(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	8(%rsp), %rcx
	movl	16(%rsp), %r8d
	movq	32(%rsp), %r11
	jne	.L5134
	movl	$0, 48(%rbx)
	movq	40(%rsp), %rcx
	movb	$0, 56(%rbx)
.L5135:
	movq	40(%rsp), %rsi
	movq	%rcx, 200(%rbx)
	movq	%rsi, 192(%rbx)
	jmp	.L5133
	.p2align 4,,10
	.p2align 3
.L5134:
	cltq
	addq	%rax, %rcx
	movzbl	56(%rbx), %eax
	movl	%eax, %r12d
	jmp	.L5135
	.p2align 4,,10
	.p2align 3
.L5398:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %edx
	jmp	.L5139
	.p2align 4,,10
	.p2align 3
.L5246:
	movl	%r12d, %r13d
	jmp	.L5138
	.p2align 4,,10
	.p2align 3
.L5381:
	movl	%ecx, %eax
	movq	40(%rbx), %rdi
	movq	%r8, 192(%rbx)
	subl	%esi, %eax
	movl	%eax, %esi
	call	*24(%rbx)
	movl	(%rbx), %eax
	movl	%eax, %edi
	jmp	.L5148
.L5142:
	movslq	%edx, %rax
	movzbl	56(%rbx), %edx
	addq	%rax, %r13
	jmp	.L5143
.L5237:
	movl	%eax, %r14d
	movl	%eax, %r8d
	movl	$3, %r10d
	xorl	%r11d, %r11d
	jmp	.L5086
.L5375:
	movl	(%rbx), %eax
	movl	4(%rbx), %r8d
	leaq	56(%rbx), %rsi
	xorl	%r14d, %r14d
	movq	%rsi, 8(%rsp)
	xorl	%r12d, %r12d
	leal	7(%rax), %edx
	movl	%eax, %edi
	shrl	$3, %edx
	negl	%edx
	andl	$3, %edx
	testl	%r8d, %r8d
	jle	.L5115
	movl	%edx, (%rsp)
	movl	%r10d, %r13d
	.p2align 4,,10
	.p2align 3
.L5114:
	movq	%rbx, %rdi
	call	stbi__get8
	movl	(%rbx), %r8d
	movzbl	%al, %edi
	testl	%r8d, %r8d
	jle	.L5120
	xorl	%r15d, %r15d
	movl	$7, %ecx
	leaq	192(%rsp), %r8
	jmp	.L5128
	.p2align 4,,10
	.p2align 3
.L5243:
	movl	(%rbx), %eax
	addl	$1, %r15d
	movl	%esi, %r14d
	cmpl	%eax, %r15d
	je	.L5120
.L5400:
	subl	$1, %ecx
	jb	.L5399
.L5123:
	cmpl	%eax, %r15d
	jge	.L5120
.L5128:
	movl	%edi, %eax
	movslq	%r14d, %rdx
	sarl	%cl, %eax
	andl	$1, %eax
	movzwl	(%r8,%rax,4), %esi
	movzbl	194(%rsp,%rax,4), %eax
	movw	%si, 0(%rbp,%rdx)
	leal	2(%r14), %edx
	leal	3(%r14), %esi
	movslq	%edx, %rdx
	movb	%al, 0(%rbp,%rdx)
	cmpl	$4, %r13d
	jne	.L5243
	movslq	%esi, %rsi
	addl	$1, %r15d
	addl	$4, %r14d
	movb	$-1, 0(%rbp,%rsi)
	movl	(%rbx), %eax
	cmpl	%eax, %r15d
	jne	.L5400
	.p2align 4,,10
	.p2align 3
.L5120:
	movl	(%rsp), %esi
	testl	%esi, %esi
	je	.L5129
	movq	%rbx, %rdi
	addl	$1, %r12d
	call	stbi__skip.part.0
	movl	4(%rbx), %r8d
	cmpl	%r8d, %r12d
	jl	.L5114
.L5356:
	movl	(%rbx), %eax
	movl	%r13d, %r10d
	movl	%eax, %edi
	jmp	.L5115
	.p2align 4,,10
	.p2align 3
.L5399:
	movq	192(%rbx), %rdx
	cmpq	200(%rbx), %rdx
	jb	.L5401
	movl	48(%rbx), %edi
	testl	%edi, %edi
	jne	.L5402
.L5125:
	movl	$7, %ecx
	jmp	.L5123
	.p2align 4,,10
	.p2align 3
.L5401:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rdx), %edi
	jmp	.L5125
	.p2align 4,,10
	.p2align 3
.L5129:
	movl	4(%rbx), %r8d
	addl	$1, %r12d
	cmpl	%r8d, %r12d
	jl	.L5114
	jmp	.L5356
.L5402:
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r8, 16(%rsp)
	movq	8(%rsp), %rsi
	call	*16(%rbx)
	movq	16(%rsp), %r8
	leaq	57(%rbx), %rdx
	movl	%eax, %edi
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	testl	%edi, %edi
	jne	.L5126
	movl	$0, 48(%rbx)
	movq	%rdx, %rax
	movb	$0, 56(%rbx)
.L5127:
	movq	%rax, 200(%rbx)
	movl	(%rbx), %eax
	movq	%rdx, 192(%rbx)
	jmp	.L5125
.L5182:
	movq	%rbp, %rdi
	call	free@PLT
	leaq	.LC215(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5075
.L5126:
	movslq	%edi, %rax
	movq	8(%rsp), %rdi
	addq	%rdi, %rax
	movzbl	56(%rbx), %edi
	jmp	.L5127
.L5254:
	movl	$8, %edx
	xorl	%r8d, %r8d
	jmp	.L5172
.L5256:
	movl	%eax, %edx
	movl	$8, %ecx
	xorl	%eax, %eax
	jmp	.L5178
.L5253:
	movl	$8, %edx
	xorl	%esi, %esi
	jmp	.L5168
.L5371:
	movl	(%rbx), %eax
	addl	%eax, %eax
	negl	%eax
	andl	$3, %eax
	movl	%eax, 84(%rsp)
	jmp	.L5156
.L5376:
	movl	(%rbx), %eax
	leal	1(%rax), %edx
	movl	%eax, %edi
	shrl	%edx
	negl	%edx
	andl	$3, %edx
	movl	%edx, 48(%rsp)
	jmp	.L5117
.L5369:
	movq	200(%rbx), %rax
	movq	%rax, 192(%rbx)
	jmp	.L5151
.L5374:
	movq	200(%rbx), %rax
	movq	%rax, 192(%rbx)
	jmp	.L5111
.L5250:
	movl	$0, 84(%rsp)
	jmp	.L5156
.L5093:
	movq	%rbp, %rdi
	call	free@PLT
	leaq	.LC213(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5075
.L5267:
	testl	%r15d, %r15d
	je	.L5182
	movl	$0, 84(%rsp)
	jmp	.L5160
.L5213:
	leaq	__PRETTY_FUNCTION__.41(%rip), %rcx
	movl	$5468, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC216(%rip), %rdi
	call	__assert_fail@PLT
.L5255:
	orl	$-1, %eax
	jmp	.L5177
.L5252:
	orl	$-1, %esi
	jmp	.L5167
.L5363:
	call	__stack_chk_fail@PLT
.L5364:
	leaq	.LC18(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5075
	.cfi_endproc
.LFE862:
	.size	stbi__bmp_load.constprop.0, .-stbi__bmp_load.constprop.0
	.section	.rodata.str1.1
.LC218:
	.string	"bad Image Descriptor"
.LC219:
	.string	"missing color table"
.LC228:
	.string	"no clear code"
.LC229:
	.string	"too many codes"
.LC230:
	.string	"illegal code in raster"
.LC231:
	.string	"unknown code"
	.text
	.p2align 4
	.type	stbi__gif_load_next.constprop.0, @function
stbi__gif_load_next.constprop.0:
.LFB863:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	8(%rsi), %rsi
	testq	%rsi, %rsi
	je	.L5542
	movl	48(%rbp), %eax
	movl	0(%rbp), %edx
	imull	4(%rbp), %edx
	sarl	$2, %eax
	andl	$7, %eax
	cmpl	$3, %eax
	jne	.L5416
	testq	%rcx, %rcx
	jne	.L5413
.L5419:
	movslq	%edx, %rcx
	xorl	%eax, %eax
	testl	%edx, %edx
	jle	.L5415
	.p2align 4,,10
	.p2align 3
.L5421:
	movq	24(%rbp), %rdx
	cmpb	$0, (%rdx,%rax)
	je	.L5420
	movq	16(%rbp), %rdi
	leal	0(,%rax,4), %edx
	movslq	%edx, %rdx
	movl	(%rdi,%rdx), %edi
	movl	%edi, (%rsi,%rdx)
	movq	8(%rbp), %rsi
.L5420:
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L5421
.L5541:
	movl	4(%rbp), %edx
	imull	0(%rbp), %edx
.L5415:
	movq	16(%rbp), %rdi
	sall	$2, %edx
	movslq	%edx, %rdx
	call	memcpy@PLT
	movl	4(%rbp), %edx
	imull	0(%rbp), %edx
	movl	$0, 36(%rsp)
	movq	24(%rbp), %rdi
	movslq	%edx, %rdx
.L5411:
	xorl	%esi, %esi
	call	memset@PLT
	movq	192(%rbx), %rax
	movq	200(%rbx), %rcx
.L5422:
	cmpq	%rcx, %rax
	jb	.L5543
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L5544
.L5425:
	leaq	.LC231(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5406:
	xorl	%eax, %eax
	jmp	.L5403
	.p2align 4,,10
	.p2align 3
.L5413:
	cmpl	$3, %eax
	jne	.L5416
	testl	%edx, %edx
	jle	.L5415
	movslq	%edx, %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5418:
	movq	24(%rbp), %rdi
	cmpb	$0, (%rdi,%rax)
	je	.L5417
	leal	0(,%rax,4), %edi
	movslq	%edi, %rdi
	movl	(%rcx,%rdi), %r8d
	movl	%r8d, (%rsi,%rdi)
	movq	8(%rbp), %rsi
.L5417:
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L5418
	jmp	.L5541
	.p2align 4,,10
	.p2align 3
.L5416:
	cmpl	$2, %eax
	jne	.L5415
	jmp	.L5419
	.p2align 4,,10
	.p2align 3
.L5543:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rbx)
	movzbl	(%rax), %eax
.L5424:
	cmpb	$44, %al
	je	.L5427
	cmpb	$59, %al
	jne	.L5545
	movq	%rbx, %rax
.L5403:
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5545:
	.cfi_restore_state
	cmpb	$33, %al
	jne	.L5425
	cmpq	%rcx, %rdx
	jb	.L5546
	movl	48(%rbx), %esi
	testl	%esi, %esi
	jne	.L5547
.L5479:
	movq	%rdx, %rax
	leaq	56(%rbx), %r12
	.p2align 4,,10
	.p2align 3
.L5484:
	cmpq	%rcx, %rax
	jb	.L5548
	movl	48(%rbx), %edx
	testl	%edx, %edx
	je	.L5422
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movslq	%eax, %rcx
	movq	192(%rbx), %rax
	subq	208(%rbx), %rax
	addl	%eax, 184(%rbx)
	leaq	57(%rbx), %rax
	testl	%ecx, %ecx
	jne	.L5491
	movl	$0, 48(%rbx)
	movq	%rax, %rcx
	movb	$0, 56(%rbx)
	movq	%rax, 200(%rbx)
	movq	%rax, 192(%rbx)
	jmp	.L5422
	.p2align 4,,10
	.p2align 3
.L5548:
	leaq	1(%rax), %rdi
	movq	%rdi, 192(%rbx)
	movzbl	(%rax), %edx
	movzbl	%dl, %esi
.L5490:
	testl	%esi, %esi
	je	.L5549
	cmpq	$0, 16(%rbx)
	je	.L5487
	movq	%rcx, %rax
	subq	%rdi, %rax
	cmpl	%esi, %eax
	jl	.L5550
.L5487:
	leaq	(%rdi,%rdx), %rax
	movq	%rax, 192(%rbx)
	jmp	.L5484
	.p2align 4,,10
	.p2align 3
.L5550:
	movq	%rcx, 192(%rbx)
	subl	%eax, %esi
	movq	40(%rbx), %rdi
	call	*24(%rbx)
	movq	192(%rbx), %rax
	movq	200(%rbx), %rcx
	jmp	.L5484
	.p2align 4,,10
	.p2align 3
.L5427:
	movq	%rbx, %rdi
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, %r14d
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, %r12d
	call	stbi__get16le
	movq	%rbx, %rdi
	movl	%eax, %r13d
	call	stbi__get16le
	movl	0(%rbp), %esi
	leal	(%r14,%r13), %edx
	cmpl	%esi, %edx
	jg	.L5429
	leal	(%r12,%rax), %edx
	cmpl	4(%rbp), %edx
	jg	.L5429
	sall	$2, %esi
	movl	%r12d, %edx
	leal	0(,%r14,4), %ecx
	movq	%rbx, %rdi
	imull	%esi, %edx
	movl	%esi, 34916(%rbp)
	movd	%ecx, %xmm0
	imull	%esi, %eax
	leal	(%rcx,%r13,4), %esi
	movl	%ecx, 34908(%rbp)
	movd	%esi, %xmm1
	addl	%edx, %eax
	testl	%r13d, %r13d
	movd	%eax, %xmm4
	punpckldq	%xmm4, %xmm1
	movd	%edx, %xmm4
	cmove	%eax, %edx
	punpckldq	%xmm4, %xmm0
	movl	%edx, 34912(%rbp)
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 34892(%rbp)
	call	stbi__get8
	movzbl	%al, %edx
	movl	%edx, 34888(%rbp)
	testb	$64, %al
	je	.L5432
	movl	34916(%rbp), %esi
	movl	$3, %ecx
	movl	%ecx, 34880(%rbp)
	leal	0(,%rsi,8), %edx
	movl	%edx, 34884(%rbp)
	testb	%al, %al
	jns	.L5434
.L5552:
	movl	$-1, %esi
	testb	$1, 48(%rbp)
	je	.L5435
	movl	44(%rbp), %esi
.L5435:
	andl	$7, %eax
	leaq	1076(%rbp), %r12
	movl	$2, %edx
	movq	%rbx, %rdi
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%esi, %ecx
	movq	%r12, %rsi
	call	stbi__gif_parse_colortable
.L5436:
	movq	%r12, 34872(%rbp)
	movq	%rbx, %rdi
	call	stbi__get8
	movl	%eax, %ecx
	cmpb	$12, %al
	ja	.L5406
	movzbl	%al, %edx
	movl	$1, %eax
	movl	%eax, %esi
	leal	1(%rdx), %edi
	sall	%cl, %esi
	movl	%edi, %ecx
	movl	%edi, 28(%rsp)
	sall	%cl, %eax
	movl	%esi, 8(%rsp)
	subl	$1, %eax
	movl	%eax, 32(%rsp)
	leal	-1(%rsi), %eax
	cmpl	$14, %eax
	jbe	.L5495
	shrl	$4, %esi
	movq	%rbp, %rax
	movdqa	.LC217(%rip), %xmm4
	movdqa	.LC220(%rip), %xmm12
	movl	%esi, %edx
	movdqa	.LC221(%rip), %xmm11
	movdqa	.LC222(%rip), %xmm10
	salq	$6, %rdx
	movdqa	.LC223(%rip), %xmm9
	movdqa	.LC2(%rip), %xmm3
	movdqa	.LC224(%rip), %xmm8
	movdqa	.LC225(%rip), %xmm7
	addq	%rbp, %rdx
	movdqa	.LC226(%rip), %xmm6
	movdqa	.LC227(%rip), %xmm5
.L5440:
	movdqa	%xmm4, %xmm2
	movl	$-1, %ecx
	addq	$64, %rax
	movl	$-1, %r11d
	movdqa	%xmm2, %xmm13
	movdqa	%xmm2, %xmm1
	movdqa	%xmm2, %xmm0
	movw	%cx, 2056(%rax)
	paddd	%xmm11, %xmm13
	movl	$-1, %r12d
	movl	$-1, %r13d
	movl	$-1, %r14d
	punpcklwd	%xmm13, %xmm1
	punpckhwd	%xmm13, %xmm0
	movl	$-1, %r15d
	movw	%r11w, 2036(%rax)
	movdqa	%xmm1, %xmm13
	punpcklwd	%xmm0, %xmm1
	movw	%r12w, 2040(%rax)
	movl	$-1, %esi
	punpckhwd	%xmm0, %xmm13
	movdqa	%xmm2, %xmm0
	movw	%r13w, 2044(%rax)
	movl	$-1, %edi
	punpcklwd	%xmm13, %xmm1
	movdqa	%xmm2, %xmm13
	paddd	%xmm10, %xmm0
	movw	%r14w, 2048(%rax)
	paddd	%xmm9, %xmm13
	movdqa	%xmm0, %xmm14
	pand	%xmm3, %xmm1
	movw	%r15w, 2052(%rax)
	punpcklwd	%xmm13, %xmm0
	punpckhwd	%xmm13, %xmm14
	movl	$-1, %r8d
	movl	$-1, %r9d
	movdqa	%xmm0, %xmm13
	punpcklwd	%xmm14, %xmm0
	movl	$-1, %r10d
	movl	$-1, %r11d
	punpckhwd	%xmm14, %xmm13
	movl	$-1, %r12d
	movl	$-1, %r13d
	movl	$-1, %r14d
	punpcklwd	%xmm13, %xmm0
	movdqa	%xmm2, %xmm13
	movl	$-1, %r15d
	movw	%si, 2060(%rax)
	pand	%xmm3, %xmm0
	paddd	%xmm7, %xmm13
	movw	%di, 2064(%rax)
	paddd	%xmm12, %xmm4
	packuswb	%xmm0, %xmm1
	movdqa	%xmm2, %xmm0
	movw	%r8w, 2068(%rax)
	paddd	%xmm8, %xmm0
	pextrw	$0, %xmm1, %ecx
	movw	%r9w, 2072(%rax)
	movdqa	%xmm0, %xmm14
	punpcklwd	%xmm13, %xmm0
	movw	%cx, 2038(%rax)
	pextrw	$1, %xmm1, %ecx
	punpckhwd	%xmm13, %xmm14
	movdqa	%xmm0, %xmm13
	movw	%cx, 2042(%rax)
	pextrw	$2, %xmm1, %ecx
	punpckhwd	%xmm14, %xmm13
	punpcklwd	%xmm14, %xmm0
	movw	%cx, 2046(%rax)
	pextrw	$3, %xmm1, %ecx
	punpcklwd	%xmm13, %xmm0
	movdqa	%xmm2, %xmm13
	paddd	%xmm5, %xmm2
	movw	%cx, 2050(%rax)
	paddd	%xmm6, %xmm13
	pextrw	$4, %xmm1, %ecx
	pand	%xmm3, %xmm0
	movw	%r10w, 2076(%rax)
	movdqa	%xmm13, %xmm14
	punpcklwd	%xmm2, %xmm13
	movw	%cx, 2054(%rax)
	pextrw	$5, %xmm1, %ecx
	punpckhwd	%xmm2, %xmm14
	movdqa	%xmm13, %xmm2
	movw	%cx, 2058(%rax)
	pextrw	$6, %xmm1, %ecx
	punpckhwd	%xmm14, %xmm2
	punpcklwd	%xmm14, %xmm13
	movw	%cx, 2062(%rax)
	pextrw	$7, %xmm1, %ecx
	punpcklwd	%xmm2, %xmm13
	movw	%cx, 2066(%rax)
	pand	%xmm3, %xmm13
	movw	%r11w, 2080(%rax)
	packuswb	%xmm13, %xmm0
	movw	%r12w, 2084(%rax)
	pextrw	$0, %xmm0, %ecx
	movw	%r13w, 2088(%rax)
	movw	%cx, 2070(%rax)
	pextrw	$1, %xmm0, %ecx
	movw	%cx, 2074(%rax)
	pextrw	$2, %xmm0, %ecx
	movw	%cx, 2078(%rax)
	pextrw	$3, %xmm0, %ecx
	movw	%cx, 2082(%rax)
	pextrw	$4, %xmm0, %ecx
	movw	%cx, 2086(%rax)
	pextrw	$5, %xmm0, %ecx
	movw	%cx, 2090(%rax)
	pextrw	$6, %xmm0, %ecx
	movw	%cx, 2094(%rax)
	pextrw	$7, %xmm0, %ecx
	movw	%r14w, 2092(%rax)
	movw	%r15w, 2096(%rax)
	movw	%cx, 2098(%rax)
	cmpq	%rdx, %rax
	jne	.L5440
	movl	8(%rsp), %esi
	movl	%esi, %eax
	andl	$-16, %eax
	movl	%eax, %ecx
	cmpl	%eax, %esi
	je	.L5441
.L5439:
	movl	8(%rsp), %esi
	subl	%ecx, %esi
	leal	-1(%rsi), %edx
	cmpl	$6, %edx
	jbe	.L5442
	leal	1(%rax), %edi
	movd	%eax, %xmm7
	leal	7(%rax), %r15d
	salq	$2, %rcx
	movd	%edi, %xmm6
	leal	2(%rax), %edi
	pshufd	$0xe0, %xmm7, %xmm1
	movl	$-1, %r12d
	movd	%edi, %xmm2
	leal	3(%rax), %edi
	pshufd	$0xe0, %xmm6, %xmm6
	movl	$-1, %r13d
	movd	%edi, %xmm3
	movdqa	%xmm1, %xmm7
	pshufd	$0xe0, %xmm2, %xmm2
	movl	$-1, %r14d
	pshufd	$0xe0, %xmm3, %xmm3
	punpcklwd	%xmm6, %xmm7
	leal	4(%rax), %edi
	movl	$-1, %r8d
	punpcklwd	%xmm6, %xmm1
	movdqa	%xmm2, %xmm6
	pshufd	$78, %xmm7, %xmm7
	movl	$-1, %r9d
	punpcklwd	%xmm3, %xmm6
	punpcklwd	%xmm3, %xmm2
	movd	%edi, %xmm0
	movq	.LC4(%rip), %xmm3
	pshufd	$78, %xmm6, %xmm6
	leal	5(%rax), %edi
	punpcklwd	%xmm7, %xmm1
	movl	$-1, %r10d
	punpcklwd	%xmm6, %xmm2
	movd	%edi, %xmm5
	pand	%xmm3, %xmm1
	pand	%xmm3, %xmm2
	pshufd	$0xe0, %xmm0, %xmm0
	pshufd	$0xe0, %xmm5, %xmm5
	packuswb	%xmm2, %xmm1
	movdqa	%xmm0, %xmm2
	leal	6(%rax), %edi
	punpcklwd	%xmm5, %xmm2
	punpcklwd	%xmm5, %xmm0
	movd	%edi, %xmm7
	movl	$-1, %edi
	pshufd	$78, %xmm2, %xmm2
	movd	%r15d, %xmm4
	pshufd	$8, %xmm1, %xmm1
	movl	$-1, %r15d
	punpcklwd	%xmm2, %xmm0
	pshufd	$0xe0, %xmm7, %xmm2
	pshufd	$0xe0, %xmm4, %xmm4
	movdqa	%xmm2, %xmm5
	leaq	2102(%rbp,%rcx), %rdx
	punpcklwd	%xmm4, %xmm2
	punpcklwd	%xmm4, %xmm5
	leaq	2100(%rbp,%rcx), %rcx
	pand	%xmm3, %xmm0
	pshufd	$78, %xmm5, %xmm5
	movw	%r12w, (%rcx)
	movw	%r13w, 4(%rcx)
	punpcklwd	%xmm5, %xmm2
	movw	%r14w, 8(%rcx)
	pand	%xmm2, %xmm3
	movw	%r15w, 12(%rcx)
	packuswb	%xmm3, %xmm0
	movw	%di, 16(%rcx)
	pshufd	$8, %xmm0, %xmm0
	movw	%r8w, 20(%rcx)
	movw	%r9w, 24(%rcx)
	movw	%r10w, 28(%rcx)
	pextrw	$0, %xmm1, %ecx
	movw	%cx, (%rdx)
	pextrw	$1, %xmm1, %ecx
	movw	%cx, 4(%rdx)
	pextrw	$2, %xmm1, %ecx
	movw	%cx, 8(%rdx)
	pextrw	$3, %xmm1, %ecx
	movw	%cx, 12(%rdx)
	pextrw	$0, %xmm0, %ecx
	movw	%cx, 16(%rdx)
	pextrw	$1, %xmm0, %ecx
	movw	%cx, 20(%rdx)
	pextrw	$2, %xmm0, %ecx
	movw	%cx, 24(%rdx)
	pextrw	$3, %xmm0, %ecx
	movw	%cx, 28(%rdx)
	movl	%esi, %edx
	andl	$-8, %edx
	addl	%edx, %eax
	andl	$7, %esi
	je	.L5441
.L5442:
	movslq	%eax, %rsi
	movzbl	%al, %edx
	movl	$-1, %r11d
	movl	8(%rsp), %r15d
	movb	%al, %dh
	leaq	0(%rbp,%rsi,4), %r8
	movw	%r11w, 2100(%r8)
	movw	%dx, 2102(%rbp,%rsi,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r15d
	jle	.L5441
	movzbl	%dl, %esi
	movslq	%edx, %rdi
	movl	$-1, %r10d
	movl	%esi, %ecx
	movw	%r10w, 2104(%r8)
	movb	%dl, %ch
	leal	2(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r15d
	jle	.L5441
	movzbl	%dl, %esi
	movslq	%edx, %rdi
	movl	$-1, %r9d
	movl	%esi, %ecx
	movw	%r9w, 2108(%r8)
	movb	%dl, %ch
	leal	3(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r15d
	jle	.L5441
	movzbl	%dl, %esi
	movl	$-1, %edi
	movl	%esi, %ecx
	movw	%di, 2112(%r8)
	movslq	%edx, %rdi
	movb	%dl, %ch
	leal	4(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%edx, %r15d
	jle	.L5441
	movl	$-1, %esi
	movslq	%edx, %rdi
	movw	%si, 2116(%r8)
	movzbl	%dl, %esi
	movl	%esi, %ecx
	movb	%dl, %ch
	leal	5(%rax), %edx
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%r15d, %edx
	jge	.L5441
	movl	$-1, %ecx
	movzbl	%dl, %esi
	movslq	%edx, %rdi
	addl	$6, %eax
	movw	%cx, 2120(%r8)
	movl	%esi, %ecx
	movb	%dl, %ch
	movw	%cx, 2102(%rbp,%rdi,4)
	cmpl	%eax, %r15d
	jle	.L5441
	movl	$-1, %edx
	movslq	%eax, %rcx
	movw	%dx, 2124(%r8)
	movzbl	%al, %edx
	movb	%al, %dh
	movw	%dx, 2102(%rbp,%rcx,4)
	.p2align 4,,10
	.p2align 3
.L5441:
	movl	8(%rsp), %esi
	xorl	%r15d, %r15d
	movl	32(%rsp), %r11d
	xorl	%r12d, %r12d
	movl	$1, 20(%rsp)
	movl	28(%rsp), %r13d
	movq	$-1, %r10
	leal	2(%rsi), %eax
	movl	%eax, 56(%rsp)
	movslq	%eax, %r14
	leal	1(%rsi), %eax
	movl	%eax, 24(%rsp)
	leaq	57(%rbx), %rax
	movq	%rax, 40(%rsp)
	movq	%rbp, %rax
	movl	%r15d, %ebp
	movq	%rax, %r8
	.p2align 4,,10
	.p2align 3
.L5444:
	cmpl	%r12d, %r13d
	jle	.L5445
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rax
	testl	%ebp, %ebp
	jne	.L5446
	cmpq	%rax, %rdx
	jb	.L5551
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L5449
.L5539:
	movq	%r8, %rbp
.L5467:
	movq	8(%rbp), %rax
	testq	%rax, %rax
	je	.L5406
	movl	36(%rsp), %r8d
	testl	%r8d, %r8d
	je	.L5403
	movl	36(%rbp), %edi
	testl	%edi, %edi
	jle	.L5403
	movl	0(%rbp), %esi
	imull	4(%rbp), %esi
	testl	%esi, %esi
	jle	.L5403
	movslq	%esi, %rsi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L5476:
	movq	24(%rbp), %rcx
	cmpb	$0, (%rcx,%rdx)
	jne	.L5475
	movslq	36(%rbp), %rcx
	movb	$-1, 55(%rbp,%rcx,4)
	movl	52(%rbp,%rcx,4), %r8d
	leal	0(,%rdx,4), %ecx
	movq	8(%rbp), %rdi
	movslq	%ecx, %rcx
	movl	%r8d, (%rdi,%rcx)
.L5475:
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jne	.L5476
	jmp	.L5403
	.p2align 4,,10
	.p2align 3
.L5491:
	movzbl	56(%rbx), %edx
	addq	%r12, %rcx
	movq	%rax, 192(%rbx)
	movq	%rax, %rdi
	movq	%rcx, 200(%rbx)
	movzbl	%dl, %esi
	jmp	.L5490
	.p2align 4,,10
	.p2align 3
.L5432:
	movl	34916(%rbp), %edx
	xorl	%ecx, %ecx
	movl	%ecx, 34880(%rbp)
	movl	%edx, 34884(%rbp)
	testb	%al, %al
	js	.L5552
.L5434:
	testb	$-128, 32(%rbp)
	je	.L5437
	leaq	52(%rbp), %r12
	jmp	.L5436
	.p2align 4,,10
	.p2align 3
.L5445:
	movl	%r15d, %r9d
	movl	%r13d, %ecx
	subl	%r13d, %r12d
	andl	%r11d, %r9d
	sarl	%cl, %r15d
	cmpl	%r9d, 8(%rsp)
	je	.L5496
	movl	24(%rsp), %eax
	cmpl	%eax, %r9d
	je	.L5553
	cmpl	%r14d, %r9d
	jg	.L5469
	movl	20(%rsp), %eax
	testl	%eax, %eax
	jne	.L5554
	testl	%r10d, %r10d
	js	.L5471
	leal	1(%r14), %edx
	cmpl	$8192, %edx
	jg	.L5555
	leaq	(%r8,%r14,4), %rax
	movslq	%edx, %r14
	movw	%r10w, 2100(%rax)
	movzbl	2102(%r8,%r10,4), %ecx
	movb	%cl, 2102(%rax)
	movslq	%r9d, %rcx
	movzbl	2102(%r8,%rcx,4), %ecx
	movb	%cl, 2103(%rax)
.L5473:
	movzwl	%r9w, %esi
	movq	%r8, %rdi
	call	stbi__out_gif_code
	testl	%r14d, %r11d
	jne	.L5497
	cmpl	$4095, %r14d
	jle	.L5556
.L5497:
	movslq	%r9d, %r10
	jmp	.L5444
	.p2align 4,,10
	.p2align 3
.L5551:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rdx), %ebp
	movq	%rcx, %rdx
.L5448:
	testl	%ebp, %ebp
	je	.L5539
.L5446:
	subl	$1, %ebp
	cmpq	%rax, %rdx
	jb	.L5557
	movl	48(%rbx), %eax
	testl	%eax, %eax
	jne	.L5558
.L5454:
	addl	$8, %r12d
	jmp	.L5444
	.p2align 4,,10
	.p2align 3
.L5496:
	movl	$0, 20(%rsp)
	movslq	56(%rsp), %r14
	movq	$-1, %r10
	movl	32(%rsp), %r11d
	movl	28(%rsp), %r13d
	jmp	.L5444
	.p2align 4,,10
	.p2align 3
.L5557:
	leaq	1(%rdx), %rax
	movl	%r12d, %ecx
	movq	%rax, 192(%rbx)
	movzbl	(%rdx), %eax
	sall	%cl, %eax
	orl	%eax, %r15d
	jmp	.L5454
	.p2align 4,,10
	.p2align 3
.L5471:
	cmpl	%r14d, %r9d
	jne	.L5473
.L5469:
	leaq	.LC230(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L5403
	.p2align 4,,10
	.p2align 3
.L5556:
	addl	$1, %r13d
	movl	$1, %r11d
	movslq	%r9d, %r10
	movl	%r13d, %ecx
	sall	%cl, %r11d
	subl	$1, %r11d
	jmp	.L5444
	.p2align 4,,10
	.p2align 3
.L5558:
	leaq	56(%rbx), %rcx
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r8, 72(%rsp)
	movl	%r10d, 64(%rsp)
	movq	%rcx, %rsi
	movl	%r11d, 60(%rsp)
	movq	%rcx, 48(%rsp)
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movq	48(%rsp), %rcx
	movl	60(%rsp), %r11d
	movslq	64(%rsp), %r10
	movq	72(%rsp), %r8
	jne	.L5455
	movl	$0, 48(%rbx)
	movq	40(%rsp), %rax
	movb	$0, 56(%rbx)
.L5456:
	movq	%rax, 200(%rbx)
	movq	40(%rsp), %rax
	movq	%rax, 192(%rbx)
	jmp	.L5454
	.p2align 4,,10
	.p2align 3
.L5542:
	xorl	%ecx, %ecx
	movq	%rbp, %rsi
	call	stbi__gif_header
	testl	%eax, %eax
	je	.L5406
	movl	0(%rbp), %esi
	movl	4(%rbp), %ecx
	testl	%esi, %esi
	js	.L5407
	je	.L5559
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%esi
	cmpl	$3, %eax
	jle	.L5407
	testl	%ecx, %ecx
	js	.L5407
	je	.L5409
	movl	$2147483647, %eax
	xorl	%edx, %edx
	leal	0(,%rsi,4), %edi
	idivl	%ecx
	cmpl	%eax, %edi
	jg	.L5407
.L5409:
	imull	%esi, %ecx
	movl	$1, %esi
	leal	0(,%rcx,4), %r14d
	movl	%ecx, %r12d
	movslq	%r14d, %r14
	movq	%r14, %rdi
	call	calloc@PLT
	movq	%r14, %rdi
	movl	$1, %esi
	movq	%rax, 8(%rbp)
	movq	%rax, %r13
	call	calloc@PLT
	movslq	%r12d, %rdx
	movl	$1, %esi
	movq	%rax, 16(%rbp)
	movq	%rax, %r14
	movq	%rdx, %rdi
	movq	%rdx, 8(%rsp)
	call	calloc@PLT
	testq	%r14, %r14
	movq	%rax, 24(%rbp)
	movq	%rax, %rdi
	sete	%al
	testq	%r13, %r13
	sete	%cl
	orb	%cl, %al
	jne	.L5410
	testq	%rdi, %rdi
	je	.L5410
	movl	$1, 36(%rsp)
	movq	8(%rsp), %rdx
	jmp	.L5411
	.p2align 4,,10
	.p2align 3
.L5449:
	leaq	56(%rbx), %rbp
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r8, 64(%rsp)
	movl	%r10d, 60(%rsp)
	movq	%rbp, %rsi
	movl	%r11d, 48(%rsp)
	call	*16(%rbx)
	movq	40(%rsp), %rsi
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	movl	48(%rsp), %r11d
	movslq	60(%rsp), %r10
	movq	%rsi, %rdx
	movq	64(%rsp), %r8
	jne	.L5451
	movl	$0, 48(%rbx)
	movq	%r8, %rbp
	movb	$0, 56(%rbx)
	movq	%rsi, 200(%rbx)
	movq	%rsi, 192(%rbx)
	jmp	.L5467
	.p2align 4,,10
	.p2align 3
.L5455:
	movzbl	56(%rbx), %edx
	cltq
	addq	%rcx, %rax
	movl	%r12d, %ecx
	sall	%cl, %edx
	orl	%edx, %r15d
	jmp	.L5456
	.p2align 4,,10
	.p2align 3
.L5544:
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	leaq	57(%rbx), %rdx
	testl	%eax, %eax
	jne	.L5426
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rdx, 200(%rbx)
	movq	%rdx, 192(%rbx)
	jmp	.L5425
	.p2align 4,,10
	.p2align 3
.L5546:
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rbx)
	movzbl	(%rdx), %eax
.L5478:
	cmpb	$-7, %al
	jne	.L5498
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %esi
	cmpb	$4, %al
	je	.L5560
	testl	%esi, %esi
	je	.L5485
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	movq	192(%rbx), %rax
	movq	200(%rbx), %rcx
	jmp	.L5422
	.p2align 4,,10
	.p2align 3
.L5429:
	leaq	.LC218(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L5403
	.p2align 4,,10
	.p2align 3
.L5451:
	cltq
	movq	%rsi, 192(%rbx)
	addq	%rbp, %rax
	movzbl	56(%rbx), %ebp
	movq	%rax, 200(%rbx)
	jmp	.L5448
	.p2align 4,,10
	.p2align 3
.L5426:
	cltq
	movq	%rdx, 192(%rbx)
	leaq	(%r12,%rax), %rcx
	movzbl	56(%rbx), %eax
	movq	%rcx, 200(%rbx)
	jmp	.L5424
.L5547:
	leaq	56(%rbx), %r12
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rsi
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L5480
	movl	$0, 48(%rbx)
	movq	%rsi, %rcx
	movq	%rsi, %rdx
	movb	$0, 56(%rbx)
	movq	%rsi, 200(%rbx)
	movq	%rsi, 192(%rbx)
	jmp	.L5479
.L5559:
	testl	%ecx, %ecx
	jns	.L5409
	.p2align 4,,10
	.p2align 3
.L5407:
	leaq	.LC66(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L5403
.L5485:
	movq	192(%rbx), %rax
	movq	200(%rbx), %rcx
	jmp	.L5422
.L5553:
	movl	%ebp, %r15d
	movq	%r8, %rbp
	testl	%r15d, %r15d
	je	.L5459
	movl	%r15d, %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
.L5459:
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
	leaq	56(%rbx), %r12
	.p2align 4,,10
	.p2align 3
.L5460:
	cmpq	%rdx, %rax
	jb	.L5561
	movl	48(%rbx), %eax
	testl	%eax, %eax
	je	.L5467
	movl	52(%rbx), %edx
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	*16(%rbx)
	movq	192(%rbx), %rdx
	leaq	57(%rbx), %rcx
	subq	208(%rbx), %rdx
	addl	%edx, 184(%rbx)
	testl	%eax, %eax
	jne	.L5466
	movl	$0, 48(%rbx)
	movb	$0, 56(%rbx)
	movq	%rcx, 200(%rbx)
	movq	%rcx, 192(%rbx)
	jmp	.L5467
	.p2align 4,,10
	.p2align 3
.L5561:
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%rbx)
	movzbl	(%rax), %eax
	movzbl	%al, %esi
.L5464:
	testl	%esi, %esi
	je	.L5467
	cmpq	$0, 16(%rbx)
	je	.L5461
	movq	%rdx, %rdi
	subq	%rcx, %rdi
	cmpl	%edi, %esi
	jg	.L5562
.L5461:
	addq	%rcx, %rax
	movq	%rax, 192(%rbx)
	jmp	.L5460
	.p2align 4,,10
	.p2align 3
.L5562:
	movq	%rdx, 192(%rbx)
	subl	%edi, %esi
	movq	40(%rbx), %rdi
	call	*24(%rbx)
	movq	192(%rbx), %rax
	movq	200(%rbx), %rdx
	jmp	.L5460
.L5554:
	leaq	.LC228(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L5403
.L5480:
	cltq
	movq	%rsi, 192(%rbx)
	leaq	(%r12,%rax), %rcx
	movzbl	56(%rbx), %eax
	movq	%rcx, 200(%rbx)
	jmp	.L5478
.L5466:
	cltq
	movq	%rcx, 192(%rbx)
	leaq	(%r12,%rax), %rdx
	movzbl	56(%rbx), %eax
	movq	%rdx, 200(%rbx)
	movzbl	%al, %esi
	jmp	.L5464
.L5555:
	leaq	.LC229(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L5403
.L5437:
	leaq	.LC219(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L5403
.L5495:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.L5439
.L5498:
	movq	%rsi, %rdx
	jmp	.L5479
.L5560:
	movq	%rbx, %rdi
	call	stbi__get8
	movq	%rbx, %rdi
	movzbl	%al, %eax
	movl	%eax, 48(%rbp)
	call	stbi__get16le
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	movl	%eax, 34920(%rbp)
	movslq	44(%rbp), %rax
	testl	%eax, %eax
	js	.L5482
	movb	$-1, 55(%rbp,%rax,4)
.L5482:
	testb	$1, 48(%rbp)
	je	.L5483
	movq	%rbx, %rdi
	call	stbi__get8
	movzbl	%al, %eax
	movl	%eax, 44(%rbp)
	movb	$0, 55(%rbp,%rax,4)
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rcx
	jmp	.L5479
.L5549:
	movq	%rdi, %rax
	jmp	.L5422
.L5483:
	movl	$1, %esi
	movq	%rbx, %rdi
	call	stbi__skip.part.0
	movl	$-1, 44(%rbp)
	movq	192(%rbx), %rdx
	movq	200(%rbx), %rcx
	jmp	.L5479
.L5410:
	leaq	.LC18(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	xorl	%eax, %eax
	jmp	.L5403
	.cfi_endproc
.LFE863:
	.size	stbi__gif_load_next.constprop.0, .-stbi__gif_load_next.constprop.0
	.p2align 4
	.type	stbi__gif_load.constprop.0, @function
stbi__gif_load.constprop.0:
.LFB864:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rsi, %r14
	xorl	%esi, %esi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdx, %r13
	movl	$34928, %edx
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%r8d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rcx, %rbx
	subq	$34944, %rsp
	.cfi_def_cfa_offset 34992
	movq	%fs:40, %rax
	movq	%rax, 34936(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdi
	call	memset@PLT
	xorl	%ecx, %ecx
	movq	%rbx, %rdx
	movq	%rbp, %rdi
	movq	%rax, %rsi
	call	stbi__gif_load_next.constprop.0
	cmpq	%rax, %rbp
	je	.L5564
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L5564
	movl	(%rsp), %ecx
	movl	4(%rsp), %r8d
	movl	%ecx, (%r14)
	movl	%r8d, 0(%r13)
	testl	$-5, %r12d
	jne	.L5581
.L5565:
	movq	24(%rsp), %rdi
	call	free@PLT
	movq	16(%rsp), %rdi
	call	free@PLT
	movq	34936(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L5582
	addq	$34944, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5581:
	.cfi_restore_state
	movl	%r12d, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	stbi__convert_format
	movq	%rax, %rbx
	jmp	.L5565
	.p2align 4,,10
	.p2align 3
.L5564:
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L5566
	call	free@PLT
.L5566:
	xorl	%ebx, %ebx
	jmp	.L5565
.L5582:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE864:
	.size	stbi__gif_load.constprop.0, .-stbi__gif_load.constprop.0
	.p2align 4
	.type	stbi__load_gif_main.constprop.0, @function
stbi__load_gif_main.constprop.0:
.LFB865:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%r8, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$35032, %rsp
	.cfi_def_cfa_offset 35088
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r9, 8(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 35016(%rsp)
	xorl	%eax, %eax
	call	stbi__gif_test_raw
	movdqu	208(%rbx), %xmm0
	movups	%xmm0, 192(%rbx)
	testl	%eax, %eax
	je	.L5584
	leaq	80(%rsp), %r9
	movl	$34928, %edx
	xorl	%esi, %esi
	movq	%r9, %rdi
	call	memset@PLT
	movq	%rax, %r9
	testq	%r14, %r14
	je	.L5585
	movq	$0, (%r14)
.L5585:
	movq	$4, 16(%rsp)
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	movq	$0, (%rsp)
	movq	%rbx, 24(%rsp)
	movq	%r15, 72(%rsp)
	movq	%r9, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L5586:
	movq	24(%rsp), %rbx
	movq	(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	32(%rsp), %rsi
	movq	%rbx, %rdi
	call	stbi__gif_load_next.constprop.0
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L5587
	cmpq	%rax, %rbx
	je	.L5587
	movl	80(%rsp), %edx
	movq	48(%rsp), %rax
	addl	$1, %r13d
	movl	%r13d, %ebp
	movq	56(%rsp), %rsi
	movl	%edx, (%rax)
	movl	84(%rsp), %eax
	imull	%eax, %edx
	movl	%eax, (%rsi)
	leal	0(,%rdx,4), %ebx
	movl	%edx, 44(%rsp)
	imull	%ebx, %ebp
	movslq	%ebp, %rsi
	testq	%r12, %r12
	je	.L5588
	movq	%r12, %rdi
	call	realloc@PLT
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L5643
	testq	%r14, %r14
	je	.L5594
	movq	(%r14), %rdi
	movq	16(%rsp), %rsi
	movq	%rax, 64(%rsp)
	call	realloc@PLT
	movq	64(%rsp), %rcx
	testq	%rax, %rax
	je	.L5644
	movq	%rax, (%r14)
	movq	%rcx, %r12
.L5596:
	subl	%ebx, %ebp
	movslq	%ebx, %rdx
	movq	%r15, %rsi
	movslq	%ebp, %rdi
	addq	%r12, %rdi
	call	memcpy@PLT
	cmpl	$1, %r13d
	je	.L5602
.L5601:
	movl	44(%rsp), %eax
	movq	%r12, %rcx
	sall	$3, %eax
	cltq
	subq	%rax, %rcx
	movq	%rcx, (%rsp)
	testq	%r14, %r14
	je	.L5598
.L5602:
	movq	(%r14), %rax
	movl	35000(%rsp), %edx
	movq	16(%rsp), %rsi
	movl	%edx, -4(%rax,%rsi)
.L5598:
	addq	$4, 16(%rsp)
	jmp	.L5586
	.p2align 4,,10
	.p2align 3
.L5604:
	movq	%rax, %rcx
.L5594:
	subl	%ebx, %ebp
	movslq	%ebx, %rdx
	movq	%r15, %rsi
	movq	%rcx, 64(%rsp)
	movslq	%ebp, %rdi
	addq	%rcx, %rdi
	call	memcpy@PLT
	movq	64(%rsp), %r12
	cmpl	$1, %r13d
	jne	.L5601
	jmp	.L5598
	.p2align 4,,10
	.p2align 3
.L5588:
	movq	%rsi, %rdi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L5645
	testq	%r14, %r14
	je	.L5604
	movq	16(%rsp), %rdi
	call	malloc@PLT
	movq	%rax, (%r14)
	testq	%rax, %rax
	jne	.L5596
	movq	88(%rsp), %rdi
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	jne	.L5640
	jmp	.L5591
	.p2align 4,,10
	.p2align 3
.L5587:
	movq	88(%rsp), %rdi
	movq	72(%rsp), %r15
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	testl	$-5, 35088(%rsp)
	jne	.L5646
.L5599:
	movl	%r13d, (%r15)
.L5583:
	movq	35016(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L5647
	addq	$35032, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L5646:
	.cfi_restore_state
	movl	80(%rsp), %ecx
	movl	84(%rsp), %r8d
	movq	%r12, %rdi
	movl	$4, %esi
	movl	35088(%rsp), %edx
	imull	%r13d, %ecx
	call	stbi__convert_format
	movq	%rax, %r12
	jmp	.L5599
.L5584:
	leaq	.LC200(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5583
.L5645:
	movq	88(%rsp), %rdi
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	testq	%r14, %r14
	je	.L5591
.L5642:
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	.L5591
.L5640:
	call	free@PLT
.L5591:
	leaq	.LC18(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5583
.L5644:
	movq	88(%rsp), %rdi
	movq	%rcx, (%rsp)
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	movq	(%rsp), %rdi
	call	free@PLT
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	jne	.L5640
	jmp	.L5591
.L5643:
	movq	88(%rsp), %rdi
	call	free@PLT
	movq	104(%rsp), %rdi
	call	free@PLT
	movq	96(%rsp), %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	testq	%r14, %r14
	jne	.L5642
	jmp	.L5591
.L5647:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE865:
	.size	stbi__load_gif_main.constprop.0, .-stbi__load_gif_main.constprop.0
	.section	.rodata.str1.1
.LC232:
	.string	"bad format"
.LC233:
	.string	"bad palette"
.LC234:
	.string	"bad req_comp"
.LC235:
	.string	"bad bits_per_channel"
.LC236:
	.string	"bad PNM"
.LC237:
	.string	"tga_comp == STBI_rgb"
	.text
	.p2align 4
	.type	stbi__load_main, @function
stbi__load_main:
.LFB567:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r9, %rbx
	subq	$456, %rsp
	.cfi_def_cfa_offset 512
	movq	%rdx, 48(%rsp)
	movl	512(%rsp), %ebp
	movq	%rsi, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movl	%r8d, 8(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 440(%rsp)
	xorl	%eax, %eax
	movq	$0, 4(%r9)
	movq	192(%rdi), %rdx
	movq	200(%rdi), %rax
	movl	$8, (%r9)
	cmpq	%rax, %rdx
	jb	.L5649
	movl	48(%rdi), %r14d
	testl	%r14d, %r14d
	jne	.L6556
	.p2align 4,,10
	.p2align 3
.L5650:
	leaq	.LC108(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movdqu	208(%r12), %xmm4
	movq	216(%r12), %rax
	movq	208(%r12), %rdx
	movups	%xmm4, 192(%r12)
	cmpq	%rax, %rdx
	jb	.L6557
	movl	48(%r12), %ecx
	testl	%ecx, %ecx
	jne	.L6558
.L5689:
	movq	%rdx, 192(%r12)
.L5693:
	movq	%rax, 200(%r12)
	movq	%r12, %rdi
	call	stbi__gif_test_raw
	movdqu	208(%r12), %xmm7
	movl	%eax, 64(%rsp)
	movups	%xmm7, 192(%r12)
	testl	%eax, %eax
	jne	.L6559
	movq	%r12, %rdi
	call	stbi__get32be
	movq	216(%r12), %rcx
	movdqu	208(%r12), %xmm5
	movl	%eax, %edx
	movq	208(%r12), %rax
	movups	%xmm5, 192(%r12)
	cmpl	$943870035, %edx
	je	.L5702
	cmpq	%rcx, %rax
	jb	.L5703
	movl	48(%r12), %r15d
	testl	%r15d, %r15d
	jne	.L6560
	.p2align 4,,10
	.p2align 3
.L5749:
	movq	208(%r12), %rax
	movl	$1, %esi
	movl	$18568, %edi
	movq	%rax, 192(%r12)
	movq	216(%r12), %rax
	movq	%rax, 200(%r12)
	call	calloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L6561
	leaq	stbi__YCbCr_to_RGB_simd(%rip), %rax
	leaq	stbi__idct_simd(%rip), %rdx
	movq	%r12, 0(%r13)
	movq	%r12, %rdi
	leaq	stbi__resample_row_hv_2_simd(%rip), %rbp
	movq	%rdx, %xmm7
	movq	%rax, %xmm6
	movl	$-1, 18508(%r13)
	movq	%rbp, 18560(%r13)
	punpcklqdq	%xmm6, %xmm7
	movb	$-1, 18472(%r13)
	movups	%xmm7, 18544(%r13)
	movaps	%xmm7, 16(%rsp)
	call	stbi__get8
	cmpb	$-1, %al
	jne	.L6536
.L5889:
	movq	0(%r13), %r14
	movq	192(%r14), %rax
	cmpq	200(%r14), %rax
	jb	.L6535
	movl	48(%r14), %r9d
	testl	%r9d, %r9d
	jne	.L6503
.L6536:
	movdqu	208(%r12), %xmm0
.L5886:
	leaq	.LC190(%rip), %rax
	movq	%r13, %rdi
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	movups	%xmm0, 192(%r12)
	call	free@PLT
.L5885:
	movq	%r12, %rdi
	call	stbi__get8
	movq	%r12, %rdi
	movl	%eax, %ebp
	call	stbi__get8
	cmpb	$80, %bpl
	jne	.L5956
	subl	$53, %eax
	cmpb	$1, %al
	ja	.L5956
	leaq	8(%r12), %rcx
	leaq	4(%r12), %rdx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	stbi__pnm_info
	movl	%eax, (%rbx)
	testl	%eax, %eax
	je	.L5892
	cmpl	$16777216, 4(%r12)
	ja	.L5962
	movl	(%r12), %eax
	cmpl	$16777216, %eax
	ja	.L5962
	movq	40(%rsp), %rsi
	movl	%eax, (%rsi)
	movq	48(%rsp), %rsi
	movl	4(%r12), %eax
	movl	%eax, (%rsi)
	movq	32(%rsp), %rsi
	testq	%rsi, %rsi
	je	.L5963
	movl	8(%r12), %eax
	movl	%eax, (%rsi)
.L5963:
	movl	8(%r12), %r14d
	movl	(%rbx), %ecx
	movl	4(%r12), %ebp
	movl	(%r12), %r15d
	testl	%r14d, %r14d
	js	.L5962
	testl	%r15d, %r15d
	js	.L5962
	testl	%ecx, %ecx
	leal	7(%rcx), %r13d
	cmovns	%ecx, %r13d
	sarl	$3, %r13d
	testl	%r15d, %r15d
	je	.L5964
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%r15d
	cmpl	%eax, %r14d
	jg	.L5962
	testl	%ebp, %ebp
	js	.L5962
	je	.L5968
	movl	$2147483647, %eax
	xorl	%edx, %edx
	movl	%r15d, %esi
	idivl	%ebp
	imull	%r14d, %esi
	cmpl	%eax, %esi
	jle	.L6562
.L5962:
	leaq	.LC66(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5892
	.p2align 4,,10
	.p2align 3
.L6557:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r12)
	movzbl	(%rdx), %ecx
.L5688:
	cmpb	$66, %cl
	jne	.L5691
	movq	%r12, %rdi
	call	stbi__get8
	cmpb	$77, %al
	je	.L6563
	movq	208(%r12), %rax
	movq	%rax, 192(%r12)
	movq	216(%r12), %rax
	jmp	.L5693
	.p2align 4,,10
	.p2align 3
.L5649:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rdi)
	movzbl	(%rdx), %edx
.L5652:
	cmpb	$-119, %dl
	jne	.L5650
	cmpq	%rax, %rcx
	jb	.L5653
	movl	48(%r12), %r13d
	testl	%r13d, %r13d
	je	.L5650
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	je	.L5666
	cltq
	movq	%rdx, 192(%r12)
	movzbl	56(%r12), %ecx
	addq	%r13, %rax
	movq	%rax, 200(%r12)
	jmp	.L5655
	.p2align 4,,10
	.p2align 3
.L5653:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rcx), %ecx
.L5655:
	cmpb	$80, %cl
	jne	.L5650
	cmpq	%rax, %rdx
	jb	.L5656
	movl	48(%r12), %r11d
	testl	%r11d, %r11d
	je	.L5650
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	je	.L5669
	cltq
	movq	%rcx, 192(%r12)
	movzbl	56(%r12), %edx
	addq	%r13, %rax
	movq	%rax, 200(%r12)
	jmp	.L5658
	.p2align 4,,10
	.p2align 3
.L5656:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r12)
	movzbl	(%rdx), %edx
.L5658:
	cmpb	$78, %dl
	jne	.L5650
	cmpq	%rax, %rcx
	jb	.L5659
	movl	48(%r12), %r10d
	testl	%r10d, %r10d
	je	.L5650
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	je	.L5666
	cltq
	movq	%rdx, 192(%r12)
	movzbl	56(%r12), %ecx
	addq	%r13, %rax
	movq	%rax, 200(%r12)
	jmp	.L5661
	.p2align 4,,10
	.p2align 3
.L5659:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rcx), %ecx
.L5661:
	cmpb	$71, %cl
	jne	.L5650
	cmpq	%rax, %rdx
	jb	.L5662
	movl	48(%r12), %r9d
	testl	%r9d, %r9d
	je	.L5650
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	je	.L5669
	cltq
	movq	%rcx, 192(%r12)
	movzbl	56(%r12), %edx
	addq	%r13, %rax
	movq	%rax, 200(%r12)
	jmp	.L5664
	.p2align 4,,10
	.p2align 3
.L5662:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r12)
	movzbl	(%rdx), %edx
.L5664:
	cmpb	$13, %dl
	jne	.L5650
	cmpq	%rax, %rcx
	jb	.L5665
	movl	48(%r12), %r8d
	testl	%r8d, %r8d
	je	.L5650
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	je	.L5666
	cltq
	movq	%rdx, 192(%r12)
	movzbl	56(%r12), %ecx
	addq	%r13, %rax
	movq	%rax, 200(%r12)
	jmp	.L5667
	.p2align 4,,10
	.p2align 3
.L5665:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rcx), %ecx
.L5667:
	cmpb	$10, %cl
	jne	.L5650
	cmpq	%rax, %rdx
	jb	.L5668
	movl	48(%r12), %edi
	testl	%edi, %edi
	je	.L5650
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	jne	.L6564
.L5669:
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rcx, 200(%r12)
	movq	%rcx, 192(%r12)
	jmp	.L5650
	.p2align 4,,10
	.p2align 3
.L5668:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r12)
	movzbl	(%rdx), %edx
.L5670:
	cmpb	$26, %dl
	jne	.L5650
	cmpq	%rax, %rcx
	jb	.L6565
	movl	48(%r12), %esi
	testl	%esi, %esi
	je	.L5650
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	jne	.L5673
	leaq	57(%r12), %rax
	movb	$0, 56(%r12)
	movl	$0, 48(%r12)
	movq	%rax, 200(%r12)
	jmp	.L5650
	.p2align 4,,10
	.p2align 3
.L6565:
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r12)
	movzbl	(%rcx), %edx
.L5672:
	cmpb	$10, %dl
	jne	.L5650
	movdqu	208(%r12), %xmm3
	cmpl	$4, 8(%rsp)
	movq	%r12, 160(%rsp)
	movups	%xmm3, 192(%r12)
	ja	.L6566
	movl	8(%rsp), %edx
	xorl	%esi, %esi
	leaq	160(%rsp), %rdi
	call	stbi__parse_png_file
	testl	%eax, %eax
	je	.L6567
	movl	192(%rsp), %edx
	cmpl	$8, %edx
	jle	.L6151
	cmpl	$16, %edx
	jne	.L6568
.L5681:
	movq	184(%rsp), %rax
	movl	%edx, (%rbx)
	movq	$0, 184(%rsp)
	movl	8(%rsp), %ebx
	movq	%rax, 16(%rsp)
	movq	160(%rsp), %rax
	movl	(%rax), %ecx
	testl	%ebx, %ebx
	je	.L6153
	movl	12(%rax), %esi
	cmpl	%esi, %ebx
	je	.L6153
	cmpl	$8, %edx
	movl	4(%rax), %r8d
	movq	16(%rsp), %rdi
	movl	%ebx, %edx
	je	.L6569
	call	stbi__convert_format16
	movq	%rax, 16(%rsp)
.L5685:
	movq	160(%rsp), %rax
	movl	8(%rsp), %esi
	cmpq	$0, 16(%rsp)
	movl	%esi, 12(%rax)
	je	.L5892
	movq	184(%rsp), %rdi
	jmp	.L5683
.L6567:
	movq	$0, 16(%rsp)
	movq	184(%rsp), %rdi
.L5680:
	call	free@PLT
	movq	176(%rsp), %rdi
	call	free@PLT
	movq	168(%rsp), %rdi
	call	free@PLT
.L5648:
	movq	440(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6550
	movq	16(%rsp), %rax
	addq	$456, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L5703:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
.L5706:
	cmpb	$83, %dl
	jne	.L5749
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L5709
	movl	48(%r12), %r14d
	testl	%r14d, %r14d
	je	.L5749
	leaq	56(%r12), %rbp
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbp, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	je	.L6552
	cltq
	movzbl	56(%r12), %edx
	addq	%rax, %rbp
	leaq	57(%r12), %rax
	movq	%rbp, 200(%r12)
	movq	%rax, 192(%r12)
	jmp	.L5712
.L6563:
	movq	%r12, %rdi
	call	stbi__get32le
	movq	%r12, %rdi
	call	stbi__get16le
	movq	%r12, %rdi
	call	stbi__get16le
	movq	%r12, %rdi
	call	stbi__get32le
	movq	%r12, %rdi
	call	stbi__get32le
	cmpl	$12, %eax
	je	.L5695
	cmpl	$40, %eax
	je	.L5695
	movq	208(%r12), %rdx
	movq	%rdx, 192(%r12)
	cmpl	$56, %eax
	je	.L6551
	cmpl	$108, %eax
	je	.L6551
	cmpl	$124, %eax
	movq	216(%r12), %rax
	jne	.L5693
.L5698:
	movq	%rax, 200(%r12)
	movq	440(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6550
	movl	8(%rsp), %r8d
	movq	32(%rsp), %rcx
	movq	%r12, %rdi
	movq	48(%rsp), %rdx
	movq	40(%rsp), %rsi
	addq	$456, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	stbi__bmp_load.constprop.0
.L5956:
	.cfi_restore_state
	movdqu	208(%r12), %xmm3
	movq	%r12, %rdi
	movups	%xmm3, 192(%r12)
	call	stbi__hdr_test
	movl	%eax, 112(%rsp)
	testl	%eax, %eax
	jne	.L6570
	movq	%r12, %rdi
	call	stbi__get8
	movq	%r12, %rdi
	call	stbi__get8
	movzbl	%al, %ebp
	movl	%ebp, %ebx
	cmpl	$1, %ebp
	jle	.L5992
.L6507:
	movq	208(%r12), %rax
	movq	%rax, 192(%r12)
	movq	216(%r12), %rax
.L5993:
	movq	%rax, 200(%r12)
	leaq	.LC203(%rip), %rax
.L6548:
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5892
.L6153:
	xorl	%edi, %edi
.L5683:
	movl	(%rax), %edx
	movq	40(%rsp), %rsi
	movl	%edx, (%rsi)
	movq	48(%rsp), %rsi
	movl	4(%rax), %edx
	movl	%edx, (%rsi)
	movq	32(%rsp), %rsi
	testq	%rsi, %rsi
	je	.L5680
	movl	8(%rax), %eax
	movl	%eax, (%rsi)
	jmp	.L5680
	.p2align 4,,10
	.p2align 3
.L5666:
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rdx, 200(%r12)
	movq	%rdx, 192(%r12)
	jmp	.L5650
	.p2align 4,,10
	.p2align 3
.L6559:
	movq	440(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6550
	movl	8(%rsp), %r8d
	movq	32(%rsp), %rcx
	movq	%r12, %rdi
	movq	48(%rsp), %rdx
	movq	40(%rsp), %rsi
	addq	$456, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	stbi__gif_load.constprop.0
	.p2align 4,,10
	.p2align 3
.L6556:
	.cfi_restore_state
	leaq	56(%rdi), %r13
	movl	52(%rdi), %edx
	movq	40(%rdi), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	je	.L5669
	cltq
	movq	%rcx, 192(%r12)
	movzbl	56(%r12), %edx
	addq	%r13, %rax
	movq	%rax, 200(%r12)
	jmp	.L5652
.L6503:
	movq	%r14, %rdi
	call	stbi__refill_buffer
	movq	192(%r14), %rax
.L6535:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %eax
	cmpb	$-1, %al
	je	.L5889
	movdqu	208(%r12), %xmm0
	cmpb	$-40, %al
	jne	.L5886
	movups	%xmm0, 192(%r12)
	movq	%r13, %rdi
	call	free@PLT
	movl	$1, %esi
	movl	$18568, %edi
	call	calloc@PLT
	movq	%rax, %r10
	testq	%rax, %rax
	je	.L6547
	movdqa	16(%rsp), %xmm6
	movq	%r12, (%rax)
	movq	%rbp, 18560(%rax)
	movups	%xmm6, 18544(%rax)
	movl	8(%rsp), %eax
	movl	$0, 8(%r12)
	movl	%eax, 96(%rsp)
	cmpl	$4, %eax
	ja	.L6571
	movq	%r10, %rdi
	movq	%r10, 16(%rsp)
	call	stbi__decode_jpeg_image
	movq	16(%rsp), %r10
	testl	%eax, %eax
	je	.L6572
	movq	(%r10), %r9
	movl	8(%rsp), %r8d
	movl	8(%r9), %r11d
	testl	%r8d, %r8d
	jne	.L5903
	cmpl	$2, %r11d
	jle	.L6174
	cmpl	$3, %r11d
	je	.L6573
	movl	$0, 128(%rsp)
	movl	%r11d, %r12d
	movl	$3, 96(%rsp)
	movl	$3, 8(%rsp)
.L5905:
	movl	(%r9), %ebx
	movl	64(%rsp), %ebp
	movq	%r9, 72(%rsp)
	pxor	%xmm0, %xmm0
	leaq	240(%rsp), %rax
	movl	%r11d, 64(%rsp)
	leaq	18084(%r10), %r15
	movabsq	$8589934593, %r14
	movq	%rax, 104(%rsp)
	leal	3(%rbx), %r13d
	movq	%r13, 56(%rsp)
	movq	%rax, %r13
	movl	%ebx, 16(%rsp)
	movq	%r15, %rbx
	movq	%r10, %r15
	movaps	%xmm0, 208(%rsp)
	movaps	%xmm0, 224(%rsp)
	.p2align 4,,10
	.p2align 3
.L5909:
	movq	56(%rsp), %rdi
	call	malloc@PLT
	movq	%rax, 68(%rbx)
	testq	%rax, %rax
	je	.L6574
	movl	18056(%r15), %eax
	movabsq	$4294967297, %rsi
	cltd
	idivl	(%rbx)
	movl	%eax, %ecx
	movl	18060(%r15), %eax
	movd	%ecx, %xmm0
	cltd
	idivl	4(%rbx)
	movl	$0, 40(%r13)
	xorl	%edx, %edx
	movl	%eax, %edi
	movl	16(%rsp), %eax
	movd	%edi, %xmm6
	leal	-1(%rax,%rcx), %eax
	punpckldq	%xmm6, %xmm0
	divl	%ecx
	movl	%edi, %edx
	sarl	%edx
	movd	%edx, %xmm5
	movd	%eax, %xmm1
	movslq	%ebp, %rax
	punpckldq	%xmm5, %xmm1
	leaq	(%rax,%rax,2), %rax
	punpcklqdq	%xmm1, %xmm0
	salq	$4, %rax
	movups	%xmm0, 24(%r13)
	movq	44(%rbx), %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, 8(%r13)
	movq	264(%rsp,%rax), %rdx
	leaq	resample_row_1(%rip), %rax
	cmpq	%rsi, %rdx
	je	.L5908
	leaq	stbi__resample_row_v_2(%rip), %rax
	cmpq	%r14, %rdx
	je	.L5908
	movabsq	$4294967298, %rcx
	leaq	stbi__resample_row_h_2(%rip), %rax
	cmpq	%rcx, %rdx
	je	.L5908
	movabsq	$8589934594, %rcx
	leaq	stbi__resample_row_generic(%rip), %rax
	cmpq	%rcx, %rdx
	jne	.L5908
	movq	18560(%r15), %rax
	.p2align 4,,10
	.p2align 3
.L5908:
	addl	$1, %ebp
	movq	%rax, 0(%r13)
	addq	$96, %rbx
	addq	$48, %r13
	cmpl	%r12d, %ebp
	jne	.L5909
	movq	72(%rsp), %r9
	movl	16(%rsp), %ebx
	movq	%r15, %r10
	movl	64(%rsp), %r11d
	movl	4(%r9), %ebp
	testl	%ebx, %ebx
	js	.L5910
	je	.L6575
	movl	$2147483647, %eax
	xorl	%edx, %edx
	movl	8(%rsp), %esi
	idivl	%ebx
	cmpl	%eax, %esi
	jg	.L5910
	testl	%ebp, %ebp
	js	.L5910
	imull	%ebx, %esi
	movl	%esi, %ecx
	testl	%ebp, %ebp
	je	.L5912
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%ebp
	cmpl	%eax, %esi
	jle	.L6576
.L5910:
	movq	%r10, %rdi
	movl	%r11d, %esi
	movq	%r10, 8(%rsp)
	call	stbi__free_jpeg_components.constprop.0
	leaq	.LC18(%rip), %rax
	movq	8(%rsp), %r10
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L6538:
	movq	$0, 16(%rsp)
.L5897:
	movq	%r10, %rdi
	call	free@PLT
	jmp	.L5648
.L6558:
	leaq	56(%r12), %r13
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%r13, %rsi
	call	*16(%r12)
	movq	208(%r12), %rdx
	movq	192(%r12), %rcx
	subq	%rdx, %rcx
	addl	%ecx, 184(%r12)
	testl	%eax, %eax
	jne	.L5690
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
.L5691:
	movq	216(%r12), %rax
	jmp	.L5689
	.p2align 4,,10
	.p2align 3
.L6566:
	leaq	.LC234(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5892:
	movq	$0, 16(%rsp)
	jmp	.L5648
.L6151:
	movl	$8, %edx
	jmp	.L5681
.L5709:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
.L5712:
	cmpb	$-128, %dl
	jne	.L5749
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L5714
	movl	48(%r12), %r13d
	testl	%r13d, %r13d
	je	.L5749
	leaq	56(%r12), %rbp
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbp, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	je	.L6552
	cltq
	movzbl	56(%r12), %edx
	addq	%rax, %rbp
	leaq	57(%r12), %rax
	movq	%rbp, 200(%r12)
	movq	%rax, 192(%r12)
	jmp	.L5717
.L5714:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
.L5717:
	cmpb	$-10, %dl
	jne	.L5749
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L6577
	movl	48(%r12), %ebp
	testl	%ebp, %ebp
	je	.L5749
	leaq	56(%r12), %rbp
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbp, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	je	.L6552
	cltq
	movzbl	56(%r12), %edx
	addq	%rax, %rbp
	leaq	57(%r12), %rax
	movq	%rbp, 200(%r12)
	movq	%rax, 192(%r12)
	jmp	.L5722
.L6577:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %edx
.L5722:
	cmpb	$52, %dl
	jne	.L5749
	movq	192(%r12), %rax
	movl	$84, %r13d
	leaq	56(%r12), %rbp
	movq	200(%r12), %rdx
	movq	%rax, %rcx
	jmp	.L5725
	.p2align 4,,10
	.p2align 3
.L5727:
	movl	48(%r12), %r11d
	testl	%r11d, %r11d
	jne	.L6578
.L5728:
	subl	$1, %r13d
	je	.L6579
.L5725:
	cmpq	%rdx, %rcx
	jnb	.L5727
	addq	$1, %rcx
	movq	%rcx, 192(%r12)
	subl	$1, %r13d
	jne	.L5725
.L6579:
	cmpq	%rdx, %rcx
	jb	.L5731
	movl	48(%r12), %r10d
	testl	%r10d, %r10d
	je	.L5749
	leaq	56(%r12), %rbp
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbp, %rsi
	call	*16(%r12)
	movslq	%eax, %rdx
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%edx, %edx
	je	.L6552
	addq	%rbp, %rdx
	movzbl	56(%r12), %eax
	movq	%rdx, 200(%r12)
	leaq	57(%r12), %rdx
	movq	%rdx, 192(%r12)
	jmp	.L5734
	.p2align 4,,10
	.p2align 3
.L6578:
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbp, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	jne	.L5729
	movl	$0, 48(%r12)
	movq	%rcx, %rdx
	movb	$0, 56(%r12)
.L5730:
	movq	%rdx, 200(%r12)
	movq	%rcx, 192(%r12)
	jmp	.L5728
	.p2align 4,,10
	.p2align 3
.L5729:
	cltq
	leaq	0(%rbp,%rax), %rdx
	jmp	.L5730
.L5702:
	movq	440(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6550
	movl	8(%rsp), %r8d
	movq	32(%rsp), %rcx
	movq	%rbx, %r9
	movq	%r12, %rdi
	movl	%ebp, 512(%rsp)
	movq	48(%rsp), %rdx
	movq	40(%rsp), %rsi
	addq	$456, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	stbi__psd_load
.L5731:
	.cfi_restore_state
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rcx), %eax
.L5734:
	cmpb	$80, %al
	jne	.L5749
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L5737
	movl	48(%r12), %r9d
	testl	%r9d, %r9d
	je	.L5749
	leaq	56(%r12), %rbp
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbp, %rsi
	call	*16(%r12)
	movslq	%eax, %rdx
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%edx, %edx
	je	.L6552
	addq	%rbp, %rdx
	movzbl	56(%r12), %eax
	movq	%rdx, 200(%r12)
	leaq	57(%r12), %rdx
	movq	%rdx, 192(%r12)
.L5740:
	cmpb	$73, %al
	jne	.L5749
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L5742
	movl	48(%r12), %r8d
	testl	%r8d, %r8d
	je	.L5749
	leaq	56(%r12), %rbp
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbp, %rsi
	call	*16(%r12)
	movslq	%eax, %rdx
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%edx, %edx
	je	.L6552
	addq	%rbp, %rdx
	movzbl	56(%r12), %eax
	movq	%rdx, 200(%r12)
	leaq	57(%r12), %rdx
	movq	%rdx, 192(%r12)
.L5745:
	cmpb	$67, %al
	jne	.L5749
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L6580
	movl	48(%r12), %edi
	testl	%edi, %edi
	je	.L5749
	leaq	56(%r12), %rbp
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbp, %rsi
	call	*16(%r12)
	movslq	%eax, %rdx
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%edx, %edx
	je	.L6552
	addq	%rbp, %rdx
	movzbl	56(%r12), %eax
	movq	%rdx, 200(%r12)
.L5748:
	cmpb	$84, %al
	jne	.L5749
	movq	32(%rsp), %rsi
	movl	$92, %ebp
	leaq	56(%r12), %rbx
	leaq	160(%rsp), %rdx
	movq	208(%r12), %rax
	testq	%rsi, %rsi
	cmovne	%rsi, %rdx
	movq	%rax, 192(%r12)
	movq	%rax, %rcx
	movq	%rdx, 32(%rsp)
	movq	216(%r12), %rdx
	movq	%rdx, 200(%r12)
	jmp	.L5757
	.p2align 4,,10
	.p2align 3
.L5753:
	movl	48(%r12), %esi
	testl	%esi, %esi
	jne	.L6581
.L5754:
	subl	$1, %ebp
	je	.L6582
.L5757:
	cmpq	%rdx, %rcx
	jnb	.L5753
	addq	$1, %rcx
	movq	%rcx, 192(%r12)
	jmp	.L5754
.L6564:
	cltq
	movq	%rcx, 192(%r12)
	movzbl	56(%r12), %edx
	addq	%r13, %rax
	movq	%rax, 200(%r12)
	jmp	.L5670
.L5690:
	cltq
	movzbl	56(%r12), %ecx
	addq	%rax, %r13
	leaq	57(%r12), %rax
	movq	%r13, 200(%r12)
	movq	%rax, 192(%r12)
	jmp	.L5688
.L5673:
	cltq
	movzbl	56(%r12), %edx
	addq	%rax, %r13
	movq	%r13, 200(%r12)
	jmp	.L5672
.L6570:
	movl	8(%rsp), %ebx
	movq	32(%rsp), %r14
	movq	%r12, %rdi
	movq	48(%rsp), %rdx
	movq	40(%rsp), %rsi
	movl	%ebx, %r8d
	movq	%r14, %rcx
	call	stbi__hdr_load.constprop.0
	movq	%rax, 56(%rsp)
	testl	%ebx, %ebx
	jne	.L5976
	movl	(%r14), %eax
	movl	%eax, 8(%rsp)
.L5976:
	movq	48(%rsp), %rax
	cmpq	$0, 56(%rsp)
	movl	(%rax), %ecx
	movq	40(%rsp), %rax
	movl	(%rax), %esi
	je	.L5892
	movl	%ecx, %eax
	orl	%esi, %eax
	js	.L5980
	testl	%ecx, %ecx
	je	.L6583
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%ecx
	cmpl	%eax, %esi
	jg	.L5980
	movl	8(%rsp), %eax
	testl	%eax, %eax
	js	.L5980
	movl	%ecx, %r14d
	imull	%esi, %r14d
	testl	%eax, %eax
	je	.L5982
	movl	%eax, %ebx
	xorl	%edx, %edx
	movl	$2147483647, %eax
	idivl	%ebx
	cmpl	%eax, %r14d
	jle	.L5981
.L5980:
	movq	56(%rsp), %rdi
	call	free@PLT
.L6547:
	leaq	.LC18(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5892
.L5695:
	movq	208(%r12), %rax
	movq	%rax, 192(%r12)
.L6551:
	movq	216(%r12), %rax
	jmp	.L5698
.L6571:
	leaq	.LC234(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6538
	.p2align 4,,10
	.p2align 3
.L6581:
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbx, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	leaq	57(%r12), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	jne	.L5755
	movl	$0, 48(%r12)
	movq	%rcx, %rdx
	movb	$0, 56(%r12)
.L5756:
	movq	%rdx, 200(%r12)
	movq	%rcx, 192(%r12)
	jmp	.L5754
	.p2align 4,,10
	.p2align 3
.L5755:
	cltq
	leaq	(%rbx,%rax), %rdx
	jmp	.L5756
.L6552:
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	jmp	.L5749
.L6582:
	movq	%r12, %rdi
	call	stbi__get16be
	movq	%r12, %rdi
	movl	%eax, 16(%rsp)
	call	stbi__get16be
	movl	%eax, %r8d
	cmpl	$16777216, %eax
	jg	.L6035
	cmpl	$16777216, 16(%rsp)
	jg	.L6035
	cmpq	$0, 16(%r12)
	je	.L5764
	movl	%eax, 56(%rsp)
	movq	40(%r12), %rdi
	call	*32(%r12)
	movl	56(%rsp), %r8d
	testl	%eax, %eax
	je	.L5763
	movl	48(%r12), %eax
	testl	%eax, %eax
	je	.L5762
.L5764:
	movq	200(%r12), %rax
	cmpq	%rax, 192(%r12)
	jnb	.L5762
.L5763:
	movl	16(%rsp), %esi
	movl	%esi, %eax
	orl	%r8d, %eax
	js	.L6035
	testl	%r8d, %r8d
	je	.L5766
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%r8d
	cmpl	%eax, %esi
	jg	.L6035
	imull	%r8d, %esi
	movl	%esi, %ebx
	cmpl	$536870911, %esi
	jg	.L6035
	movq	%r12, %rdi
	movl	%r8d, 56(%rsp)
	sall	$2, %ebx
	call	stbi__get32be
	movq	%r12, %rdi
	call	stbi__get16be
	movq	%r12, %rdi
	call	stbi__get16be
	movl	56(%rsp), %r8d
.L6144:
	movl	16(%rsp), %edi
	movl	%r8d, 56(%rsp)
	imull	%r8d, %edi
	sall	$2, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L6554
	movslq	%ebx, %rdx
	movl	$255, %esi
	movq	%rax, %rdi
	xorl	%r15d, %r15d
	call	memset@PLT
	movl	$0, 72(%rsp)
	movq	%r12, %rax
	leaq	241(%rsp), %rbx
	movq	%rbp, %r12
	movq	%rax, %rbp
.L5768:
	movq	200(%rbp), %rax
	movq	192(%rbp), %rdx
	movl	%r15d, 80(%rsp)
	addl	$1, %r15d
	movq	16(%rbp), %r8
	movq	%rax, %rsi
	cmpq	%rax, %rdx
	jb	.L6584
	movl	48(%rbp), %eax
	xorl	%r13d, %r13d
	testl	%eax, %eax
	jne	.L6585
.L5772:
	xorl	%r14d, %r14d
.L5782:
	movq	%rsi, %rax
	xorl	%esi, %esi
.L5783:
	movb	%sil, (%rbx)
	cmpq	%rax, %rdx
	jb	.L6586
	movl	48(%rbp), %eax
	testl	%eax, %eax
	jne	.L6587
	cmpq	$0, 16(%rbp)
	movb	$0, 1(%rbx)
	je	.L6529
.L6149:
	movq	40(%rbp), %rdi
	call	*32(%rbp)
	testl	%eax, %eax
	je	.L5792
	movl	48(%rbp), %r11d
	testl	%r11d, %r11d
	je	.L6529
	movq	192(%rbp), %rsi
	movq	200(%rbp), %rax
.L5791:
	cmpq	%rax, %rsi
	jnb	.L6529
.L5792:
	cmpb	$8, %r14b
	jne	.L5796
	addq	$3, %rbx
	testb	%r13b, %r13b
	je	.L6588
	cmpl	$10, %r15d
	jne	.L5768
.L5796:
	leaq	.LC232(%rip), %rax
	movl	56(%rsp), %r8d
	movq	%r12, %rbp
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L5769:
	movq	%rbp, %rdi
	movl	%r8d, 56(%rsp)
	xorl	%ebp, %ebp
	call	free@PLT
	movl	56(%rsp), %r8d
.L5882:
	movq	40(%rsp), %rax
	movl	16(%rsp), %esi
	movl	8(%rsp), %r10d
	movl	%esi, (%rax)
	movq	48(%rsp), %rax
	movl	%r8d, (%rax)
	testl	%r10d, %r10d
	jne	.L5883
	movq	32(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 8(%rsp)
.L5883:
	movl	16(%rsp), %ecx
	movl	8(%rsp), %edx
	movl	$4, %esi
	movq	%rbp, %rdi
	call	stbi__convert_format
	movq	%rax, 16(%rsp)
	jmp	.L5648
.L6035:
	leaq	.LC66(%rip), %rax
	jmp	.L6548
.L5737:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %eax
	jmp	.L5740
.L5742:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %eax
	jmp	.L5745
.L6580:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %eax
	jmp	.L5748
.L6560:
	leaq	56(%r12), %rbp
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbp, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	je	.L6552
	cltq
	movzbl	56(%r12), %edx
	addq	%rax, %rbp
	leaq	57(%r12), %rax
	movq	%rbp, 200(%r12)
	movq	%rax, 192(%r12)
	jmp	.L5706
.L6568:
	leaq	.LC235(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5892
.L5992:
	movq	%r12, %rdi
	call	stbi__get8
	cmpl	$1, %ebp
	je	.L6589
	andl	$-10, %eax
	cmpb	$2, %al
	jne	.L6507
	movl	$9, %esi
	movq	%r12, %rdi
	call	stbi__skip.part.0
.L5998:
	movq	%r12, %rdi
	call	stbi__get16le
	testl	%eax, %eax
	jle	.L6507
	movq	%r12, %rdi
	call	stbi__get16le
	testl	%eax, %eax
	jle	.L6507
	movq	%r12, %rdi
	call	stbi__get8
	cmpb	$8, %al
	movzbl	%al, %edx
	setne	%sil
	andl	$1, %ebx
	je	.L6002
	testb	%sil, %sil
	je	.L6002
	cmpl	$16, %edx
	jne	.L6507
	movq	208(%r12), %rcx
.L6004:
	movq	%rcx, 192(%r12)
	movq	216(%r12), %rax
.L6006:
	movq	%rax, 200(%r12)
	cmpq	%rax, %rcx
	jb	.L6590
	movl	48(%r12), %eax
	testl	%eax, %eax
	jne	.L6591
.L6009:
	movb	$0, 120(%rsp)
	xorl	%r14d, %r14d
.L6011:
	movl	48(%r12), %ebp
	movl	$0, 80(%rsp)
	testl	%ebp, %ebp
	jne	.L6592
.L6013:
	movq	%r12, %rdi
	call	stbi__get16le
	movq	%r12, %rdi
	movl	%eax, 136(%rsp)
	call	stbi__get16le
	movl	%eax, 104(%rsp)
	movq	192(%r12), %rax
	cmpq	200(%r12), %rax
	jb	.L6593
	movl	48(%r12), %r15d
	xorl	%r13d, %r13d
	testl	%r15d, %r15d
	jne	.L6594
.L6021:
	movq	%r12, %rdi
	call	stbi__get16le
	movq	%r12, %rdi
	call	stbi__get16le
	movq	%r12, %rdi
	call	stbi__get16le
	movq	%r12, %rdi
	movl	%eax, 72(%rsp)
	call	stbi__get16le
	movq	192(%r12), %rdx
	movq	200(%r12), %rcx
	movl	%eax, 64(%rsp)
	cmpq	%rcx, %rdx
	jb	.L6595
	movl	48(%r12), %eax
	xorl	%ebx, %ebx
	xorl	%ecx, %ecx
	movl	%eax, 96(%rsp)
	testl	%eax, %eax
	jne	.L6596
.L6026:
	cmpl	$16777216, 64(%rsp)
	movl	$0, 436(%rsp)
	jg	.L6035
	cmpl	$16777216, 72(%rsp)
	jg	.L6035
	movl	$0, 128(%rsp)
	cmpl	$7, %ebp
	jle	.L6036
	movl	$1, 128(%rsp)
	subl	$8, %ebp
.L6036:
	movl	80(%rsp), %eax
	testl	%eax, %eax
	je	.L6037
	cmpb	$16, %r13b
	ja	.L6038
	cmpb	$14, %r13b
	ja	.L6201
	cmpb	$8, %r13b
	jne	.L6200
.L6198:
	movl	$0, 56(%rsp)
	movl	$1, %ebx
	movb	$1, 88(%rsp)
.L6039:
	movq	40(%rsp), %rax
	movl	72(%rsp), %esi
	movl	%esi, (%rax)
	movq	48(%rsp), %rax
	movl	64(%rsp), %esi
	movl	%esi, (%rax)
	movq	32(%rsp), %rax
	testq	%rax, %rax
	je	.L6045
	movl	%ebx, (%rax)
.L6045:
	movl	72(%rsp), %esi
	movl	64(%rsp), %edi
	movl	%esi, %eax
	orl	%edi, %eax
	js	.L6035
	testl	%edi, %edi
	je	.L6203
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%edi
	cmpl	%eax, %esi
	jg	.L6035
	movl	$2147483647, %eax
	imull	%edi, %esi
	xorl	%edx, %edx
	idivl	%ebx
	movl	%esi, 32(%rsp)
	cmpl	%eax, %esi
	jg	.L6035
.L6046:
	movl	32(%rsp), %edi
	movb	%cl, 40(%rsp)
	imull	%ebx, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L6554
	testl	%r14d, %r14d
	movzbl	40(%rsp), %ecx
	je	.L6047
	cmpq	$0, 16(%r12)
	movq	192(%r12), %rdx
	je	.L6048
	movq	200(%r12), %rsi
	movq	%rsi, %rax
	subq	%rdx, %rax
	cmpl	%r14d, %eax
	jl	.L6597
.L6048:
	movzbl	120(%rsp), %eax
	addq	%rax, %rdx
	movq	%rdx, 192(%r12)
.L6047:
	movl	%ecx, %eax
	movl	128(%rsp), %esi
	andl	$32, %eax
	orl	80(%rsp), %esi
	movb	%al, 48(%rsp)
	jne	.L6049
	movl	56(%rsp), %r14d
	testl	%r14d, %r14d
	jne	.L6050
	movl	64(%rsp), %r13d
	testl	%r13d, %r13d
	jle	.L6052
	movl	72(%rsp), %r15d
	movq	192(%r12), %rsi
	imull	%ebx, %r15d
	movslq	%r15d, %rbp
	testb	%al, %al
	je	.L6053
	movq	16(%rsp), %r13
	movq	%rbp, %r14
	jmp	.L6057
.L6055:
	addl	$1, 56(%rsp)
	addq	%r14, %r13
	movl	56(%rsp), %eax
	cmpl	%eax, 64(%rsp)
	je	.L6052
.L6057:
	cmpq	$0, 16(%r12)
	movq	200(%r12), %rax
	je	.L6056
	movq	%rax, %r8
	subq	%rsi, %r8
	cmpl	%r8d, %r15d
	jg	.L6598
.L6056:
	leaq	(%rsi,%r14), %rdx
	cmpq	%rdx, %rax
	jb	.L6055
	movq	%r14, %rdx
	movq	%r13, %rdi
	call	memcpy@PLT
	movq	192(%r12), %rsi
	addq	%r14, %rsi
	movq	%rsi, 192(%r12)
	jmp	.L6055
.L5903:
	cmpl	$3, %r11d
	je	.L6599
.L5904:
	testl	%r11d, %r11d
	jle	.L6538
	movl	$0, 128(%rsp)
	movl	%r11d, %r12d
	jmp	.L5905
.L6569:
	call	stbi__convert_format
	movq	%rax, 16(%rsp)
	jmp	.L5685
.L6586:
	leaq	1(%rdx), %rsi
	movq	%rsi, 192(%rbp)
	movzbl	(%rdx), %edi
	orl	%edi, 72(%rsp)
	movl	%edi, %edx
.L5787:
	cmpq	$0, 16(%rbp)
	movb	%dl, 1(%rbx)
	je	.L5791
	jmp	.L6149
.L6584:
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%rbp)
	movzbl	(%rdx), %r13d
.L5771:
	cmpq	%rax, %rdi
	jnb	.L5774
	leaq	1(%rdi), %rsi
	movq	%rsi, 192(%rbp)
	movzbl	(%rdi), %r14d
.L5777:
	cmpq	%rax, %rsi
	jnb	.L5779
	leaq	1(%rsi), %rdx
	movq	%rdx, 192(%rbp)
	movzbl	(%rsi), %esi
	jmp	.L5783
.L5762:
	leaq	.LC86(%rip), %rax
	jmp	.L6548
.L6583:
	movl	8(%rsp), %eax
	testl	%eax, %eax
	js	.L5980
.L5981:
	imull	%esi, %ecx
	movl	8(%rsp), %ebx
	movl	%ebx, %edi
	imull	%ecx, %edi
	movl	%ecx, %r14d
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L5980
	movl	%ebx, %ecx
	andl	$1, %ebx
	jne	.L5983
.L6142:
	movl	8(%rsp), %eax
	leal	-1(%rax), %ecx
.L5983:
	testl	%r14d, %r14d
	je	.L5984
	xorl	%eax, %eax
	testl	%ecx, %ecx
	movl	%r14d, 72(%rsp)
	movl	64(%rsp), %r14d
	cmovns	%ecx, %eax
	xorl	%edx, %edx
	movl	%edx, %r15d
	movl	%ecx, %edx
	movl	%eax, 80(%rsp)
	.p2align 4,,10
	.p2align 3
.L5985:
	testl	%edx, %edx
	jle	.L5991
	movq	56(%rsp), %rax
	movslq	%r15d, %rdi
	movl	%edx, 48(%rsp)
	pxor	%xmm1, %xmm1
	movss	stbi__h2l_scale_i(%rip), %xmm4
	movslq	%edx, %r12
	xorl	%r13d, %r13d
	cvtss2sd	stbi__h2l_gamma_i(%rip), %xmm1
	leaq	(%rax,%rdi,4), %rbp
	movq	16(%rsp), %rax
	movss	%xmm4, 40(%rsp)
	leaq	(%rax,%rdi), %rbx
	.p2align 4,,10
	.p2align 3
.L5987:
	movss	40(%rsp), %xmm0
	mulss	0(%rbp,%r13,4), %xmm0
	movsd	%xmm1, 32(%rsp)
	cvtss2sd	%xmm0, %xmm0
	call	pow@PLT
	pxor	%xmm2, %xmm2
	xorl	%edx, %edx
	cvtsd2ss	%xmm0, %xmm0
	mulss	.LC188(%rip), %xmm0
	movsd	32(%rsp), %xmm1
	addss	.LC88(%rip), %xmm0
	comiss	%xmm0, %xmm2
	ja	.L5986
	comiss	.LC188(%rip), %xmm0
	movl	$-1, %edx
	jbe	.L6600
.L5986:
	movb	%dl, (%rbx,%r13)
	addq	$1, %r13
	cmpq	%r13, %r12
	jne	.L5987
	movl	48(%rsp), %edx
.L5991:
	movl	80(%rsp), %eax
	cmpl	%eax, 8(%rsp)
	jle	.L5988
	addl	%r15d, %eax
	movq	56(%rsp), %rsi
	pxor	%xmm1, %xmm1
	xorl	%edi, %edi
	cltq
	movss	.LC188(%rip), %xmm0
	mulss	(%rsi,%rax,4), %xmm0
	addss	.LC88(%rip), %xmm0
	comiss	%xmm0, %xmm1
	ja	.L5989
	comiss	.LC188(%rip), %xmm0
	movl	$-1, %edi
	jbe	.L6601
.L5989:
	movq	16(%rsp), %rsi
	movb	%dil, (%rsi,%rax)
.L5988:
	movl	8(%rsp), %eax
	addl	$1, %r14d
	addl	%eax, %r15d
	movl	72(%rsp), %eax
	cmpl	%eax, %r14d
	jne	.L5985
.L5984:
	movq	56(%rsp), %rdi
	call	free@PLT
	jmp	.L5648
.L6600:
	cvttss2sil	%xmm0, %edx
	jmp	.L5986
.L6174:
	movl	$1, 96(%rsp)
	movl	$1, 8(%rsp)
	jmp	.L5904
.L6529:
	movl	56(%rsp), %r8d
	movq	%r12, %rbp
.L6534:
	leaq	.LC86(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5769
.L6599:
	movl	18512(%r10), %r12d
	movl	$1, 128(%rsp)
	cmpl	$3, %r12d
	je	.L5905
	cmpq	$0, 18504(%r10)
	movl	$3, %r12d
	je	.L5905
	movl	$0, 128(%rsp)
	xorl	%r12d, %r12d
	cmpl	$2, 8(%rsp)
	setg	%r12b
	leal	1(%r12,%r12), %r12d
	jmp	.L5905
.L6617:
	cmpb	$0, 48(%rsp)
	movq	144(%rsp), %r11
	movl	%ebp, %ebx
	jne	.L6130
	movl	64(%rsp), %eax
	testl	%eax, %eax
	jle	.L6130
	movl	72(%rsp), %r8d
	leal	-1(%rax), %r12d
	imull	%ebp, %r8d
	testl	%r8d, %r8d
	je	.L6130
.L6077:
	leal	-1(%r8), %eax
	movq	16(%rsp), %rsi
	movl	%r8d, %r9d
	movl	%r8d, %r13d
	movl	%eax, 48(%rsp)
	movl	%r8d, %eax
	andl	$15, %r9d
	andl	$-16, %r13d
	shrl	$4, %eax
	movq	%r11, 80(%rsp)
	xorl	%ebp, %ebp
	leal	-1(%r9), %r14d
	salq	$4, %rax
	movq	%rax, 40(%rsp)
	movl	%r8d, %eax
	addq	%rsi, %rax
	movq	%rax, 56(%rsp)
.L6133:
	movl	72(%rsp), %edi
	movl	%r12d, %eax
	subl	%ebp, %eax
	movl	%edi, %edx
	imull	%edi, %eax
	imull	%ebp, %edx
	imull	%ebx, %eax
	imull	%ebx, %edx
	cmpl	$6, 48(%rsp)
	movslq	%eax, %r10
	movslq	%edx, %rdi
	jbe	.L6131
	leaq	16(%rdi), %rcx
	cmpq	%r10, %rcx
	jle	.L6132
	leaq	16(%r10), %rcx
	cmpq	%rcx, %rdi
	jge	.L6132
.L6131:
	movq	56(%rsp), %rcx
	leaq	(%rsi,%rdi), %rax
	leaq	(%rcx,%rdi), %r11
.L6139:
	movq	%rax, %rdx
	movzbl	(%rax), %ecx
	addq	$1, %rax
	subq	%rdi, %rdx
	movzbl	(%rdx,%r10), %r15d
	movb	%r15b, -1(%rax)
	movb	%cl, (%rdx,%r10)
	cmpq	%rax, %r11
	jne	.L6139
.L6140:
	addl	$1, %ebp
	leal	(%rbp,%rbp), %eax
	cmpl	%eax, 64(%rsp)
	jg	.L6133
	movq	80(%rsp), %r11
.L6130:
	testq	%r11, %r11
	je	.L6052
.L6146:
	movq	%r11, %rdi
	call	free@PLT
.L6052:
	cmpl	$2, %ebx
	jle	.L6076
	cmpb	$0, 88(%rsp)
	jne	.L6602
.L6076:
	movl	8(%rsp), %eax
	testl	%eax, %eax
	je	.L5648
	cmpl	%ebx, %eax
	je	.L5648
	movl	64(%rsp), %r8d
	movl	72(%rsp), %ecx
	movl	%eax, %edx
	movl	%ebx, %esi
	movq	16(%rsp), %rdi
	call	stbi__convert_format
	movq	%rax, 16(%rsp)
	jmp	.L5648
.L6575:
	testl	%ebp, %ebp
	js	.L5910
	je	.L5912
.L5913:
	movl	8(%rsp), %r14d
	movl	%r11d, 72(%rsp)
	movq	%r10, 56(%rsp)
	movl	%r14d, %edi
	movq	%r9, 64(%rsp)
	imull	%ebx, %edi
	imull	%ebp, %edi
	addl	$1, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	56(%rsp), %r10
	movl	72(%rsp), %r11d
	testq	%rax, %rax
	movq	%rax, 16(%rsp)
	je	.L5910
	testl	%ebp, %ebp
	movq	64(%rsp), %r9
	je	.L5914
	leaq	18112(%r10), %rsi
	movslq	%r12d, %r8
	movslq	%r14d, %r15
	xorl	%r12d, %r12d
	leaq	208(%rsp), %rax
	movq	%rsi, 120(%rsp)
	movl	%ebx, %ebp
	movq	%rax, 112(%rsp)
	leaq	(%rax,%r8,8), %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	%r15, 136(%rsp)
	movq	%r10, %r15
	.p2align 4,,10
	.p2align 3
.L5915:
	imull	%eax, %ebp
	movq	16(%rsp), %rsi
	movq	120(%rsp), %r14
	movq	%r15, 72(%rsp)
	movq	112(%rsp), %r13
	movq	104(%rsp), %rbx
	movl	%eax, 80(%rsp)
	movl	%r12d, 88(%rsp)
	movq	%r14, %r12
	addq	%rsi, %rbp
	movq	%rbp, 64(%rsp)
.L5921:
	movl	28(%rbx), %r15d
	movq	16(%rbx), %r14
	movl	36(%rbx), %ebp
	movq	(%rbx), %rax
	movl	%r15d, %edi
	movl	24(%rbx), %r8d
	movl	32(%rbx), %ecx
	movq	%r14, %rdx
	sarl	%edi
	movq	8(%rbx), %rsi
	cmpl	%edi, %ebp
	jl	.L5917
	movq	%rsi, %rdx
	movq	%r14, %rsi
.L5917:
	movq	40(%r12), %rdi
	addl	$1, %ebp
	call	*%rax
	movq	%rax, 0(%r13)
	cmpl	%ebp, %r15d
	jle	.L5918
	movl	%ebp, 36(%rbx)
.L5919:
	addq	$48, %rbx
	addq	$96, %r12
	addq	$8, %r13
	cmpq	%r13, 56(%rsp)
	jne	.L5921
	movq	72(%rsp), %r15
	cmpl	$2, 8(%rsp)
	movq	64(%rsp), %rbp
	movl	80(%rsp), %eax
	movq	(%r15), %r9
	movl	88(%rsp), %r12d
	movl	(%r9), %r8d
	jle	.L5922
	movl	8(%r9), %edx
	movq	208(%rsp), %rsi
	cmpl	$3, %edx
	je	.L6603
	cmpl	$4, %edx
	jne	.L6604
	movl	18508(%r15), %edi
	testl	%edi, %edi
	je	.L6605
	movl	%eax, 64(%rsp)
	movq	18552(%r15), %r11
	movq	216(%rsp), %rdx
	movq	224(%rsp), %rcx
	cmpl	$2, %edi
	je	.L6606
	movl	8(%rsp), %r9d
	movq	%rbp, %rdi
	call	*%r11
	movq	(%r15), %r9
	movl	64(%rsp), %eax
	.p2align 4,,10
	.p2align 3
.L5927:
	movl	96(%rsp), %esi
	addl	$1, %r12d
	addl	%esi, %eax
	cmpl	4(%r9), %r12d
	jnb	.L6607
	movl	(%r9), %ebp
	jmp	.L5915
	.p2align 4,,10
	.p2align 3
.L5918:
	movl	40(%rbx), %eax
	movl	$0, 36(%rbx)
	movq	%r14, 8(%rbx)
	addl	$1, %eax
	movl	%eax, 40(%rbx)
	cmpl	(%r12), %eax
	jge	.L5919
	movslq	4(%r12), %rax
	leaq	(%r14,%rax), %r10
	movq	%r10, 16(%rbx)
	jmp	.L5919
.L5922:
	movl	128(%rsp), %edx
	testl	%edx, %edx
	je	.L5936
	cmpl	$1, 8(%rsp)
	je	.L5937
	testl	%r8d, %r8d
	je	.L5927
	movq	224(%rsp), %rbx
	movq	216(%rsp), %r11
	xorl	%ecx, %ecx
	movq	208(%rsp), %r8
	.p2align 4,,10
	.p2align 3
.L5940:
	movl	%ecx, %esi
	movzbl	(%r8,%rsi), %edx
	movzbl	(%r11,%rsi), %edi
	movzbl	(%rbx,%rsi), %esi
	movb	$-1, 1(%rbp,%rcx,2)
	imull	$77, %edx, %edx
	imull	$150, %edi, %edi
	imull	$29, %esi, %esi
	addl	%edi, %edx
	addl	%esi, %edx
	movb	%dh, 0(%rbp,%rcx,2)
	addq	$1, %rcx
	cmpl	(%r9), %ecx
	jb	.L5940
	jmp	.L5927
.L5936:
	cmpl	$4, 8(%r9)
	je	.L6608
.L5941:
	cmpl	$1, 8(%rsp)
	movq	208(%rsp), %rcx
	je	.L5945
	xorl	%edx, %edx
	testl	%r8d, %r8d
	je	.L5927
	.p2align 4,,10
	.p2align 3
.L5946:
	movl	%edx, %esi
	movzbl	(%rcx,%rsi), %esi
	movb	$-1, 1(%rbp,%rdx,2)
	movb	%sil, 0(%rbp,%rdx,2)
	addq	$1, %rdx
	cmpl	(%r9), %edx
	jb	.L5946
.L6537:
	movq	(%r15), %r9
	jmp	.L5927
.L6603:
	movl	128(%rsp), %edi
	testl	%edi, %edi
	jne	.L6609
	movl	%eax, 64(%rsp)
	movl	8(%rsp), %r9d
	movq	%rbp, %rdi
	movq	224(%rsp), %rcx
	movq	216(%rsp), %rdx
	call	*18552(%r15)
	movq	(%r15), %r9
	movl	64(%rsp), %eax
	jmp	.L5927
.L6604:
	movq	136(%rsp), %rdi
	xorl	%edx, %edx
	testl	%r8d, %r8d
	je	.L5927
	.p2align 4,,10
	.p2align 3
.L5935:
	movl	%edx, %ecx
	addl	$1, %edx
	movzbl	(%rsi,%rcx), %ebx
	movb	$-1, 3(%rbp)
	movzbl	%bl, %ecx
	movb	%bl, 2(%rbp)
	movb	%bl, %ch
	movw	%cx, 0(%rbp)
	addq	%rdi, %rbp
	cmpl	(%r9), %edx
	jb	.L5935
	jmp	.L6537
.L6607:
	movl	8(%r9), %r11d
	movq	%r15, %r10
.L5914:
	testl	%r11d, %r11d
	jle	.L5949
	movslq	%r11d, %rax
	movq	%r10, %rbp
	movq	%r10, %r12
	leaq	(%rax,%rax,2), %rbx
	salq	$5, %rbx
	addq	%r10, %rbx
.L5953:
	movq	18136(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L5950
	call	free@PLT
	pxor	%xmm6, %xmm6
	movups	%xmm6, 18128(%rbp)
.L5950:
	movq	18144(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L5951
	call	free@PLT
	movq	$0, 18144(%rbp)
	movq	$0, 18160(%rbp)
.L5951:
	movq	18152(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L5952
	call	free@PLT
	movq	$0, 18152(%rbp)
.L5952:
	addq	$96, %rbp
	cmpq	%rbp, %rbx
	jne	.L5953
	movq	(%r12), %r9
	movq	%r12, %r10
.L5949:
	movl	(%r9), %eax
	movq	40(%rsp), %rsi
	movl	%eax, (%rsi)
	movq	48(%rsp), %rsi
	movl	4(%r9), %eax
	movl	%eax, (%rsi)
	movq	32(%rsp), %rsi
	testq	%rsi, %rsi
	je	.L5897
	xorl	%eax, %eax
	cmpl	$3, 8(%r9)
	setge	%al
	leal	1(%rax,%rax), %eax
	movl	%eax, (%rsi)
	jmp	.L5897
.L6608:
	movl	18508(%r15), %edx
	testl	%edx, %edx
	je	.L6610
	cmpl	$2, %edx
	jne	.L5941
	testl	%r8d, %r8d
	je	.L5927
	movq	232(%rsp), %r8
	movq	208(%rsp), %rsi
	xorl	%ecx, %ecx
	movslq	8(%rsp), %r11
.L5944:
	movl	%ecx, %edi
	addl	$1, %ecx
	movzbl	(%rsi,%rdi), %edx
	movzbl	(%r8,%rdi), %edi
	movb	$-1, 1(%rbp)
	notl	%edx
	movzbl	%dl, %edx
	imull	%edi, %edx
	subl	$-128, %edx
	movl	%edx, %edi
	shrl	$8, %edi
	addl	%edi, %edx
	movb	%dh, 0(%rbp)
	addq	%r11, %rbp
	cmpl	(%r9), %ecx
	jb	.L5944
	jmp	.L6537
.L5937:
	testl	%r8d, %r8d
	je	.L5927
	movq	224(%rsp), %rbx
	movq	216(%rsp), %r11
	xorl	%ecx, %ecx
	movq	208(%rsp), %r8
	.p2align 4,,10
	.p2align 3
.L5939:
	movl	%ecx, %esi
	movzbl	(%r8,%rsi), %edx
	movzbl	(%r11,%rsi), %edi
	movzbl	(%rbx,%rsi), %esi
	imull	$77, %edx, %edx
	imull	$150, %edi, %edi
	imull	$29, %esi, %esi
	addl	%edi, %edx
	addl	%esi, %edx
	movb	%dh, 0(%rbp,%rcx)
	addq	$1, %rcx
	cmpl	(%r9), %ecx
	jb	.L5939
	jmp	.L5927
.L5945:
	testl	%r8d, %r8d
	je	.L5927
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L5947:
	movl	%edx, %esi
	addl	$1, %edx
	movzbl	(%rcx,%rsi), %edi
	movb	%dil, 0(%rbp,%rsi)
	cmpl	(%r9), %edx
	jb	.L5947
	jmp	.L6537
.L6605:
	testl	%r8d, %r8d
	je	.L5927
	movq	232(%rsp), %rbx
	movq	216(%rsp), %r13
	movq	224(%rsp), %r14
	movslq	8(%rsp), %r10
.L5931:
	movl	%edi, %r8d
	addl	$1, %edi
	movzbl	(%rbx,%r8), %ecx
	movzbl	(%rsi,%r8), %edx
	imull	%ecx, %edx
	subl	$-128, %edx
	movl	%edx, %r11d
	shrl	$8, %r11d
	addl	%r11d, %edx
	movb	%dh, 0(%rbp)
	movzbl	0(%r13,%r8), %edx
	imull	%ecx, %edx
	subl	$-128, %edx
	movl	%edx, %r11d
	shrl	$8, %r11d
	addl	%r11d, %edx
	movb	%dh, 1(%rbp)
	movzbl	(%r14,%r8), %edx
	movb	$-1, 3(%rbp)
	imull	%ecx, %edx
	subl	$-128, %edx
	movl	%edx, %ecx
	shrl	$8, %ecx
	addl	%ecx, %edx
	movb	%dh, 2(%rbp)
	addq	%r10, %rbp
	cmpl	(%r9), %edi
	jb	.L5931
	jmp	.L6537
.L6609:
	testl	%r8d, %r8d
	je	.L5927
	movq	216(%rsp), %r11
	movq	224(%rsp), %r8
	xorl	%edx, %edx
	movslq	8(%rsp), %rdi
.L5926:
	movl	%edx, %ecx
	addl	$1, %edx
	movzbl	(%rsi,%rcx), %r10d
	movb	%r10b, 0(%rbp)
	movzbl	(%r11,%rcx), %r10d
	movb	%r10b, 1(%rbp)
	movzbl	(%r8,%rcx), %ecx
	movb	$-1, 3(%rbp)
	movb	%cl, 2(%rbp)
	addq	%rdi, %rbp
	cmpl	(%r9), %edx
	jb	.L5926
	jmp	.L6537
.L6601:
	cvttss2sil	%xmm0, %edi
	jmp	.L5989
.L6589:
	andl	$-9, %eax
	cmpb	$1, %al
	jne	.L6507
	movq	%r12, %rdi
	movl	$4, %esi
	call	stbi__skip.part.0
	movq	%r12, %rdi
	call	stbi__get8
	cmpb	$32, %al
	ja	.L6507
	movabsq	$-4311843073, %rdx
	btq	%rax, %rdx
	jc	.L6507
	movl	$4, %esi
	movq	%r12, %rdi
	call	stbi__skip.part.0
	jmp	.L5998
.L6037:
	leal	-8(%rbx), %r10d
	cmpb	$24, %r10b
	ja	.L6200
	leaq	.L6041(%rip), %rdx
	movzbl	%r10b, %r10d
	movslq	(%rdx,%r10,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L6041:
	.long	.L6198-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6201-.L6041
	.long	.L6042-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6040-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6200-.L6041
	.long	.L6040-.L6041
	.text
.L6200:
	leaq	.LC232(%rip), %rax
	jmp	.L6548
.L6038:
	leal	-24(%r13), %r8d
	leaq	.LC232(%rip), %rax
	andl	$247, %r8d
	jne	.L6548
	movl	%r15d, %ebx
	movl	$0, 56(%rsp)
	movb	$1, 88(%rsp)
	sarl	$3, %ebx
	jmp	.L6039
.L6595:
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r12)
	movzbl	(%rdx), %esi
	movl	%esi, 96(%rsp)
	movl	%esi, %ebx
.L6025:
	cmpq	%rcx, %rax
	jnb	.L6028
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %ecx
	jmp	.L6026
.L6610:
	testl	%r8d, %r8d
	je	.L5927
	movq	232(%rsp), %rbx
	movslq	8(%rsp), %r10
	xorl	%r11d, %r11d
	movq	208(%rsp), %r13
	movq	216(%rsp), %r14
	movq	224(%rsp), %rsi
.L5943:
	movl	%r11d, %ecx
	addl	$1, %r11d
	movzbl	(%rbx,%rcx), %edi
	movzbl	0(%r13,%rcx), %edx
	movzbl	(%r14,%rcx), %r8d
	movzbl	(%rsi,%rcx), %ecx
	movb	$-1, 1(%rbp)
	imull	%edi, %edx
	imull	%edi, %r8d
	imull	%ecx, %edi
	subl	$-128, %edx
	movl	%edx, %ecx
	subl	$-128, %r8d
	shrl	$8, %ecx
	subl	$-128, %edi
	addl	%ecx, %edx
	movl	%r8d, %ecx
	shrl	$8, %ecx
	shrl	$8, %edx
	addl	%r8d, %ecx
	imull	$77, %edx, %edx
	shrl	$8, %ecx
	imull	$150, %ecx, %ecx
	addl	%ecx, %edx
	movl	%edi, %ecx
	shrl	$8, %ecx
	addl	%edi, %ecx
	shrl	$8, %ecx
	imull	$29, %ecx, %ecx
	addl	%ecx, %edx
	movb	%dh, 0(%rbp)
	addq	%r10, %rbp
	cmpl	(%r9), %r11d
	jb	.L5943
	jmp	.L6537
.L5776:
	leaq	56(%rbp), %r14
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r14, %rsi
	call	*%r8
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rsi
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L5778
	movl	$0, 48(%rbp)
	movq	16(%rbp), %r8
	xorl	%r14d, %r14d
	movb	$0, 56(%rbp)
	movq	%rsi, 200(%rbp)
	movq	%rsi, 192(%rbp)
.L5779:
	movl	48(%rbp), %eax
	testl	%eax, %eax
	jne	.L5781
	movq	192(%rbp), %rdx
	movq	200(%rbp), %rsi
	jmp	.L5782
.L6585:
	leaq	56(%rbp), %r14
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r14, %rsi
	call	*%r8
	movq	192(%rbp), %rdx
	leaq	57(%rbp), %rdi
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L5773
	movl	$0, 48(%rbp)
	movq	16(%rbp), %r8
	movb	$0, 56(%rbp)
	movq	%rdi, 200(%rbp)
	movq	%rdi, 192(%rbp)
.L5774:
	movl	48(%rbp), %eax
	testl	%eax, %eax
	jne	.L5776
	movq	192(%rbp), %rdx
	movq	200(%rbp), %rsi
	jmp	.L5772
.L5781:
	leaq	56(%rbp), %rsi
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%rsi, 88(%rsp)
	call	*%r8
	movq	192(%rbp), %rdx
	movq	88(%rsp), %rsi
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	leaq	57(%rbp), %rdx
	jne	.L5784
	movl	$0, 48(%rbp)
	movq	%rdx, %rax
	xorl	%esi, %esi
	movb	$0, 56(%rbp)
.L5785:
	movq	%rax, 200(%rbp)
	movq	16(%rbp), %r8
	movq	%rdx, 192(%rbp)
	jmp	.L5783
.L6587:
	leaq	56(%rbp), %r9
	movl	52(%rbp), %edx
	movq	40(%rbp), %rdi
	movq	%r9, %rsi
	movq	%r9, 88(%rsp)
	call	*%r8
	movq	192(%rbp), %rdx
	movq	88(%rsp), %r9
	leaq	57(%rbp), %rsi
	subq	208(%rbp), %rdx
	addl	%edx, 184(%rbp)
	testl	%eax, %eax
	jne	.L5789
	movl	$0, 48(%rbp)
	movq	%rsi, %rax
	xorl	%edx, %edx
	movb	$0, 56(%rbp)
.L5790:
	movq	%rax, 200(%rbp)
	movq	%rsi, 192(%rbp)
	jmp	.L5787
.L6593:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rax), %r15d
	movl	%r15d, %r13d
	jmp	.L6021
.L6606:
	movl	8(%rsp), %ebx
	movq	%rbp, %rdi
	movl	%ebx, %r9d
	call	*%r11
	movq	(%r15), %r9
	movl	64(%rsp), %eax
	movl	(%r9), %ecx
	testl	%ecx, %ecx
	je	.L5927
	movq	232(%rsp), %r8
	movslq	%ebx, %r11
	xorl	%ecx, %ecx
.L5934:
	movl	%ecx, %edx
	addl	$1, %ecx
	movzbl	(%r8,%rdx), %esi
	movzbl	0(%rbp), %edx
	notl	%edx
	movzbl	%dl, %edx
	imull	%esi, %edx
	subl	$-128, %edx
	movl	%edx, %edi
	shrl	$8, %edi
	addl	%edi, %edx
	movb	%dh, 0(%rbp)
	movzbl	1(%rbp), %edx
	notl	%edx
	movzbl	%dl, %edx
	imull	%esi, %edx
	subl	$-128, %edx
	movl	%edx, %edi
	shrl	$8, %edi
	addl	%edi, %edx
	movb	%dh, 1(%rbp)
	movzbl	2(%rbp), %edx
	notl	%edx
	movzbl	%dl, %edx
	imull	%esi, %edx
	subl	$-128, %edx
	movl	%edx, %esi
	shrl	$8, %esi
	addl	%esi, %edx
	movb	%dh, 2(%rbp)
	addq	%r11, %rbp
	cmpl	(%r9), %ecx
	jb	.L5934
	jmp	.L5927
.L6590:
	leaq	1(%rcx), %rdx
	movq	%rdx, 192(%r12)
	movzbl	(%rcx), %r14d
	movb	%r14b, 120(%rsp)
.L6008:
	cmpq	%rax, %rdx
	jnb	.L6011
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%r12)
	movzbl	(%rdx), %esi
	movl	%esi, 80(%rsp)
.L6012:
	cmpq	%rax, %rcx
	jnb	.L6611
	leaq	1(%rcx), %rax
	movq	%rax, 192(%r12)
	movzbl	(%rcx), %ebp
	jmp	.L6013
.L5766:
	movq	%r12, %rdi
	movl	%r8d, 56(%rsp)
	xorl	%ebx, %ebx
	call	stbi__get32be
	movq	%r12, %rdi
	call	stbi__get16be
	movq	%r12, %rdi
	call	stbi__get16be
	movl	56(%rsp), %r8d
	jmp	.L6144
.L6572:
	movq	(%r10), %rax
	movslq	8(%rax), %rax
	testl	%eax, %eax
	jle	.L6538
	leaq	(%rax,%rax,2), %rbp
	movq	%r10, %rbx
	movq	%r10, %r12
	salq	$5, %rbp
	addq	%r10, %rbp
.L5901:
	movq	18136(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5898
	call	free@PLT
	pxor	%xmm4, %xmm4
	movups	%xmm4, 18128(%rbx)
.L5898:
	movq	18144(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5899
	call	free@PLT
	movq	$0, 18144(%rbx)
	movq	$0, 18160(%rbx)
.L5899:
	movq	18152(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5900
	call	free@PLT
	movq	$0, 18152(%rbx)
.L5900:
	addq	$96, %rbx
	cmpq	%rbp, %rbx
	jne	.L5901
	movq	%r12, %r10
	jmp	.L6538
.L6573:
	movl	18512(%r10), %r12d
	cmpl	$3, %r12d
	je	.L6176
	xorl	%eax, %eax
	cmpq	$0, 18504(%r10)
	movl	$3, 8(%rsp)
	movl	$3, %r12d
	sete	%al
	movl	$3, 96(%rsp)
	movl	%eax, 128(%rsp)
	jmp	.L5905
.L5964:
	testl	%ebp, %ebp
	js	.L5962
.L5968:
	cmpl	$-7, %ecx
	jl	.L5962
.L5970:
	movl	%r15d, %edi
	imull	%r14d, %edi
	imull	%ebp, %edi
	imull	%r13d, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L6547
	movl	%ebp, %edx
	movq	%rax, %rsi
	movq	%r12, %rdi
	movq	%rax, 32(%rsp)
	imull	%r15d, %edx
	imull	%r14d, %edx
	imull	%r13d, %edx
	call	stbi__getn
	movq	32(%rsp), %r9
	testl	%eax, %eax
	je	.L6612
	movl	8(%rsp), %eax
	testl	%eax, %eax
	je	.L5648
	movl	8(%r12), %esi
	cmpl	%esi, %eax
	je	.L5648
	cmpl	$16, (%rbx)
	movl	4(%r12), %r8d
	movl	(%r12), %ecx
	je	.L6613
	movq	440(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6550
	movl	8(%rsp), %edx
	addq	$456, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r9, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	stbi__convert_format
.L5778:
	.cfi_restore_state
	cltq
	movq	%rsi, 192(%rbp)
	movq	16(%rbp), %r8
	addq	%r14, %rax
	movzbl	56(%rbp), %r14d
	movq	%rax, 200(%rbp)
	jmp	.L5777
.L6592:
	leaq	56(%r12), %rbx
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbx, %rsi
	call	*16(%r12)
	leaq	57(%r12), %rcx
	movl	%eax, %esi
	movl	%eax, 80(%rsp)
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%esi, %esi
	jne	.L6014
	movl	$0, 48(%r12)
	movq	%rcx, %rax
	movb	$0, 56(%r12)
.L6015:
	movq	%rax, 200(%r12)
	movq	%rcx, 192(%r12)
	jmp	.L6012
.L5789:
	movzbl	56(%rbp), %edi
	cltq
	orl	%edi, 72(%rsp)
	addq	%r9, %rax
	movl	%edi, %edx
	jmp	.L5790
.L5912:
	movl	$1, %edi
	movl	%r11d, 64(%rsp)
	movq	%r9, 56(%rsp)
	movq	%r10, 8(%rsp)
	call	malloc@PLT
	movq	8(%rsp), %r10
	movq	56(%rsp), %r9
	testq	%rax, %rax
	movq	%rax, 16(%rsp)
	movl	64(%rsp), %r11d
	jne	.L5914
	jmp	.L5910
.L6591:
	leaq	56(%r12), %rbx
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbx, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	leaq	57(%r12), %rdx
	testl	%eax, %eax
	jne	.L6010
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rdx, 200(%r12)
	movq	%rdx, 192(%r12)
	jmp	.L6009
.L6201:
	movb	$0, 88(%rsp)
	movl	$3, %ebx
	movl	$1, 56(%rsp)
	jmp	.L6039
.L6050:
	movl	32(%rsp), %edi
	xorl	%r11d, %r11d
	testl	%edi, %edi
	je	.L6614
.L6072:
	movslq	%ebx, %rax
	movq	16(%rsp), %rbp
	movq	%r12, %r14
	xorl	%r15d, %r15d
	movq	%rax, 136(%rsp)
	leaq	436(%rsp), %rax
	xorl	%r13d, %r13d
	movl	$1, %edx
	movl	$0, 40(%rsp)
	movq	%rbp, %r12
	movl	%ebx, %ebp
	movl	128(%rsp), %ebx
	movq	%rax, 120(%rsp)
	movq	%r11, 144(%rsp)
.L6129:
	testl	%ebx, %ebx
	je	.L6079
	testl	%r13d, %r13d
	je	.L6615
	movl	40(%rsp), %eax
	testl	%eax, %eax
	je	.L6079
	movq	120(%rsp), %rdi
	testl	%edx, %edx
	jne	.L6616
.L6085:
	testl	%ebp, %ebp
	je	.L6128
.L6508:
	xorl	%eax, %eax
.L6127:
	movl	%eax, %edx
	addl	$1, %eax
	movzbl	(%rdi,%rdx), %ecx
	movb	%cl, (%r12,%rdx)
	cmpl	%ebp, %eax
	jb	.L6127
.L6128:
	movq	136(%rsp), %rax
	addl	$1, %r15d
	subl	$1, %r13d
	addq	%rax, %r12
	movl	32(%rsp), %eax
	cmpl	%eax, %r15d
	jge	.L6617
	xorl	%edx, %edx
	jmp	.L6129
.L6615:
	movq	192(%r14), %rax
	cmpq	200(%r14), %rax
	jb	.L6618
	movl	48(%r14), %eax
	movl	%ebx, %r13d
	movl	%eax, 40(%rsp)
	testl	%eax, %eax
	je	.L6079
	leaq	56(%r14), %r13
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%r13, %rsi
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	leaq	57(%r14), %rdx
	testl	%eax, %eax
	jne	.L6083
	xorl	%ecx, %ecx
	movb	$0, 56(%r14)
	movq	%rdx, %r13
	movl	%ecx, 48(%r14)
.L6084:
	movq	%r13, 200(%r14)
	movzbl	56(%r14), %eax
	movq	%rdx, 192(%r14)
.L6544:
	movl	%eax, %r13d
	sarl	$7, %eax
	andl	$127, %r13d
	movl	%eax, 40(%rsp)
	addl	$1, %r13d
	movzbl	%r13b, %r13d
.L6079:
	movl	80(%rsp), %eax
	testl	%eax, %eax
	jne	.L6619
	movl	56(%rsp), %eax
	testl	%eax, %eax
	je	.L6093
	cmpl	$3, %ebp
	jne	.L6620
	movq	192(%r14), %rsi
	movq	200(%r14), %rdx
	cmpq	%rdx, %rsi
	jb	.L6621
	movl	48(%r14), %r10d
	testl	%r10d, %r10d
	jne	.L6622
.L6097:
	movl	%r10d, %edx
	movq	120(%rsp), %rdi
	shrw	$10, %dx
	andl	$31, %edx
	movl	%edx, %eax
	sall	$8, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	imulq	$138547333, %rdx, %rdx
	shrq	$32, %rdx
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	movl	%r10d, %edx
	andl	$31, %r10d
	shrw	$5, %dx
	shrl	$4, %eax
	andl	$31, %edx
	movb	%al, 436(%rsp)
	movl	%edx, %eax
	sall	$8, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	imulq	$138547333, %rdx, %rdx
	shrq	$32, %rdx
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$4, %eax
	movb	%al, 437(%rsp)
	movl	%r10d, %eax
	sall	$8, %eax
	subl	%r10d, %eax
	movl	%eax, %edx
	imulq	$138547333, %rdx, %rdx
	shrq	$32, %rdx
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$4, %eax
	movb	%al, 438(%rsp)
	jmp	.L6508
.L6619:
	cmpl	$8, 96(%rsp)
	movq	%r14, %rdi
	je	.L6623
	call	stbi__get16le
.L6088:
	xorl	%edx, %edx
	cmpl	%eax, 104(%rsp)
	jle	.L6089
	imull	%ebp, %eax
	movl	%eax, %edx
.L6089:
	movq	144(%rsp), %rsi
	movslq	%edx, %rax
	movq	120(%rsp), %rdi
	addq	%rsi, %rax
	testl	%ebp, %ebp
	je	.L6128
	xorl	%edx, %edx
.L6090:
	movl	%edx, %ecx
	movq	120(%rsp), %r11
	addl	$1, %edx
	movzbl	(%rax,%rcx), %esi
	movb	%sil, (%r11,%rcx)
	cmpl	%ebp, %edx
	jb	.L6090
	jmp	.L6085
.L6093:
	movq	192(%r14), %rsi
	movq	200(%r14), %rax
	cmpq	%rax, %rsi
	jb	.L6105
	movl	48(%r14), %eax
	testl	%eax, %eax
	jne	.L6624
	movb	$0, 436(%rsp)
	cmpl	$1, %ebp
	je	.L6546
.L6148:
	movl	48(%r14), %r10d
	testl	%r10d, %r10d
	jne	.L6625
	movb	$0, 437(%rsp)
	cmpl	$2, %ebp
	jle	.L6545
.L6147:
	movl	48(%r14), %r8d
	testl	%r8d, %r8d
	jne	.L6626
	movb	$0, 438(%rsp)
	cmpl	$4, %ebp
	jne	.L6545
.L6123:
	movl	48(%r14), %esi
	xorl	%r10d, %r10d
	testl	%esi, %esi
	jne	.L6627
.L6124:
	movb	%r10b, 439(%rsp)
.L6546:
	leaq	436(%rsp), %rdi
	jmp	.L6508
.L6621:
	leaq	1(%rsi), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rsi), %r10d
.L6096:
	cmpq	%rdx, %rax
	jnb	.L6099
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %eax
	sall	$8, %eax
	addl	%eax, %r10d
	jmp	.L6097
.L6623:
	call	stbi__get8
	movzbl	%al, %eax
	jmp	.L6088
.L6618:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rax), %eax
	jmp	.L6544
.L6132:
	cmpl	$14, 48(%rsp)
	jle	.L6213
	movl	%eax, 96(%rsp)
	leaq	(%rsi,%rdi), %r15
	leaq	(%rsi,%r10), %r11
	xorl	%ecx, %ecx
.L6135:
	movdqu	(%r15,%rcx), %xmm0
	movdqu	(%r11,%rcx), %xmm3
	movq	40(%rsp), %rax
	movups	%xmm3, (%r15,%rcx)
	movups	%xmm0, (%r11,%rcx)
	addq	$16, %rcx
	cmpq	%rax, %rcx
	jne	.L6135
	movl	96(%rsp), %eax
	addl	%r13d, %edx
	addl	%r13d, %eax
	cmpl	%r8d, %r13d
	je	.L6140
	movl	%r9d, %r11d
	cmpl	$6, %r14d
	jbe	.L6214
	movl	%r13d, %ecx
	movl	%r9d, %r15d
.L6134:
	addq	%rcx, %rdi
	addq	%r10, %rcx
	addq	%rsi, %rcx
	addq	%rsi, %rdi
	movq	(%rcx), %xmm0
	movq	(%rdi), %r10
	movq	%xmm0, (%rdi)
	movl	%r11d, %edi
	andl	$-8, %edi
	movq	%r10, (%rcx)
	movl	%r15d, %ecx
	addl	%edi, %edx
	addl	%edi, %eax
	subl	%edi, %ecx
	andl	$7, %r11d
	je	.L6140
.L6137:
	movslq	%edx, %r10
	movslq	%eax, %rdi
	addq	%rsi, %r10
	addq	%rsi, %rdi
	movzbl	(%r10), %r11d
	movzbl	(%rdi), %r15d
	movb	%r15b, (%r10)
	leal	1(%rdx), %r10d
	movb	%r11b, (%rdi)
	leal	1(%rax), %edi
	cmpl	$1, %ecx
	je	.L6140
	movslq	%r10d, %r10
	movslq	%edi, %rdi
	addq	%rsi, %r10
	addq	%rsi, %rdi
	movzbl	(%r10), %r11d
	movzbl	(%rdi), %r15d
	movb	%r15b, (%r10)
	leal	2(%rdx), %r10d
	movb	%r11b, (%rdi)
	leal	2(%rax), %edi
	cmpl	$2, %ecx
	je	.L6140
	movslq	%r10d, %r10
	movslq	%edi, %rdi
	addq	%rsi, %r10
	addq	%rsi, %rdi
	movzbl	(%r10), %r11d
	movzbl	(%rdi), %r15d
	movb	%r15b, (%r10)
	leal	3(%rdx), %r10d
	movb	%r11b, (%rdi)
	leal	3(%rax), %edi
	cmpl	$3, %ecx
	je	.L6140
	movslq	%r10d, %r10
	movslq	%edi, %rdi
	addq	%rsi, %r10
	addq	%rsi, %rdi
	movzbl	(%r10), %r11d
	movzbl	(%rdi), %r15d
	movb	%r15b, (%r10)
	leal	4(%rdx), %r10d
	movb	%r11b, (%rdi)
	leal	4(%rax), %edi
	cmpl	$4, %ecx
	je	.L6140
	movslq	%r10d, %r10
	movslq	%edi, %rdi
	addq	%rsi, %r10
	addq	%rsi, %rdi
	movzbl	(%r10), %r11d
	movzbl	(%rdi), %r15d
	movb	%r15b, (%r10)
	leal	5(%rdx), %r10d
	movb	%r11b, (%rdi)
	leal	5(%rax), %edi
	cmpl	$5, %ecx
	je	.L6140
	movslq	%r10d, %r10
	movslq	%edi, %rdi
	addl	$6, %edx
	addl	$6, %eax
	addq	%rsi, %r10
	addq	%rsi, %rdi
	movzbl	(%r10), %r11d
	movzbl	(%rdi), %r15d
	movb	%r15b, (%r10)
	movb	%r11b, (%rdi)
	cmpl	$6, %ecx
	je	.L6140
	movslq	%edx, %rdx
	cltq
	addq	%rsi, %rdx
	addq	%rsi, %rax
	movzbl	(%rdx), %ecx
	movzbl	(%rax), %edi
	movb	%dil, (%rdx)
	movb	%cl, (%rax)
	jmp	.L6140
.L6545:
	leaq	436(%rsp), %rdi
	jmp	.L6085
.L6622:
	leaq	56(%r14), %rsi
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rsi, 128(%rsp)
	call	*16(%r14)
	movq	128(%rsp), %rsi
	movslq	%eax, %r10
	movq	192(%r14), %rax
	subq	208(%r14), %rax
	addl	%eax, 184(%r14)
	testl	%r10d, %r10d
	leaq	57(%r14), %rax
	jne	.L6098
	movl	$0, 48(%r14)
	movb	$0, 56(%r14)
	movq	%rax, 200(%r14)
	movq	%rax, 192(%r14)
.L6099:
	movl	48(%r14), %eax
	testl	%eax, %eax
	je	.L6097
	leaq	56(%r14), %rsi
	movl	%r10d, 156(%rsp)
	movl	52(%r14), %edx
	movq	%rsi, 128(%rsp)
	movq	40(%r14), %rdi
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	leaq	57(%r14), %rdx
	movq	128(%rsp), %rsi
	movl	156(%rsp), %r10d
	jne	.L6102
	movl	$0, 48(%r14)
	movq	%rdx, %rsi
	movb	$0, 56(%r14)
.L6103:
	movq	%rsi, 200(%r14)
	movq	%rdx, 192(%r14)
	jmp	.L6097
.L6105:
	leaq	1(%rsi), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rsi), %esi
.L6109:
	movb	%sil, 436(%rsp)
	cmpl	$1, %ebp
	je	.L6546
	cmpq	%rax, %rdx
	jnb	.L6148
	leaq	1(%rdx), %rdi
	movq	%rdi, 192(%r14)
	movzbl	(%rdx), %edx
.L6115:
	movb	%dl, 437(%rsp)
	cmpl	$2, %ebp
	jle	.L6545
	cmpq	%rax, %rdi
	jnb	.L6147
	leaq	1(%rdi), %rdx
	movq	%rdx, 192(%r14)
	movzbl	(%rdi), %esi
.L6121:
	movb	%sil, 438(%rsp)
	cmpl	$4, %ebp
	jne	.L6545
	cmpq	%rax, %rdx
	jnb	.L6123
	leaq	1(%rdx), %rax
	movq	%rax, 192(%r14)
	movzbl	(%rdx), %r10d
	jmp	.L6124
.L6049:
	movl	80(%rsp), %ebp
	testl	%ebp, %ebp
	je	.L6050
	movl	104(%rsp), %r11d
	testl	%r11d, %r11d
	je	.L6628
	movl	136(%rsp), %r10d
	testl	%r10d, %r10d
	je	.L6064
	js	.L6629
	movl	136(%rsp), %esi
	movq	%r12, %rdi
	call	stbi__skip.part.0
.L6064:
	movl	104(%rsp), %r9d
	testl	%r9d, %r9d
	js	.L6067
	movl	$2147483647, %eax
	xorl	%edx, %edx
	movl	104(%rsp), %esi
	idivl	%ebx
	cmpl	%eax, %esi
	jg	.L6067
	imull	%ebx, %esi
	movslq	%esi, %rdi
	movq	%rdi, %r13
	call	malloc@PLT
	movq	%rax, %r11
	testq	%rax, %rax
	je	.L6067
	movl	56(%rsp), %r8d
	testl	%r8d, %r8d
	je	.L6068
	cmpl	$3, %ebx
	jne	.L6630
	movslq	104(%rsp), %rax
	movq	%r11, %rbp
	movq	%r11, %r14
	leaq	(%rax,%rax,2), %rax
	leaq	(%r11,%rax), %r13
.L6070:
	movq	%r12, %rdi
	addq	$3, %rbp
	call	stbi__get16le
	movl	%eax, %ecx
	movl	%eax, %edx
	shrw	$10, %cx
	andl	$31, %ecx
	movl	%ecx, %eax
	sall	$8, %eax
	subl	%ecx, %eax
	movl	%eax, %ecx
	imulq	$138547333, %rcx, %rcx
	shrq	$32, %rcx
	subl	%ecx, %eax
	shrl	%eax
	addl	%ecx, %eax
	movl	%edx, %ecx
	andl	$31, %edx
	shrw	$5, %cx
	shrl	$4, %eax
	andl	$31, %ecx
	movb	%al, -3(%rbp)
	movl	%ecx, %eax
	sall	$8, %eax
	subl	%ecx, %eax
	movl	%eax, %ecx
	imulq	$138547333, %rcx, %rcx
	shrq	$32, %rcx
	subl	%ecx, %eax
	shrl	%eax
	addl	%ecx, %eax
	shrl	$4, %eax
	movb	%al, -2(%rbp)
	movl	%edx, %eax
	sall	$8, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	imulq	$138547333, %rdx, %rdx
	shrq	$32, %rdx
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$4, %eax
	movb	%al, -1(%rbp)
	cmpq	%r13, %rbp
	jne	.L6070
	movq	%r14, %r11
.L6071:
	movl	32(%rsp), %esi
	testl	%esi, %esi
	jne	.L6072
	cmpb	$0, 48(%rsp)
	jne	.L6145
	movl	64(%rsp), %eax
	testl	%eax, %eax
	jle	.L6145
	movl	72(%rsp), %r8d
	leal	-1(%rax), %r12d
	imull	%ebx, %r8d
	testl	%r8d, %r8d
	jne	.L6077
	jmp	.L6146
	.p2align 4,,10
	.p2align 3
.L5773:
	cltq
	movq	%rdi, 192(%rbp)
	movzbl	56(%rbp), %r13d
	addq	%r14, %rax
	movq	16(%rbp), %r8
	movq	%rax, 200(%rbp)
	jmp	.L5771
.L6203:
	movl	$0, 32(%rsp)
	jmp	.L6046
.L6611:
	movl	48(%r12), %ebp
	testl	%ebp, %ebp
	je	.L6013
	leaq	56(%r12), %rbx
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbx, %rsi
	call	*16(%r12)
	movslq	%eax, %rbp
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	leaq	57(%r12), %rax
	testl	%ebp, %ebp
	jne	.L6018
	movl	$0, 48(%r12)
	movq	%rax, %rbx
	movb	$0, 56(%r12)
.L6019:
	movq	%rbx, 200(%r12)
	movq	%rax, 192(%r12)
	jmp	.L6013
.L5784:
	cltq
	addq	%rsi, %rax
	movzbl	56(%rbp), %esi
	jmp	.L5785
.L6596:
	leaq	56(%r12), %rcx
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rcx, %rsi
	movq	%rcx, 16(%rsp)
	call	*16(%r12)
	movq	16(%rsp), %rcx
	movl	%eax, %esi
	movl	%eax, 96(%rsp)
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%esi, %esi
	leaq	57(%r12), %rax
	jne	.L6027
	movl	$0, 48(%r12)
	movb	$0, 56(%r12)
	movq	%rax, 200(%r12)
	movq	%rax, 192(%r12)
.L6028:
	movl	48(%r12), %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L6026
	leaq	56(%r12), %rcx
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rcx, 16(%rsp)
	movq	%rcx, %rsi
	call	*16(%r12)
	movq	192(%r12), %rdx
	movq	16(%rsp), %rcx
	subq	208(%r12), %rdx
	addl	%edx, 184(%r12)
	testl	%eax, %eax
	leaq	57(%r12), %rdx
	jne	.L6031
	movl	$0, 48(%r12)
	movq	%rdx, %rax
	xorl	%ecx, %ecx
	movb	$0, 56(%r12)
.L6032:
	movq	%rax, 200(%r12)
	movq	%rdx, 192(%r12)
	jmp	.L6026
.L6594:
	leaq	56(%r12), %rbx
	movl	52(%r12), %edx
	movq	40(%r12), %rdi
	movq	%rbx, %rsi
	call	*16(%r12)
	leaq	57(%r12), %rdx
	movl	%eax, %r15d
	movq	192(%r12), %rax
	subq	208(%r12), %rax
	addl	%eax, 184(%r12)
	testl	%r15d, %r15d
	jne	.L6022
	movl	$0, 48(%r12)
	movq	%rdx, %rax
	movb	$0, 56(%r12)
.L6023:
	movq	%rax, 200(%r12)
	movq	%rdx, 192(%r12)
	jmp	.L6021
.L6027:
	movslq	96(%rsp), %rdx
	movzbl	56(%r12), %esi
	movq	%rax, 192(%r12)
	addq	%rdx, %rcx
	movl	%esi, 96(%rsp)
	movl	%esi, %ebx
	movq	%rcx, 200(%r12)
	jmp	.L6025
.L6022:
	movslq	%r15d, %r9
	movzbl	56(%r12), %r15d
	leaq	(%rbx,%r9), %rax
	movl	%r15d, %r13d
	jmp	.L6023
.L6598:
	movslq	%r8d, %rbp
	movq	%r13, %rdi
	movq	%r8, 40(%rsp)
	movq	%rbp, %rdx
	call	memcpy@PLT
	movq	40(%rsp), %r8
	movl	%r15d, %edx
	leaq	0(%r13,%rbp), %rsi
	movq	40(%r12), %rdi
	subl	%r8d, %edx
	call	*16(%r12)
	movq	200(%r12), %rsi
	movq	%rsi, 192(%r12)
	jmp	.L6055
.L6067:
	movq	16(%rsp), %rdi
	call	free@PLT
.L6554:
	leaq	.LC18(%rip), %rax
	jmp	.L6548
.L6588:
	movl	72(%rsp), %eax
	movq	32(%rsp), %rsi
	xchgq	%r12, %rbp
	leaq	240(%rsp), %r13
	movl	56(%rsp), %r8d
	movq	%rbp, 56(%rsp)
	movq	%rbp, %r14
	andl	$16, %eax
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addl	$4, %eax
	movl	%eax, (%rsi)
	movl	16(%rsp), %eax
	sall	$2, %eax
	movslq	%eax, %rsi
	movslq	80(%rsp), %rax
	movq	%rsi, %r15
	leaq	(%rax,%rax,2), %rax
	leaq	243(%rsp,%rax), %rax
	movq	%rax, 96(%rsp)
	movq	%r13, %rax
	movq	%r12, %r13
	movl	%r8d, %r12d
.L5799:
	movl	64(%rsp), %esi
	cmpl	%esi, %r12d
	jle	.L6631
	movl	%r12d, 72(%rsp)
	movq	%r14, 80(%rsp)
	movq	%r13, %r14
	movq	%rax, %r13
	movq	%r15, 88(%rsp)
	movq	%rax, %r15
.L5804:
	movzbl	1(%r15), %eax
	cmpb	$1, %al
	je	.L5800
	movq	%r13, %rdx
	movq	56(%rsp), %r13
.L5808:
	cmpb	$2, %al
	je	.L6157
	testb	%al, %al
	je	.L6632
	leaq	.LC232(%rip), %rax
	movl	72(%rsp), %r8d
	movq	%r13, %rbp
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5769
.L6068:
	movl	%r13d, %edx
	movq	%rax, %rsi
	movq	%r12, %rdi
	movq	%rax, 40(%rsp)
	call	stbi__getn
	movq	40(%rsp), %r11
	testl	%eax, %eax
	jne	.L6071
	movq	16(%rsp), %rdi
	movq	%r11, 8(%rsp)
	call	free@PLT
	movq	8(%rsp), %rdi
	call	free@PLT
	leaq	.LC233(%rip), %rax
	jmp	.L6548
.L6597:
	movq	%rsi, 192(%r12)
	movl	%r14d, %esi
	movq	40(%r12), %rdi
	subl	%eax, %esi
	call	*24(%r12)
	movzbl	40(%rsp), %ecx
	jmp	.L6047
.L6018:
	addq	%rbp, %rbx
	movzbl	56(%r12), %ebp
	jmp	.L6019
.L6002:
	movq	208(%r12), %rcx
	cmpl	$15, %edx
	je	.L6004
	testb	%sil, %sil
	je	.L6004
	andl	$-9, %eax
	cmpb	$16, %al
	je	.L6004
	movq	%rcx, 192(%r12)
	movq	216(%r12), %rax
	cmpl	$32, %edx
	jne	.L5993
	jmp	.L6006
.L6010:
	movzbl	56(%r12), %r14d
	cltq
	movq	%rdx, 192(%r12)
	addq	%rbx, %rax
	movb	%r14b, 120(%rsp)
	movq	%rax, 200(%r12)
	jmp	.L6008
.L6031:
	cltq
	addq	%rcx, %rax
	movzbl	56(%r12), %ecx
	jmp	.L6032
.L6014:
	movslq	80(%rsp), %rax
	movzbl	56(%r12), %esi
	addq	%rbx, %rax
	movl	%esi, 80(%rsp)
	jmp	.L6015
.L6602:
	movl	32(%rsp), %eax
	testl	%eax, %eax
	je	.L6076
	movq	16(%rsp), %rax
	movl	112(%rsp), %ecx
	movslq	%ebx, %rdx
.L6141:
	movzbl	(%rax), %esi
	movzbl	2(%rax), %edi
	addl	$1, %ecx
	movb	%sil, 2(%rax)
	movl	32(%rsp), %esi
	movb	%dil, (%rax)
	addq	%rdx, %rax
	cmpl	%esi, %ecx
	jne	.L6141
	jmp	.L6076
.L6040:
	movl	96(%rsp), %ebx
	movl	$0, 56(%rsp)
	movb	$1, 88(%rsp)
	sarl	$3, %ebx
	jmp	.L6039
.L6042:
	xorl	%eax, %eax
	cmpl	$3, %ebp
	setne	%al
	sete	88(%rsp)
	movl	%eax, 56(%rsp)
	leal	2(%rax), %ebx
	jmp	.L6039
.L6626:
	leaq	56(%r14), %rsi
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rsi, 128(%rsp)
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	leaq	57(%r14), %rdx
	testl	%eax, %eax
	je	.L6119
	movq	128(%rsp), %rsi
	cltq
	addq	%rsi, %rax
	movzbl	56(%r14), %esi
.L6122:
	movq	%rax, 200(%r14)
	movq	%rdx, 192(%r14)
	jmp	.L6121
.L6625:
	leaq	56(%r14), %rsi
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rsi, 128(%rsp)
	call	*16(%r14)
	movq	192(%r14), %rdx
	leaq	57(%r14), %rdi
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	je	.L6113
	movq	128(%rsp), %rsi
	cltq
	movzbl	56(%r14), %edx
	addq	%rsi, %rax
.L6116:
	movq	%rax, 200(%r14)
	movq	%rdi, 192(%r14)
	jmp	.L6115
.L6214:
	movl	%r9d, %ecx
	jmp	.L6137
.L6098:
	leaq	(%rsi,%r10), %rdx
	movq	%rax, 192(%r14)
	movzbl	56(%r14), %r10d
	movq	%rdx, 200(%r14)
	jmp	.L6096
.L6102:
	cltq
	addq	%rax, %rsi
	movzbl	56(%r14), %eax
	sall	$8, %eax
	addl	%eax, %r10d
	jmp	.L6103
.L6624:
	leaq	56(%r14), %rsi
	movl	52(%r14), %edx
	movq	40(%r14), %rdi
	movq	%rsi, 128(%rsp)
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	leaq	57(%r14), %rdx
	testl	%eax, %eax
	je	.L6107
	movq	128(%rsp), %rsi
	cltq
	addq	%rsi, %rax
	movzbl	56(%r14), %esi
.L6110:
	movq	%rax, 200(%r14)
	movq	%rdx, 192(%r14)
	jmp	.L6109
.L6213:
	movl	%r8d, %r11d
	movl	%r8d, %r15d
	xorl	%ecx, %ecx
	jmp	.L6134
.L6176:
	movl	$3, 8(%rsp)
	movl	$3, 96(%rsp)
	movl	$1, 128(%rsp)
	jmp	.L5905
.L6613:
	movq	440(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6550
	movl	8(%rsp), %edx
	addq	$456, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r9, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	stbi__convert_format16
.L6612:
	.cfi_restore_state
	movq	%r9, %rdi
	call	free@PLT
	leaq	.LC236(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5892
.L5982:
	xorl	%edi, %edi
	call	malloc@PLT
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	jne	.L6142
	jmp	.L5980
.L6053:
	movl	%r15d, %eax
	movl	72(%rsp), %edi
	negl	%eax
	movslq	%eax, %r14
	movl	64(%rsp), %eax
	subl	$1, %eax
	imull	%edi, %eax
	movq	16(%rsp), %rdi
	imull	%ebx, %eax
	cltq
	leaq	(%rdi,%rax), %r13
	movq	%rbp, %rax
	movl	%ebx, %ebp
	movq	%rax, %rbx
	jmp	.L6061
.L6060:
	addl	$1, 56(%rsp)
	addq	%r14, %r13
	movl	56(%rsp), %eax
	cmpl	%eax, 64(%rsp)
	je	.L6633
.L6061:
	cmpq	$0, 16(%r12)
	movq	200(%r12), %rax
	je	.L6059
	movq	%rax, %rcx
	subq	%rsi, %rcx
	cmpl	%ecx, %r15d
	jg	.L6634
.L6059:
	leaq	(%rsi,%rbx), %rdx
	cmpq	%rdx, %rax
	jb	.L6060
	movq	%rbx, %rdx
	movq	%r13, %rdi
	call	memcpy@PLT
	movq	192(%r12), %rsi
	addq	%rbx, %rsi
	movq	%rsi, 192(%r12)
	jmp	.L6060
.L6633:
	movl	%ebp, %ebx
	jmp	.L6052
.L6634:
	movslq	%ecx, %rdx
	movq	%r13, %rdi
	movq	%rcx, 48(%rsp)
	movq	%rdx, 40(%rsp)
	call	memcpy@PLT
	movq	48(%rsp), %rcx
	movq	40(%rsp), %rdx
	movl	%r15d, %eax
	movq	40(%r12), %rdi
	subl	%ecx, %eax
	leaq	0(%r13,%rdx), %rsi
	movl	%eax, %edx
	call	*16(%r12)
	movq	200(%r12), %rsi
	movq	%rsi, 192(%r12)
	jmp	.L6060
.L6083:
	cltq
	addq	%rax, %r13
	jmp	.L6084
.L6627:
	leaq	56(%r14), %rsi
	movl	52(%r14), %edx
	movb	%r10b, 156(%rsp)
	movq	%rsi, 128(%rsp)
	movq	40(%r14), %rdi
	call	*16(%r14)
	movq	192(%r14), %rdx
	subq	208(%r14), %rdx
	addl	%edx, 184(%r14)
	testl	%eax, %eax
	leaq	57(%r14), %rdx
	movq	128(%rsp), %rsi
	jne	.L6125
	xorl	%ecx, %ecx
	movb	$0, 56(%r14)
	movq	%rdx, %rsi
	movzbl	156(%rsp), %r10d
	movl	%ecx, 48(%r14)
.L6126:
	movq	%rsi, 200(%r14)
	movq	%rdx, 192(%r14)
	jmp	.L6124
.L6620:
	leaq	__PRETTY_FUNCTION__.34(%rip), %rcx
	movl	$6086, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC237(%rip), %rdi
	call	__assert_fail@PLT
.L6125:
	cltq
	movzbl	56(%r14), %r10d
	addq	%rax, %rsi
	jmp	.L6126
.L6561:
	leaq	.LC18(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L5885
.L6574:
	movl	64(%rsp), %r11d
	movq	%r15, %r10
	jmp	.L5910
.L6550:
	call	__stack_chk_fail@PLT
.L6614:
	cmpb	$0, 48(%rsp)
	jne	.L6076
	movl	64(%rsp), %eax
	testl	%eax, %eax
	jle	.L6076
	movl	72(%rsp), %r8d
	leal	-1(%rax), %r12d
	imull	%ebx, %r8d
	testl	%r8d, %r8d
	jne	.L6077
	jmp	.L6076
.L6616:
	movl	%edx, 40(%rsp)
	jmp	.L6079
.L6107:
	xorl	%r11d, %r11d
	movb	$0, 56(%r14)
	movq	%rdx, %rax
	xorl	%esi, %esi
	movl	%r11d, 48(%r14)
	jmp	.L6110
.L6576:
	imull	%ebp, %ecx
	cmpl	$2147483647, %ecx
	je	.L5910
	jmp	.L5913
.L6629:
	movq	200(%r12), %rax
	movq	%rax, 192(%r12)
	jmp	.L6064
.L6119:
	xorl	%edi, %edi
	movb	$0, 56(%r14)
	movq	%rdx, %rax
	xorl	%esi, %esi
	movl	%edi, 48(%r14)
	jmp	.L6122
.L6113:
	xorl	%r9d, %r9d
	movb	$0, 56(%r14)
	movq	%rdi, %rax
	xorl	%edx, %edx
	movl	%r9d, 48(%r14)
	jmp	.L6116
.L6632:
	cmpl	$0, 16(%rsp)
	jle	.L6635
	movq	80(%rsp), %rbx
	movq	88(%rsp), %rax
	movq	%r15, 56(%rsp)
	movzbl	2(%r15), %ebp
	movq	%rdx, %r15
	leaq	(%rbx,%rax), %r12
	jmp	.L5807
.L6637:
	addq	$4, %rbx
	cmpq	%r12, %rbx
	je	.L6636
.L5807:
	movq	%rbx, %rdx
	movl	%ebp, %esi
	movq	%r14, %rdi
	call	stbi__readval
	testq	%rax, %rax
	jne	.L6637
	movl	72(%rsp), %r8d
	movq	%r13, %rbp
	jmp	.L5769
.L6157:
	movl	16(%rsp), %ebx
	movq	80(%rsp), %r12
	movq	%r13, 56(%rsp)
	movq	%rdx, %r13
	xchgq	%r13, %r14
	movl	%ebx, %ebp
.L5801:
	testl	%ebp, %ebp
	jle	.L6638
	movq	%r13, %rdi
	call	stbi__get8
	cmpq	$0, 16(%r13)
	movzbl	%al, %esi
	movq	%rsi, %rdx
	je	.L5848
	movl	%esi, 112(%rsp)
	movq	40(%r13), %rdi
	movb	%sil, 104(%rsp)
	call	*32(%r13)
	movzbl	104(%rsp), %edx
	movl	112(%rsp), %esi
	testl	%eax, %eax
	je	.L5847
	cmpl	$0, 48(%r13)
	je	.L6530
.L5848:
	movq	200(%r13), %rax
	cmpq	%rax, 192(%r13)
	jnb	.L6530
.L5847:
	cmpl	$127, %esi
	jle	.L5849
	leal	-127(%rsi), %ebx
	cmpl	$128, %esi
	je	.L6639
.L5851:
	cmpl	%ebx, %ebp
	jl	.L6530
	movzbl	2(%r15), %esi
	leaq	436(%rsp), %rdx
	movq	%r13, %rdi
	movb	%sil, 104(%rsp)
	call	stbi__readval
	testq	%rax, %rax
	je	.L6523
	testl	%ebx, %ebx
	jle	.L5854
	movzbl	104(%rsp), %r8d
	movl	%r8d, %eax
	movl	%r8d, %edx
	movl	%r8d, %esi
	andl	$64, %eax
	andl	$32, %edx
	andl	$16, %esi
	testb	%r8b, %r8b
	js	.L5855
	testb	%sil, %sil
	jne	.L5856
	testb	%dl, %dl
	jne	.L5857
	testb	%al, %al
	je	.L6533
	xorl	%eax, %eax
.L5858:
	movzbl	437(%rsp), %edx
	movb	%dl, 1(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5858
.L6533:
	movl	%ebx, %eax
	leaq	(%r12,%rax,4), %r12
.L5854:
	movq	%r12, %r8
.L5877:
	subl	%ebx, %ebp
	movq	%r8, %r12
	jmp	.L5801
.L6638:
	xchgq	%r14, %r13
.L5845:
	addq	$3, %r15
	cmpq	%r15, 96(%rsp)
	jne	.L5804
	movq	88(%rsp), %r15
	movq	%r13, %rax
	movq	%r14, %r13
	movq	80(%rsp), %r14
	movl	72(%rsp), %r12d
	leaq	(%r14,%r15), %rbx
.L5805:
	addl	$1, 64(%rsp)
	movq	%rbx, %r14
	jmp	.L5799
.L6530:
	movl	72(%rsp), %r8d
	movq	56(%rsp), %rbp
	jmp	.L6534
.L6636:
	movq	%r15, %rdx
	movq	56(%rsp), %r15
	movq	96(%rsp), %rax
	addq	$3, %r15
	cmpq	%rax, %r15
	je	.L6518
	movzbl	1(%r15), %eax
	cmpb	$1, %al
	jne	.L5808
	movq	%r13, 56(%rsp)
	movq	%rdx, %r13
.L5844:
	leaq	436(%rsp), %rax
	movq	%r13, 112(%rsp)
	movq	%rax, 104(%rsp)
.L5841:
	movq	80(%rsp), %rbx
	movl	16(%rsp), %r12d
	movq	%r14, %r13
.L5843:
	movq	%r13, %rdi
	call	stbi__get8
	cmpq	$0, 16(%r13)
	movzbl	%al, %ebp
	je	.L5812
	movq	40(%r13), %rdi
	call	*32(%r13)
	testl	%eax, %eax
	je	.L5811
	cmpl	$0, 48(%r13)
	je	.L6530
.L5812:
	movq	200(%r13), %rax
	cmpq	%rax, 192(%r13)
	jnb	.L6530
.L5811:
	movzbl	%bpl, %r9d
	cmpl	%r12d, %r9d
	jle	.L5814
	movzbl	2(%r15), %esi
	movq	104(%rsp), %rdx
	movq	%r13, %rdi
	movzbl	%r12b, %ebp
	movl	%esi, %r14d
	call	stbi__readval
	testq	%rax, %rax
	je	.L6523
	movzbl	%r12b, %eax
.L5816:
	movl	%r14d, %edx
	movl	%r14d, %esi
	movl	%r14d, %edi
	andl	$64, %edx
	andl	$32, %esi
	andl	$16, %edi
	testb	%r14b, %r14b
	js	.L5818
	testb	%dil, %dil
	jne	.L5819
	testb	%sil, %sil
	jne	.L5820
	testb	%dl, %dl
	je	.L6531
	xorl	%edx, %edx
.L5821:
	movzbl	437(%rsp), %ecx
	movb	%cl, 1(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5821
.L6531:
	leaq	(%rbx,%rbp,4), %rbx
.L5822:
	subl	%eax, %r12d
	testl	%r12d, %r12d
	jg	.L5843
	movq	96(%rsp), %rax
	addq	$3, %r15
	movq	%r13, %r14
	cmpq	%rax, %r15
	je	.L6640
	movzbl	1(%r15), %eax
	cmpb	$1, %al
	je	.L5841
	movq	56(%rsp), %r13
	movq	112(%rsp), %rdx
	jmp	.L5808
.L5820:
	testb	%dl, %dl
	movl	$0, %edx
	jne	.L5823
.L5824:
	movzbl	438(%rsp), %ecx
	movb	%cl, 2(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5824
.L6532:
	movzbl	%bpl, %ebp
	leaq	(%rbx,%rbp,4), %rbx
	jmp	.L5822
.L6640:
	movq	88(%rsp), %r15
	movq	80(%rsp), %r14
	movl	72(%rsp), %r12d
	movq	112(%rsp), %rax
	leaq	(%r14,%r15), %rbx
	jmp	.L5805
.L5823:
	movzbl	437(%rsp), %ecx
	movb	%cl, 1(%rbx,%rdx,4)
	movzbl	438(%rsp), %ecx
	movb	%cl, 2(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5823
	jmp	.L6531
.L5819:
	testb	%sil, %sil
	jne	.L5825
	testb	%dl, %dl
	movl	$0, %edx
	jne	.L5826
.L5827:
	movzbl	439(%rsp), %ecx
	movb	%cl, 3(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5827
	jmp	.L6532
.L5818:
	testb	%dil, %dil
	jne	.L5830
	testb	%sil, %sil
	jne	.L5831
	testb	%dl, %dl
	movl	$0, %edx
	jne	.L5832
.L5833:
	movzbl	436(%rsp), %ecx
	movb	%cl, (%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5833
	jmp	.L6532
.L5826:
	movzbl	437(%rsp), %ecx
	movb	%cl, 1(%rbx,%rdx,4)
	movzbl	439(%rsp), %ecx
	movb	%cl, 3(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5826
	jmp	.L6531
.L5814:
	movzbl	2(%r15), %esi
	movq	104(%rsp), %rdx
	movq	%r13, %rdi
	movl	%r9d, 120(%rsp)
	movl	%esi, %r14d
	call	stbi__readval
	testq	%rax, %rax
	je	.L6523
	movl	120(%rsp), %eax
	testl	%eax, %eax
	jne	.L5816
	jmp	.L5843
.L6518:
	movq	%r13, 56(%rsp)
	movq	%r12, %rbx
	movq	88(%rsp), %r15
	movq	%rdx, %rax
	movl	72(%rsp), %r12d
	movq	%r14, %r13
	jmp	.L5805
.L5825:
	testb	%dl, %dl
	movl	$0, %edx
	jne	.L5828
.L5829:
	movzbl	438(%rsp), %ecx
	movb	%cl, 2(%rbx,%rdx,4)
	movzbl	439(%rsp), %ecx
	movb	%cl, 3(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5829
	jmp	.L6532
.L5832:
	movzbl	436(%rsp), %ecx
	movb	%cl, (%rbx,%rdx,4)
	movzbl	437(%rsp), %ecx
	movb	%cl, 1(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5832
	jmp	.L6531
.L5828:
	movzbl	437(%rsp), %ecx
	movb	%cl, 1(%rbx,%rdx,4)
	movzbl	438(%rsp), %ecx
	movb	%cl, 2(%rbx,%rdx,4)
	movzbl	439(%rsp), %ecx
	movb	%cl, 3(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5828
	jmp	.L6531
.L5831:
	testb	%dl, %dl
	movl	$0, %edx
	jne	.L5834
.L5835:
	movzbl	436(%rsp), %ecx
	movb	%cl, (%rbx,%rdx,4)
	movzbl	438(%rsp), %ecx
	movb	%cl, 2(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5835
	jmp	.L6532
.L5830:
	testb	%sil, %sil
	jne	.L5836
	testb	%dl, %dl
	movl	$0, %edx
	jne	.L5837
.L5838:
	movzbl	436(%rsp), %ecx
	movb	%cl, (%rbx,%rdx,4)
	movzbl	439(%rsp), %ecx
	movb	%cl, 3(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5838
	jmp	.L6532
.L5834:
	movzbl	436(%rsp), %ecx
	movb	%cl, (%rbx,%rdx,4)
	movzbl	437(%rsp), %ecx
	movb	%cl, 1(%rbx,%rdx,4)
	movzbl	438(%rsp), %ecx
	movb	%cl, 2(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5834
	jmp	.L6531
.L5837:
	movzbl	436(%rsp), %ecx
	movb	%cl, (%rbx,%rdx,4)
	movzbl	437(%rsp), %ecx
	movb	%cl, 1(%rbx,%rdx,4)
	movzbl	439(%rsp), %ecx
	movb	%cl, 3(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5837
	jmp	.L6531
.L5836:
	testb	%dl, %dl
	movl	$0, %edx
	jne	.L5839
.L5840:
	movzbl	436(%rsp), %ecx
	movb	%cl, (%rbx,%rdx,4)
	movzbl	438(%rsp), %ecx
	movb	%cl, 2(%rbx,%rdx,4)
	movzbl	439(%rsp), %ecx
	movb	%cl, 3(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5840
	jmp	.L6532
.L5849:
	leal	1(%rsi), %ebx
	cmpl	%ebx, %ebp
	jl	.L6530
	movzbl	2(%r15), %esi
	leaq	4(%r12,%rdx,4), %r8
	movq	%r14, 104(%rsp)
	movl	%ebp, %r14d
	movq	%r15, 112(%rsp)
	movl	%ebx, %r15d
	movq	%r8, %rbx
	movl	%esi, %ebp
	jmp	.L5879
.L6642:
	addq	$4, %r12
	cmpq	%rbx, %r12
	je	.L6641
.L5879:
	movq	%r12, %rdx
	movl	%ebp, %esi
	movq	%r13, %rdi
	call	stbi__readval
	testq	%rax, %rax
	jne	.L6642
.L6523:
	movl	72(%rsp), %r8d
	movq	56(%rsp), %rbp
	jmp	.L5769
.L6639:
	movq	%r13, %rdi
	call	stbi__get16be
	movl	%eax, %ebx
	jmp	.L5851
.L5856:
	testb	%dl, %dl
	jne	.L5861
	testb	%al, %al
	movl	$0, %eax
	jne	.L5862
.L5863:
	movzbl	439(%rsp), %edx
	movb	%dl, 3(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5863
	jmp	.L6533
.L5857:
	testb	%al, %al
	movl	$0, %eax
	jne	.L5859
.L5860:
	movzbl	438(%rsp), %edx
	movb	%dl, 2(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5860
	jmp	.L6533
.L5839:
	movzbl	436(%rsp), %ecx
	movb	%cl, (%rbx,%rdx,4)
	movzbl	437(%rsp), %ecx
	movb	%cl, 1(%rbx,%rdx,4)
	movzbl	438(%rsp), %ecx
	movb	%cl, 2(%rbx,%rdx,4)
	movzbl	439(%rsp), %ecx
	movb	%cl, 3(%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %eax
	jg	.L5839
	jmp	.L6531
.L5859:
	movzbl	437(%rsp), %edx
	movb	%dl, 1(%r12,%rax,4)
	movzbl	438(%rsp), %edx
	movb	%dl, 2(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5859
	jmp	.L6533
.L5855:
	testb	%sil, %sil
	jne	.L5866
	testb	%dl, %dl
	jne	.L5867
	testb	%al, %al
	movl	$0, %eax
	jne	.L5868
.L5869:
	movzbl	436(%rsp), %edx
	movb	%dl, (%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5869
	jmp	.L6533
.L6641:
	movl	%r14d, %ebp
	movq	%rbx, %r8
	movq	104(%rsp), %r14
	movl	%r15d, %ebx
	movq	112(%rsp), %r15
	jmp	.L5877
.L5868:
	movzbl	436(%rsp), %edx
	movb	%dl, (%r12,%rax,4)
	movzbl	437(%rsp), %edx
	movb	%dl, 1(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5868
	jmp	.L6533
.L5867:
	testb	%al, %al
	movl	$0, %eax
	jne	.L5870
.L5871:
	movzbl	436(%rsp), %edx
	movb	%dl, (%r12,%rax,4)
	movzbl	438(%rsp), %edx
	movb	%dl, 2(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5871
	jmp	.L6533
.L5866:
	testb	%dl, %dl
	jne	.L5872
	testb	%al, %al
	movl	$0, %eax
	jne	.L5873
.L5874:
	movzbl	436(%rsp), %edx
	movb	%dl, (%r12,%rax,4)
	movzbl	439(%rsp), %edx
	movb	%dl, 3(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5874
	jmp	.L6533
.L5870:
	movzbl	436(%rsp), %edx
	movb	%dl, (%r12,%rax,4)
	movzbl	437(%rsp), %edx
	movb	%dl, 1(%r12,%rax,4)
	movzbl	438(%rsp), %edx
	movb	%dl, 2(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5870
	jmp	.L6533
.L5873:
	movzbl	436(%rsp), %edx
	movb	%dl, (%r12,%rax,4)
	movzbl	437(%rsp), %edx
	movb	%dl, 1(%r12,%rax,4)
	movzbl	439(%rsp), %edx
	movb	%dl, 3(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5873
	jmp	.L6533
.L5872:
	testb	%al, %al
	movl	$0, %eax
	jne	.L5875
.L5876:
	movzbl	436(%rsp), %edx
	movb	%dl, (%r12,%rax,4)
	movzbl	438(%rsp), %edx
	movb	%dl, 2(%r12,%rax,4)
	movzbl	439(%rsp), %edx
	movb	%dl, 3(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5876
	jmp	.L6533
.L5862:
	movzbl	437(%rsp), %edx
	movb	%dl, 1(%r12,%rax,4)
	movzbl	439(%rsp), %edx
	movb	%dl, 3(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5862
	jmp	.L6533
.L5861:
	testb	%al, %al
	movl	$0, %eax
	jne	.L5864
.L5865:
	movzbl	438(%rsp), %edx
	movb	%dl, 2(%r12,%rax,4)
	movzbl	439(%rsp), %edx
	movb	%dl, 3(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5865
	jmp	.L6533
.L5875:
	movzbl	436(%rsp), %edx
	movb	%dl, (%r12,%rax,4)
	movzbl	437(%rsp), %edx
	movb	%dl, 1(%r12,%rax,4)
	movzbl	438(%rsp), %edx
	movb	%dl, 2(%r12,%rax,4)
	movzbl	439(%rsp), %edx
	movb	%dl, 3(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5875
	jmp	.L6533
.L5864:
	movzbl	437(%rsp), %edx
	movb	%dl, 1(%r12,%rax,4)
	movzbl	438(%rsp), %edx
	movb	%dl, 2(%r12,%rax,4)
	movzbl	439(%rsp), %edx
	movb	%dl, 3(%r12,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L5864
	jmp	.L6533
.L6635:
	movq	%r13, 56(%rsp)
	movq	%rdx, %r13
	jmp	.L5845
.L5800:
	cmpl	$0, 16(%rsp)
	jg	.L5844
	jmp	.L5845
.L6631:
	movq	56(%rsp), %rbp
	movl	%r12d, %r8d
	jmp	.L5882
.L6628:
	movq	16(%rsp), %rdi
	call	free@PLT
	leaq	.LC233(%rip), %rax
	jmp	.L6548
.L6562:
	imull	%ebp, %esi
	cmpl	$-7, %ecx
	jl	.L5962
	testl	%r13d, %r13d
	je	.L5970
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%r13d
	cmpl	%eax, %esi
	jg	.L5962
	jg	.L6547
	jmp	.L5970
.L6145:
	movq	%r11, %rdi
	call	free@PLT
	jmp	.L6076
.L6630:
	leaq	__PRETTY_FUNCTION__.34(%rip), %rcx
	movl	$6033, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC237(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE567:
	.size	stbi__load_main, .-stbi__load_main
	.section	.rodata.str1.8
	.align 8
.LC238:
	.string	"ri.bits_per_channel == 8 || ri.bits_per_channel == 16"
	.text
	.p2align 4
	.type	stbi__load_and_postprocess_8bit, @function
stbi__load_and_postprocess_8bit:
.LFB572:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%r8d, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$64, %rsp
	.cfi_def_cfa_offset 120
	movq	%fs:40, %rax
	movq	%rax, 48(%rsp)
	xorl	%eax, %eax
	pushq	$8
	.cfi_def_cfa_offset 128
	leaq	44(%rsp), %r9
	call	stbi__load_main
	popq	%rsi
	.cfi_def_cfa_offset 120
	popq	%rdi
	.cfi_def_cfa_offset 112
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L6643
	movl	28(%rsp), %eax
	leal	-8(%rax), %edx
	movl	%edx, %esi
	andl	$-9, %esi
	jne	.L6683
	cmpl	$8, %eax
	je	.L6646
	movl	%ebp, %eax
	testl	%ebp, %ebp
	je	.L6684
.L6647:
	movl	0(%r13), %edx
	imull	(%r12), %edx
	movl	%esi, 12(%rsp)
	imull	%eax, %edx
	movslq	%edx, %rcx
	movl	%edx, 8(%rsp)
	movq	%rcx, %rdi
	movq	%rcx, (%rsp)
	call	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L6648
	movl	8(%rsp), %edx
	movq	(%rsp), %rcx
	movl	12(%rsp), %esi
	testl	%edx, %edx
	jle	.L6650
	leal	-1(%rdx), %r8d
	movl	%edx, %edi
	cmpl	$6, %r8d
	jbe	.L6666
	leaq	(%rbx,%rcx,2), %rax
	cmpq	%rax, %r15
	jnb	.L6669
	leaq	(%r15,%rcx), %r9
	xorl	%eax, %eax
	cmpq	%r9, %rbx
	jnb	.L6669
	.p2align 4,,10
	.p2align 3
.L6658:
	movzbl	1(%rbx,%rax,2), %edx
	movb	%dl, (%r15,%rax)
	addq	$1, %rax
	cmpq	%rax, %rcx
	jne	.L6658
.L6650:
	movq	%rbx, %rdi
	movq	%r15, %rbx
	call	free@PLT
.L6646:
	movl	%fs:stbi__vertically_flip_on_load_set@tpoff, %ecx
	testl	%ecx, %ecx
	jne	.L6685
	movl	stbi__vertically_flip_on_load_global(%rip), %eax
	testl	%eax, %eax
	je	.L6643
.L6661:
	testl	%ebp, %ebp
	jne	.L6663
	movl	(%r14), %ebp
.L6663:
	movl	0(%r13), %edx
	movl	(%r12), %esi
	movl	%ebp, %ecx
	movq	%rbx, %rdi
	call	stbi__vertical_flip
.L6643:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6686
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6685:
	.cfi_restore_state
	movl	%fs:stbi__vertically_flip_on_load_local@tpoff, %edx
	testl	%edx, %edx
	jne	.L6661
	jmp	.L6643
	.p2align 4,,10
	.p2align 3
.L6684:
	movl	(%r14), %eax
	jmp	.L6647
	.p2align 4,,10
	.p2align 3
.L6669:
	cmpl	$14, %r8d
	jbe	.L6668
	movl	%edx, %ecx
	movdqa	.LC2(%rip), %xmm2
	xorl	%eax, %eax
	shrl	$4, %ecx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L6654:
	movdqu	(%rbx,%rax,2), %xmm0
	movdqu	16(%rbx,%rax,2), %xmm1
	psrlw	$8, %xmm0
	psrlw	$8, %xmm1
	pand	%xmm2, %xmm0
	pand	%xmm2, %xmm1
	packuswb	%xmm1, %xmm0
	movups	%xmm0, (%r15,%rax)
	addq	$16, %rax
	cmpq	%rax, %rcx
	jne	.L6654
	movl	%edx, %eax
	andl	$-16, %eax
	movl	%eax, %esi
	cmpl	%eax, %edx
	je	.L6650
	movl	%edx, %edi
	subl	%eax, %edi
	leal	-1(%rdi), %ecx
	cmpl	$6, %ecx
	jbe	.L6656
.L6653:
	movq	.LC4(%rip), %xmm1
	leaq	(%rbx,%rsi,2), %rcx
	movq	(%rcx), %xmm0
	movq	8(%rcx), %xmm2
	movl	%edi, %ecx
	andl	$-8, %ecx
	psrlw	$8, %xmm0
	psrlw	$8, %xmm2
	addl	%ecx, %eax
	andl	$7, %edi
	pand	%xmm1, %xmm0
	pand	%xmm2, %xmm1
	packuswb	%xmm1, %xmm0
	pshufd	$8, %xmm0, %xmm0
	movq	%xmm0, (%r15,%rsi)
	je	.L6650
.L6656:
	movslq	%eax, %rsi
	movzbl	1(%rbx,%rsi,2), %edi
	leaq	(%rsi,%rsi), %rcx
	movb	%dil, (%r15,%rsi)
	leal	1(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6650
	movzbl	3(%rbx,%rcx), %edi
	movslq	%esi, %rsi
	movb	%dil, (%r15,%rsi)
	leal	2(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6650
	movzbl	5(%rbx,%rcx), %edi
	movslq	%esi, %rsi
	movb	%dil, (%r15,%rsi)
	leal	3(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6650
	movzbl	7(%rbx,%rcx), %edi
	movslq	%esi, %rsi
	movb	%dil, (%r15,%rsi)
	leal	4(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6650
	movzbl	9(%rbx,%rcx), %edi
	movslq	%esi, %rsi
	movb	%dil, (%r15,%rsi)
	leal	5(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6650
	movzbl	11(%rbx,%rcx), %edi
	movslq	%esi, %rsi
	addl	$6, %eax
	movb	%dil, (%r15,%rsi)
	cmpl	%eax, %edx
	jle	.L6650
	movzbl	13(%rbx,%rcx), %edx
	cltq
	movb	%dl, (%r15,%rax)
	jmp	.L6650
	.p2align 4,,10
	.p2align 3
.L6666:
	xorl	%eax, %eax
	jmp	.L6658
.L6668:
	xorl	%eax, %eax
	jmp	.L6653
.L6686:
	call	__stack_chk_fail@PLT
.L6683:
	leaq	__PRETTY_FUNCTION__.50(%rip), %rcx
	movl	$1267, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC238(%rip), %rdi
	call	__assert_fail@PLT
.L6648:
	leaq	.LC18(%rip), %rax
	xorl	%ebx, %ebx
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6646
	.cfi_endproc
.LFE572:
	.size	stbi__load_and_postprocess_8bit, .-stbi__load_and_postprocess_8bit
	.p2align 4
	.type	stbi__loadf_main, @function
stbi__loadf_main:
.LFB585:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movl	%r8d, 44(%rsp)
	call	stbi__hdr_test
	movl	%eax, 48(%rsp)
	testl	%eax, %eax
	jne	.L6758
	movl	44(%rsp), %r15d
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	movl	%r15d, %r8d
	call	stbi__load_and_postprocess_8bit
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	je	.L6695
	testl	%r15d, %r15d
	jne	.L6696
	movl	(%r12), %eax
	movl	%eax, 44(%rsp)
.L6696:
	movl	0(%rbp), %ecx
	movl	(%rbx), %esi
	movl	%ecx, %eax
	orl	%esi, %eax
	js	.L6699
	testl	%ecx, %ecx
	je	.L6759
	movl	$2147483647, %eax
	xorl	%edx, %edx
	idivl	%ecx
	cmpl	%eax, %esi
	jg	.L6699
	movl	44(%rsp), %eax
	testl	%eax, %eax
	js	.L6699
	movl	%ecx, %ebx
	imull	%esi, %ebx
	movl	%ebx, 40(%rsp)
	testl	%eax, %eax
	je	.L6701
	movl	%eax, %edi
	xorl	%edx, %edx
	movl	$2147483647, %eax
	idivl	%edi
	cmpl	%eax, %ebx
	jg	.L6699
	movl	%ebx, %eax
	imull	%edi, %eax
	cmpl	$536870911, %eax
	jle	.L6700
	.p2align 4,,10
	.p2align 3
.L6699:
	movq	32(%rsp), %rdi
	call	free@PLT
	leaq	.LC18(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
.L6689:
	movq	$0, 24(%rsp)
.L6687:
	movq	24(%rsp), %rax
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6758:
	.cfi_restore_state
	movl	44(%rsp), %r8d
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	stbi__hdr_load.constprop.0
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L6689
	movl	%fs:stbi__vertically_flip_on_load_set@tpoff, %r11d
	testl	%r11d, %r11d
	je	.L6690
	movl	%fs:stbi__vertically_flip_on_load_local@tpoff, %r10d
	testl	%r10d, %r10d
	je	.L6687
.L6691:
	movl	44(%rsp), %r8d
	testl	%r8d, %r8d
	jne	.L6693
	movl	(%r12), %eax
	movl	%eax, 44(%rsp)
.L6693:
	movl	44(%rsp), %ecx
	movl	0(%rbp), %edx
	movl	(%rbx), %esi
	movq	24(%rsp), %rdi
	sall	$2, %ecx
	call	stbi__vertical_flip
	jmp	.L6687
.L6695:
	leaq	.LC203(%rip), %rax
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6689
.L6759:
	movl	44(%rsp), %edi
	testl	%edi, %edi
	js	.L6699
.L6700:
	imull	%esi, %ecx
	movl	44(%rsp), %ebx
	movl	%ebx, %edi
	imull	%ecx, %edi
	movl	%ecx, 40(%rsp)
	movl	%ecx, %r15d
	sall	$2, %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L6699
	movl	%ebx, %ecx
	andl	$1, %ecx
	jne	.L6702
	leal	-1(%rbx), %eax
	movl	%eax, 52(%rsp)
	testl	%r15d, %r15d
	je	.L6703
	testl	%eax, %eax
	jle	.L6760
.L6704:
	movslq	52(%rsp), %rax
	movq	32(%rsp), %rsi
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	movss	.LC188(%rip), %xmm4
	movslq	44(%rsp), %r15
	movq	%rax, 56(%rsp)
	leaq	(%rsi,%rax), %rbx
	movss	%xmm4, 20(%rsp)
	.p2align 4,,10
	.p2align 3
.L6707:
	movq	32(%rsp), %rax
	pxor	%xmm5, %xmm5
	pxor	%xmm1, %xmm1
	cvtss2sd	stbi__l2h_scale(%rip), %xmm5
	movsd	%xmm5, 8(%rsp)
	cvtss2sd	stbi__l2h_gamma(%rip), %xmm1
	leaq	(%rax,%rbp), %r13
	movq	24(%rsp), %rax
	leaq	(%rax,%rbp,4), %r14
	.p2align 4,,10
	.p2align 3
.L6708:
	movzbl	0(%r13), %ecx
	pxor	%xmm0, %xmm0
	addq	$1, %r13
	addq	$4, %r14
	movsd	%xmm1, (%rsp)
	cvtsi2ssl	%ecx, %xmm0
	divss	20(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	pow@PLT
	mulsd	8(%rsp), %xmm0
	movsd	(%rsp), %xmm1
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -4(%r14)
	cmpq	%rbx, %r13
	jne	.L6708
	movl	40(%rsp), %eax
	addl	$1, %r12d
	leaq	0(%r13,%r15), %rbx
	addq	%r15, %rbp
	cmpl	%eax, %r12d
	jl	.L6707
	movl	52(%rsp), %edx
	cmpl	%edx, 44(%rsp)
	jle	.L6703
.L6705:
	movq	32(%rsp), %rsi
	movq	56(%rsp), %rax
	movq	24(%rsp), %rdi
	leaq	(%rsi,%rax), %rdx
	leaq	0(,%r15,4), %rsi
	leaq	(%rdi,%rax,4), %rax
	.p2align 4,,10
	.p2align 3
.L6710:
	movzbl	(%rdx), %ecx
	pxor	%xmm0, %xmm0
	addl	$1, 48(%rsp)
	addq	%r15, %rdx
	movl	48(%rsp), %edi
	cvtsi2ssl	%ecx, %xmm0
	divss	20(%rsp), %xmm0
	movss	%xmm0, (%rax)
	addq	%rsi, %rax
	cmpl	%edi, 40(%rsp)
	jg	.L6710
	.p2align 4,,10
	.p2align 3
.L6703:
	movq	32(%rsp), %rdi
	call	free@PLT
	jmp	.L6687
.L6702:
	movl	40(%rsp), %edx
	testl	%edx, %edx
	je	.L6703
	movl	44(%rsp), %eax
	movl	%eax, 52(%rsp)
	testl	%eax, %eax
	jg	.L6704
	jmp	.L6703
.L6690:
	movl	stbi__vertically_flip_on_load_global(%rip), %r9d
	testl	%r9d, %r9d
	je	.L6687
	jmp	.L6691
.L6701:
	xorl	%edi, %edi
	call	malloc@PLT
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.L6699
	movl	40(%rsp), %eax
	testl	%eax, %eax
	je	.L6703
	movss	.LC188(%rip), %xmm3
	xorl	%r15d, %r15d
	movq	$-1, 56(%rsp)
	movss	%xmm3, 20(%rsp)
	jmp	.L6705
.L6760:
	cmpl	$1, 44(%rsp)
	jne	.L6761
	cmpl	$7, 40(%rsp)
	jle	.L6762
	movslq	40(%rsp), %rdi
	movslq	52(%rsp), %rbx
	movl	$4, %r9d
	movq	24(%rsp), %r11
	movq	32(%rsp), %r15
	testl	%edi, %edi
	leaq	0(,%rdi,4), %rsi
	movq	%rbx, 56(%rsp)
	leaq	0(,%rbx,4), %r8
	cmovle	%r9, %rsi
	leaq	(%r15,%rbx), %rdx
	leaq	(%r11,%r8), %rax
	addq	%r8, %rsi
	addq	%r11, %rsi
	cmpq	%rsi, %rdx
	jnb	.L6726
	testl	%edi, %edi
	movl	$1, %esi
	cmovg	%rdi, %rsi
	addq	%rbx, %rsi
	addq	%r15, %rsi
	cmpq	%rsi, %rax
	jnb	.L6726
.L6712:
	movq	24(%rsp), %rax
	movq	56(%rsp), %rdx
	movss	.LC188(%rip), %xmm4
	movq	32(%rsp), %rdi
	leaq	(%rax,%rdx,4), %rsi
	xorl	%eax, %eax
	movss	%xmm4, 20(%rsp)
	leaq	(%rdi,%rdx), %rcx
	.p2align 4,,10
	.p2align 3
.L6719:
	movzbl	(%rcx,%rax), %edx
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	divss	20(%rsp), %xmm0
	movss	%xmm0, (%rsi,%rax,4)
	addq	$1, %rax
	cmpl	%eax, 40(%rsp)
	jg	.L6719
	jmp	.L6703
.L6726:
	movl	40(%rsp), %edi
	movl	$1, %esi
	testl	%edi, %edi
	cmovg	%edi, %esi
	cmpl	$15, %edi
	jle	.L6723
	movl	%esi, %ecx
	movss	.LC188(%rip), %xmm4
	pxor	%xmm5, %xmm5
	shrl	$4, %ecx
	pxor	%xmm3, %xmm3
	salq	$4, %rcx
	shufps	$0, %xmm4, %xmm4
	addq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L6715:
	movdqu	(%rdx), %xmm0
	addq	$16, %rdx
	addq	$64, %rax
	movdqa	%xmm0, %xmm1
	punpckhbw	%xmm5, %xmm0
	punpcklbw	%xmm5, %xmm1
	movdqa	%xmm1, %xmm2
	punpckhwd	%xmm3, %xmm1
	cvtdq2ps	%xmm1, %xmm1
	divps	%xmm4, %xmm1
	punpcklwd	%xmm3, %xmm2
	cvtdq2ps	%xmm2, %xmm2
	divps	%xmm4, %xmm2
	movups	%xmm1, -48(%rax)
	movdqa	%xmm0, %xmm1
	punpckhwd	%xmm3, %xmm0
	punpcklwd	%xmm3, %xmm1
	cvtdq2ps	%xmm0, %xmm0
	cvtdq2ps	%xmm1, %xmm1
	divps	%xmm4, %xmm0
	movups	%xmm2, -64(%rax)
	divps	%xmm4, %xmm1
	movups	%xmm0, -16(%rax)
	movups	%xmm1, -32(%rax)
	cmpq	%rdx, %rcx
	jne	.L6715
	movl	%esi, %edx
	andl	$-16, %edx
	movl	%edx, %ecx
	testb	$15, %sil
	je	.L6703
.L6714:
	movl	%esi, %eax
	subl	%edx, %eax
	leal	-1(%rax), %esi
	cmpl	$6, %esi
	jbe	.L6717
	movq	56(%rsp), %rsi
	movq	32(%rsp), %rdi
	pxor	%xmm2, %xmm2
	pxor	%xmm4, %xmm4
	movaps	.LC242(%rip), %xmm3
	addq	%rdx, %rsi
	movq	24(%rsp), %rdx
	movq	(%rdi,%rsi), %xmm0
	leaq	(%rdx,%rsi,4), %rdx
	movdqa	%xmm0, %xmm1
	punpcklbw	%xmm2, %xmm0
	punpcklbw	%xmm2, %xmm1
	pshufd	$78, %xmm0, %xmm0
	movdqa	%xmm1, %xmm2
	punpcklwd	%xmm4, %xmm1
	pshufd	$78, %xmm1, %xmm1
	punpcklwd	%xmm4, %xmm2
	cvtdq2ps	%xmm1, %xmm1
	divps	%xmm3, %xmm1
	cvtdq2ps	%xmm2, %xmm2
	divps	%xmm3, %xmm2
	movlps	%xmm1, 8(%rdx)
	movdqa	%xmm0, %xmm1
	punpcklwd	%xmm4, %xmm0
	punpcklwd	%xmm4, %xmm1
	pshufd	$78, %xmm0, %xmm0
	cvtdq2ps	%xmm1, %xmm1
	cvtdq2ps	%xmm0, %xmm0
	divps	%xmm3, %xmm1
	movlps	%xmm2, (%rdx)
	divps	%xmm3, %xmm0
	movlps	%xmm1, 16(%rdx)
	movlps	%xmm0, 24(%rdx)
	movl	%eax, %edx
	andl	$-8, %edx
	addl	%edx, %ecx
	testb	$7, %al
	je	.L6703
.L6717:
	movl	52(%rsp), %esi
	movq	32(%rsp), %rdi
	pxor	%xmm1, %xmm1
	movss	.LC188(%rip), %xmm0
	movq	24(%rsp), %rbx
	leal	(%rsi,%rcx), %eax
	movl	40(%rsp), %r9d
	cltq
	movzbl	(%rdi,%rax), %edx
	cvtsi2ssl	%edx, %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm1, (%rbx,%rax,4)
	leal	1(%rcx), %eax
	cmpl	%r9d, %eax
	jge	.L6703
	addl	%esi, %eax
	pxor	%xmm1, %xmm1
	cltq
	movzbl	(%rdi,%rax), %edx
	cvtsi2ssl	%edx, %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm1, (%rbx,%rax,4)
	leal	2(%rcx), %eax
	cmpl	%r9d, %eax
	jge	.L6703
	addl	%esi, %eax
	pxor	%xmm1, %xmm1
	cltq
	movzbl	(%rdi,%rax), %edx
	cvtsi2ssl	%edx, %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm1, (%rbx,%rax,4)
	leal	3(%rcx), %eax
	cmpl	%eax, %r9d
	jle	.L6703
	addl	%esi, %eax
	pxor	%xmm1, %xmm1
	cltq
	movzbl	(%rdi,%rax), %edx
	cvtsi2ssl	%edx, %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm1, (%rbx,%rax,4)
	leal	4(%rcx), %eax
	cmpl	%eax, %r9d
	jle	.L6703
	addl	%esi, %eax
	pxor	%xmm1, %xmm1
	cltq
	movzbl	(%rdi,%rax), %edx
	cvtsi2ssl	%edx, %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm1, (%rbx,%rax,4)
	leal	5(%rcx), %eax
	cmpl	%eax, %r9d
	jle	.L6703
	addl	%esi, %eax
	pxor	%xmm1, %xmm1
	addl	$6, %ecx
	cltq
	movzbl	(%rdi,%rax), %edx
	cvtsi2ssl	%edx, %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm1, (%rbx,%rax,4)
	cmpl	%ecx, %r9d
	jle	.L6703
	addl	%ecx, %esi
	pxor	%xmm1, %xmm1
	movslq	%esi, %rax
	movzbl	(%rdi,%rax), %edx
	cvtsi2ssl	%edx, %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm1, (%rbx,%rax,4)
	jmp	.L6703
.L6762:
	movslq	52(%rsp), %rax
	movq	%rax, 56(%rsp)
	jmp	.L6712
.L6723:
	xorl	%edx, %edx
	jmp	.L6714
.L6761:
	movss	.LC188(%rip), %xmm3
	cltq
	movslq	44(%rsp), %r15
	movq	%rax, 56(%rsp)
	movss	%xmm3, 20(%rsp)
	jmp	.L6705
	.cfi_endproc
.LFE585:
	.size	stbi__loadf_main, .-stbi__loadf_main
	.p2align 4
	.type	stbi__load_and_postprocess_16bit, @function
stbi__load_and_postprocess_16bit:
.LFB573:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%r8d, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$64, %rsp
	.cfi_def_cfa_offset 120
	movq	%fs:40, %rax
	movq	%rax, 48(%rsp)
	xorl	%eax, %eax
	pushq	$16
	.cfi_def_cfa_offset 128
	leaq	44(%rsp), %r9
	call	stbi__load_main
	popq	%rsi
	.cfi_def_cfa_offset 120
	popq	%rdi
	.cfi_def_cfa_offset 112
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L6763
	movl	28(%rsp), %eax
	leal	-8(%rax), %edx
	movl	%edx, %ecx
	andl	$-9, %ecx
	jne	.L6805
	cmpl	$16, %eax
	je	.L6766
	movl	%ebp, %eax
	testl	%ebp, %ebp
	je	.L6806
.L6767:
	movl	0(%r13), %edx
	imull	(%r12), %edx
	movl	%ecx, 12(%rsp)
	imull	%eax, %edx
	leal	(%rdx,%rdx), %edi
	movl	%edx, 8(%rsp)
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L6768
	movl	8(%rsp), %edx
	movl	12(%rsp), %ecx
	testl	%edx, %edx
	jle	.L6770
	leal	-1(%rdx), %eax
	movl	%edx, %edi
	movslq	%edx, %rsi
	cmpl	$6, %eax
	jbe	.L6771
	leaq	(%r15,%rsi,2), %r8
	cmpq	%r8, %rbx
	jnb	.L6787
	leaq	(%rbx,%rsi), %r8
	cmpq	%r8, %r15
	jnb	.L6787
.L6771:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L6778:
	movzbl	(%rbx,%rax), %ecx
	movl	%ecx, %edx
	sall	$8, %edx
	addl	%ecx, %edx
	movw	%dx, (%r15,%rax,2)
	addq	$1, %rax
	cmpq	%rax, %rsi
	jne	.L6778
.L6770:
	movq	%rbx, %rdi
	movq	%r15, %rbx
	call	free@PLT
.L6766:
	movl	%fs:stbi__vertically_flip_on_load_set@tpoff, %ecx
	testl	%ecx, %ecx
	jne	.L6807
	movl	stbi__vertically_flip_on_load_global(%rip), %eax
	testl	%eax, %eax
	je	.L6763
.L6781:
	testl	%ebp, %ebp
	jne	.L6783
	movl	(%r14), %ebp
.L6783:
	movl	0(%r13), %edx
	movl	(%r12), %esi
	leal	(%rbp,%rbp), %ecx
	movq	%rbx, %rdi
	call	stbi__vertical_flip
.L6763:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6808
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6807:
	.cfi_restore_state
	movl	%fs:stbi__vertically_flip_on_load_local@tpoff, %edx
	testl	%edx, %edx
	jne	.L6781
	jmp	.L6763
	.p2align 4,,10
	.p2align 3
.L6806:
	movl	(%r14), %eax
	jmp	.L6767
	.p2align 4,,10
	.p2align 3
.L6787:
	cmpl	$14, %eax
	jbe	.L6786
	movl	%edx, %ecx
	xorl	%eax, %eax
	pxor	%xmm3, %xmm3
	shrl	$4, %ecx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L6774:
	movdqu	(%rbx,%rax), %xmm0
	movdqa	%xmm0, %xmm2
	punpckhbw	%xmm3, %xmm0
	punpcklbw	%xmm3, %xmm2
	movdqa	%xmm2, %xmm1
	psllw	$8, %xmm1
	paddw	%xmm2, %xmm1
	movups	%xmm1, (%r15,%rax,2)
	movdqa	%xmm0, %xmm1
	psllw	$8, %xmm1
	paddw	%xmm1, %xmm0
	movups	%xmm0, 16(%r15,%rax,2)
	addq	$16, %rax
	cmpq	%rcx, %rax
	jne	.L6774
	movl	%edx, %eax
	andl	$-16, %eax
	movl	%eax, %ecx
	cmpl	%eax, %edx
	je	.L6770
	movl	%edx, %edi
	subl	%eax, %edi
	leal	-1(%rdi), %esi
	cmpl	$6, %esi
	jbe	.L6776
.L6773:
	movq	(%rbx,%rcx), %xmm0
	pxor	%xmm2, %xmm2
	leaq	(%r15,%rcx,2), %rsi
	movl	%edi, %ecx
	andl	$-8, %ecx
	movdqa	%xmm0, %xmm3
	punpcklbw	%xmm2, %xmm0
	addl	%ecx, %eax
	andl	$7, %edi
	punpcklbw	%xmm2, %xmm3
	pshufd	$78, %xmm0, %xmm0
	movdqa	%xmm3, %xmm1
	psllw	$8, %xmm1
	paddw	%xmm3, %xmm1
	movq	%xmm1, (%rsi)
	movdqa	%xmm0, %xmm1
	psllw	$8, %xmm1
	paddw	%xmm1, %xmm0
	movq	%xmm0, 8(%rsi)
	je	.L6770
.L6776:
	movslq	%eax, %rsi
	movzbl	(%rbx,%rsi), %r8d
	leaq	(%rsi,%rsi), %rcx
	movl	%r8d, %edi
	sall	$8, %edi
	addl	%r8d, %edi
	movw	%di, (%r15,%rsi,2)
	leal	1(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6770
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 2(%r15,%rcx)
	leal	2(%rax), %esi
	cmpl	%edx, %esi
	jge	.L6770
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 4(%r15,%rcx)
	leal	3(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6770
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 6(%r15,%rcx)
	leal	4(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6770
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 8(%r15,%rcx)
	leal	5(%rax), %esi
	cmpl	%esi, %edx
	jle	.L6770
	movslq	%esi, %rsi
	addl	$6, %eax
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	sall	$8, %esi
	addl	%edi, %esi
	movw	%si, 10(%r15,%rcx)
	cmpl	%eax, %edx
	jle	.L6770
	cltq
	movzbl	(%rbx,%rax), %edx
	movl	%edx, %eax
	sall	$8, %eax
	addl	%edx, %eax
	movw	%ax, 12(%r15,%rcx)
	jmp	.L6770
.L6786:
	xorl	%eax, %eax
	jmp	.L6773
.L6808:
	call	__stack_chk_fail@PLT
.L6805:
	leaq	__PRETTY_FUNCTION__.33(%rip), %rcx
	movl	$1293, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC238(%rip), %rdi
	call	__assert_fail@PLT
.L6768:
	leaq	.LC18(%rip), %rax
	xorl	%ebx, %ebx
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6766
	.cfi_endproc
.LFE573:
	.size	stbi__load_and_postprocess_16bit, .-stbi__load_and_postprocess_16bit
	.p2align 4
	.globl	stbi_failure_reason
	.type	stbi_failure_reason, @function
stbi_failure_reason:
.LFB551:
	.cfi_startproc
	movq	%fs:stbi__g_failure_reason@tpoff, %rax
	ret
	.cfi_endproc
.LFE551:
	.size	stbi_failure_reason, .-stbi_failure_reason
	.p2align 4
	.globl	stbi_image_free
	.type	stbi_image_free, @function
stbi_image_free:
.LFB564:
	.cfi_startproc
	jmp	free@PLT
	.cfi_endproc
.LFE564:
	.size	stbi_image_free, .-stbi_image_free
	.p2align 4
	.globl	stbi_set_flip_vertically_on_load
	.type	stbi_set_flip_vertically_on_load, @function
stbi_set_flip_vertically_on_load:
.LFB565:
	.cfi_startproc
	movl	%edi, stbi__vertically_flip_on_load_global(%rip)
	ret
	.cfi_endproc
.LFE565:
	.size	stbi_set_flip_vertically_on_load, .-stbi_set_flip_vertically_on_load
	.p2align 4
	.globl	stbi_set_flip_vertically_on_load_thread
	.type	stbi_set_flip_vertically_on_load_thread, @function
stbi_set_flip_vertically_on_load_thread:
.LFB566:
	.cfi_startproc
	movl	%edi, %fs:stbi__vertically_flip_on_load_local@tpoff
	movl	$1, %fs:stbi__vertically_flip_on_load_set@tpoff
	ret
	.cfi_endproc
.LFE566:
	.size	stbi_set_flip_vertically_on_load_thread, .-stbi_set_flip_vertically_on_load_thread
	.section	.rodata.str1.1
.LC243:
	.string	"rb"
.LC244:
	.string	"can't fopen"
	.text
	.p2align 4
	.globl	stbi_load
	.type	stbi_load, @function
stbi_load:
.LFB576:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	leaq	.LC243(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L6824
	movq	%rax, %rbx
	leaq	56(%rsp), %r15
	movl	$128, %edx
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movq	%rbx, 40(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r15, 208(%rsp)
	movq	%r15, 192(%rsp)
	movaps	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L6825
	cltq
	addq	%r15, %rax
.L6817:
	movq	%rbp, %rsi
	movq	%rsp, %rdi
	movl	%r14d, %r8d
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rax, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__load_and_postprocess_8bit
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L6818
	movl	192(%rsp), %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	subl	200(%rsp), %esi
	movslq	%esi, %rsi
	call	fseek@PLT
.L6818:
	movq	%rbx, %rdi
	call	fclose@PLT
.L6813:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6826
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6825:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
	jmp	.L6817
.L6826:
	call	__stack_chk_fail@PLT
.L6824:
	leaq	.LC244(%rip), %rax
	xorl	%ebp, %ebp
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6813
	.cfi_endproc
.LFE576:
	.size	stbi_load, .-stbi_load
	.p2align 4
	.globl	stbi_load_from_file
	.type	stbi_load_from_file, @function
stbi_load_from_file:
.LFB577:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	movl	$128, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %r15
	movq	%rdi, 40(%rsp)
	movq	%r15, %rsi
	movq	%r15, 208(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r15, 192(%rsp)
	movaps	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6828
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L6829:
	movq	%rbp, %rsi
	movq	%rsp, %rdi
	movl	%r14d, %r8d
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rax, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__load_and_postprocess_8bit
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L6827
	movl	192(%rsp), %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	subl	200(%rsp), %esi
	movslq	%esi, %rsi
	call	fseek@PLT
.L6827:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6836
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6828:
	.cfi_restore_state
	cltq
	addq	%r15, %rax
	jmp	.L6829
.L6836:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE577:
	.size	stbi_load_from_file, .-stbi_load_from_file
	.p2align 4
	.globl	stbi_load_from_file_16
	.type	stbi_load_from_file_16, @function
stbi_load_from_file_16:
.LFB578:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	movl	$128, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %r15
	movq	%rdi, 40(%rsp)
	movq	%r15, %rsi
	movq	%r15, 208(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r15, 192(%rsp)
	movaps	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6838
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L6839:
	movq	%rbp, %rsi
	movq	%rsp, %rdi
	movl	%r14d, %r8d
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rax, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__load_and_postprocess_16bit
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L6837
	movl	192(%rsp), %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	subl	200(%rsp), %esi
	movslq	%esi, %rsi
	call	fseek@PLT
.L6837:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6846
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6838:
	.cfi_restore_state
	cltq
	addq	%r15, %rax
	jmp	.L6839
.L6846:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE578:
	.size	stbi_load_from_file_16, .-stbi_load_from_file_16
	.p2align 4
	.globl	stbi_load_16
	.type	stbi_load_16, @function
stbi_load_16:
.LFB579:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	leaq	.LC243(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L6858
	movq	%rax, %rbx
	leaq	56(%rsp), %r15
	movl	$128, %edx
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movq	%rbx, 40(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r15, 208(%rsp)
	movq	%r15, 192(%rsp)
	movaps	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L6859
	cltq
	addq	%r15, %rax
.L6851:
	movq	%rbp, %rsi
	movq	%rsp, %rdi
	movl	%r14d, %r8d
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rax, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__load_and_postprocess_16bit
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L6852
	movl	192(%rsp), %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	subl	200(%rsp), %esi
	movslq	%esi, %rsi
	call	fseek@PLT
.L6852:
	movq	%rbx, %rdi
	call	fclose@PLT
.L6847:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6860
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6859:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
	jmp	.L6851
.L6860:
	call	__stack_chk_fail@PLT
.L6858:
	leaq	.LC244(%rip), %rax
	xorl	%ebp, %ebp
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6847
	.cfi_endproc
.LFE579:
	.size	stbi_load_16, .-stbi_load_16
	.p2align 4
	.globl	stbi_load_16_from_memory
	.type	stbi_load_16_from_memory, @function
stbi_load_16_from_memory:
.LFB580:
	.cfi_startproc
	movslq	%esi, %rax
	subq	$248, %rsp
	.cfi_def_cfa_offset 256
	movq	%rdi, %xmm0
	movq	%rdx, %rsi
	addq	%rdi, %rax
	movq	%rcx, %rdx
	movq	%rsp, %rdi
	movq	%r8, %rcx
	movq	%rax, %xmm1
	movl	%r9d, %r8d
	movq	%fs:40, %r9
	movq	%r9, 232(%rsp)
	xorl	%r9d, %r9d
	punpcklqdq	%xmm1, %xmm0
	movl	$0, 48(%rsp)
	movq	$0, 16(%rsp)
	movl	$0, 184(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	call	stbi__load_and_postprocess_16bit
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6864
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L6864:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE580:
	.size	stbi_load_16_from_memory, .-stbi_load_16_from_memory
	.p2align 4
	.globl	stbi_load_16_from_callbacks
	.type	stbi_load_16_from_callbacks, @function
stbi_load_16_from_callbacks:
.LFB581:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %rax
	movq	%rsi, %rdi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%r9d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdx, %rbx
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	movdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	movq	16(%rax), %rax
	leaq	56(%rsp), %r14
	movq	%rsi, 40(%rsp)
	movl	$128, %edx
	movaps	%xmm0, 16(%rsp)
	movq	%r14, %rsi
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r14, 208(%rsp)
	movq	%r14, 192(%rsp)
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6866
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L6867:
	movq	%rbp, %rdx
	movq	%rsp, %rdi
	movl	%r13d, %r8d
	movq	%r12, %rcx
	movq	%rbx, %rsi
	movq	%rax, 200(%rsp)
	movq	%r14, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__load_and_postprocess_16bit
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6870
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6866:
	.cfi_restore_state
	cltq
	addq	%r14, %rax
	jmp	.L6867
.L6870:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE581:
	.size	stbi_load_16_from_callbacks, .-stbi_load_16_from_callbacks
	.p2align 4
	.globl	stbi_load_from_memory
	.type	stbi_load_from_memory, @function
stbi_load_from_memory:
.LFB582:
	.cfi_startproc
	movslq	%esi, %rax
	subq	$248, %rsp
	.cfi_def_cfa_offset 256
	movq	%rdi, %xmm0
	movq	%rdx, %rsi
	addq	%rdi, %rax
	movq	%rcx, %rdx
	movq	%rsp, %rdi
	movq	%r8, %rcx
	movq	%rax, %xmm1
	movl	%r9d, %r8d
	movq	%fs:40, %r9
	movq	%r9, 232(%rsp)
	xorl	%r9d, %r9d
	punpcklqdq	%xmm1, %xmm0
	movl	$0, 48(%rsp)
	movq	$0, 16(%rsp)
	movl	$0, 184(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	call	stbi__load_and_postprocess_8bit
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6874
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L6874:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE582:
	.size	stbi_load_from_memory, .-stbi_load_from_memory
	.p2align 4
	.globl	stbi_load_from_callbacks
	.type	stbi_load_from_callbacks, @function
stbi_load_from_callbacks:
.LFB583:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %rax
	movq	%rsi, %rdi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%r9d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdx, %rbx
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	movdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	movq	16(%rax), %rax
	leaq	56(%rsp), %r14
	movq	%rsi, 40(%rsp)
	movl	$128, %edx
	movaps	%xmm0, 16(%rsp)
	movq	%r14, %rsi
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r14, 208(%rsp)
	movq	%r14, 192(%rsp)
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6876
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L6877:
	movq	%rbp, %rdx
	movq	%rsp, %rdi
	movl	%r13d, %r8d
	movq	%r12, %rcx
	movq	%rbx, %rsi
	movq	%rax, 200(%rsp)
	movq	%r14, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__load_and_postprocess_8bit
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6880
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6876:
	.cfi_restore_state
	cltq
	addq	%r14, %rax
	jmp	.L6877
.L6880:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE583:
	.size	stbi_load_from_callbacks, .-stbi_load_from_callbacks
	.p2align 4
	.globl	stbi_load_gif_from_memory
	.type	stbi_load_gif_from_memory, @function
stbi_load_gif_from_memory:
.LFB584:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%esi, %rax
	movq	%rdi, %xmm0
	movq	%rdx, %rsi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	addq	%rdi, %rax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rax, %xmm1
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	punpcklqdq	%xmm1, %xmm0
	movq	%r9, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r8, %rbp
	movq	%r12, %r8
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbx
	movq	%rbp, %rcx
	subq	$2328, %rsp
	.cfi_def_cfa_offset 2384
	movq	%fs:40, %rdx
	movq	%rdx, 2312(%rsp)
	xorl	%edx, %edx
	movq	2384(%rsp), %r13
	leaq	32(%rsp), %rdi
	movq	%rbx, %rdx
	movq	$0, 48(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 2392
	movl	$0, 88(%rsp)
	movq	%r13, %r9
	movl	$0, 224(%rsp)
	movaps	%xmm0, 232(%rsp)
	movaps	%xmm0, 248(%rsp)
	movl	2400(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 2400
	call	stbi__load_gif_main.constprop.0
	popq	%rsi
	.cfi_def_cfa_offset 2392
	popq	%rdi
	.cfi_def_cfa_offset 2384
	movl	%fs:stbi__vertically_flip_on_load_set@tpoff, %r8d
	testl	%r8d, %r8d
	je	.L6882
	movl	%fs:stbi__vertically_flip_on_load_local@tpoff, %ecx
	testl	%ecx, %ecx
	jne	.L6883
.L6881:
	movq	2312(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6930
	addq	$2328, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L6882:
	.cfi_restore_state
	movl	stbi__vertically_flip_on_load_global(%rip), %edx
	testl	%edx, %edx
	je	.L6881
.L6883:
	movslq	0(%rbp), %rdx
	movslq	(%rbx), %rsi
	movslq	0(%r13), %rcx
	movl	(%r12), %r15d
	movl	%edx, %edi
	imull	%esi, %edi
	imull	%ecx, %edi
	testl	%r15d, %r15d
	jle	.L6881
	imulq	%rcx, %rsi
	movl	%edx, %r13d
	subq	$1, %rdx
	movslq	%edi, %r14
	sarl	%r13d
	xorl	%r8d, %r8d
	imulq	%rsi, %rdx
	movq	%rsi, %r12
	movq	%rdx, 16(%rsp)
	movq	%rax, %rdx
.L6886:
	testl	%r13d, %r13d
	jle	.L6887
	testq	%r12, %r12
	je	.L6887
	movl	%r15d, 28(%rsp)
	leaq	256(%rsp), %r10
	.p2align 4,,10
	.p2align 3
.L6889:
	movq	16(%rsp), %rbx
	movl	%r8d, 24(%rsp)
	movq	%r14, %r15
	movq	%rdx, %rbp
	movq	%rdx, 8(%rsp)
	xorl	%r11d, %r11d
	movq	%rax, %r14
	addq	%rdx, %rbx
	.p2align 4,,10
	.p2align 3
.L6902:
	movl	%r11d, 4(%rsp)
	movq	%rbp, %r8
	movq	%rbx, %rdx
	movq	%r12, %r9
	jmp	.L6888
	.p2align 4,,10
	.p2align 3
.L6936:
	testb	$4, %al
	jne	.L6931
	testl	%eax, %eax
	je	.L6899
	movzbl	(%r10), %ecx
	movb	%cl, (%rdx)
	testb	$2, %al
	jne	.L6932
.L6899:
	addq	%rax, %r8
	addq	%rax, %rdx
	subq	%rax, %r9
	je	.L6933
.L6888:
	movl	$2048, %eax
	movq	%r10, %rdi
	movq	%r8, %rsi
	cmpq	%rax, %r9
	cmovbe	%r9, %rax
	cmpl	$8, %eax
	jb	.L6890
	movl	%eax, %ecx
	shrl	$3, %ecx
	rep movsq
.L6890:
	xorl	%ecx, %ecx
	testb	$4, %al
	je	.L6891
	movl	(%rsi), %ecx
	movl	%ecx, (%rdi)
	movl	$4, %ecx
.L6891:
	testb	$2, %al
	je	.L6892
	movzwl	(%rsi,%rcx), %r11d
	movw	%r11w, (%rdi,%rcx)
	addq	$2, %rcx
.L6892:
	testb	$1, %al
	je	.L6893
	movzbl	(%rsi,%rcx), %esi
	movb	%sil, (%rdi,%rcx)
.L6893:
	cmpl	$8, %eax
	jnb	.L6894
	testb	$4, %al
	jne	.L6934
	testl	%eax, %eax
	je	.L6895
	movzbl	(%rdx), %ecx
	movb	%cl, (%r8)
	testb	$2, %al
	jne	.L6935
.L6895:
	cmpl	$8, %eax
	jb	.L6936
	movq	(%r10), %rcx
	leaq	8(%rdx), %rdi
	addq	%rax, %r8
	andq	$-8, %rdi
	movq	%rcx, (%rdx)
	movl	%eax, %ecx
	movq	-8(%r10,%rcx), %rsi
	movq	%rsi, -8(%rdx,%rcx)
	movq	%rdx, %rcx
	movq	%r10, %rsi
	addq	%rax, %rdx
	subq	%rdi, %rcx
	subq	%rcx, %rsi
	addl	%eax, %ecx
	shrl	$3, %ecx
	rep movsq
	subq	%rax, %r9
	jne	.L6888
.L6933:
	movl	4(%rsp), %r11d
	addq	%r12, %rbp
	subq	%r12, %rbx
	addl	$1, %r11d
	cmpl	%r13d, %r11d
	jne	.L6902
	movl	24(%rsp), %r8d
	movq	8(%rsp), %rdx
	movq	%r14, %rax
	movq	%r15, %r14
	addq	%r15, %rdx
	addl	$1, %r8d
	cmpl	%r8d, 28(%rsp)
	jne	.L6889
	jmp	.L6881
	.p2align 4,,10
	.p2align 3
.L6894:
	movq	(%rdx), %rcx
	leaq	8(%r8), %rdi
	andq	$-8, %rdi
	movq	%rcx, (%r8)
	movl	%eax, %ecx
	movq	-8(%rdx,%rcx), %rsi
	movq	%rsi, -8(%r8,%rcx)
	movq	%r8, %rcx
	movq	%rdx, %rsi
	subq	%rdi, %rcx
	subq	%rcx, %rsi
	addl	%eax, %ecx
	shrl	$3, %ecx
	rep movsq
	jmp	.L6895
	.p2align 4,,10
	.p2align 3
.L6931:
	movl	(%r10), %ecx
	movl	%ecx, (%rdx)
	movl	%eax, %ecx
	movl	-4(%r10,%rcx), %esi
	movl	%esi, -4(%rdx,%rcx)
	jmp	.L6899
	.p2align 4,,10
	.p2align 3
.L6934:
	movl	(%rdx), %ecx
	movl	%ecx, (%r8)
	movl	%eax, %ecx
	movl	-4(%rdx,%rcx), %esi
	movl	%esi, -4(%r8,%rcx)
	jmp	.L6895
	.p2align 4,,10
	.p2align 3
.L6935:
	movl	%eax, %ecx
	movzwl	-2(%rdx,%rcx), %esi
	movw	%si, -2(%r8,%rcx)
	jmp	.L6895
	.p2align 4,,10
	.p2align 3
.L6932:
	movl	%eax, %ecx
	movzwl	-2(%r10,%rcx), %esi
	movw	%si, -2(%rdx,%rcx)
	jmp	.L6899
.L6887:
	addl	$1, %r8d
	addq	%r14, %rdx
	cmpl	%r8d, %r15d
	jne	.L6886
	jmp	.L6881
.L6930:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE584:
	.size	stbi_load_gif_from_memory, .-stbi_load_gif_from_memory
	.p2align 4
	.globl	stbi_loadf_from_memory
	.type	stbi_loadf_from_memory, @function
stbi_loadf_from_memory:
.LFB586:
	.cfi_startproc
	movslq	%esi, %rax
	subq	$248, %rsp
	.cfi_def_cfa_offset 256
	movq	%rdi, %xmm0
	movq	%rdx, %rsi
	addq	%rdi, %rax
	movq	%rcx, %rdx
	movq	%rsp, %rdi
	movq	%r8, %rcx
	movq	%rax, %xmm1
	movl	%r9d, %r8d
	movq	%fs:40, %r9
	movq	%r9, 232(%rsp)
	xorl	%r9d, %r9d
	punpcklqdq	%xmm1, %xmm0
	movl	$0, 48(%rsp)
	movq	$0, 16(%rsp)
	movl	$0, 184(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	call	stbi__loadf_main
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6940
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L6940:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE586:
	.size	stbi_loadf_from_memory, .-stbi_loadf_from_memory
	.p2align 4
	.globl	stbi_loadf_from_callbacks
	.type	stbi_loadf_from_callbacks, @function
stbi_loadf_from_callbacks:
.LFB587:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %rax
	movq	%rsi, %rdi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%r9d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdx, %rbx
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	movdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	movq	16(%rax), %rax
	leaq	56(%rsp), %r14
	movq	%rsi, 40(%rsp)
	movl	$128, %edx
	movaps	%xmm0, 16(%rsp)
	movq	%r14, %rsi
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r14, 208(%rsp)
	movq	%r14, 192(%rsp)
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6942
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L6943:
	movq	%rbp, %rdx
	movq	%rsp, %rdi
	movl	%r13d, %r8d
	movq	%r12, %rcx
	movq	%rbx, %rsi
	movq	%rax, 200(%rsp)
	movq	%r14, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__loadf_main
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6946
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6942:
	.cfi_restore_state
	cltq
	addq	%r14, %rax
	jmp	.L6943
.L6946:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE587:
	.size	stbi_loadf_from_callbacks, .-stbi_loadf_from_callbacks
	.p2align 4
	.globl	stbi_loadf
	.type	stbi_loadf, @function
stbi_loadf:
.LFB588:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%r8d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	leaq	.LC243(%rip), %rsi
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L6954
	movq	%rax, %r14
	leaq	56(%rsp), %r15
	movl	$128, %edx
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%r14, 40(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r15, 208(%rsp)
	movq	%r15, 192(%rsp)
	movaps	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L6955
	cltq
	addq	%r15, %rax
.L6951:
	movq	%rsp, %rdi
	movq	%rbx, %rsi
	movl	%r13d, %r8d
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movq	%rax, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__loadf_main
	movq	%r14, %rdi
	movq	%rax, %rbx
	call	fclose@PLT
.L6947:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6956
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6955:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
	jmp	.L6951
.L6956:
	call	__stack_chk_fail@PLT
.L6954:
	leaq	.LC244(%rip), %rax
	xorl	%ebx, %ebx
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L6947
	.cfi_endproc
.LFE588:
	.size	stbi_loadf, .-stbi_loadf
	.p2align 4
	.globl	stbi_loadf_from_file
	.type	stbi_loadf_from_file, @function
stbi_loadf_from_file:
.LFB589:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%r8d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdx, %rbp
	movl	$128, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rsi, %rbx
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	movdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	movq	16+stbi__stdio_callbacks(%rip), %rax
	leaq	56(%rsp), %r14
	movq	%rdi, 40(%rsp)
	movq	%r14, %rsi
	movq	%r14, 208(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r14, 192(%rsp)
	movaps	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6958
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L6959:
	movq	%rbp, %rdx
	movq	%rsp, %rdi
	movl	%r13d, %r8d
	movq	%r12, %rcx
	movq	%rbx, %rsi
	movq	%rax, 200(%rsp)
	movq	%r14, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__loadf_main
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6962
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6958:
	.cfi_restore_state
	cltq
	addq	%r14, %rax
	jmp	.L6959
.L6962:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE589:
	.size	stbi_loadf_from_file, .-stbi_loadf_from_file
	.p2align 4
	.globl	stbi_is_hdr_from_memory
	.type	stbi_is_hdr_from_memory, @function
stbi_is_hdr_from_memory:
.LFB590:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movslq	%esi, %rsi
	movq	%rdi, %xmm0
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	addq	%rdi, %rsi
	leaq	1+.LC64(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %xmm2
	movl	$35, %ebx
	punpcklqdq	%xmm2, %xmm0
	subq	$240, %rsp
	.cfi_def_cfa_offset 272
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	movl	$0, 48(%rsp)
	leaq	56(%rsp), %r12
	movq	$0, 16(%rsp)
	movl	$0, 184(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	.p2align 4,,10
	.p2align 3
.L6968:
	cmpq	%rsi, %rdi
	jb	.L6983
	movl	48(%rsp), %edx
	testl	%edx, %edx
	jne	.L6984
.L6966:
	movdqa	208(%rsp), %xmm1
	movq	216(%rsp), %rdx
	leaq	1+.LC65(%rip), %r12
	movl	$35, %ebx
	movq	208(%rsp), %rax
	movaps	%xmm1, 192(%rsp)
.L6974:
	cmpq	%rdx, %rax
	jb	.L6985
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L6972
.L6973:
	xorl	%eax, %eax
.L6963:
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L6986
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6983:
	.cfi_restore_state
	leaq	1(%rdi), %rax
	movq	%rax, 192(%rsp)
	movzbl	(%rdi), %edx
	movq	%rax, %rdi
.L6965:
	cmpl	%edx, %ebx
	jne	.L6966
	movsbl	0(%rbp), %ebx
	addq	$1, %rbp
	testb	%bl, %bl
	jne	.L6968
	movl	$1, %eax
	jmp	.L6963
	.p2align 4,,10
	.p2align 3
.L6984:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r12, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6967
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	jmp	.L6966
	.p2align 4,,10
	.p2align 3
.L6985:
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%rsp)
	movzbl	(%rax), %esi
	movq	%rcx, %rax
.L6971:
	cmpl	%esi, %ebx
	jne	.L6973
	movsbl	(%r12), %ebx
	addq	$1, %r12
	testb	%bl, %bl
	jne	.L6974
	movl	$1, %eax
	jmp	.L6963
	.p2align 4,,10
	.p2align 3
.L6967:
	cltq
	leaq	57(%rsp), %rdi
	movzbl	56(%rsp), %edx
	leaq	(%r12,%rax), %rsi
	movq	%rdi, 192(%rsp)
	movq	%rsi, 200(%rsp)
	jmp	.L6965
	.p2align 4,,10
	.p2align 3
.L6972:
	leaq	56(%rsp), %rbp
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%rbp, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L6973
	cltq
	movzbl	56(%rsp), %esi
	leaq	0(%rbp,%rax), %rdx
	leaq	57(%rsp), %rax
	movq	%rdx, 200(%rsp)
	movq	%rax, 192(%rsp)
	jmp	.L6971
.L6986:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE590:
	.size	stbi_is_hdr_from_memory, .-stbi_is_hdr_from_memory
	.p2align 4
	.globl	stbi_is_hdr
	.type	stbi_is_hdr, @function
stbi_is_hdr:
.LFB591:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	.LC243(%rip), %rsi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L7004
	movq	%rax, %rdi
	movq	%rax, %r12
	leaq	56(%rsp), %r14
	call	ftell@PLT
	movl	$128, %edx
	movq	%r14, %rsi
	movq	%r12, %rdi
	movq	%rax, %r13
	movq	%r12, 40(%rsp)
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movdqa	stbi__stdio_callbacks(%rip), %xmm1
	movq	%r14, 208(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r14, 192(%rsp)
	movaps	%xmm1, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7008
	cltq
	addq	%r14, %rax
.L6990:
	movq	%rax, 200(%rsp)
	leaq	1+.LC64(%rip), %rbp
	movl	$35, %ebx
	movq	%rax, 216(%rsp)
	movq	%r14, 192(%rsp)
	leaq	56(%rsp), %r14
	movq	%r14, %rdx
	.p2align 4,,10
	.p2align 3
.L6995:
	cmpq	%rax, %rdx
	jb	.L7009
	movl	48(%rsp), %edx
	testl	%edx, %edx
	jne	.L7010
.L6993:
	movdqa	208(%rsp), %xmm0
	movq	216(%rsp), %rdx
	leaq	1+.LC65(%rip), %rbp
	movl	$35, %ebx
	movq	208(%rsp), %rax
	movaps	%xmm0, 192(%rsp)
.L7002:
	cmpq	%rdx, %rax
	jb	.L7011
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L7012
.L6999:
	xorl	%ebx, %ebx
.L7001:
	movq	208(%rsp), %rax
	movq	%rax, 192(%rsp)
	movq	216(%rsp), %rax
.L6996:
	movq	%r12, %rdi
	xorl	%edx, %edx
	movq	%r13, %rsi
	movq	%rax, 200(%rsp)
	call	fseek@PLT
	movq	%r12, %rdi
	call	fclose@PLT
.L6987:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7013
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7008:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
	jmp	.L6990
	.p2align 4,,10
	.p2align 3
.L7012:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7000
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	jmp	.L6999
	.p2align 4,,10
	.p2align 3
.L7009:
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rsp)
	movzbl	(%rdx), %esi
	movq	%rcx, %rdx
.L6992:
	cmpl	%esi, %ebx
	jne	.L6993
	movsbl	0(%rbp), %ebx
	addq	$1, %rbp
	testb	%bl, %bl
	jne	.L6995
	movq	208(%rsp), %rax
	movl	$1, %ebx
	movq	%rax, 192(%rsp)
	movq	216(%rsp), %rax
	jmp	.L6996
	.p2align 4,,10
	.p2align 3
.L7010:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L6994
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	jmp	.L6993
	.p2align 4,,10
	.p2align 3
.L7011:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rsp)
	movzbl	(%rax), %edx
.L6998:
	cmpl	%ebx, %edx
	jne	.L6999
	movsbl	0(%rbp), %ebx
	addq	$1, %rbp
	testb	%bl, %bl
	je	.L7005
	movq	192(%rsp), %rax
	movq	200(%rsp), %rdx
	jmp	.L7002
	.p2align 4,,10
	.p2align 3
.L6994:
	cltq
	leaq	57(%rsp), %rdx
	movzbl	56(%rsp), %esi
	addq	%r14, %rax
	movq	%rdx, 192(%rsp)
	movq	%rax, 200(%rsp)
	jmp	.L6992
	.p2align 4,,10
	.p2align 3
.L7000:
	cltq
	movzbl	56(%rsp), %edx
	addq	%r14, %rax
	movq	%rax, 200(%rsp)
	leaq	57(%rsp), %rax
	movq	%rax, 192(%rsp)
	jmp	.L6998
	.p2align 4,,10
	.p2align 3
.L7005:
	movl	$1, %ebx
	jmp	.L7001
.L7013:
	call	__stack_chk_fail@PLT
.L7004:
	xorl	%ebx, %ebx
	jmp	.L6987
	.cfi_endproc
.LFE591:
	.size	stbi_is_hdr, .-stbi_is_hdr
	.p2align 4
	.globl	stbi_is_hdr_from_file
	.type	stbi_is_hdr_from_file, @function
stbi_is_hdr_from_file:
.LFB592:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$240, %rsp
	.cfi_def_cfa_offset 288
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	56(%rsp), %r14
	call	ftell@PLT
	movl	$128, %edx
	movq	%r14, %rsi
	movq	%r12, %rdi
	movq	%rax, %r13
	movq	%r12, 40(%rsp)
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movdqa	stbi__stdio_callbacks(%rip), %xmm1
	movq	%r14, 208(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r14, 192(%rsp)
	movaps	%xmm1, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7015
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L7016:
	movq	%rax, 200(%rsp)
	leaq	1+.LC64(%rip), %rbp
	movl	$35, %ebx
	movq	%rax, 216(%rsp)
	movq	%r14, 192(%rsp)
	leaq	56(%rsp), %r14
	movq	%r14, %rdx
	.p2align 4,,10
	.p2align 3
.L7021:
	cmpq	%rax, %rdx
	jb	.L7033
	movl	48(%rsp), %edx
	testl	%edx, %edx
	jne	.L7034
.L7019:
	movdqa	208(%rsp), %xmm0
	movq	216(%rsp), %rdx
	leaq	1+.LC65(%rip), %rbp
	movl	$35, %ebx
	movq	208(%rsp), %rax
	movaps	%xmm0, 192(%rsp)
.L7028:
	cmpq	%rdx, %rax
	jb	.L7035
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L7036
.L7025:
	xorl	%ebx, %ebx
.L7027:
	movq	208(%rsp), %rax
	movq	%rax, 192(%rsp)
	movq	216(%rsp), %rax
.L7022:
	xorl	%edx, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	movq	%rax, 200(%rsp)
	call	fseek@PLT
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7037
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7033:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rsp)
	movzbl	(%rdx), %esi
	movq	%rcx, %rdx
.L7018:
	cmpl	%esi, %ebx
	jne	.L7019
	movsbl	0(%rbp), %ebx
	addq	$1, %rbp
	testb	%bl, %bl
	jne	.L7021
	movq	208(%rsp), %rax
	movl	$1, %ebx
	movq	%rax, 192(%rsp)
	movq	216(%rsp), %rax
	jmp	.L7022
	.p2align 4,,10
	.p2align 3
.L7034:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7020
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	jmp	.L7019
	.p2align 4,,10
	.p2align 3
.L7035:
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rsp)
	movzbl	(%rax), %edx
.L7024:
	cmpl	%ebx, %edx
	jne	.L7025
	movsbl	0(%rbp), %ebx
	addq	$1, %rbp
	testb	%bl, %bl
	je	.L7030
	movq	192(%rsp), %rax
	movq	200(%rsp), %rdx
	jmp	.L7028
	.p2align 4,,10
	.p2align 3
.L7020:
	cltq
	leaq	57(%rsp), %rdx
	movzbl	56(%rsp), %esi
	addq	%r14, %rax
	movq	%rdx, 192(%rsp)
	movq	%rax, 200(%rsp)
	jmp	.L7018
	.p2align 4,,10
	.p2align 3
.L7015:
	cltq
	addq	%r14, %rax
	jmp	.L7016
	.p2align 4,,10
	.p2align 3
.L7036:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r14, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7026
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	jmp	.L7025
	.p2align 4,,10
	.p2align 3
.L7026:
	cltq
	movzbl	56(%rsp), %edx
	addq	%r14, %rax
	movq	%rax, 200(%rsp)
	leaq	57(%rsp), %rax
	movq	%rax, 192(%rsp)
	jmp	.L7024
	.p2align 4,,10
	.p2align 3
.L7030:
	movl	$1, %ebx
	jmp	.L7027
.L7037:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE592:
	.size	stbi_is_hdr_from_file, .-stbi_is_hdr_from_file
	.p2align 4
	.globl	stbi_is_hdr_from_callbacks
	.type	stbi_is_hdr_from_callbacks, @function
stbi_is_hdr_from_callbacks:
.LFB593:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %rax
	movq	%rsi, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$240, %rsp
	.cfi_def_cfa_offset 272
	movdqu	(%rax), %xmm1
	movq	(%rax), %rcx
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	movq	16(%rax), %rax
	leaq	56(%rsp), %r12
	movq	%rsi, 40(%rsp)
	movl	$128, %edx
	movaps	%xmm1, 16(%rsp)
	movq	%r12, %rsi
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r12, 208(%rsp)
	movq	%r12, 192(%rsp)
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7039
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L7040:
	movq	%rax, 200(%rsp)
	leaq	1+.LC64(%rip), %rbp
	movl	$35, %ebx
	movq	%rax, 216(%rsp)
	movq	%r12, 192(%rsp)
	leaq	56(%rsp), %r12
	movq	%r12, %rdx
	.p2align 4,,10
	.p2align 3
.L7045:
	cmpq	%rax, %rdx
	jb	.L7060
	movl	48(%rsp), %edx
	testl	%edx, %edx
	jne	.L7061
.L7043:
	movdqa	208(%rsp), %xmm0
	movq	216(%rsp), %rdx
	leaq	1+.LC65(%rip), %rbp
	movl	$35, %ebx
	movq	208(%rsp), %rax
	movaps	%xmm0, 192(%rsp)
.L7051:
	cmpq	%rdx, %rax
	jb	.L7062
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jne	.L7049
.L7050:
	xorl	%eax, %eax
.L7038:
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7063
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7060:
	.cfi_restore_state
	leaq	1(%rdx), %rcx
	movq	%rcx, 192(%rsp)
	movzbl	(%rdx), %esi
	movq	%rcx, %rdx
.L7042:
	cmpl	%esi, %ebx
	jne	.L7043
	movsbl	0(%rbp), %ebx
	addq	$1, %rbp
	testb	%bl, %bl
	jne	.L7045
	movl	$1, %eax
	jmp	.L7038
	.p2align 4,,10
	.p2align 3
.L7061:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r12, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7044
	movl	$0, 48(%rsp)
	movb	$0, 56(%rsp)
	jmp	.L7043
	.p2align 4,,10
	.p2align 3
.L7062:
	leaq	1(%rax), %rcx
	movq	%rcx, 192(%rsp)
	movzbl	(%rax), %esi
	movq	%rcx, %rax
.L7048:
	cmpl	%ebx, %esi
	jne	.L7050
	movsbl	0(%rbp), %ebx
	addq	$1, %rbp
	testb	%bl, %bl
	jne	.L7051
	movl	$1, %eax
	jmp	.L7038
	.p2align 4,,10
	.p2align 3
.L7044:
	cltq
	leaq	57(%rsp), %rdx
	movzbl	56(%rsp), %esi
	addq	%r12, %rax
	movq	%rdx, 192(%rsp)
	movq	%rax, 200(%rsp)
	jmp	.L7042
	.p2align 4,,10
	.p2align 3
.L7039:
	cltq
	addq	%r12, %rax
	jmp	.L7040
	.p2align 4,,10
	.p2align 3
.L7049:
	movl	52(%rsp), %edx
	movq	40(%rsp), %rdi
	movq	%r12, %rsi
	call	*16(%rsp)
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7050
	cltq
	movzbl	56(%rsp), %esi
	leaq	(%r12,%rax), %rdx
	leaq	57(%rsp), %rax
	movq	%rdx, 200(%rsp)
	movq	%rax, 192(%rsp)
	jmp	.L7048
.L7063:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE593:
	.size	stbi_is_hdr_from_callbacks, .-stbi_is_hdr_from_callbacks
	.p2align 4
	.globl	stbi_ldr_to_hdr_gamma
	.type	stbi_ldr_to_hdr_gamma, @function
stbi_ldr_to_hdr_gamma:
.LFB594:
	.cfi_startproc
	movss	%xmm0, stbi__l2h_gamma(%rip)
	ret
	.cfi_endproc
.LFE594:
	.size	stbi_ldr_to_hdr_gamma, .-stbi_ldr_to_hdr_gamma
	.p2align 4
	.globl	stbi_ldr_to_hdr_scale
	.type	stbi_ldr_to_hdr_scale, @function
stbi_ldr_to_hdr_scale:
.LFB595:
	.cfi_startproc
	movss	%xmm0, stbi__l2h_scale(%rip)
	ret
	.cfi_endproc
.LFE595:
	.size	stbi_ldr_to_hdr_scale, .-stbi_ldr_to_hdr_scale
	.p2align 4
	.globl	stbi_hdr_to_ldr_gamma
	.type	stbi_hdr_to_ldr_gamma, @function
stbi_hdr_to_ldr_gamma:
.LFB596:
	.cfi_startproc
	movaps	%xmm0, %xmm1
	movss	.LC42(%rip), %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, stbi__h2l_gamma_i(%rip)
	ret
	.cfi_endproc
.LFE596:
	.size	stbi_hdr_to_ldr_gamma, .-stbi_hdr_to_ldr_gamma
	.p2align 4
	.globl	stbi_hdr_to_ldr_scale
	.type	stbi_hdr_to_ldr_scale, @function
stbi_hdr_to_ldr_scale:
.LFB597:
	.cfi_startproc
	movaps	%xmm0, %xmm1
	movss	.LC42(%rip), %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, stbi__h2l_scale_i(%rip)
	ret
	.cfi_endproc
.LFE597:
	.size	stbi_hdr_to_ldr_scale, .-stbi_hdr_to_ldr_scale
	.p2align 4
	.globl	stbi_zlib_decode_malloc_guesssize
	.type	stbi_zlib_decode_malloc_guesssize, @function
stbi_zlib_decode_malloc_guesssize:
.LFB670:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movslq	%edx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movslq	%esi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	movq	%r13, %rdi
	subq	$4120, %rsp
	.cfi_def_cfa_offset 4160
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	testq	%rax, %rax
	je	.L7069
	movq	%rax, %xmm0
	movq	%rbx, (%rsp)
	addq	%r13, %rax
	addq	%rbp, %rbx
	punpcklqdq	%xmm0, %xmm0
	movq	%rsp, %rdi
	movl	$1, %esi
	movq	%rbx, 8(%rsp)
	movq	%rax, 40(%rsp)
	movl	$1, 48(%rsp)
	movups	%xmm0, 24(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L7070
	movq	32(%rsp), %rax
	testq	%r12, %r12
	je	.L7068
	movq	24(%rsp), %rdx
	subq	%rax, %rdx
	movl	%edx, (%r12)
.L7068:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7081
	addq	$4120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7070:
	.cfi_restore_state
	movq	32(%rsp), %rdi
	call	free@PLT
.L7069:
	xorl	%eax, %eax
	jmp	.L7068
.L7081:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE670:
	.size	stbi_zlib_decode_malloc_guesssize, .-stbi_zlib_decode_malloc_guesssize
	.p2align 4
	.globl	stbi_zlib_decode_malloc
	.type	stbi_zlib_decode_malloc, @function
stbi_zlib_decode_malloc:
.LFB671:
	.cfi_startproc
	movq	%rdx, %rcx
	movl	$16384, %edx
	jmp	stbi_zlib_decode_malloc_guesssize
	.cfi_endproc
.LFE671:
	.size	stbi_zlib_decode_malloc, .-stbi_zlib_decode_malloc
	.p2align 4
	.globl	stbi_zlib_decode_malloc_guesssize_headerflag
	.type	stbi_zlib_decode_malloc_guesssize_headerflag, @function
stbi_zlib_decode_malloc_guesssize_headerflag:
.LFB672:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movslq	%edx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%r8d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movslq	%esi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	movq	%r14, %rdi
	subq	$4112, %rsp
	.cfi_def_cfa_offset 4160
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	testq	%rax, %rax
	je	.L7084
	movq	%rax, %xmm0
	movq	%rbx, (%rsp)
	addq	%r14, %rax
	addq	%rbp, %rbx
	punpcklqdq	%xmm0, %xmm0
	movq	%rsp, %rdi
	movl	%r13d, %esi
	movq	%rbx, 8(%rsp)
	movq	%rax, 40(%rsp)
	movl	$1, 48(%rsp)
	movups	%xmm0, 24(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L7085
	movq	32(%rsp), %rax
	testq	%r12, %r12
	je	.L7083
	movq	24(%rsp), %rdx
	subq	%rax, %rdx
	movl	%edx, (%r12)
.L7083:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7096
	addq	$4112, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7085:
	.cfi_restore_state
	movq	32(%rsp), %rdi
	call	free@PLT
.L7084:
	xorl	%eax, %eax
	jmp	.L7083
.L7096:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE672:
	.size	stbi_zlib_decode_malloc_guesssize_headerflag, .-stbi_zlib_decode_malloc_guesssize_headerflag
	.p2align 4
	.globl	stbi_zlib_decode_buffer
	.type	stbi_zlib_decode_buffer, @function
stbi_zlib_decode_buffer:
.LFB673:
	.cfi_startproc
	movslq	%esi, %rsi
	subq	$4120, %rsp
	.cfi_def_cfa_offset 4128
	movq	%rdi, %xmm0
	movslq	%ecx, %rcx
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	addq	%rsi, %rdi
	movq	%rdx, (%rsp)
	punpcklqdq	%xmm0, %xmm0
	addq	%rcx, %rdx
	movq	%rdi, 40(%rsp)
	movq	%rsp, %rdi
	movl	$1, %esi
	movq	%rdx, 8(%rsp)
	movl	$0, 48(%rsp)
	movups	%xmm0, 24(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L7100
	movq	24(%rsp), %rax
	subl	32(%rsp), %eax
.L7097:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7102
	addq	$4120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7100:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L7097
.L7102:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE673:
	.size	stbi_zlib_decode_buffer, .-stbi_zlib_decode_buffer
	.p2align 4
	.globl	stbi_zlib_decode_noheader_malloc
	.type	stbi_zlib_decode_noheader_malloc, @function
stbi_zlib_decode_noheader_malloc:
.LFB674:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movl	$16384, %edi
	subq	$4112, %rsp
	.cfi_def_cfa_offset 4144
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	testq	%rax, %rax
	je	.L7104
	movq	%rax, %xmm0
	movslq	%r12d, %rdx
	addq	$16384, %rax
	xorl	%esi, %esi
	movq	%rbx, (%rsp)
	punpcklqdq	%xmm0, %xmm0
	addq	%rdx, %rbx
	movq	%rsp, %rdi
	movq	%rbx, 8(%rsp)
	movq	%rax, 40(%rsp)
	movl	$1, 48(%rsp)
	movups	%xmm0, 24(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L7105
	movq	32(%rsp), %rax
	testq	%rbp, %rbp
	je	.L7103
	movq	24(%rsp), %rdx
	subq	%rax, %rdx
	movl	%edx, 0(%rbp)
.L7103:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7116
	addq	$4112, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7105:
	.cfi_restore_state
	movq	32(%rsp), %rdi
	call	free@PLT
.L7104:
	xorl	%eax, %eax
	jmp	.L7103
.L7116:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE674:
	.size	stbi_zlib_decode_noheader_malloc, .-stbi_zlib_decode_noheader_malloc
	.p2align 4
	.globl	stbi_zlib_decode_noheader_buffer
	.type	stbi_zlib_decode_noheader_buffer, @function
stbi_zlib_decode_noheader_buffer:
.LFB675:
	.cfi_startproc
	movslq	%esi, %rsi
	subq	$4120, %rsp
	.cfi_def_cfa_offset 4128
	movq	%rdi, %xmm0
	movslq	%ecx, %rcx
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	addq	%rsi, %rdi
	movq	%rdx, (%rsp)
	punpcklqdq	%xmm0, %xmm0
	addq	%rcx, %rdx
	movq	%rdi, 40(%rsp)
	xorl	%esi, %esi
	movq	%rsp, %rdi
	movq	%rdx, 8(%rsp)
	movl	$0, 48(%rsp)
	movups	%xmm0, 24(%rsp)
	call	stbi__parse_zlib
	testl	%eax, %eax
	je	.L7120
	movq	24(%rsp), %rax
	subl	32(%rsp), %eax
.L7117:
	movq	4104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7122
	addq	$4120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7120:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L7117
.L7122:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE675:
	.size	stbi_zlib_decode_noheader_buffer, .-stbi_zlib_decode_noheader_buffer
	.p2align 4
	.globl	stbi_set_unpremultiply_on_load
	.type	stbi_set_unpremultiply_on_load, @function
stbi_set_unpremultiply_on_load:
.LFB684:
	.cfi_startproc
	movl	%edi, stbi__unpremultiply_on_load_global(%rip)
	ret
	.cfi_endproc
.LFE684:
	.size	stbi_set_unpremultiply_on_load, .-stbi_set_unpremultiply_on_load
	.p2align 4
	.globl	stbi_convert_iphone_png_to_rgb
	.type	stbi_convert_iphone_png_to_rgb, @function
stbi_convert_iphone_png_to_rgb:
.LFB685:
	.cfi_startproc
	movl	%edi, stbi__de_iphone_flag_global(%rip)
	ret
	.cfi_endproc
.LFE685:
	.size	stbi_convert_iphone_png_to_rgb, .-stbi_convert_iphone_png_to_rgb
	.p2align 4
	.globl	stbi_set_unpremultiply_on_load_thread
	.type	stbi_set_unpremultiply_on_load_thread, @function
stbi_set_unpremultiply_on_load_thread:
.LFB686:
	.cfi_startproc
	movl	%edi, %fs:stbi__unpremultiply_on_load_local@tpoff
	movl	$1, %fs:stbi__unpremultiply_on_load_set@tpoff
	ret
	.cfi_endproc
.LFE686:
	.size	stbi_set_unpremultiply_on_load_thread, .-stbi_set_unpremultiply_on_load_thread
	.p2align 4
	.globl	stbi_convert_iphone_png_to_rgb_thread
	.type	stbi_convert_iphone_png_to_rgb_thread, @function
stbi_convert_iphone_png_to_rgb_thread:
.LFB687:
	.cfi_startproc
	movl	%edi, %fs:stbi__de_iphone_flag_local@tpoff
	movl	$1, %fs:stbi__de_iphone_flag_set@tpoff
	ret
	.cfi_endproc
.LFE687:
	.size	stbi_convert_iphone_png_to_rgb_thread, .-stbi_convert_iphone_png_to_rgb_thread
	.p2align 4
	.globl	stbi_info
	.type	stbi_info, @function
stbi_info:
.LFB751:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	leaq	.LC243(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L7134
	movq	%rax, %rdi
	movq	%rax, %rbx
	leaq	56(%rsp), %r15
	call	ftell@PLT
	movl	$128, %edx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r14
	movq	%rbx, 40(%rsp)
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%r15, 208(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r15, 192(%rsp)
	movaps	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7135
	cltq
	addq	%r15, %rax
.L7131:
	movq	%rbp, %rsi
	movq	%rsp, %rdi
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rax, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__info_main
	movq	%rbx, %rdi
	xorl	%edx, %edx
	movq	%r14, %rsi
	movl	%eax, %ebp
	call	fseek@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
.L7127:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7136
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7135:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
	jmp	.L7131
.L7136:
	call	__stack_chk_fail@PLT
.L7134:
	leaq	.LC244(%rip), %rax
	xorl	%ebp, %ebp
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L7127
	.cfi_endproc
.LFE751:
	.size	stbi_info, .-stbi_info
	.p2align 4
	.globl	stbi_info_from_file
	.type	stbi_info_from_file, @function
stbi_info_from_file:
.LFB752:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	56(%rsp), %r15
	call	ftell@PLT
	movl	$128, %edx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	movq	%rbx, 40(%rsp)
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%r15, 208(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r15, 192(%rsp)
	movaps	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7138
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L7139:
	movq	%r12, %rsi
	movq	%rsp, %rdi
	movq	%r13, %rdx
	movq	%r14, %rcx
	movq	%rax, 200(%rsp)
	movq	%r15, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__info_main
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movl	%eax, %r12d
	call	fseek@PLT
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7142
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7138:
	.cfi_restore_state
	cltq
	addq	%r15, %rax
	jmp	.L7139
.L7142:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE752:
	.size	stbi_info_from_file, .-stbi_info_from_file
	.p2align 4
	.globl	stbi_is_16_bit
	.type	stbi_is_16_bit, @function
stbi_is_16_bit:
.LFB753:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	.LC243(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$240, %rsp
	.cfi_def_cfa_offset 272
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L7150
	movq	%rax, %rdi
	movq	%rax, %rbx
	leaq	56(%rsp), %r12
	call	ftell@PLT
	movl	$128, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	movq	%rbx, 40(%rsp)
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%r12, 208(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r12, 192(%rsp)
	movaps	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	je	.L7151
	cltq
	addq	%r12, %rax
.L7147:
	movq	%rsp, %rdi
	movq	%r12, 192(%rsp)
	movq	%rax, 200(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__is_16_main
	movq	%rbx, %rdi
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movl	%eax, %r12d
	call	fseek@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
.L7143:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7152
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7151:
	.cfi_restore_state
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
	jmp	.L7147
.L7152:
	call	__stack_chk_fail@PLT
.L7150:
	leaq	.LC244(%rip), %rax
	xorl	%r12d, %r12d
	movq	%rax, %fs:stbi__g_failure_reason@tpoff
	jmp	.L7143
	.cfi_endproc
.LFE753:
	.size	stbi_is_16_bit, .-stbi_is_16_bit
	.p2align 4
	.globl	stbi_is_16_bit_from_file
	.type	stbi_is_16_bit_from_file, @function
stbi_is_16_bit_from_file:
.LFB754:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	subq	$240, %rsp
	.cfi_def_cfa_offset 272
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	56(%rsp), %r12
	call	ftell@PLT
	movl	$128, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	movq	%rbx, 40(%rsp)
	movq	16+stbi__stdio_callbacks(%rip), %rax
	movdqa	stbi__stdio_callbacks(%rip), %xmm0
	movq	%r12, 208(%rsp)
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r12, 192(%rsp)
	movaps	%xmm0, 16(%rsp)
	call	stbi__stdio_read
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7154
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L7155:
	movq	%rsp, %rdi
	movq	%r12, 192(%rsp)
	movq	%rax, 200(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__is_16_main
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movl	%eax, %r12d
	call	fseek@PLT
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7158
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7154:
	.cfi_restore_state
	cltq
	addq	%r12, %rax
	jmp	.L7155
.L7158:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE754:
	.size	stbi_is_16_bit_from_file, .-stbi_is_16_bit_from_file
	.p2align 4
	.globl	stbi_info_from_memory
	.type	stbi_info_from_memory, @function
stbi_info_from_memory:
.LFB755:
	.cfi_startproc
	movslq	%esi, %rax
	subq	$248, %rsp
	.cfi_def_cfa_offset 256
	movq	%rdi, %xmm0
	movq	%rdx, %rsi
	addq	%rdi, %rax
	movq	%rcx, %rdx
	movq	%rsp, %rdi
	movq	%r8, %rcx
	movq	%fs:40, %r8
	movq	%r8, 232(%rsp)
	xorl	%r8d, %r8d
	movq	%rax, %xmm1
	movl	$0, 48(%rsp)
	movq	$0, 16(%rsp)
	punpcklqdq	%xmm1, %xmm0
	movl	$0, 184(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	call	stbi__info_main
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7162
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7162:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE755:
	.size	stbi_info_from_memory, .-stbi_info_from_memory
	.p2align 4
	.globl	stbi_info_from_callbacks
	.type	stbi_info_from_callbacks, @function
stbi_info_from_callbacks:
.LFB756:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %rax
	movq	%rsi, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdx, %rbx
	subq	$248, %rsp
	.cfi_def_cfa_offset 288
	movdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	%fs:40, %rdx
	movq	%rdx, 232(%rsp)
	xorl	%edx, %edx
	movq	16(%rax), %rax
	leaq	56(%rsp), %r13
	movq	%rsi, 40(%rsp)
	movl	$128, %edx
	movaps	%xmm0, 16(%rsp)
	movq	%r13, %rsi
	movq	%rax, 32(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 184(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r13, 208(%rsp)
	movq	%r13, 192(%rsp)
	call	*%rcx
	movq	192(%rsp), %rdx
	subq	208(%rsp), %rdx
	addl	%edx, 184(%rsp)
	testl	%eax, %eax
	jne	.L7164
	movl	$0, 48(%rsp)
	leaq	57(%rsp), %rax
	movb	$0, 56(%rsp)
.L7165:
	movq	%rbp, %rdx
	movq	%rsp, %rdi
	movq	%r12, %rcx
	movq	%rbx, %rsi
	movq	%rax, 200(%rsp)
	movq	%r13, 192(%rsp)
	movq	%rax, 216(%rsp)
	call	stbi__info_main
	movq	232(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7168
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7164:
	.cfi_restore_state
	cltq
	addq	%r13, %rax
	jmp	.L7165
.L7168:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE756:
	.size	stbi_info_from_callbacks, .-stbi_info_from_callbacks
	.p2align 4
	.globl	stbi_is_16_bit_from_memory
	.type	stbi_is_16_bit_from_memory, @function
stbi_is_16_bit_from_memory:
.LFB757:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%esi, %rsi
	movq	%rdi, %xmm0
	xorl	%edx, %edx
	subq	$288, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 280(%rsp)
	xorl	%eax, %eax
	leaq	(%rdi,%rsi), %rax
	leaq	48(%rsp), %rbx
	movq	%rsp, %rdi
	movq	%rax, %xmm1
	movl	$2, %esi
	movq	%rbx, (%rsp)
	punpcklqdq	%xmm1, %xmm0
	movq	$0, 64(%rsp)
	movl	$0, 96(%rsp)
	movl	$0, 232(%rsp)
	movaps	%xmm0, 240(%rsp)
	movaps	%xmm0, 256(%rsp)
	call	stbi__parse_png_file
	testl	%eax, %eax
	je	.L7184
	cmpl	$16, 32(%rsp)
	je	.L7173
	movq	(%rsp), %rax
	movq	%rbx, %rdi
	movdqu	208(%rax), %xmm2
	movups	%xmm2, 192(%rax)
	call	stbi__get32be
	cmpl	$943870035, %eax
	je	.L7174
.L7180:
	movq	256(%rsp), %rax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%rax, 240(%rsp)
	movq	264(%rsp), %rax
	movq	%rax, 248(%rsp)
	call	stbi__pnm_info
	cmpl	$16, %eax
	sete	%al
	movzbl	%al, %eax
.L7169:
	movq	280(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7185
	addq	$288, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7184:
	.cfi_restore_state
	movq	(%rsp), %rax
	movq	%rbx, %rdi
	movdqu	208(%rax), %xmm3
	movups	%xmm3, 192(%rax)
	call	stbi__get32be
	cmpl	$943870035, %eax
	jne	.L7180
.L7174:
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$1, %eax
	jne	.L7180
	cmpq	$0, 64(%rsp)
	movq	240(%rsp), %rax
	je	.L7177
	movq	248(%rsp), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	$5, %edx
	jle	.L7186
.L7177:
	addq	$6, %rax
	movq	%rax, 240(%rsp)
.L7178:
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	ja	.L7180
	movq	%rbx, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	jne	.L7180
	.p2align 4,,10
	.p2align 3
.L7173:
	movl	$1, %eax
	jmp	.L7169
	.p2align 4,,10
	.p2align 3
.L7186:
	movl	$6, %esi
	movq	%rcx, 240(%rsp)
	movq	88(%rsp), %rdi
	subl	%edx, %esi
	call	*72(%rsp)
	jmp	.L7178
.L7185:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE757:
	.size	stbi_is_16_bit_from_memory, .-stbi_is_16_bit_from_memory
	.p2align 4
	.globl	stbi_is_16_bit_from_callbacks
	.type	stbi_is_16_bit_from_callbacks, @function
stbi_is_16_bit_from_callbacks:
.LFB758:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rax
	movq	%rsi, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$296, %rsp
	.cfi_def_cfa_offset 320
	movdqu	(%rax), %xmm0
	movq	(%rax), %rcx
	movq	%fs:40, %rdx
	movq	%rdx, 280(%rsp)
	xorl	%edx, %edx
	movq	16(%rax), %rax
	leaq	104(%rsp), %rbx
	movq	%rsi, 88(%rsp)
	movl	$128, %edx
	movaps	%xmm0, 64(%rsp)
	movq	%rbx, %rsi
	movq	%rax, 80(%rsp)
	movq	.LC245(%rip), %rax
	movl	$0, 232(%rsp)
	movq	%rax, 96(%rsp)
	movq	%rbx, 256(%rsp)
	movq	%rbx, 240(%rsp)
	call	*%rcx
	movq	240(%rsp), %rdx
	subq	256(%rsp), %rdx
	addl	%edx, 232(%rsp)
	testl	%eax, %eax
	jne	.L7188
	movl	$0, 96(%rsp)
	leaq	105(%rsp), %rax
	movb	$0, 104(%rsp)
.L7189:
	leaq	48(%rsp), %rbp
	xorl	%edx, %edx
	movq	%rsp, %rdi
	movl	$2, %esi
	movq	%rax, 248(%rsp)
	movq	%rbx, 240(%rsp)
	movq	%rax, 264(%rsp)
	movq	%rbp, (%rsp)
	call	stbi__parse_png_file
	testl	%eax, %eax
	je	.L7204
	cmpl	$16, 32(%rsp)
	je	.L7193
	movq	(%rsp), %rax
	movq	%rbp, %rdi
	movdqu	208(%rax), %xmm1
	movups	%xmm1, 192(%rax)
	call	stbi__get32be
	cmpl	$943870035, %eax
	je	.L7194
.L7200:
	movq	256(%rsp), %rax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%rax, 240(%rsp)
	movq	264(%rsp), %rax
	movq	%rax, 248(%rsp)
	call	stbi__pnm_info
	cmpl	$16, %eax
	sete	%al
	movzbl	%al, %eax
.L7187:
	movq	280(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7205
	addq	$296, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7188:
	.cfi_restore_state
	cltq
	addq	%rbx, %rax
	jmp	.L7189
	.p2align 4,,10
	.p2align 3
.L7204:
	movq	(%rsp), %rax
	movq	%rbp, %rdi
	movdqu	208(%rax), %xmm2
	movups	%xmm2, 192(%rax)
	call	stbi__get32be
	cmpl	$943870035, %eax
	jne	.L7200
.L7194:
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$1, %eax
	jne	.L7200
	cmpq	$0, 64(%rsp)
	movq	240(%rsp), %rax
	je	.L7197
	movq	248(%rsp), %rcx
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpl	$5, %edx
	jle	.L7206
.L7197:
	addq	$6, %rax
	movq	%rax, 240(%rsp)
.L7198:
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	ja	.L7200
	movq	%rbp, %rdi
	call	stbi__get16be
	cmpl	$16, %eax
	jne	.L7200
	.p2align 4,,10
	.p2align 3
.L7193:
	movl	$1, %eax
	jmp	.L7187
	.p2align 4,,10
	.p2align 3
.L7206:
	movl	$6, %esi
	movq	%rcx, 240(%rsp)
	movq	88(%rsp), %rdi
	subl	%edx, %esi
	call	*72(%rsp)
	jmp	.L7198
.L7205:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE758:
	.size	stbi_is_16_bit_from_callbacks, .-stbi_is_16_bit_from_callbacks
	.p2align 4
	.globl	stbi_flip_vertically_on_write
	.type	stbi_flip_vertically_on_write, @function
stbi_flip_vertically_on_write:
.LFB759:
	.cfi_startproc
	movl	%edi, stbi__flip_vertically_on_write(%rip)
	ret
	.cfi_endproc
.LFE759:
	.size	stbi_flip_vertically_on_write, .-stbi_flip_vertically_on_write
	.section	.rodata.str1.1
.LC246:
	.string	"11 4 22 44 44 22 444444"
	.section	.rodata.str1.8
	.align 8
.LC247:
	.string	"11 4 22 44 44 22 444444 4444 4 444 444 444 444"
	.text
	.p2align 4
	.globl	stbi_write_bmp_to_func
	.type	stbi_write_bmp_to_func, @function
stbi_write_bmp_to_func:
.LFB775:
	.cfi_startproc
	subq	$104, %rsp
	.cfi_def_cfa_offset 112
	pxor	%xmm0, %xmm0
	movl	%edx, %eax
	movl	%ecx, %edx
	movq	%fs:40, %rcx
	movq	%rcx, 88(%rsp)
	xorl	%ecx, %ecx
	movq	%rdi, (%rsp)
	movq	$0, 80(%rsp)
	movq	%rsi, 8(%rsp)
	movaps	%xmm0, 16(%rsp)
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
	cmpl	$4, %r8d
	je	.L7209
	movl	%eax, %esi
	leal	0(,%rax,4), %ecx
	movl	%eax, %r10d
	movq	%rsp, %rdi
	andl	$3, %esi
	subl	%ecx, %r10d
	pushq	$0
	.cfi_def_cfa_offset 120
	movl	%esi, %ecx
	pushq	$0
	.cfi_def_cfa_offset 128
	subl	%r10d, %ecx
	pushq	$0
	.cfi_def_cfa_offset 136
	imull	%edx, %ecx
	pushq	$0
	.cfi_def_cfa_offset 144
	pushq	$0
	.cfi_def_cfa_offset 152
	pushq	$0
	.cfi_def_cfa_offset 160
	addl	$54, %ecx
	pushq	$24
	.cfi_def_cfa_offset 168
	pushq	$1
	.cfi_def_cfa_offset 176
	pushq	%rdx
	.cfi_def_cfa_offset 184
	pushq	%rax
	.cfi_def_cfa_offset 192
	pushq	$40
	.cfi_def_cfa_offset 200
	pushq	$54
	.cfi_def_cfa_offset 208
	pushq	$0
	.cfi_def_cfa_offset 216
	pushq	$0
	.cfi_def_cfa_offset 224
	pushq	%rcx
	.cfi_def_cfa_offset 232
	leaq	.LC246(%rip), %rcx
	pushq	$77
	.cfi_def_cfa_offset 240
	pushq	$66
	.cfi_def_cfa_offset 248
	pushq	%rcx
	.cfi_def_cfa_offset 256
	movl	%eax, %ecx
	xorl	%eax, %eax
	pushq	%rsi
	.cfi_def_cfa_offset 264
	movl	$-1, %esi
	pushq	$0
	.cfi_def_cfa_offset 272
	pushq	%r9
	.cfi_def_cfa_offset 280
	movl	%r8d, %r9d
	movl	%edx, %r8d
	movl	$-1, %edx
	pushq	$1
	.cfi_def_cfa_offset 288
	call	stbiw__outfile.constprop.0
	addq	$176, %rsp
	.cfi_def_cfa_offset 112
.L7208:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7213
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7209:
	.cfi_restore_state
	movl	%eax, %ecx
	movq	%rsp, %rdi
	leaq	.LC247(%rip), %rsi
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	imull	%edx, %ecx
	pushq	$0
	.cfi_def_cfa_offset 128
	movl	%edx, %r8d
	pushq	$0
	.cfi_def_cfa_offset 136
	pushq	$0
	.cfi_def_cfa_offset 144
	leal	122(,%rcx,4), %ecx
	pushq	$0
	.cfi_def_cfa_offset 152
	pushq	$0
	.cfi_def_cfa_offset 160
	pushq	$0
	.cfi_def_cfa_offset 168
	pushq	$0
	.cfi_def_cfa_offset 176
	pushq	$0
	.cfi_def_cfa_offset 184
	pushq	$0
	.cfi_def_cfa_offset 192
	pushq	$0
	.cfi_def_cfa_offset 200
	pushq	$0
	.cfi_def_cfa_offset 208
	pushq	$0
	.cfi_def_cfa_offset 216
	pushq	$0
	.cfi_def_cfa_offset 224
	pushq	$-16777216
	.cfi_def_cfa_offset 232
	pushq	$255
	.cfi_def_cfa_offset 240
	pushq	$65280
	.cfi_def_cfa_offset 248
	pushq	$16711680
	.cfi_def_cfa_offset 256
	pushq	$0
	.cfi_def_cfa_offset 264
	pushq	$0
	.cfi_def_cfa_offset 272
	pushq	$0
	.cfi_def_cfa_offset 280
	pushq	$0
	.cfi_def_cfa_offset 288
	pushq	$0
	.cfi_def_cfa_offset 296
	pushq	$3
	.cfi_def_cfa_offset 304
	pushq	$32
	.cfi_def_cfa_offset 312
	pushq	$1
	.cfi_def_cfa_offset 320
	pushq	%rdx
	.cfi_def_cfa_offset 328
	movl	$-1, %edx
	pushq	%rax
	.cfi_def_cfa_offset 336
	pushq	$108
	.cfi_def_cfa_offset 344
	pushq	$122
	.cfi_def_cfa_offset 352
	pushq	$0
	.cfi_def_cfa_offset 360
	pushq	$0
	.cfi_def_cfa_offset 368
	pushq	%rcx
	.cfi_def_cfa_offset 376
	movl	%eax, %ecx
	xorl	%eax, %eax
	pushq	$77
	.cfi_def_cfa_offset 384
	pushq	$66
	.cfi_def_cfa_offset 392
	pushq	%rsi
	.cfi_def_cfa_offset 400
	movl	$-1, %esi
	pushq	$0
	.cfi_def_cfa_offset 408
	pushq	$1
	.cfi_def_cfa_offset 416
	pushq	%r9
	.cfi_def_cfa_offset 424
	movl	$4, %r9d
	pushq	$1
	.cfi_def_cfa_offset 432
	call	stbiw__outfile.constprop.0
	addq	$320, %rsp
	.cfi_def_cfa_offset 112
	jmp	.L7208
.L7213:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE775:
	.size	stbi_write_bmp_to_func, .-stbi_write_bmp_to_func
	.section	.rodata.str1.1
.LC248:
	.string	"wb"
	.text
	.p2align 4
	.globl	stbi_write_bmp
	.type	stbi_write_bmp, @function
stbi_write_bmp:
.LFB776:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %r9
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%ecx, %r12d
	movl	$11, %ecx
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%edx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	leaq	.LC248(%rip), %rsi
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %r14
	movq	%r14, %rdi
	rep stosq
	movq	%r9, %rdi
	call	fopen@PLT
	leaq	stbi__stdio_write(%rip), %rdx
	movq	%rdx, (%rsp)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L7219
	cmpl	$4, %r12d
	je	.L7216
	movl	%ebx, %edx
	leal	0(,%rbx,4), %eax
	movl	%ebx, %ecx
	pushq	$0
	.cfi_def_cfa_offset 152
	andl	$3, %edx
	subl	%eax, %ecx
	pushq	$0
	.cfi_def_cfa_offset 160
	movl	%r12d, %r9d
	movl	%edx, %eax
	pushq	$0
	.cfi_def_cfa_offset 168
	movl	%ebp, %r8d
	movl	$-1, %esi
	subl	%ecx, %eax
	pushq	$0
	.cfi_def_cfa_offset 176
	movl	%ebx, %ecx
	movq	%r14, %rdi
	imull	%ebp, %eax
	pushq	$0
	.cfi_def_cfa_offset 184
	pushq	$0
	.cfi_def_cfa_offset 192
	pushq	$24
	.cfi_def_cfa_offset 200
	addl	$54, %eax
	pushq	$1
	.cfi_def_cfa_offset 208
	pushq	%rbp
	.cfi_def_cfa_offset 216
	pushq	%rbx
	.cfi_def_cfa_offset 224
	pushq	$40
	.cfi_def_cfa_offset 232
	pushq	$54
	.cfi_def_cfa_offset 240
	pushq	$0
	.cfi_def_cfa_offset 248
	pushq	$0
	.cfi_def_cfa_offset 256
	pushq	%rax
	.cfi_def_cfa_offset 264
	leaq	.LC246(%rip), %rax
	pushq	$77
	.cfi_def_cfa_offset 272
	pushq	$66
	.cfi_def_cfa_offset 280
	pushq	%rax
	.cfi_def_cfa_offset 288
	xorl	%eax, %eax
	pushq	%rdx
	.cfi_def_cfa_offset 296
	movl	$-1, %edx
	pushq	$0
	.cfi_def_cfa_offset 304
	pushq	%r13
	.cfi_def_cfa_offset 312
	pushq	$1
	.cfi_def_cfa_offset 320
	call	stbiw__outfile.constprop.0
	movq	%r14, %rsp
	.cfi_def_cfa_offset 144
	movl	%eax, %ebx
.L7217:
	movq	8(%rsp), %rdi
	call	fclose@PLT
.L7214:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7221
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7216:
	.cfi_restore_state
	movl	%ebx, %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 152
	movl	%ebx, %ecx
	movl	$4, %r9d
	imull	%ebp, %eax
	pushq	$0
	.cfi_def_cfa_offset 160
	movl	%ebp, %r8d
	movl	$-1, %edx
	pushq	$0
	.cfi_def_cfa_offset 168
	movl	$-1, %esi
	movq	%r14, %rdi
	pushq	$0
	.cfi_def_cfa_offset 176
	leal	122(,%rax,4), %eax
	pushq	$0
	.cfi_def_cfa_offset 184
	pushq	$0
	.cfi_def_cfa_offset 192
	pushq	$0
	.cfi_def_cfa_offset 200
	pushq	$0
	.cfi_def_cfa_offset 208
	pushq	$0
	.cfi_def_cfa_offset 216
	pushq	$0
	.cfi_def_cfa_offset 224
	pushq	$0
	.cfi_def_cfa_offset 232
	pushq	$0
	.cfi_def_cfa_offset 240
	pushq	$0
	.cfi_def_cfa_offset 248
	pushq	$0
	.cfi_def_cfa_offset 256
	pushq	$-16777216
	.cfi_def_cfa_offset 264
	pushq	$255
	.cfi_def_cfa_offset 272
	pushq	$65280
	.cfi_def_cfa_offset 280
	pushq	$16711680
	.cfi_def_cfa_offset 288
	pushq	$0
	.cfi_def_cfa_offset 296
	pushq	$0
	.cfi_def_cfa_offset 304
	pushq	$0
	.cfi_def_cfa_offset 312
	pushq	$0
	.cfi_def_cfa_offset 320
	pushq	$0
	.cfi_def_cfa_offset 328
	pushq	$3
	.cfi_def_cfa_offset 336
	pushq	$32
	.cfi_def_cfa_offset 344
	pushq	$1
	.cfi_def_cfa_offset 352
	pushq	%rbp
	.cfi_def_cfa_offset 360
	pushq	%rbx
	.cfi_def_cfa_offset 368
	pushq	$108
	.cfi_def_cfa_offset 376
	pushq	$122
	.cfi_def_cfa_offset 384
	pushq	$0
	.cfi_def_cfa_offset 392
	pushq	$0
	.cfi_def_cfa_offset 400
	pushq	%rax
	.cfi_def_cfa_offset 408
	leaq	.LC247(%rip), %rax
	pushq	$77
	.cfi_def_cfa_offset 416
	pushq	$66
	.cfi_def_cfa_offset 424
	pushq	%rax
	.cfi_def_cfa_offset 432
	xorl	%eax, %eax
	pushq	$0
	.cfi_def_cfa_offset 440
	pushq	$1
	.cfi_def_cfa_offset 448
	pushq	%r13
	.cfi_def_cfa_offset 456
	pushq	$1
	.cfi_def_cfa_offset 464
	call	stbiw__outfile.constprop.0
	addq	$320, %rsp
	.cfi_def_cfa_offset 144
	movl	%eax, %ebx
	jmp	.L7217
.L7219:
	xorl	%ebx, %ebx
	jmp	.L7214
.L7221:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE776:
	.size	stbi_write_bmp, .-stbi_write_bmp
	.p2align 4
	.globl	stbi_write_tga_to_func
	.type	stbi_write_tga_to_func, @function
stbi_write_tga_to_func:
.LFB778:
	.cfi_startproc
	subq	$104, %rsp
	.cfi_def_cfa_offset 112
	pxor	%xmm0, %xmm0
	movq	%rsi, %rax
	movl	%edx, %esi
	movl	%ecx, %edx
	movl	%r8d, %ecx
	movq	%r9, %r8
	movq	%fs:40, %r9
	movq	%r9, 88(%rsp)
	xorl	%r9d, %r9d
	movq	%rdi, (%rsp)
	movq	%rsp, %rdi
	movq	$0, 80(%rsp)
	movq	%rax, 8(%rsp)
	movaps	%xmm0, 16(%rsp)
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
	call	stbi_write_tga_core
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7225
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7225:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE778:
	.size	stbi_write_tga_to_func, .-stbi_write_tga_to_func
	.p2align 4
	.globl	stbi_write_tga
	.type	stbi_write_tga, @function
stbi_write_tga:
.LFB779:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %r9
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%ecx, %r12d
	movl	$11, %ecx
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%edx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	leaq	.LC248(%rip), %rsi
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %r14
	movq	%r14, %rdi
	rep stosq
	movq	%r9, %rdi
	call	fopen@PLT
	leaq	stbi__stdio_write(%rip), %rdx
	movq	%rdx, (%rsp)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L7229
	movl	%ebx, %esi
	movq	%r14, %rdi
	movq	%r13, %r8
	movl	%r12d, %ecx
	movl	%ebp, %edx
	call	stbi_write_tga_core
	movq	8(%rsp), %rdi
	movl	%eax, %ebx
	call	fclose@PLT
.L7226:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7231
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L7229:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L7226
.L7231:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE779:
	.size	stbi_write_tga, .-stbi_write_tga
	.p2align 4
	.globl	stbi_write_hdr_to_func
	.type	stbi_write_hdr_to_func, @function
stbi_write_hdr_to_func:
.LFB785:
	.cfi_startproc
	subq	$104, %rsp
	.cfi_def_cfa_offset 112
	movq	%rdi, %rax
	pxor	%xmm0, %xmm0
	movl	%edx, %edi
	movl	%ecx, %edx
	movl	%r8d, %ecx
	movq	%fs:40, %r8
	movq	%r8, 88(%rsp)
	xorl	%r8d, %r8d
	testl	%edx, %edx
	movq	%rax, (%rsp)
	setle	%al
	testq	%r9, %r9
	movq	%rsi, 8(%rsp)
	sete	%sil
	movaps	%xmm0, 16(%rsp)
	orb	%sil, %al
	movaps	%xmm0, 32(%rsp)
	movq	$0, 80(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
	jne	.L7235
	testl	%edi, %edi
	jle	.L7235
	movq	%rsp, %rax
	movl	%edi, %esi
	movq	%r9, %r8
	movq	%rax, %rdi
	call	stbi_write_hdr_core.part.0
	jmp	.L7232
	.p2align 4,,10
	.p2align 3
.L7235:
	xorl	%eax, %eax
.L7232:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7237
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7237:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE785:
	.size	stbi_write_hdr_to_func, .-stbi_write_hdr_to_func
	.p2align 4
	.globl	stbi_write_hdr
	.type	stbi_write_hdr, @function
stbi_write_hdr:
.LFB786:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pxor	%xmm0, %xmm0
	movl	%edx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%ecx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%esi, %r12d
	leaq	.LC248(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%r8, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movaps	%xmm0, 16(%rsp)
	movq	$0, 80(%rsp)
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
	call	fopen@PLT
	movq	%rax, %rbx
	leaq	stbi__stdio_write(%rip), %rax
	movq	%rax, (%rsp)
	movq	%rbx, 8(%rsp)
	testq	%rbx, %rbx
	je	.L7242
	testl	%r14d, %r14d
	setle	%al
	testq	%rbp, %rbp
	sete	%dl
	orb	%dl, %al
	jne	.L7243
	testl	%r12d, %r12d
	jle	.L7243
	movq	%rbp, %r8
	movq	%rsp, %rdi
	movl	%r13d, %ecx
	movl	%r14d, %edx
	movl	%r12d, %esi
	call	stbi_write_hdr_core.part.0
	movl	%eax, %ebp
	jmp	.L7240
	.p2align 4,,10
	.p2align 3
.L7243:
	xorl	%ebp, %ebp
.L7240:
	movq	%rbx, %rdi
	call	fclose@PLT
.L7238:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7245
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L7242:
	.cfi_restore_state
	xorl	%ebp, %ebp
	jmp	.L7238
.L7245:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE786:
	.size	stbi_write_hdr, .-stbi_write_hdr
	.section	.rodata.str1.1
.LC250:
	.string	"d <= 32767 && best <= 258"
	.text
	.p2align 4
	.globl	stbi_zlib_compress
	.type	stbi_zlib_compress, @function
stbi_zlib_compress:
.LFB792:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
	movl	$131072, %edi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%ecx, %ebx
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movl	%esi, 56(%rsp)
	movl	$1, %esi
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movl	$0, 96(%rsp)
	movl	$0, 100(%rsp)
	call	calloc@PLT
	movq	%rax, %r11
	testq	%rax, %rax
	je	.L7246
	movq	%rax, 8(%rsp)
	movl	$5, %eax
	movl	$10, %edi
	cmpl	%eax, %ebx
	cmovge	%ebx, %eax
	movl	%eax, 76(%rsp)
	call	malloc@PLT
	movq	8(%rsp), %r11
	testq	%rax, %rax
	movq	%rax, %rdi
	je	.L7249
	movq	.LC249(%rip), %rax
	movb	$120, 8(%rdi)
	movl	$13, %esi
	movq	%r11, 16(%rsp)
	movq	%rax, (%rdi)
	call	realloc@PLT
	testq	%rax, %rax
	je	.L7249
	movslq	4(%rax), %rdx
	movl	$5, (%rax)
	leaq	100(%rsp), %rbx
	leaq	96(%rsp), %r14
	leaq	8(%rax), %rdi
	movq	%r14, %rsi
	movq	%rbx, 48(%rsp)
	leal	1(%rdx), %ecx
	movl	$1, 96(%rsp)
	movl	%ecx, 4(%rax)
	movb	$94, 8(%rax,%rdx)
	movq	%rbx, %rdx
	movl	$1, 100(%rsp)
	movq	%r14, 24(%rsp)
	call	stbiw__zlib_flushf
	movl	100(%rsp), %ecx
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	sall	%cl, %eax
	addl	$2, %ecx
	orl	%eax, 96(%rsp)
	movl	%ecx, 100(%rsp)
	call	stbiw__zlib_flushf
	movq	16(%rsp), %r11
	movq	%rax, 8(%rsp)
	movl	56(%rsp), %eax
	leal	-3(%rax), %ebx
	cmpl	$3, %eax
	movl	%ebx, 64(%rsp)
	jle	.L7310
	movslq	76(%rsp), %rax
	movq	%r11, 32(%rsp)
	xorl	%r14d, %r14d
	movq	%rbp, 88(%rsp)
	leal	(%rax,%rax), %ebx
	salq	$3, %rax
	movl	%ebx, 72(%rsp)
	movq	%rax, 80(%rsp)
	.p2align 4,,10
	.p2align 3
.L7283:
	movslq	%r14d, %rax
	movq	32(%rsp), %rsi
	leaq	(%r15,%rax), %rbx
	movq	%rax, 40(%rsp)
	movzbl	(%rbx), %eax
	movzwl	(%rbx), %edx
	movl	%eax, 16(%rsp)
	movl	%eax, %r11d
	movzbl	2(%rbx), %eax
	sall	$16, %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$5, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$4, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$25, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$6, %edx
	addl	%edx, %eax
	andl	$16383, %eax
	leaq	(%rsi,%rax,8), %r13
	movq	0(%r13), %r8
	testq	%r8, %r8
	je	.L7251
	movslq	-4(%r8), %rax
	testl	%eax, %eax
	jle	.L7311
	movl	56(%rsp), %edi
	movslq	%eax, %rdx
	movl	%r14d, 60(%rsp)
	movq	%r8, %rsi
	leal	-32768(%r14), %r9d
	leaq	(%r8,%rdx,8), %r10
	xorl	%r12d, %r12d
	movl	$3, %ebp
	movslq	%r9d, %r9
	subl	%r14d, %edi
	jmp	.L7258
	.p2align 4,,10
	.p2align 3
.L7253:
	addq	$8, %rsi
	cmpq	%rsi, %r10
	je	.L7399
.L7258:
	movq	(%rsi), %r14
	movq	%r14, %rdx
	subq	%r15, %rdx
	cmpq	%r9, %rdx
	jle	.L7253
	movl	$1, %edx
	jmp	.L7255
	.p2align 4,,10
	.p2align 3
.L7400:
	movl	%edx, %ecx
	addq	$1, %rdx
	cmpl	%ecx, %edi
	jle	.L7257
	cmpl	$257, %ecx
	jg	.L7257
.L7255:
	movzbl	-1(%rbx,%rdx), %ecx
	cmpb	%cl, -1(%r14,%rdx)
	je	.L7400
	leal	-1(%rdx), %ecx
.L7257:
	cmpl	%ebp, %ecx
	jl	.L7253
	addq	$8, %rsi
	movq	%r14, %r12
	movl	%ecx, %ebp
	cmpq	%rsi, %r10
	jne	.L7258
	.p2align 4,,10
	.p2align 3
.L7399:
	movl	60(%rsp), %r14d
	cmpl	%eax, 72(%rsp)
	je	.L7401
.L7252:
	movl	-8(%r8), %edx
	leal	1(%rax), %ecx
	salq	$3, %rax
	cmpl	%edx, %ecx
	jl	.L7262
	leal	1(%rdx,%rdx), %edx
	leaq	-8(%r8), %rdi
	movb	%r11b, 71(%rsp)
	leal	0(,%rdx,8), %esi
	movl	%edx, 60(%rsp)
	movslq	%esi, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L7260
	movslq	4(%rax), %rax
	movl	60(%rsp), %edx
	movzbl	71(%rsp), %r11d
	leal	1(%rax), %ecx
	salq	$3, %rax
.L7263:
	leaq	8(%rsi), %r8
	movl	%edx, (%rsi)
	movq	%r8, 0(%r13)
.L7262:
	movl	%ecx, -4(%r8)
	movq	%rbx, (%r8,%rax)
	testq	%r12, %r12
	jne	.L7402
.L7264:
	movl	100(%rsp), %ecx
	movl	96(%rsp), %edx
	movl	16(%rsp), %eax
	cmpb	$-113, %r11b
	ja	.L7281
	addl	$48, %eax
	movl	%eax, %esi
	leal	(%rax,%rax), %edi
	sarl	%esi
	andl	$2, %edi
	andl	$1, %esi
	orl	%esi, %edi
	movl	%eax, %esi
	sarl	$2, %esi
	addl	%edi, %edi
	andl	$1, %esi
	orl	%edi, %esi
	movl	%eax, %edi
	sarl	$3, %edi
	addl	%esi, %esi
	andl	$1, %edi
	orl	%esi, %edi
	movl	%eax, %esi
	sarl	$4, %esi
	addl	%edi, %edi
	andl	$1, %esi
	orl	%edi, %esi
	movl	%eax, %edi
	sarl	$5, %edi
	addl	%esi, %esi
	andl	$1, %edi
	orl	%esi, %edi
	movl	%eax, %esi
	sarl	$7, %eax
	sarl	$6, %esi
	addl	%edi, %edi
	andl	$1, %esi
	orl	%edi, %esi
	addl	%esi, %esi
	orl	%esi, %eax
	sall	%cl, %eax
	addl	$8, %ecx
	orl	%edx, %eax
	movl	%eax, 96(%rsp)
.L7396:
	movq	48(%rsp), %rdx
	movq	24(%rsp), %rsi
	movl	%ecx, 100(%rsp)
	addl	$1, %r14d
	movq	8(%rsp), %rdi
	call	stbiw__zlib_flushf
	movq	%rax, 8(%rsp)
.L7280:
	movl	64(%rsp), %eax
	cmpl	%eax, %r14d
	jl	.L7283
	movq	32(%rsp), %r11
	movq	88(%rsp), %rbp
.L7250:
	movl	56(%rsp), %eax
	cmpl	%eax, %r14d
	jge	.L7284
	movslq	%r14d, %r12
	movl	%eax, %ebx
	movq	8(%rsp), %rdi
	addq	%r15, %r12
	subl	%r14d, %ebx
	movq	48(%rsp), %r14
	addq	%r12, %rbx
	movq	%r12, %r13
	movq	%r11, %r12
.L7287:
	movzbl	0(%r13), %eax
	movl	100(%rsp), %ecx
	movl	96(%rsp), %edx
	cmpb	$-113, %al
	ja	.L7285
	addl	$48, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leal	(%rax,%rax), %r9d
	sarl	%esi
	andl	$2, %r9d
	andl	$1, %esi
	orl	%esi, %r9d
	movl	%eax, %esi
	sarl	$2, %esi
	addl	%r9d, %r9d
	andl	$1, %esi
	orl	%r9d, %esi
	movl	%eax, %r9d
	sarl	$3, %r9d
	addl	%esi, %esi
	andl	$1, %r9d
	orl	%esi, %r9d
	movl	%eax, %esi
	sarl	$4, %esi
	addl	%r9d, %r9d
	andl	$1, %esi
	orl	%r9d, %esi
	movl	%eax, %r9d
	sarl	$5, %r9d
	addl	%esi, %esi
	andl	$1, %r9d
	orl	%esi, %r9d
	movl	%eax, %esi
	sarl	$7, %eax
	sarl	$6, %esi
	addl	%r9d, %r9d
	andl	$1, %esi
	orl	%r9d, %esi
	addl	%esi, %esi
	orl	%esi, %eax
	sall	%cl, %eax
	addl	$8, %ecx
	orl	%edx, %eax
	movl	%eax, 96(%rsp)
.L7397:
	movq	24(%rsp), %rsi
	movq	%r14, %rdx
	movl	%ecx, 100(%rsp)
	addq	$1, %r13
	call	stbiw__zlib_flushf
	movq	%rax, %rdi
	cmpq	%rbx, %r13
	jne	.L7287
	movq	%rax, 8(%rsp)
	movq	%r12, %r11
.L7284:
	movq	48(%rsp), %r12
	movq	24(%rsp), %rbx
	movq	%r11, 16(%rsp)
	movq	8(%rsp), %rdi
	addl	$7, 100(%rsp)
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	stbiw__zlib_flushf
	movq	16(%rsp), %r11
	movq	%rax, %r13
	movl	100(%rsp), %eax
	testl	%eax, %eax
	je	.L7288
	movl	%eax, %edx
	movq	%r13, %rdi
	movq	%r11, %r14
	.p2align 4,,10
	.p2align 3
.L7289:
	addl	$1, %edx
	movq	%rbx, %rsi
	movl	%edx, 100(%rsp)
	movq	%r12, %rdx
	call	stbiw__zlib_flushf
	movl	100(%rsp), %edx
	movq	%rax, %rdi
	testl	%edx, %edx
	jne	.L7289
	movq	%rax, %r13
	movq	%r14, %r11
.L7288:
	movq	%r11, %rbx
	leaq	131072(%r11), %r12
	movq	%r11, %r14
	.p2align 4,,10
	.p2align 3
.L7291:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7290
	subq	$8, %rdi
	call	free@PLT
.L7290:
	addq	$8, %rbx
	cmpq	%r12, %rbx
	jne	.L7291
	movq	%r14, %rdi
	call	free@PLT
	movl	56(%rsp), %ebx
	movl	-4(%r13), %esi
	leaq	-8(%r13), %rcx
	movq	%rcx, %r11
	leal	32766(%rbx), %edx
	movl	%ebx, %r14d
	movslq	%edx, %rax
	imulq	$-2147418109, %rax, %rax
	shrq	$32, %rax
	addl	%edx, %eax
	sarl	$31, %edx
	sarl	$14, %eax
	subl	%edx, %eax
	leal	(%rax,%rax,4), %eax
	leal	2(%rbx,%rax), %eax
	cmpl	%eax, %esi
	jle	.L7292
	movl	$2, -4(%r13)
	testl	%ebx, %ebx
	jle	.L7312
	movq	%rbp, 24(%rsp)
	movl	$2, %esi
	xorl	%ebx, %ebx
	movq	%rcx, %r12
	jmp	.L7299
	.p2align 4,,10
	.p2align 3
.L7295:
	movl	%edx, -4(%r13)
	movb	%bpl, 0(%r13,%rax)
	movslq	-4(%r13), %rax
	movl	-8(%r13), %esi
	leal	1(%rax), %edx
	cmpl	%esi, %edx
	jge	.L7403
.L7296:
	movl	%ebp, %ecx
	movl	%edx, -4(%r13)
	movzbl	%ch, %ecx
	movb	%cl, 0(%r13,%rax)
	movslq	-4(%r13), %rax
	movl	-8(%r13), %esi
	leal	1(%rax), %edx
	cmpl	%esi, %edx
	jge	.L7404
.L7297:
	movl	%edx, -4(%r13)
	movl	%ebp, %edx
	notl	%edx
	movb	%dl, 0(%r13,%rax)
	movslq	-4(%r13), %rax
	movl	-8(%r13), %esi
	leal	1(%rax), %edx
	cmpl	%esi, %edx
	jge	.L7405
.L7298:
	movl	%edx, -4(%r13)
	movl	%ebp, %edx
	movslq	%ebx, %rsi
	addl	%ebp, %ebx
	notl	%edx
	addq	%r15, %rsi
	movzbl	%dh, %ecx
	movslq	%ebp, %rdx
	movb	%cl, 0(%r13,%rax)
	movslq	-4(%r13), %rdi
	addq	%r13, %rdi
	call	memcpy@PLT
	movl	-4(%r13), %esi
	addl	%ebp, %esi
	movl	%esi, -4(%r13)
	cmpl	%ebx, %r14d
	jle	.L7390
	leaq	-8(%r13), %r12
.L7299:
	movl	%r14d, %edx
	movl	$32767, %ecx
	movl	-8(%r13), %edi
	leal	1(%rsi), %eax
	subl	%ebx, %edx
	cmpl	%ecx, %edx
	cmovle	%edx, %ecx
	movl	%ecx, %ebp
	cmpl	%edi, %eax
	jl	.L7294
	leal	1(%rdi,%rdi), %r8d
	movq	%r12, %rdi
	movl	%edx, 16(%rsp)
	movslq	%r8d, %rsi
	movl	%r8d, 8(%rsp)
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7249
	movl	8(%rsp), %r8d
	movl	4(%rax), %esi
	leaq	8(%rax), %r13
	movl	16(%rsp), %edx
	movl	%r8d, (%rax)
	leal	1(%rsi), %eax
.L7294:
	movslq	%esi, %rsi
	cmpl	$32767, %edx
	movl	%eax, -4(%r13)
	setle	0(%r13,%rsi)
	movslq	-4(%r13), %rax
	movl	-8(%r13), %esi
	leal	1(%rax), %edx
	cmpl	%esi, %edx
	jl	.L7295
	leal	1(%rsi,%rsi), %edx
	movq	%r12, %rdi
	movslq	%edx, %rsi
	movl	%edx, 8(%rsp)
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7249
	movl	8(%rsp), %edx
	leaq	8(%rax), %r13
	movl	%edx, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7295
	.p2align 4,,10
	.p2align 3
.L7402:
	movq	40(%rsp), %rax
	movq	32(%rsp), %rdi
	leaq	1(%r15,%rax), %rdx
	movzbl	2(%rdx), %eax
	movzwl	(%rdx), %edx
	sall	$16, %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$5, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$4, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$25, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$6, %edx
	addl	%edx, %eax
	andl	$16383, %eax
	movq	(%rdi,%rax,8), %rsi
	testq	%rsi, %rsi
	je	.L7265
	movslq	-4(%rsi), %rax
	testl	%eax, %eax
	jle	.L7265
	movl	56(%rsp), %edi
	leal	-32767(%r14), %r8d
	leaq	(%rsi,%rax,8), %r9
	movslq	%r8d, %r8
	subl	$1, %edi
	subl	%r14d, %edi
	jmp	.L7271
	.p2align 4,,10
	.p2align 3
.L7266:
	addq	$8, %rsi
	cmpq	%rsi, %r9
	je	.L7265
.L7271:
	movq	(%rsi), %rcx
	movq	%rcx, %rax
	subq	%r15, %rax
	cmpq	%r8, %rax
	jle	.L7266
	testl	%edi, %edi
	jle	.L7266
	movl	$1, %eax
	jmp	.L7268
	.p2align 4,,10
	.p2align 3
.L7406:
	movl	%eax, %edx
	addq	$1, %rax
	cmpl	%edx, %edi
	jle	.L7270
	cmpl	$257, %edx
	jg	.L7270
.L7268:
	movzbl	(%rbx,%rax), %edx
	cmpb	%dl, -1(%rcx,%rax)
	je	.L7406
	leal	-1(%rax), %edx
.L7270:
	cmpl	%edx, %ebp
	jl	.L7264
	addq	$8, %rsi
	cmpq	%rsi, %r9
	jne	.L7271
	.p2align 4,,10
	.p2align 3
.L7265:
	subq	%r12, %rbx
	movq	%rbx, %r13
	movl	%ebx, %r12d
	cmpl	$32767, %ebx
	jg	.L7314
	cmpl	$258, %ebp
	jg	.L7314
	leaq	2+lengthc.26(%rip), %rax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L7274:
	movzwl	(%rax), %ecx
	movslq	%edx, %rbx
	addq	$2, %rax
	leal	1(%rbx), %edx
	cmpl	%ebp, %ecx
	jle	.L7274
	movl	100(%rsp), %ecx
	movl	96(%rsp), %esi
	cmpl	$22, %ebx
	jg	.L7275
	movl	%edx, %edi
	leal	(%rdx,%rdx), %eax
	sarl	%edi
	andl	$2, %eax
	andl	$1, %edi
	orl	%edi, %eax
	movl	%edx, %edi
	sarl	$2, %edi
	addl	%eax, %eax
	andl	$1, %edi
	orl	%eax, %edi
	movl	%edx, %eax
	sarl	$4, %edx
	sarl	$3, %eax
	addl	%edi, %edi
	andl	$1, %eax
	orl	%edi, %eax
	addl	%eax, %eax
	orl	%eax, %edx
	leal	0(,%rdx,4), %eax
	sall	%cl, %eax
	addl	$7, %ecx
	orl	%esi, %eax
	movl	%eax, 96(%rsp)
.L7395:
	movq	8(%rsp), %rdi
	movq	48(%rsp), %rdx
	movl	%ecx, 100(%rsp)
	movq	24(%rsp), %rsi
	call	stbiw__zlib_flushf
	movq	%rax, %rdi
	leaq	lengtheb.25(%rip), %rax
	movzbl	(%rax,%rbx), %eax
	testb	%al, %al
	jne	.L7407
.L7277:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7278:
	leaq	2+distc.24(%rip), %rbx
	movzwl	(%rbx,%rax,2), %edx
	movq	%rax, %rbx
	addq	$1, %rax
	cmpl	%r12d, %edx
	jle	.L7278
	movl	%ebx, %edx
	leal	(%rbx,%rbx), %eax
	movl	100(%rsp), %ecx
	movq	24(%rsp), %rsi
	sarl	%edx
	andl	$2, %eax
	andl	$1, %edx
	orl	%edx, %eax
	movl	%ebx, %edx
	sarl	$2, %edx
	addl	%eax, %eax
	andl	$1, %edx
	orl	%eax, %edx
	movl	%ebx, %eax
	sarl	$3, %eax
	addl	%edx, %edx
	andl	$1, %eax
	orl	%edx, %eax
	movl	%ebx, %edx
	movslq	%ebx, %rbx
	sarl	$4, %edx
	addl	%eax, %eax
	orl	%edx, %eax
	movq	48(%rsp), %rdx
	sall	%cl, %eax
	addl	$5, %ecx
	orl	%eax, 96(%rsp)
	movl	%ecx, 100(%rsp)
	call	stbiw__zlib_flushf
	movq	%rax, 8(%rsp)
	leaq	disteb.23(%rip), %rax
	movzbl	(%rax,%rbx), %eax
	testb	%al, %al
	jne	.L7408
.L7279:
	addl	%ebp, %r14d
	jmp	.L7280
	.p2align 4,,10
	.p2align 3
.L7281:
	addl	$256, %eax
	movl	%eax, %edi
	leal	(%rax,%rax), %esi
	sarl	%edi
	andl	$2, %esi
	andl	$1, %edi
	orl	%edi, %esi
	movl	%eax, %edi
	sarl	$2, %edi
	addl	%esi, %esi
	andl	$1, %edi
	orl	%esi, %edi
	movl	%eax, %esi
	sarl	$3, %esi
	addl	%edi, %edi
	andl	$1, %esi
	orl	%edi, %esi
	movl	%eax, %edi
	sarl	$4, %edi
	addl	%esi, %esi
	andl	$1, %edi
	orl	%esi, %edi
	movl	%eax, %esi
	sarl	$6, %eax
	sarl	$5, %esi
	addl	%edi, %edi
	andl	$1, %eax
	andl	$1, %esi
	orl	%edi, %esi
	addl	%esi, %esi
	orl	%esi, %eax
	leal	3(,%rax,4), %eax
	sall	%cl, %eax
	addl	$9, %ecx
	orl	%edx, %eax
	movl	%eax, 96(%rsp)
	jmp	.L7396
	.p2align 4,,10
	.p2align 3
.L7251:
	movl	$24, %edi
	movb	%r11b, 60(%rsp)
	call	malloc@PLT
	movzbl	60(%rsp), %r11d
	testq	%rax, %rax
	movq	%rax, %rsi
	je	.L7260
	movl	$0, 4(%rax)
	xorl	%r12d, %r12d
	xorl	%eax, %eax
	movl	$1, %ecx
	movl	$3, %ebp
	movl	$2, %edx
	jmp	.L7263
.L7407:
	leaq	lengthc.26(%rip), %rdx
	movl	100(%rsp), %ecx
	movzwl	(%rdx,%rbx,2), %esi
	movl	%ebp, %edx
	addl	%ecx, %eax
	subl	%esi, %edx
	movq	24(%rsp), %rsi
	movl	%eax, 100(%rsp)
	sall	%cl, %edx
	orl	%edx, 96(%rsp)
	movq	48(%rsp), %rdx
	call	stbiw__zlib_flushf
	movq	%rax, %rdi
	jmp	.L7277
.L7401:
	movq	80(%rsp), %rdx
	movq	%r8, %rdi
	movb	%r11b, 60(%rsp)
	leaq	(%r8,%rdx), %rsi
	call	memmove@PLT
	movzbl	60(%rsp), %r11d
	movq	%rax, %r8
	movslq	76(%rsp), %rax
	movl	%eax, -4(%r8)
	jmp	.L7252
.L7275:
	leal	169(%rbx), %eax
	movl	%eax, %edi
	leal	(%rax,%rax), %edx
	sarl	$2, %eax
	sarl	%edi
	andl	$2, %edx
	andl	$1, %eax
	andl	$1, %edi
	orl	%edi, %edx
	addl	%edx, %edx
	orl	%edx, %eax
	sall	$5, %eax
	orl	$3, %eax
	sall	%cl, %eax
	addl	$8, %ecx
	orl	%esi, %eax
	movl	%eax, 96(%rsp)
	jmp	.L7395
.L7285:
	addl	$256, %eax
	movl	%eax, %r9d
	leal	(%rax,%rax), %esi
	sarl	%r9d
	andl	$2, %esi
	andl	$1, %r9d
	orl	%r9d, %esi
	movl	%eax, %r9d
	sarl	$2, %r9d
	addl	%esi, %esi
	andl	$1, %r9d
	orl	%esi, %r9d
	movl	%eax, %esi
	sarl	$3, %esi
	addl	%r9d, %r9d
	andl	$1, %esi
	orl	%r9d, %esi
	movl	%eax, %r9d
	sarl	$4, %r9d
	addl	%esi, %esi
	andl	$1, %r9d
	orl	%esi, %r9d
	movl	%eax, %esi
	sarl	$6, %eax
	sarl	$5, %esi
	addl	%r9d, %r9d
	andl	$1, %eax
	andl	$1, %esi
	orl	%r9d, %esi
	addl	%esi, %esi
	orl	%esi, %eax
	leal	3(,%rax,4), %eax
	sall	%cl, %eax
	addl	$9, %ecx
	orl	%edx, %eax
	movl	%eax, 96(%rsp)
	jmp	.L7397
.L7408:
	leaq	distc.24(%rip), %rdi
	movl	100(%rsp), %ecx
	movq	24(%rsp), %rsi
	movzwl	(%rdi,%rbx,2), %edx
	movq	8(%rsp), %rdi
	addl	%ecx, %eax
	subl	%edx, %r13d
	movq	48(%rsp), %rdx
	movl	%eax, 100(%rsp)
	sall	%cl, %r13d
	orl	%r13d, 96(%rsp)
	call	stbiw__zlib_flushf
	movq	%rax, 8(%rsp)
	jmp	.L7279
.L7292:
	movslq	%ebx, %r8
	movl	%ebx, %eax
	leal	1(%rsi), %r9d
	imulq	$1584310703, %r8, %r8
	sarl	$31, %eax
	sarq	$43, %r8
	subl	%eax, %r8d
	imull	$5552, %r8d, %eax
	movl	%ebx, %r8d
	subl	%eax, %r8d
	testl	%ebx, %ebx
	jle	.L7398
.L7301:
	xorl	%edi, %edi
	xorl	%r12d, %r12d
	movl	$1, %ebx
	testl	%r8d, %r8d
	je	.L7304
	movl	$1, %ebx
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L7303:
	movslq	%edi, %rdx
	movslq	%r8d, %rcx
	addq	%rdx, %rcx
	leaq	(%r15,%rdx), %rax
	addq	%r15, %rcx
	.p2align 4,,10
	.p2align 3
.L7302:
	movzbl	(%rax), %edx
	addq	$1, %rax
	addl	%edx, %ebx
	addl	%ebx, %r12d
	cmpq	%rcx, %rax
	jne	.L7302
.L7304:
	movl	%ebx, %eax
	movl	$2147975281, %edx
	addl	%r8d, %edi
	movl	$5552, %r8d
	imulq	%rdx, %rax
	shrq	$47, %rax
	imull	$65521, %eax, %eax
	subl	%eax, %ebx
	movl	%r12d, %eax
	imulq	%rdx, %rax
	shrq	$47, %rax
	imull	$65521, %eax, %eax
	subl	%eax, %r12d
	cmpl	%edi, 56(%rsp)
	jg	.L7303
.L7293:
	movl	-8(%r13), %eax
	cmpl	%r9d, %eax
	jg	.L7305
	leal	1(%rax,%rax), %r14d
	movq	%r11, %rdi
	movslq	%r14d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r11
	testq	%rax, %rax
	je	.L7249
	movl	4(%rax), %esi
	movl	%r14d, (%rax)
	leaq	8(%rax), %r13
	leal	1(%rsi), %r9d
.L7305:
	movl	%r12d, %eax
	movslq	%esi, %rsi
	movl	%r9d, -4(%r13)
	movzbl	%ah, %eax
	movb	%al, 0(%r13,%rsi)
	movslq	-4(%r13), %rax
	movl	-8(%r13), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7409
.L7306:
	movl	%edx, -4(%r13)
	movb	%r12b, 0(%r13,%rax)
	movslq	-4(%r13), %rax
	movl	-8(%r13), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7410
.L7307:
	movzbl	%bh, %ecx
	movl	%edx, -4(%r13)
	movb	%cl, 0(%r13,%rax)
	movslq	-4(%r13), %rax
	movl	-8(%r13), %ecx
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jge	.L7411
.L7308:
	movl	%edx, -4(%r13)
	movq	%r11, %rdi
	movq	%r13, %rsi
	movb	%bl, 0(%r13,%rax)
	movslq	-4(%r13), %rdx
	movl	%edx, 0(%rbp)
	call	memmove@PLT
	movq	%rax, %r11
.L7246:
	movq	104(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7412
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r11, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L7405:
	.cfi_restore_state
	leal	1(%rsi,%rsi), %edx
	movq	%r12, %rdi
	movslq	%edx, %rsi
	movl	%edx, 8(%rsp)
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7249
	movl	8(%rsp), %edx
	leaq	8(%rax), %r13
	movl	%edx, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7298
.L7404:
	leal	1(%rsi,%rsi), %edx
	movq	%r12, %rdi
	movslq	%edx, %rsi
	movl	%edx, 8(%rsp)
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7249
	movl	8(%rsp), %edx
	leaq	8(%rax), %r13
	movl	%edx, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7297
.L7403:
	leal	1(%rsi,%rsi), %edx
	movq	%r12, %rdi
	movslq	%edx, %rsi
	movl	%edx, 8(%rsp)
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L7249
	movl	8(%rsp), %edx
	leaq	8(%rax), %r13
	movl	%edx, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7296
.L7390:
	movslq	56(%rsp), %r8
	movq	24(%rsp), %rbp
	movq	%r12, %r11
	leal	1(%rsi), %r9d
	movq	%r8, %rbx
	imulq	$1584310703, %r8, %r8
	movl	%ebx, %eax
	sarl	$31, %eax
	sarq	$43, %r8
	subl	%eax, %r8d
	imull	$5552, %r8d, %eax
	subl	%eax, %ebx
	movl	%ebx, %r8d
	jmp	.L7301
.L7311:
	xorl	%r12d, %r12d
	movl	$3, %ebp
	jmp	.L7252
.L7411:
	leal	1(%rcx,%rcx), %r12d
	movq	%r11, %rdi
	movslq	%r12d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r11
	testq	%rax, %rax
	je	.L7249
	movl	%r12d, (%rax)
	leaq	8(%rax), %r13
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7308
.L7410:
	leal	1(%rcx,%rcx), %r12d
	movq	%r11, %rdi
	movslq	%r12d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r11
	testq	%rax, %rax
	je	.L7249
	movl	%r12d, (%rax)
	leaq	8(%rax), %r13
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7307
.L7409:
	leal	1(%rcx,%rcx), %r14d
	movq	%r11, %rdi
	movslq	%r14d, %rsi
	addq	$8, %rsi
	call	realloc@PLT
	movq	%rax, %r11
	testq	%rax, %rax
	je	.L7249
	movl	%r14d, (%rax)
	leaq	8(%rax), %r13
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L7306
.L7312:
	movl	$3, %r9d
	movl	$2, %esi
.L7398:
	xorl	%r12d, %r12d
	movl	$1, %ebx
	jmp	.L7293
.L7310:
	xorl	%r14d, %r14d
	jmp	.L7250
.L7314:
	leaq	__PRETTY_FUNCTION__.27(%rip), %rcx
	movl	$973, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC250(%rip), %rdi
	call	__assert_fail@PLT
.L7260:
	leaq	__PRETTY_FUNCTION__.22(%rip), %rcx
	movl	$844, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC44(%rip), %rdi
	call	__assert_fail@PLT
.L7249:
	call	stbiw__sbgrowf.part.0
.L7412:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE792:
	.size	stbi_zlib_compress, .-stbi_zlib_compress
	.section	.rodata.str1.1
.LC255:
	.string	"o == out + *out_len"
	.text
	.p2align 4
	.globl	stbi_write_png_to_mem
	.type	stbi_write_png_to_mem, @function
stbi_write_png_to_mem:
.LFB797:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%ecx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movdqa	.LC251(%rip), %xmm0
	movq	%rdi, 24(%rsp)
	movl	%edx, 16(%rsp)
	imull	%r8d, %edx
	movl	%r8d, 20(%rsp)
	movq	%r9, 80(%rsp)
	leal	1(%rdx), %ebp
	movl	%edx, %r15d
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	movl	stbi_write_force_png_filter(%rip), %eax
	testl	%esi, %esi
	movaps	%xmm0, 112(%rsp)
	movl	$6, 128(%rsp)
	cmove	%edx, %esi
	movl	%esi, 32(%rsp)
	cmpl	$5, %eax
	movl	%eax, %ebx
	movl	$-1, %eax
	cmovl	%ebx, %eax
	movl	%eax, 88(%rsp)
	movl	%ebp, %eax
	imull	%ecx, %eax
	movslq	%eax, %rdi
	movl	%eax, 92(%rsp)
	call	malloc@PLT
	movq	%rax, 72(%rsp)
	testq	%rax, %rax
	je	.L7435
	movslq	%r15d, %rax
	movq	%rax, %rdi
	movq	%rax, 48(%rsp)
	call	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L7417
	testl	%r13d, %r13d
	jle	.L7432
	movslq	%ebp, %rax
	movl	%r15d, %ebp
	movl	%r13d, 12(%rsp)
	xorl	%r12d, %r12d
	movq	%rax, 56(%rsp)
	movq	72(%rsp), %rax
	shrl	$4, %ebp
	salq	$4, %rbp
	leaq	1(%rax), %r14
	leal	-1(%r15), %eax
	addq	%rbx, %rbp
	movl	%eax, 36(%rsp)
	movl	%r15d, %eax
	andl	$-16, %eax
	movl	%eax, 44(%rsp)
	jmp	.L7431
	.p2align 4,,10
	.p2align 3
.L7461:
	pushq	%rbx
	.cfi_def_cfa_offset 216
	movl	%r12d, %r8d
	pushq	%r13
	.cfi_def_cfa_offset 224
	movl	36(%rsp), %r9d
	movl	28(%rsp), %ecx
	movl	32(%rsp), %edx
	movl	48(%rsp), %esi
	movq	40(%rsp), %rdi
	call	stbiw__encode_png_line
	popq	%r8
	.cfi_def_cfa_offset 216
	movl	%r13d, %r11d
	popq	%r9
	.cfi_def_cfa_offset 208
.L7422:
	movb	%r11b, -1(%r14)
	movq	48(%rsp), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	addl	$1, %r12d
	call	memcpy@PLT
	movq	56(%rsp), %rax
	addq	%rax, %r14
	cmpl	%r12d, 12(%rsp)
	je	.L7460
.L7431:
	movl	88(%rsp), %r13d
	testl	%r13d, %r13d
	jns	.L7461
	xorl	%r11d, %r11d
	xorl	%r13d, %r13d
	movl	$2147483647, %eax
	movq	%r14, 64(%rsp)
	movl	%r11d, 40(%rsp)
	movl	%r15d, %r14d
	movq	%rbp, %r15
	movl	%r13d, %ebp
	movl	%eax, %r13d
	.p2align 4,,10
	.p2align 3
.L7421:
	pushq	%rbx
	.cfi_def_cfa_offset 216
	movl	%r12d, %r8d
	pushq	%rbp
	.cfi_def_cfa_offset 224
	movl	36(%rsp), %r9d
	movl	28(%rsp), %ecx
	movl	32(%rsp), %edx
	movl	48(%rsp), %esi
	movq	40(%rsp), %rdi
	call	stbiw__encode_png_line
	popq	%rsi
	.cfi_def_cfa_offset 216
	popq	%rdi
	.cfi_def_cfa_offset 208
	testl	%r14d, %r14d
	jle	.L7439
	cmpl	$14, 36(%rsp)
	jbe	.L7440
	pxor	%xmm0, %xmm0
	pxor	%xmm5, %xmm5
	pxor	%xmm4, %xmm4
	movq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L7425:
	movdqu	(%rdx), %xmm6
	movdqa	%xmm5, %xmm2
	addq	$16, %rdx
	psubb	%xmm6, %xmm2
	pminub	%xmm6, %xmm2
	movdqa	%xmm2, %xmm3
	punpckhbw	%xmm5, %xmm2
	punpcklbw	%xmm5, %xmm3
	movdqa	%xmm3, %xmm1
	punpckhwd	%xmm4, %xmm3
	punpcklwd	%xmm4, %xmm1
	paddd	%xmm1, %xmm0
	movdqa	%xmm2, %xmm1
	punpckhwd	%xmm4, %xmm2
	paddd	%xmm3, %xmm0
	punpcklwd	%xmm4, %xmm1
	paddd	%xmm1, %xmm0
	paddd	%xmm2, %xmm0
	cmpq	%rdx, %r15
	jne	.L7425
	movdqa	%xmm0, %xmm1
	psrldq	$8, %xmm1
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %edx
	testb	$15, %r14b
	je	.L7423
	movl	44(%rsp), %ecx
.L7424:
	movslq	%ecx, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	1(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	2(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	3(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	4(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	5(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	6(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	7(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	8(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	9(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	10(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	11(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	12(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	movzbl	%sil, %esi
	addl	%esi, %edx
	leal	13(%rcx), %esi
	cmpl	%esi, %r14d
	jle	.L7423
	movslq	%esi, %rsi
	movzbl	(%rbx,%rsi), %edi
	movl	%edi, %esi
	negb	%sil
	cmovs	%edi, %esi
	addl	$14, %ecx
	movzbl	%sil, %esi
	addl	%esi, %edx
	cmpl	%ecx, %r14d
	jle	.L7423
	movslq	%ecx, %rcx
	movzbl	(%rbx,%rcx), %esi
	movl	%esi, %ecx
	negb	%cl
	cmovs	%esi, %ecx
	movzbl	%cl, %ecx
	addl	%ecx, %edx
	.p2align 4,,10
	.p2align 3
.L7423:
	cmpl	%edx, %r13d
	jle	.L7428
	movl	%ebp, 40(%rsp)
	movl	%edx, %r13d
.L7428:
	addl	$1, %ebp
	cmpl	$5, %ebp
	jne	.L7421
	movl	40(%rsp), %r11d
	movq	%r15, %rbp
	movl	%r14d, %r15d
	movq	64(%rsp), %r14
	cmpl	$5, %r11d
	je	.L7422
	pushq	%rbx
	.cfi_def_cfa_offset 216
	movl	%r12d, %r8d
	pushq	%r11
	.cfi_def_cfa_offset 224
	movl	36(%rsp), %r9d
	movl	28(%rsp), %ecx
	movl	32(%rsp), %edx
	movl	48(%rsp), %esi
	movq	40(%rsp), %rdi
	movl	%r11d, 56(%rsp)
	call	stbiw__encode_png_line
	popq	%rdx
	.cfi_def_cfa_offset 216
	popq	%rcx
	.cfi_def_cfa_offset 208
	movl	40(%rsp), %r11d
	jmp	.L7422
	.p2align 4,,10
	.p2align 3
.L7439:
	xorl	%edx, %edx
	jmp	.L7423
.L7440:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	jmp	.L7424
.L7460:
	movl	12(%rsp), %r13d
.L7432:
	movq	%rbx, %rdi
	call	free@PLT
	movq	72(%rsp), %r15
	movl	stbi_write_png_compression_level(%rip), %ecx
	leaq	108(%rsp), %rdx
	movl	92(%rsp), %esi
	movq	%r15, %rdi
	call	stbi_zlib_compress
	movq	%r15, %rdi
	movq	%rax, %rbx
	call	free@PLT
	testq	%rbx, %rbx
	je	.L7435
	movl	108(%rsp), %r12d
	leal	57(%r12), %r15d
	movl	%r12d, %r14d
	movslq	%r15d, %rdi
	bswap	%r14d
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L7435
	movq	80(%rsp), %rax
	movl	%r13d, %esi
	movl	%r13d, %edi
	movl	%r13d, %ecx
	sarl	$8, %esi
	sarl	$16, %edi
	movl	16(%rsp), %r11d
	movl	%r14d, 33(%rbp)
	movl	%r15d, (%rax)
	movzbl	%sil, %r10d
	sarl	$24, %ecx
	leaq	41(%rbp), %r14
	movzbl	%cl, %ecx
	movl	%r11d, %r8d
	movl	%r11d, %r9d
	movl	%r11d, %edx
	sarl	$8, %r8d
	sarl	$16, %r9d
	leaq	crc_table.18(%rip), %r15
	movabsq	$727905341920923785, %rax
	movq	%rax, 0(%rbp)
	movq	.LC252(%rip), %rax
	sarl	$24, %edx
	movzbl	%dl, %edx
	movb	$8, 24(%rbp)
	movq	%rax, 8(%rbp)
	movzbl	%r13b, %eax
	salq	$8, %rax
	movb	$0, 28(%rbp)
	orq	%r10, %rax
	movzbl	%dil, %r10d
	movl	$1413563465, 37(%rbp)
	salq	$8, %rax
	orq	%r10, %rax
	salq	$8, %rax
	orq	%rcx, %rax
	movzbl	%r11b, %ecx
	salq	$8, %rax
	orq	%rcx, %rax
	movzbl	%r8b, %ecx
	salq	$8, %rax
	orq	%rcx, %rax
	movzbl	%r9b, %ecx
	salq	$8, %rax
	orq	%rcx, %rax
	salq	$8, %rax
	orq	%rdx, %rax
	movq	%rax, 16(%rbp)
	movslq	20(%rsp), %rax
	movl	112(%rsp,%rax,4), %edx
	xorl	%eax, %eax
	movw	%ax, 26(%rbp)
	movl	%r11d, %eax
	shrl	$24, %eax
	movb	%dl, 25(%rbp)
	xorb	$-11, %al
	movl	%eax, %eax
	movl	(%r15,%rax,4), %eax
	xorl	$5725777, %eax
	movl	%eax, %ecx
	xorl	%r9d, %eax
	movzbl	%al, %eax
	shrl	$8, %ecx
	xorl	(%r15,%rax,4), %ecx
	movl	%ecx, %eax
	xorl	%r8d, %ecx
	movl	%r13d, %r8d
	movzbl	%cl, %ecx
	shrl	$8, %eax
	xorl	(%r15,%rcx,4), %eax
	movl	%eax, %ecx
	xorl	%r11d, %eax
	movzbl	%al, %eax
	shrl	$8, %ecx
	xorl	(%r15,%rax,4), %ecx
	shrl	$24, %r8d
	movl	%ecx, %eax
	xorl	%r8d, %ecx
	movzbl	%cl, %ecx
	shrl	$8, %eax
	xorl	(%r15,%rcx,4), %eax
	movl	%eax, %ecx
	xorl	%edi, %eax
	movq	%r14, %rdi
	movzbl	%al, %eax
	shrl	$8, %ecx
	xorl	(%r15,%rax,4), %ecx
	movl	%ecx, %eax
	xorl	%esi, %ecx
	movq	%rbx, %rsi
	movzbl	%cl, %ecx
	shrl	$8, %eax
	xorl	(%r15,%rcx,4), %eax
	movl	%eax, %ecx
	xorl	%r13d, %eax
	movslq	%r12d, %r13
	movzbl	%al, %eax
	shrl	$8, %ecx
	addq	%r13, %r14
	xorl	(%r15,%rax,4), %ecx
	movl	%ecx, %eax
	movzbl	%cl, %ecx
	xorq	$8, %rcx
	shrl	$8, %eax
	xorl	(%r15,%rcx,4), %eax
	movl	%eax, %ecx
	xorl	%edx, %eax
	movzbl	%al, %eax
	shrl	$8, %ecx
	xorl	(%r15,%rax,4), %ecx
	movzbl	%cl, %edx
	movl	%ecx, %eax
	shrl	$8, %eax
	xorl	(%r15,%rdx,4), %eax
	movl	%eax, %edx
	movzbl	%al, %eax
	shrl	$8, %edx
	xorl	(%r15,%rax,4), %edx
	movl	%edx, %eax
	movzbl	%dl, %edx
	shrl	$8, %eax
	xorl	(%r15,%rdx,4), %eax
	movq	%r13, %rdx
	notl	%eax
	bswap	%eax
	movl	%eax, 29(%rbp)
	call	memmove@PLT
	movq	%rbx, %rdi
	call	free@PLT
	cmpl	$-3, %r12d
	jl	.L7441
	leal	3(%r12), %eax
	leaq	37(%rbp), %rdx
	subq	%r13, %rax
	leaq	-3(%r14,%rax), %rsi
	movl	$-1, %eax
	.p2align 4,,10
	.p2align 3
.L7434:
	movl	%eax, %ecx
	xorb	(%rdx), %al
	addq	$1, %rdx
	movzbl	%al, %eax
	shrl	$8, %ecx
	xorl	(%r15,%rax,4), %ecx
	movl	%ecx, %eax
	cmpq	%rdx, %rsi
	jne	.L7434
	notl	%eax
	bswap	%eax
.L7433:
	movl	%eax, (%r14)
	movq	.LC253(%rip), %rax
	addq	$16, %r14
	movq	%rax, -12(%r14)
	movl	.LC254(%rip), %eax
	movl	%eax, -4(%r14)
	movq	80(%rsp), %rax
	movslq	(%rax), %rax
	addq	%rbp, %rax
	cmpq	%r14, %rax
	jne	.L7462
.L7413:
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7463
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L7441:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L7433
.L7462:
	leaq	__PRETTY_FUNCTION__.21(%rip), %rcx
	movl	$1225, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC255(%rip), %rdi
	call	__assert_fail@PLT
.L7417:
	movq	72(%rsp), %rdi
	call	free@PLT
.L7435:
	xorl	%ebp, %ebp
	jmp	.L7413
.L7463:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE797:
	.size	stbi_write_png_to_mem, .-stbi_write_png_to_mem
	.p2align 4
	.globl	stbi_write_png
	.type	stbi_write_png, @function
stbi_write_png:
.LFB798:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %eax
	movq	%rdi, %rbp
	movl	%r9d, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%r8, %rdi
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %r8
	movq	%r8, 8(%rsp)
	xorl	%r8d, %r8d
	leaq	4(%rsp), %r9
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	%eax, %edx
	call	stbi_write_png_to_mem
	testq	%rax, %rax
	je	.L7465
	movq	%rbp, %rdi
	leaq	.LC248(%rip), %rsi
	movq	%rax, %rbx
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L7473
	movslq	4(%rsp), %rdx
	movq	%rax, %rcx
	movl	$1, %esi
	movq	%rbx, %rdi
	call	fwrite@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movl	$1, %eax
.L7464:
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7474
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L7474:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L7473:
	movq	%rbx, %rdi
	call	free@PLT
.L7465:
	xorl	%eax, %eax
	jmp	.L7464
	.cfi_endproc
.LFE798:
	.size	stbi_write_png, .-stbi_write_png
	.p2align 4
	.globl	stbi_write_png_to_func
	.type	stbi_write_png_to_func, @function
stbi_write_png_to_func:
.LFB799:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	movq	%r9, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movl	48(%rsp), %esi
	leaq	4(%rsp), %r9
	call	stbi_write_png_to_mem
	testq	%rax, %rax
	je	.L7478
	movq	%rax, %rbx
	movq	%rax, %rsi
	movl	4(%rsp), %edx
	movq	%r12, %rdi
	call	*%rbp
	movq	%rbx, %rdi
	call	free@PLT
	movl	$1, %eax
.L7475:
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7480
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7478:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L7475
.L7480:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE799:
	.size	stbi_write_png_to_func, .-stbi_write_png_to_func
	.p2align 4
	.globl	stbi_write_jpg_to_func
	.type	stbi_write_jpg_to_func, @function
stbi_write_jpg_to_func:
.LFB805:
	.cfi_startproc
	subq	$104, %rsp
	.cfi_def_cfa_offset 112
	pxor	%xmm0, %xmm0
	movq	%rsi, %rax
	movl	%edx, %esi
	movl	%ecx, %edx
	movl	%r8d, %ecx
	movq	%r9, %r8
	movq	%fs:40, %r9
	movq	%r9, 88(%rsp)
	xorl	%r9d, %r9d
	movq	%rdi, (%rsp)
	movq	$0, 80(%rsp)
	movq	%rax, 8(%rsp)
	movaps	%xmm0, 16(%rsp)
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
	testq	%r8, %r8
	je	.L7485
	testl	%esi, %esi
	je	.L7485
	leal	-1(%rcx), %eax
	cmpl	$3, %eax
	ja	.L7485
	testl	%edx, %edx
	je	.L7485
	movl	112(%rsp), %r9d
	movq	%rsp, %rdi
	call	stbi_write_jpg_core.part.0
	jmp	.L7481
	.p2align 4,,10
	.p2align 3
.L7485:
	xorl	%eax, %eax
.L7481:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7487
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7487:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE805:
	.size	stbi_write_jpg_to_func, .-stbi_write_jpg_to_func
	.p2align 4
	.globl	stbi_write_jpg
	.type	stbi_write_jpg, @function
stbi_write_jpg:
.LFB806:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pxor	%xmm0, %xmm0
	movl	%ecx, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r9d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%edx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r12d
	leaq	.LC248(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r8, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movaps	%xmm0, 16(%rsp)
	movq	$0, 80(%rsp)
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
	call	fopen@PLT
	movq	%rax, %rbx
	leaq	stbi__stdio_write(%rip), %rax
	movq	%rax, (%rsp)
	movq	%rbx, 8(%rsp)
	testq	%rbx, %rbx
	je	.L7492
	testq	%rbp, %rbp
	je	.L7494
	testl	%r12d, %r12d
	je	.L7494
	leal	-1(%r15), %eax
	cmpl	$3, %eax
	ja	.L7494
	testl	%r13d, %r13d
	je	.L7494
	movq	%rbp, %r8
	movq	%rsp, %rdi
	movl	%r14d, %r9d
	movl	%r15d, %ecx
	movl	%r13d, %edx
	movl	%r12d, %esi
	call	stbi_write_jpg_core.part.0
	movl	%eax, %ebp
	jmp	.L7490
	.p2align 4,,10
	.p2align 3
.L7494:
	xorl	%ebp, %ebp
.L7490:
	movq	%rbx, %rdi
	call	fclose@PLT
.L7488:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7496
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L7492:
	.cfi_restore_state
	xorl	%ebp, %ebp
	jmp	.L7488
.L7496:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE806:
	.size	stbi_write_jpg, .-stbi_write_jpg
	.section	.rodata.str1.8
	.align 8
.LC256:
	.string	"%d %d new(old): %d %d %lf %lf\n"
	.text
	.p2align 4
	.globl	rotate2
	.type	rotate2, @function
rotate2:
.LFB807:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r9, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movl	%edi, 8(%rsp)
	leaq	136(%rsp), %rdi
	movl	%esi, 4(%rsp)
	leaq	128(%rsp), %rsi
	movq	%rcx, 72(%rsp)
	call	sincos@PLT
	movl	8(%rsp), %r11d
	pxor	%xmm3, %xmm3
	movsd	128(%rsp), %xmm2
	movl	4(%rsp), %r10d
	pxor	%xmm0, %xmm0
	movsd	136(%rsp), %xmm1
	cvtsi2sdl	%r11d, %xmm3
	cvtsi2sdl	%r10d, %xmm0
	movapd	%xmm3, %xmm4
	mulsd	%xmm2, %xmm4
	mulsd	%xmm1, %xmm3
	cvttsd2sil	%xmm4, %eax
	movapd	%xmm0, %xmm4
	mulsd	%xmm1, %xmm4
	mulsd	%xmm2, %xmm0
	movl	%eax, %esi
	negl	%esi
	cvttsd2sil	%xmm4, %edx
	cmovs	%eax, %esi
	cvttsd2sil	%xmm0, %ecx
	movl	%edx, %eax
	negl	%eax
	cmovs	%edx, %eax
	addl	%eax, %esi
	cvttsd2sil	%xmm3, %eax
	movl	%eax, %edx
	negl	%edx
	cmovs	%eax, %edx
	movl	%ecx, %eax
	negl	%eax
	cmovs	%ecx, %eax
	addl	%edx, %eax
	je	.L7498
	movl	%eax, %edx
	movl	%esi, %edi
	movl	%r11d, %r8d
	shrl	$31, %edx
	shrl	$31, %edi
	addl	%eax, %edx
	addl	%esi, %edi
	shrl	$31, %r8d
	movl	%edx, %ebx
	movl	%r10d, %edx
	sarl	%edi
	addl	%r11d, %r8d
	shrl	$31, %edx
	sarl	%ebx
	negl	%edi
	addl	%r10d, %edx
	negl	%ebx
	sarl	%r8d
	sarl	%edx
	testl	%esi, %esi
	je	.L7498
	pxor	%xmm3, %xmm3
	movl	%esi, %ecx
	movl	%eax, 84(%rsp)
	xorl	%r12d, %r12d
	cvtsi2sdl	%r8d, %xmm3
	movl	%r11d, 4(%rsp)
	xorl	%r15d, %r15d
	imull	%r14d, %ecx
	movl	%r10d, 64(%rsp)
	movq	%r13, 112(%rsp)
	movq	%rbp, 120(%rsp)
	movsd	%xmm3, 40(%rsp)
	pxor	%xmm3, %xmm3
	cvtsi2sdl	%edx, %xmm3
	movl	%r14d, %edx
	movl	%ecx, 96(%rsp)
	leal	-1(%r14), %ecx
	shrl	$4, %edx
	movl	%ecx, 80(%rsp)
	salq	$4, %rdx
	movl	%edi, 60(%rsp)
	movq	%rdx, 104(%rsp)
	movsd	%xmm3, 48(%rsp)
	movapd	%xmm1, %xmm3
	xorpd	.LC257(%rip), %xmm3
	movl	%ebx, 100(%rsp)
	movl	%esi, 56(%rsp)
	movl	%r12d, %esi
	movsd	%xmm3, 32(%rsp)
	movsd	%xmm2, 8(%rsp)
	movsd	%xmm1, 88(%rsp)
	.p2align 4,,10
	.p2align 3
.L7500:
	movl	100(%rsp), %eax
	pxor	%xmm0, %xmm0
	movsd	88(%rsp), %xmm3
	movl	%esi, %ebx
	movl	%esi, 68(%rsp)
	xorl	%r13d, %r13d
	leal	(%r15,%rax), %edx
	cvtsi2sdl	%edx, %xmm0
	mulsd	%xmm0, %xmm3
	mulsd	8(%rsp), %xmm0
	movsd	%xmm3, 16(%rsp)
	movsd	%xmm0, 24(%rsp)
	jmp	.L7502
	.p2align 4,,10
	.p2align 3
.L7504:
	addl	$1, %r13d
	addl	%r14d, %ebx
	cmpl	%r13d, 56(%rsp)
	je	.L7534
.L7502:
	movl	60(%rsp), %eax
	pxor	%xmm0, %xmm0
	movl	%r13d, %edx
	movl	%r15d, %esi
	movsd	8(%rsp), %xmm1
	leaq	.LC256(%rip), %rdi
	addl	%r13d, %eax
	cvtsi2sdl	%eax, %xmm0
	movl	$2, %eax
	mulsd	%xmm0, %xmm1
	mulsd	32(%rsp), %xmm0
	addsd	16(%rsp), %xmm1
	addsd	24(%rsp), %xmm0
	addsd	40(%rsp), %xmm1
	addsd	48(%rsp), %xmm0
	cvttsd2sil	%xmm1, %ebp
	cvttsd2sil	%xmm0, %r12d
	movl	%ebp, %r8d
	movl	%r12d, %ecx
	call	printf@PLT
	cmpl	%ebp, 4(%rsp)
	jle	.L7504
	movl	%ebp, %eax
	orl	%r12d, %eax
	js	.L7504
	cmpl	%r12d, 64(%rsp)
	jle	.L7504
	movl	4(%rsp), %ecx
	movslq	%ebx, %rsi
	imull	%r12d, %ecx
	leal	(%rcx,%rbp), %eax
	imull	%r14d, %eax
	cltq
	testl	%r14d, %r14d
	jle	.L7504
	cmpl	$6, 80(%rsp)
	jbe	.L7535
	movq	72(%rsp), %rdx
	addq	208(%rsp), %rsi
	movq	%rsi, %rcx
	leaq	1(%rdx,%rax), %rdi
	subq	%rdi, %rcx
	cmpq	$14, %rcx
	ja	.L7536
.L7505:
	movq	72(%rsp), %rdi
	movslq	%r14d, %r8
	xorl	%ecx, %ecx
	addq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L7512:
	movzbl	(%rax,%rcx), %edx
	movb	%dl, (%rsi,%rcx)
	addq	$1, %rcx
	cmpq	%rcx, %r8
	jne	.L7512
	addl	$1, %r13d
	addl	%r14d, %ebx
	cmpl	%r13d, 56(%rsp)
	jne	.L7502
	.p2align 4,,10
	.p2align 3
.L7534:
	movl	68(%rsp), %esi
	movl	96(%rsp), %eax
	addl	$1, %r15d
	addl	%eax, %esi
	cmpl	%r15d, 84(%rsp)
	jne	.L7500
	movl	56(%rsp), %esi
	movl	84(%rsp), %eax
	movq	112(%rsp), %r13
	movq	120(%rsp), %rbp
.L7498:
	movl	%esi, 0(%r13)
	movl	%eax, 0(%rbp)
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7536:
	.cfi_restore_state
	cmpl	$14, 80(%rsp)
	jbe	.L7514
	addq	%rdx, %rax
	movq	104(%rsp), %rdx
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L7507:
	movdqu	(%rax,%rcx), %xmm3
	movups	%xmm3, (%rsi,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %rdx
	jne	.L7507
	movl	%r14d, %ecx
	andl	$-16, %ecx
	movl	%ecx, %edi
	cmpl	%r14d, %ecx
	je	.L7504
	movl	%r14d, %r8d
	subl	%ecx, %r8d
	leal	-1(%r8), %r9d
	cmpl	$6, %r9d
	jbe	.L7510
.L7506:
	movq	(%rax,%rdi), %r9
	movq	%r9, (%rsi,%rdi)
	movl	%r8d, %edi
	andl	$-8, %edi
	addl	%edi, %ecx
	andl	$7, %r8d
	je	.L7504
.L7510:
	movslq	%ecx, %rdi
	movzbl	(%rax,%rdi), %r8d
	movb	%r8b, (%rsi,%rdi)
	leal	1(%rcx), %edi
	cmpl	%edi, %r14d
	jle	.L7504
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	movb	%r8b, (%rsi,%rdi)
	leal	2(%rcx), %edi
	cmpl	%edi, %r14d
	jle	.L7504
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	movb	%r8b, (%rsi,%rdi)
	leal	3(%rcx), %edi
	cmpl	%edi, %r14d
	jle	.L7504
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	movb	%r8b, (%rsi,%rdi)
	leal	4(%rcx), %edi
	cmpl	%edi, %r14d
	jle	.L7504
	movslq	%edi, %rdi
	movzbl	(%rax,%rdi), %r8d
	movb	%r8b, (%rsi,%rdi)
	leal	5(%rcx), %edi
	cmpl	%edi, %r14d
	jle	.L7504
	movslq	%edi, %rdi
	addl	$6, %ecx
	movzbl	(%rax,%rdi), %r8d
	movb	%r8b, (%rsi,%rdi)
	cmpl	%ecx, %r14d
	jle	.L7504
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %eax
	movb	%al, (%rsi,%rcx)
	jmp	.L7504
	.p2align 4,,10
	.p2align 3
.L7535:
	movq	208(%rsp), %rdx
	addq	%rdx, %rsi
	jmp	.L7505
.L7514:
	movl	%r14d, %r8d
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	addq	%rdx, %rax
	jmp	.L7506
	.cfi_endproc
.LFE807:
	.size	rotate2, .-rotate2
	.section	.rodata.str1.1
.LC258:
	.string	"DOG.jpg"
.LC261:
	.string	"Malloc failed"
.LC262:
	.string	"%p\n"
.LC264:
	.string	"new_w = %d, new_h = %d\n"
.LC265:
	.string	"%d\n"
.LC266:
	.string	"%d'th: "
.LC267:
	.string	"%u\n"
.LC268:
	.string	"rotated.jpg"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB808:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%r8d, %r8d
	leaq	.LC258(%rip), %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	28(%rsp), %rcx
	leaq	24(%rsp), %rdx
	leaq	20(%rsp), %rsi
	call	stbi_load
	movl	20(%rsp), %ebx
	pxor	%xmm1, %xmm1
	movsd	.LC259(%rip), %xmm2
	movl	24(%rsp), %ebp
	pxor	%xmm0, %xmm0
	movq	%rax, 8(%rsp)
	cvtsi2sdl	%ebx, %xmm1
	cvtsi2sdl	%ebp, %xmm0
	movapd	%xmm1, %xmm3
	mulsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm4
	mulsd	%xmm2, %xmm0
	cvttsd2sil	%xmm3, %edx
	movsd	.LC260(%rip), %xmm3
	mulsd	%xmm3, %xmm4
	mulsd	%xmm3, %xmm1
	movl	%edx, %eax
	negl	%eax
	cmovs	%edx, %eax
	cvttsd2sil	%xmm4, %ecx
	movl	%ecx, %edx
	negl	%edx
	cmovs	%ecx, %edx
	cvttsd2sil	%xmm0, %ecx
	addl	%edx, %eax
	cvttsd2sil	%xmm1, %edx
	movl	%eax, 32(%rsp)
	movl	%edx, %eax
	negl	%eax
	cmovs	%edx, %eax
	movl	%ecx, %edx
	negl	%edx
	cmovs	%ecx, %edx
	movl	28(%rsp), %ecx
	addl	%edx, %eax
	movslq	%ebx, %rdx
	movl	%ecx, 4(%rsp)
	movl	%eax, 36(%rsp)
	movslq	%ebp, %rax
	imulq	%rdx, %rax
	movslq	%ecx, %rdx
	imulq	%rdx, %rax
	leaq	(%rax,%rax,2), %rdi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L7545
	leaq	.LC262(%rip), %r13
	movq	%rax, %r12
	movq	%rax, %rsi
	xorl	%eax, %eax
	movq	%r13, %rdi
	call	printf@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	movl	%ebp, %esi
	movl	%ebx, %edi
	pushq	%r12
	.cfi_def_cfa_offset 128
	movl	20(%rsp), %r15d
	movq	24(%rsp), %rcx
	movsd	.LC263(%rip), %xmm0
	movl	%r15d, %edx
	leaq	52(%rsp), %r9
	leaq	48(%rsp), %r8
	call	rotate@PLT
	movq	%r13, %rdi
	movq	%r12, %rsi
	xorl	%eax, %eax
	call	printf@PLT
	movl	48(%rsp), %esi
	movl	52(%rsp), %edx
	xorl	%eax, %eax
	leaq	.LC264(%rip), %rdi
	call	printf@PLT
	movl	48(%rsp), %esi
	movl	52(%rsp), %r13d
	popq	%rax
	.cfi_def_cfa_offset 120
	popq	%rdx
	.cfi_def_cfa_offset 112
	imull	%esi, %r13d
	imull	%r15d, %r13d
	testl	%r13d, %r13d
	jle	.L7540
	movslq	%r13d, %r13
	xorl	%r14d, %r14d
	leaq	.LC265(%rip), %r15
	.p2align 4,,10
	.p2align 3
.L7541:
	movl	%r14d, %esi
	movq	%r15, %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movzbl	(%r12,%r14), %ebp
	movl	%r14d, %esi
	xorl	%eax, %eax
	leaq	.LC266(%rip), %rdi
	call	printf@PLT
	movl	%r14d, %esi
	movzbl	%bpl, %edx
	xorl	%eax, %eax
	leaq	.LC267(%rip), %rdi
	addq	$1, %r14
	call	printf@PLT
	cmpq	%r14, %r13
	jne	.L7541
	movl	32(%rsp), %esi
.L7540:
	movl	4(%rsp), %ecx
	movl	36(%rsp), %edx
	xorl	%r9d, %r9d
	movq	%r12, %r8
	leaq	.LC268(%rip), %rdi
	call	stbi_write_jpg
	movq	8(%rsp), %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	xorl	%eax, %eax
.L7537:
	movq	40(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7546
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L7545:
	.cfi_restore_state
	leaq	.LC261(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L7537
.L7546:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE808:
	.size	main, .-main
	.section	.rodata
	.align 32
	.type	UVAC_HT.1, @object
	.size	UVAC_HT.1, 1024
UVAC_HT.1:
	.value	0
	.value	2
	.value	1
	.value	2
	.value	4
	.value	3
	.value	10
	.value	4
	.value	24
	.value	5
	.value	25
	.value	5
	.value	56
	.value	6
	.value	120
	.value	7
	.value	500
	.value	9
	.value	1014
	.value	10
	.value	4084
	.value	12
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	11
	.value	4
	.value	57
	.value	6
	.value	246
	.value	8
	.value	501
	.value	9
	.value	2038
	.value	11
	.value	4085
	.value	12
	.value	-120
	.value	16
	.value	-119
	.value	16
	.value	-118
	.value	16
	.value	-117
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	26
	.value	5
	.value	247
	.value	8
	.value	1015
	.value	10
	.value	4086
	.value	12
	.value	32706
	.value	15
	.value	-116
	.value	16
	.value	-115
	.value	16
	.value	-114
	.value	16
	.value	-113
	.value	16
	.value	-112
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	27
	.value	5
	.value	248
	.value	8
	.value	1016
	.value	10
	.value	4087
	.value	12
	.value	-111
	.value	16
	.value	-110
	.value	16
	.value	-109
	.value	16
	.value	-108
	.value	16
	.value	-107
	.value	16
	.value	-106
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	58
	.value	6
	.value	502
	.value	9
	.value	-105
	.value	16
	.value	-104
	.value	16
	.value	-103
	.value	16
	.value	-102
	.value	16
	.value	-101
	.value	16
	.value	-100
	.value	16
	.value	-99
	.value	16
	.value	-98
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	59
	.value	6
	.value	1017
	.value	10
	.value	-97
	.value	16
	.value	-96
	.value	16
	.value	-95
	.value	16
	.value	-94
	.value	16
	.value	-93
	.value	16
	.value	-92
	.value	16
	.value	-91
	.value	16
	.value	-90
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	121
	.value	7
	.value	2039
	.value	11
	.value	-89
	.value	16
	.value	-88
	.value	16
	.value	-87
	.value	16
	.value	-86
	.value	16
	.value	-85
	.value	16
	.value	-84
	.value	16
	.value	-83
	.value	16
	.value	-82
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	122
	.value	7
	.value	2040
	.value	11
	.value	-81
	.value	16
	.value	-80
	.value	16
	.value	-79
	.value	16
	.value	-78
	.value	16
	.value	-77
	.value	16
	.value	-76
	.value	16
	.value	-75
	.value	16
	.value	-74
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	249
	.value	8
	.value	-73
	.value	16
	.value	-72
	.value	16
	.value	-71
	.value	16
	.value	-70
	.value	16
	.value	-69
	.value	16
	.value	-68
	.value	16
	.value	-67
	.value	16
	.value	-66
	.value	16
	.value	-65
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	503
	.value	9
	.value	-64
	.value	16
	.value	-63
	.value	16
	.value	-62
	.value	16
	.value	-61
	.value	16
	.value	-60
	.value	16
	.value	-59
	.value	16
	.value	-58
	.value	16
	.value	-57
	.value	16
	.value	-56
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	504
	.value	9
	.value	-55
	.value	16
	.value	-54
	.value	16
	.value	-53
	.value	16
	.value	-52
	.value	16
	.value	-51
	.value	16
	.value	-50
	.value	16
	.value	-49
	.value	16
	.value	-48
	.value	16
	.value	-47
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	505
	.value	9
	.value	-46
	.value	16
	.value	-45
	.value	16
	.value	-44
	.value	16
	.value	-43
	.value	16
	.value	-42
	.value	16
	.value	-41
	.value	16
	.value	-40
	.value	16
	.value	-39
	.value	16
	.value	-38
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	506
	.value	9
	.value	-37
	.value	16
	.value	-36
	.value	16
	.value	-35
	.value	16
	.value	-34
	.value	16
	.value	-33
	.value	16
	.value	-32
	.value	16
	.value	-31
	.value	16
	.value	-30
	.value	16
	.value	-29
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	2041
	.value	11
	.value	-28
	.value	16
	.value	-27
	.value	16
	.value	-26
	.value	16
	.value	-25
	.value	16
	.value	-24
	.value	16
	.value	-23
	.value	16
	.value	-22
	.value	16
	.value	-21
	.value	16
	.value	-20
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	16352
	.value	14
	.value	-19
	.value	16
	.value	-18
	.value	16
	.value	-17
	.value	16
	.value	-16
	.value	16
	.value	-15
	.value	16
	.value	-14
	.value	16
	.value	-13
	.value	16
	.value	-12
	.value	16
	.value	-11
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	1018
	.value	10
	.value	32707
	.value	15
	.value	-10
	.value	16
	.value	-9
	.value	16
	.value	-8
	.value	16
	.value	-7
	.value	16
	.value	-6
	.value	16
	.value	-5
	.value	16
	.value	-4
	.value	16
	.value	-3
	.value	16
	.value	-2
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.align 32
	.type	UVDC_HT.2, @object
	.size	UVDC_HT.2, 1024
UVDC_HT.2:
	.value	0
	.value	2
	.value	1
	.value	2
	.value	2
	.value	2
	.value	6
	.value	3
	.value	14
	.value	4
	.value	30
	.value	5
	.value	62
	.value	6
	.value	126
	.value	7
	.value	254
	.value	8
	.value	510
	.value	9
	.value	1022
	.value	10
	.value	2046
	.value	11
	.zero	976
	.align 32
	.type	YAC_HT.3, @object
	.size	YAC_HT.3, 1024
YAC_HT.3:
	.value	10
	.value	4
	.value	0
	.value	2
	.value	1
	.value	2
	.value	4
	.value	3
	.value	11
	.value	4
	.value	26
	.value	5
	.value	120
	.value	7
	.value	248
	.value	8
	.value	1014
	.value	10
	.value	-126
	.value	16
	.value	-125
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	12
	.value	4
	.value	27
	.value	5
	.value	121
	.value	7
	.value	502
	.value	9
	.value	2038
	.value	11
	.value	-124
	.value	16
	.value	-123
	.value	16
	.value	-122
	.value	16
	.value	-121
	.value	16
	.value	-120
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	28
	.value	5
	.value	249
	.value	8
	.value	1015
	.value	10
	.value	4084
	.value	12
	.value	-119
	.value	16
	.value	-118
	.value	16
	.value	-117
	.value	16
	.value	-116
	.value	16
	.value	-115
	.value	16
	.value	-114
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	58
	.value	6
	.value	503
	.value	9
	.value	4085
	.value	12
	.value	-113
	.value	16
	.value	-112
	.value	16
	.value	-111
	.value	16
	.value	-110
	.value	16
	.value	-109
	.value	16
	.value	-108
	.value	16
	.value	-107
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	59
	.value	6
	.value	1016
	.value	10
	.value	-106
	.value	16
	.value	-105
	.value	16
	.value	-104
	.value	16
	.value	-103
	.value	16
	.value	-102
	.value	16
	.value	-101
	.value	16
	.value	-100
	.value	16
	.value	-99
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	122
	.value	7
	.value	2039
	.value	11
	.value	-98
	.value	16
	.value	-97
	.value	16
	.value	-96
	.value	16
	.value	-95
	.value	16
	.value	-94
	.value	16
	.value	-93
	.value	16
	.value	-92
	.value	16
	.value	-91
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	123
	.value	7
	.value	4086
	.value	12
	.value	-90
	.value	16
	.value	-89
	.value	16
	.value	-88
	.value	16
	.value	-87
	.value	16
	.value	-86
	.value	16
	.value	-85
	.value	16
	.value	-84
	.value	16
	.value	-83
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	250
	.value	8
	.value	4087
	.value	12
	.value	-82
	.value	16
	.value	-81
	.value	16
	.value	-80
	.value	16
	.value	-79
	.value	16
	.value	-78
	.value	16
	.value	-77
	.value	16
	.value	-76
	.value	16
	.value	-75
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	504
	.value	9
	.value	32704
	.value	15
	.value	-74
	.value	16
	.value	-73
	.value	16
	.value	-72
	.value	16
	.value	-71
	.value	16
	.value	-70
	.value	16
	.value	-69
	.value	16
	.value	-68
	.value	16
	.value	-67
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	505
	.value	9
	.value	-66
	.value	16
	.value	-65
	.value	16
	.value	-64
	.value	16
	.value	-63
	.value	16
	.value	-62
	.value	16
	.value	-61
	.value	16
	.value	-60
	.value	16
	.value	-59
	.value	16
	.value	-58
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	506
	.value	9
	.value	-57
	.value	16
	.value	-56
	.value	16
	.value	-55
	.value	16
	.value	-54
	.value	16
	.value	-53
	.value	16
	.value	-52
	.value	16
	.value	-51
	.value	16
	.value	-50
	.value	16
	.value	-49
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	1017
	.value	10
	.value	-48
	.value	16
	.value	-47
	.value	16
	.value	-46
	.value	16
	.value	-45
	.value	16
	.value	-44
	.value	16
	.value	-43
	.value	16
	.value	-42
	.value	16
	.value	-41
	.value	16
	.value	-40
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	1018
	.value	10
	.value	-39
	.value	16
	.value	-38
	.value	16
	.value	-37
	.value	16
	.value	-36
	.value	16
	.value	-35
	.value	16
	.value	-34
	.value	16
	.value	-33
	.value	16
	.value	-32
	.value	16
	.value	-31
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	2040
	.value	11
	.value	-30
	.value	16
	.value	-29
	.value	16
	.value	-28
	.value	16
	.value	-27
	.value	16
	.value	-26
	.value	16
	.value	-25
	.value	16
	.value	-24
	.value	16
	.value	-23
	.value	16
	.value	-22
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	-21
	.value	16
	.value	-20
	.value	16
	.value	-19
	.value	16
	.value	-18
	.value	16
	.value	-17
	.value	16
	.value	-16
	.value	16
	.value	-15
	.value	16
	.value	-14
	.value	16
	.value	-13
	.value	16
	.value	-12
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	2041
	.value	11
	.value	-11
	.value	16
	.value	-10
	.value	16
	.value	-9
	.value	16
	.value	-8
	.value	16
	.value	-7
	.value	16
	.value	-6
	.value	16
	.value	-5
	.value	16
	.value	-4
	.value	16
	.value	-3
	.value	16
	.value	-2
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.align 32
	.type	YDC_HT.4, @object
	.size	YDC_HT.4, 1024
YDC_HT.4:
	.value	0
	.value	2
	.value	2
	.value	3
	.value	3
	.value	3
	.value	4
	.value	3
	.value	5
	.value	3
	.value	6
	.value	3
	.value	14
	.value	4
	.value	30
	.value	5
	.value	62
	.value	6
	.value	126
	.value	7
	.value	254
	.value	8
	.value	510
	.value	9
	.zero	976
	.align 8
	.type	head2.5, @object
	.size	head2.5, 14
head2.5:
	.string	"\377\332"
	.string	"\f\003\001"
	.string	"\002\021\003\021"
	.string	"?"
	.align 32
	.type	std_ac_chrominance_values.6, @object
	.size	std_ac_chrominance_values.6, 162
std_ac_chrominance_values.6:
	.string	""
	.ascii	"\001\002\003\021\004\005!1\006\022AQ\007aq\023\"2\201\b\024B"
	.ascii	"\221\241\261\301\t#3R\360\025br\321\n\026$4\341%\361\027\030"
	.ascii	"\031\032&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\202\203\204"
	.ascii	"\205\206\207\210\211\212\222\223\224\225\226\227\230\231\232"
	.ascii	"\242\243\244\245\246\247\250\251\252\262\263\264\265\266\267"
	.ascii	"\270\271\272\302\303\304\305\306\307\310\311\312\322\323\324"
	.ascii	"\325\326\327\330\331\332\342\343\344\345\346\347\350\351\352"
	.ascii	"\362\363\364\365\366\367\370\371\372"
	.align 16
	.type	std_ac_chrominance_nrcodes.7, @object
	.size	std_ac_chrominance_nrcodes.7, 17
std_ac_chrominance_nrcodes.7:
	.string	""
	.string	""
	.string	"\002\001\002\004\004\003\004\007\005\004\004"
	.ascii	"\001\002w"
	.align 8
	.type	std_dc_chrominance_values.8, @object
	.size	std_dc_chrominance_values.8, 12
std_dc_chrominance_values.8:
	.string	""
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013"
	.align 16
	.type	std_dc_chrominance_nrcodes.9, @object
	.size	std_dc_chrominance_nrcodes.9, 17
std_dc_chrominance_nrcodes.9:
	.string	""
	.string	""
	.string	"\003\001\001\001\001\001\001\001\001\001"
	.string	""
	.string	""
	.string	""
	.string	""
	.align 32
	.type	std_ac_luminance_values.10, @object
	.size	std_ac_luminance_values.10, 162
std_ac_luminance_values.10:
	.string	"\001\002\003"
	.ascii	"\004\021\005\022!1A\006\023Qa\007\"q\0242\201\221\241\b#B\261"
	.ascii	"\301\025R\321\360$3br\202\t\n\026\027\030\031\032%&'()*45678"
	.ascii	"9:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\203\204\205\206\207\210\211"
	.ascii	"\212\222\223\224\225\226\227\230\231\232\242\243\244\245\246"
	.ascii	"\247\250\251\252\262\263\264\265\266\267\270\271\272\302\303"
	.ascii	"\304\305\306\307\310\311\312\322\323\324\325\326\327\330\331"
	.ascii	"\332\341\342\343\344\345\346\347\350\351\352\361\362\363\364"
	.ascii	"\365\366\367\370\371\372"
	.align 16
	.type	std_ac_luminance_nrcodes.11, @object
	.size	std_ac_luminance_nrcodes.11, 17
std_ac_luminance_nrcodes.11:
	.string	""
	.string	""
	.string	"\002\001\003\003\002\004\003\005\005\004\004"
	.string	""
	.ascii	"\001}"
	.align 8
	.type	std_dc_luminance_values.12, @object
	.size	std_dc_luminance_values.12, 12
std_dc_luminance_values.12:
	.string	""
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013"
	.align 16
	.type	std_dc_luminance_nrcodes.13, @object
	.size	std_dc_luminance_nrcodes.13, 17
std_dc_luminance_nrcodes.13:
	.string	""
	.string	""
	.string	"\001\005\001\001\001\001\001\001"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.align 16
	.type	head0.14, @object
	.size	head0.14, 25
head0.14:
	.string	"\377\330\377\340"
	.string	"\020JFIF"
	.string	"\001\001"
	.string	""
	.string	"\001"
	.string	"\001"
	.string	""
	.string	"\377\333"
	.string	"\204"
	.align 32
	.type	aasf.15, @object
	.size	aasf.15, 32
aasf.15:
	.long	1077216499
	.long	1081808063
	.long	1080853343
	.long	1079302960
	.long	1077216499
	.long	1074674138
	.long	1069805333
	.long	1061668290
	.align 32
	.type	UVQT.16, @object
	.size	UVQT.16, 256
UVQT.16:
	.long	17
	.long	18
	.long	24
	.long	47
	.long	99
	.long	99
	.long	99
	.long	99
	.long	18
	.long	21
	.long	26
	.long	66
	.long	99
	.long	99
	.long	99
	.long	99
	.long	24
	.long	26
	.long	56
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	47
	.long	66
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.align 32
	.type	YQT.17, @object
	.size	YQT.17, 256
YQT.17:
	.long	16
	.long	11
	.long	10
	.long	16
	.long	24
	.long	40
	.long	51
	.long	61
	.long	12
	.long	12
	.long	14
	.long	19
	.long	26
	.long	58
	.long	60
	.long	55
	.long	14
	.long	13
	.long	16
	.long	24
	.long	40
	.long	57
	.long	69
	.long	56
	.long	14
	.long	17
	.long	22
	.long	29
	.long	51
	.long	87
	.long	80
	.long	62
	.long	18
	.long	22
	.long	37
	.long	56
	.long	68
	.long	109
	.long	103
	.long	77
	.long	24
	.long	35
	.long	55
	.long	64
	.long	81
	.long	104
	.long	113
	.long	92
	.long	49
	.long	64
	.long	78
	.long	87
	.long	103
	.long	121
	.long	120
	.long	101
	.long	72
	.long	92
	.long	95
	.long	98
	.long	112
	.long	100
	.long	103
	.long	99
	.align 32
	.type	crc_table.18, @object
	.size	crc_table.18, 1024
crc_table.18:
	.long	0
	.long	1996959894
	.long	-301047508
	.long	-1727442502
	.long	124634137
	.long	1886057615
	.long	-379345611
	.long	-1637575261
	.long	249268274
	.long	2044508324
	.long	-522852066
	.long	-1747789432
	.long	162941995
	.long	2125561021
	.long	-407360249
	.long	-1866523247
	.long	498536548
	.long	1789927666
	.long	-205950648
	.long	-2067906082
	.long	450548861
	.long	1843258603
	.long	-187386543
	.long	-2083289657
	.long	325883990
	.long	1684777152
	.long	-43845254
	.long	-1973040660
	.long	335633487
	.long	1661365465
	.long	-99664541
	.long	-1928851979
	.long	997073096
	.long	1281953886
	.long	-715111964
	.long	-1570279054
	.long	1006888145
	.long	1258607687
	.long	-770865667
	.long	-1526024853
	.long	901097722
	.long	1119000684
	.long	-608450090
	.long	-1396901568
	.long	853044451
	.long	1172266101
	.long	-589951537
	.long	-1412350631
	.long	651767980
	.long	1373503546
	.long	-925412992
	.long	-1076862698
	.long	565507253
	.long	1454621731
	.long	-809855591
	.long	-1195530993
	.long	671266974
	.long	1594198024
	.long	-972236366
	.long	-1324619484
	.long	795835527
	.long	1483230225
	.long	-1050600021
	.long	-1234817731
	.long	1994146192
	.long	31158534
	.long	-1731059524
	.long	-271249366
	.long	1907459465
	.long	112637215
	.long	-1614814043
	.long	-390540237
	.long	2013776290
	.long	251722036
	.long	-1777751922
	.long	-519137256
	.long	2137656763
	.long	141376813
	.long	-1855689577
	.long	-429695999
	.long	1802195444
	.long	476864866
	.long	-2056965928
	.long	-228458418
	.long	1812370925
	.long	453092731
	.long	-2113342271
	.long	-183516073
	.long	1706088902
	.long	314042704
	.long	-1950435094
	.long	-54949764
	.long	1658658271
	.long	366619977
	.long	-1932296973
	.long	-69972891
	.long	1303535960
	.long	984961486
	.long	-1547960204
	.long	-725929758
	.long	1256170817
	.long	1037604311
	.long	-1529756563
	.long	-740887301
	.long	1131014506
	.long	879679996
	.long	-1385723834
	.long	-631195440
	.long	1141124467
	.long	855842277
	.long	-1442165665
	.long	-586318647
	.long	1342533948
	.long	654459306
	.long	-1106571248
	.long	-921952122
	.long	1466479909
	.long	544179635
	.long	-1184443383
	.long	-832445281
	.long	1591671054
	.long	702138776
	.long	-1328506846
	.long	-942167884
	.long	1504918807
	.long	783551873
	.long	-1212326853
	.long	-1061524307
	.long	-306674912
	.long	-1698712650
	.long	62317068
	.long	1957810842
	.long	-355121351
	.long	-1647151185
	.long	81470997
	.long	1943803523
	.long	-480048366
	.long	-1805370492
	.long	225274430
	.long	2053790376
	.long	-468791541
	.long	-1828061283
	.long	167816743
	.long	2097651377
	.long	-267414716
	.long	-2029476910
	.long	503444072
	.long	1762050814
	.long	-144550051
	.long	-2140837941
	.long	426522225
	.long	1852507879
	.long	-19653770
	.long	-1982649376
	.long	282753626
	.long	1742555852
	.long	-105259153
	.long	-1900089351
	.long	397917763
	.long	1622183637
	.long	-690576408
	.long	-1580100738
	.long	953729732
	.long	1340076626
	.long	-776247311
	.long	-1497606297
	.long	1068828381
	.long	1219638859
	.long	-670225446
	.long	-1358292148
	.long	906185462
	.long	1090812512
	.long	-547295293
	.long	-1469587627
	.long	829329135
	.long	1181335161
	.long	-882789492
	.long	-1134132454
	.long	628085408
	.long	1382605366
	.long	-871598187
	.long	-1156888829
	.long	570562233
	.long	1426400815
	.long	-977650754
	.long	-1296233688
	.long	733239954
	.long	1555261956
	.long	-1026031705
	.long	-1244606671
	.long	752459403
	.long	1541320221
	.long	-1687895376
	.long	-328994266
	.long	1969922972
	.long	40735498
	.long	-1677130071
	.long	-351390145
	.long	1913087877
	.long	83908371
	.long	-1782625662
	.long	-491226604
	.long	2075208622
	.long	213261112
	.long	-1831694693
	.long	-438977011
	.long	2094854071
	.long	198958881
	.long	-2032938284
	.long	-237706686
	.long	1759359992
	.long	534414190
	.long	-2118248755
	.long	-155638181
	.long	1873836001
	.long	414664567
	.long	-2012718362
	.long	-15766928
	.long	1711684554
	.long	285281116
	.long	-1889165569
	.long	-127750551
	.long	1634467795
	.long	376229701
	.long	-1609899400
	.long	-686959890
	.long	1308918612
	.long	956543938
	.long	-1486412191
	.long	-799009033
	.long	1231636301
	.long	1047427035
	.long	-1362007478
	.long	-640263460
	.long	1088359270
	.long	936918000
	.long	-1447252397
	.long	-558129467
	.long	1202900863
	.long	817233897
	.long	-1111625188
	.long	-893730166
	.long	1404277552
	.long	615818150
	.long	-1160759803
	.long	-841546093
	.long	1423857449
	.long	601450431
	.long	-1285129682
	.long	-1000256840
	.long	1567103746
	.long	711928724
	.long	-1274298825
	.long	-1022587231
	.long	1510334235
	.long	755167117
	.data
	.align 16
	.type	firstmap.19, @object
	.size	firstmap.19, 20
firstmap.19:
	.long	0
	.long	1
	.long	0
	.long	5
	.long	6
	.align 16
	.type	mapping.20, @object
	.size	mapping.20, 20
mapping.20:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.21, @object
	.size	__PRETTY_FUNCTION__.21, 22
__PRETTY_FUNCTION__.21:
	.string	"stbi_write_png_to_mem"
	.align 8
	.type	__PRETTY_FUNCTION__.22, @object
	.size	__PRETTY_FUNCTION__.22, 15
__PRETTY_FUNCTION__.22:
	.string	"stbiw__sbgrowf"
	.align 16
	.type	disteb.23, @object
	.size	disteb.23, 30
disteb.23:
	.string	""
	.string	""
	.string	""
	.string	""
	.ascii	"\001\001\002\002\003\003\004\004\005\005\006\006\007\007\b\b"
	.ascii	"\t\t\n\n\013\013\f\f\r\r"
	.align 32
	.type	distc.24, @object
	.size	distc.24, 62
distc.24:
	.value	1
	.value	2
	.value	3
	.value	4
	.value	5
	.value	7
	.value	9
	.value	13
	.value	17
	.value	25
	.value	33
	.value	49
	.value	65
	.value	97
	.value	129
	.value	193
	.value	257
	.value	385
	.value	513
	.value	769
	.value	1025
	.value	1537
	.value	2049
	.value	3073
	.value	4097
	.value	6145
	.value	8193
	.value	12289
	.value	16385
	.value	24577
	.value	-32768
	.align 16
	.type	lengtheb.25, @object
	.size	lengtheb.25, 29
lengtheb.25:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\001\001\001\001\002\002\002\002\003\003\003\003\004\004\004\004\005\005\005\005"
	.align 32
	.type	lengthc.26, @object
	.size	lengthc.26, 60
lengthc.26:
	.value	3
	.value	4
	.value	5
	.value	6
	.value	7
	.value	8
	.value	9
	.value	10
	.value	11
	.value	13
	.value	15
	.value	17
	.value	19
	.value	23
	.value	27
	.value	31
	.value	35
	.value	43
	.value	51
	.value	59
	.value	67
	.value	83
	.value	99
	.value	115
	.value	131
	.value	163
	.value	195
	.value	227
	.value	258
	.value	259
	.align 16
	.type	__PRETTY_FUNCTION__.27, @object
	.size	__PRETTY_FUNCTION__.27, 19
__PRETTY_FUNCTION__.27:
	.string	"stbi_zlib_compress"
	.align 8
	.type	__PRETTY_FUNCTION__.30, @object
	.size	__PRETTY_FUNCTION__.30, 15
__PRETTY_FUNCTION__.30:
	.string	"stbiw__writefv"
	.align 16
	.type	length_dezigzag.31, @object
	.size	length_dezigzag.31, 19
length_dezigzag.31:
	.string	"\020\021\022"
	.ascii	"\b\007\t\006\n\005\013\004\f\003\r\002\016\001\017"
	.align 32
	.type	__PRETTY_FUNCTION__.33, @object
	.size	__PRETTY_FUNCTION__.33, 33
__PRETTY_FUNCTION__.33:
	.string	"stbi__load_and_postprocess_16bit"
	.align 8
	.type	__PRETTY_FUNCTION__.34, @object
	.size	__PRETTY_FUNCTION__.34, 15
__PRETTY_FUNCTION__.34:
	.string	"stbi__tga_load"
	.align 16
	.type	__PRETTY_FUNCTION__.35, @object
	.size	__PRETTY_FUNCTION__.35, 23
__PRETTY_FUNCTION__.35:
	.string	"stbi__jpeg_huff_decode"
	.type	rgb.36, @object
	.size	rgb.36, 3
rgb.36:
	.ascii	"RGB"
	.type	tag.37, @object
	.size	tag.37, 6
tag.37:
	.string	"Adobe"
	.type	tag.38, @object
	.size	tag.38, 5
tag.38:
	.string	"JFIF"
	.align 32
	.type	shift_table.39, @object
	.size	shift_table.39, 36
shift_table.39:
	.long	0
	.long	0
	.long	0
	.long	1
	.long	0
	.long	2
	.long	4
	.long	6
	.long	0
	.align 32
	.type	mul_table.40, @object
	.size	mul_table.40, 36
mul_table.40:
	.long	0
	.long	255
	.long	85
	.long	73
	.long	17
	.long	33
	.long	65
	.long	129
	.long	1
	.align 16
	.type	__PRETTY_FUNCTION__.41, @object
	.size	__PRETTY_FUNCTION__.41, 18
__PRETTY_FUNCTION__.41:
	.string	"stbi__shiftsigned"
	.align 16
	.type	__PRETTY_FUNCTION__.42, @object
	.size	__PRETTY_FUNCTION__.42, 23
__PRETTY_FUNCTION__.42:
	.string	"stbi__convert_format16"
	.align 16
	.type	__PRETTY_FUNCTION__.43, @object
	.size	__PRETTY_FUNCTION__.43, 21
__PRETTY_FUNCTION__.43:
	.string	"stbi__convert_format"
	.align 16
	.type	__PRETTY_FUNCTION__.44, @object
	.size	__PRETTY_FUNCTION__.44, 16
__PRETTY_FUNCTION__.44:
	.string	"stbi__de_iphone"
	.align 16
	.type	__PRETTY_FUNCTION__.45, @object
	.size	__PRETTY_FUNCTION__.45, 27
__PRETTY_FUNCTION__.45:
	.string	"stbi__compute_transparency"
	.align 16
	.type	__PRETTY_FUNCTION__.46, @object
	.size	__PRETTY_FUNCTION__.46, 29
__PRETTY_FUNCTION__.46:
	.string	"stbi__compute_transparency16"
	.align 16
	.type	__PRETTY_FUNCTION__.47, @object
	.size	__PRETTY_FUNCTION__.47, 27
__PRETTY_FUNCTION__.47:
	.string	"stbi__create_png_image_raw"
	.data
	.align 16
	.type	invalid_chunk.48, @object
	.size	invalid_chunk.48, 25
invalid_chunk.48:
	.string	"XXXX PNG chunk not known"
	.section	.rodata
	.align 32
	.type	__PRETTY_FUNCTION__.50, @object
	.size	__PRETTY_FUNCTION__.50, 32
__PRETTY_FUNCTION__.50:
	.string	"stbi__load_and_postprocess_8bit"
	.align 32
	.type	stbiw__jpg_ZigZag, @object
	.size	stbiw__jpg_ZigZag, 64
stbiw__jpg_ZigZag:
	.string	""
	.ascii	"\001\005\006\016\017\033\034\002\004\007\r\020\032\035*\003\b"
	.ascii	"\f\021\031\036)+\t\013\022\030\037(,5\n\023\027 '-46\024\026"
	.ascii	"!&.37<\025\"%/28;=#$019:>?"
	.local	stbi__flip_vertically_on_write
	.comm	stbi__flip_vertically_on_write,4,4
	.globl	stbi_write_force_png_filter
	.data
	.align 4
	.type	stbi_write_force_png_filter, @object
	.size	stbi_write_force_png_filter, 4
stbi_write_force_png_filter:
	.long	-1
	.globl	stbi_write_tga_with_rle
	.align 4
	.type	stbi_write_tga_with_rle, @object
	.size	stbi_write_tga_with_rle, 4
stbi_write_tga_with_rle:
	.long	1
	.globl	stbi_write_png_compression_level
	.align 4
	.type	stbi_write_png_compression_level, @object
	.size	stbi_write_png_compression_level, 4
stbi_write_png_compression_level:
	.long	8
	.section	.tbss,"awT",@nobits
	.align 4
	.type	stbi__de_iphone_flag_set, @object
	.size	stbi__de_iphone_flag_set, 4
stbi__de_iphone_flag_set:
	.zero	4
	.align 4
	.type	stbi__de_iphone_flag_local, @object
	.size	stbi__de_iphone_flag_local, 4
stbi__de_iphone_flag_local:
	.zero	4
	.align 4
	.type	stbi__unpremultiply_on_load_set, @object
	.size	stbi__unpremultiply_on_load_set, 4
stbi__unpremultiply_on_load_set:
	.zero	4
	.align 4
	.type	stbi__unpremultiply_on_load_local, @object
	.size	stbi__unpremultiply_on_load_local, 4
stbi__unpremultiply_on_load_local:
	.zero	4
	.local	stbi__de_iphone_flag_global
	.comm	stbi__de_iphone_flag_global,4,4
	.local	stbi__unpremultiply_on_load_global
	.comm	stbi__unpremultiply_on_load_global,4,4
	.section	.rodata
	.align 8
	.type	stbi__depth_scale_table, @object
	.size	stbi__depth_scale_table, 9
stbi__depth_scale_table:
	.string	""
	.string	"\377U"
	.string	"\021"
	.string	""
	.string	""
	.ascii	"\001"
	.type	first_row_filter, @object
	.size	first_row_filter, 5
first_row_filter:
	.string	""
	.string	"\001"
	.ascii	"\005\006"
	.align 32
	.type	stbi__zdefault_distance, @object
	.size	stbi__zdefault_distance, 32
stbi__zdefault_distance:
	.ascii	"\005\005\005\005\005\005\005\005\005\005\005\005\005\005\005"
	.ascii	"\005\005\005\005\005\005\005\005\005\005\005\005\005\005\005"
	.ascii	"\005\005"
	.align 32
	.type	stbi__zdefault_length, @object
	.size	stbi__zdefault_length, 288
stbi__zdefault_length:
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\t\t\t\t\t\t"
	.ascii	"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"
	.ascii	"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"
	.ascii	"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"
	.ascii	"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\007\007\007\007\007\007\007"
	.ascii	"\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007"
	.ascii	"\007\007\b\b\b\b\b\b\b\b"
	.align 32
	.type	stbi__zdist_extra, @object
	.size	stbi__zdist_extra, 128
stbi__zdist_extra:
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	1
	.long	2
	.long	2
	.long	3
	.long	3
	.long	4
	.long	4
	.long	5
	.long	5
	.long	6
	.long	6
	.long	7
	.long	7
	.long	8
	.long	8
	.long	9
	.long	9
	.long	10
	.long	10
	.long	11
	.long	11
	.long	12
	.long	12
	.long	13
	.long	13
	.zero	8
	.align 32
	.type	stbi__zdist_base, @object
	.size	stbi__zdist_base, 128
stbi__zdist_base:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	7
	.long	9
	.long	13
	.long	17
	.long	25
	.long	33
	.long	49
	.long	65
	.long	97
	.long	129
	.long	193
	.long	257
	.long	385
	.long	513
	.long	769
	.long	1025
	.long	1537
	.long	2049
	.long	3073
	.long	4097
	.long	6145
	.long	8193
	.long	12289
	.long	16385
	.long	24577
	.long	0
	.long	0
	.align 32
	.type	stbi__zlength_extra, @object
	.size	stbi__zlength_extra, 124
stbi__zlength_extra:
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	1
	.long	1
	.long	1
	.long	2
	.long	2
	.long	2
	.long	2
	.long	3
	.long	3
	.long	3
	.long	3
	.long	4
	.long	4
	.long	4
	.long	4
	.long	5
	.long	5
	.long	5
	.long	5
	.long	0
	.long	0
	.long	0
	.align 32
	.type	stbi__zlength_base, @object
	.size	stbi__zlength_base, 124
stbi__zlength_base:
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	9
	.long	10
	.long	11
	.long	13
	.long	15
	.long	17
	.long	19
	.long	23
	.long	27
	.long	31
	.long	35
	.long	43
	.long	51
	.long	59
	.long	67
	.long	83
	.long	99
	.long	115
	.long	131
	.long	163
	.long	195
	.long	227
	.long	258
	.long	0
	.long	0
	.align 32
	.type	stbi__jpeg_dezigzag, @object
	.size	stbi__jpeg_dezigzag, 79
stbi__jpeg_dezigzag:
	.string	""
	.ascii	"\001\b\020\t\002\003\n\021\030 \031\022\013\004\005\f\023\032"
	.ascii	"!(0)\"\033\024\r\006\007\016\025\034#*1892+$\035\026\017\027"
	.ascii	"\036%,3:;4-&\037'.5<=6/7>????????????????"
	.align 32
	.type	stbi__jbias, @object
	.size	stbi__jbias, 64
stbi__jbias:
	.long	0
	.long	-1
	.long	-3
	.long	-7
	.long	-15
	.long	-31
	.long	-63
	.long	-127
	.long	-255
	.long	-511
	.long	-1023
	.long	-2047
	.long	-4095
	.long	-8191
	.long	-16383
	.long	-32767
	.align 32
	.type	stbi__bmask, @object
	.size	stbi__bmask, 68
stbi__bmask:
	.long	0
	.long	1
	.long	3
	.long	7
	.long	15
	.long	31
	.long	63
	.long	127
	.long	255
	.long	511
	.long	1023
	.long	2047
	.long	4095
	.long	8191
	.long	16383
	.long	32767
	.long	65535
	.data
	.align 4
	.type	stbi__h2l_scale_i, @object
	.size	stbi__h2l_scale_i, 4
stbi__h2l_scale_i:
	.long	1065353216
	.align 4
	.type	stbi__h2l_gamma_i, @object
	.size	stbi__h2l_gamma_i, 4
stbi__h2l_gamma_i:
	.long	1055439406
	.align 4
	.type	stbi__l2h_scale, @object
	.size	stbi__l2h_scale, 4
stbi__l2h_scale:
	.long	1065353216
	.align 4
	.type	stbi__l2h_gamma, @object
	.size	stbi__l2h_gamma, 4
stbi__l2h_gamma:
	.long	1074580685
	.section	.tbss
	.align 4
	.type	stbi__vertically_flip_on_load_set, @object
	.size	stbi__vertically_flip_on_load_set, 4
stbi__vertically_flip_on_load_set:
	.zero	4
	.align 4
	.type	stbi__vertically_flip_on_load_local, @object
	.size	stbi__vertically_flip_on_load_local, 4
stbi__vertically_flip_on_load_local:
	.zero	4
	.local	stbi__vertically_flip_on_load_global
	.comm	stbi__vertically_flip_on_load_global,4,4
	.align 8
	.type	stbi__g_failure_reason, @object
	.size	stbi__g_failure_reason, 8
stbi__g_failure_reason:
	.zero	8
	.section	.data.rel.ro.local,"aw"
	.align 16
	.type	stbi__stdio_callbacks, @object
	.size	stbi__stdio_callbacks, 24
stbi__stdio_callbacks:
	.quad	stbi__stdio_read
	.quad	stbi__stdio_skip
	.quad	stbi__stdio_eof
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.align 16
.LC1:
	.value	2
	.value	2
	.value	2
	.value	2
	.value	2
	.value	2
	.value	2
	.value	2
	.align 16
.LC2:
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.set	.LC3,.LC1
	.set	.LC4,.LC2
	.align 16
.LC5:
	.byte	3
	.byte	0
	.byte	3
	.byte	0
	.byte	3
	.byte	0
	.byte	3
	.byte	0
	.byte	3
	.byte	0
	.byte	3
	.byte	0
	.byte	3
	.byte	0
	.byte	3
	.byte	0
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC6:
	.long	1060439283
	.align 4
.LC7:
	.long	1053028117
	.align 4
.LC8:
	.long	1057655764
	.align 4
.LC9:
	.long	1067924853
	.section	.rodata.cst16
	.align 16
.LC14:
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.align 16
.LC15:
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC19:
	.value	-1
	.value	-1
	.value	-1
	.value	-1
	.section	.rodata.cst16
	.align 16
.LC20:
	.value	77
	.value	77
	.value	77
	.value	77
	.value	77
	.value	77
	.value	77
	.value	77
	.align 16
.LC21:
	.value	150
	.value	150
	.value	150
	.value	150
	.value	150
	.value	150
	.value	150
	.value	150
	.align 16
.LC22:
	.value	29
	.value	29
	.value	29
	.value	29
	.value	29
	.value	29
	.value	29
	.value	29
	.align 16
.LC23:
	.value	8
	.value	8
	.value	8
	.value	8
	.value	8
	.value	8
	.value	8
	.value	8
	.align 16
.LC24:
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.set	.LC25,.LC24
	.align 16
.LC26:
	.value	5743
	.value	5743
	.value	5743
	.value	5743
	.value	5743
	.value	5743
	.value	5743
	.value	5743
	.align 16
.LC27:
	.value	-1410
	.value	-1410
	.value	-1410
	.value	-1410
	.value	-1410
	.value	-1410
	.value	-1410
	.value	-1410
	.align 16
.LC28:
	.value	7258
	.value	7258
	.value	7258
	.value	7258
	.value	7258
	.value	7258
	.value	7258
	.value	7258
	.align 16
.LC29:
	.value	-2925
	.value	-2925
	.value	-2925
	.value	-2925
	.value	-2925
	.value	-2925
	.value	-2925
	.value	-2925
	.align 16
.LC30:
	.value	2217
	.value	-5350
	.value	2217
	.value	-5350
	.value	2217
	.value	-5350
	.value	2217
	.value	-5350
	.align 16
.LC31:
	.value	5352
	.value	2217
	.value	5352
	.value	2217
	.value	5352
	.value	2217
	.value	5352
	.value	2217
	.align 16
.LC32:
	.value	-6811
	.value	-8034
	.value	-6811
	.value	-8034
	.value	-6811
	.value	-8034
	.value	-6811
	.value	-8034
	.align 16
.LC33:
	.value	-8034
	.value	4552
	.value	-8034
	.value	4552
	.value	-8034
	.value	4552
	.value	-8034
	.value	4552
	.align 16
.LC34:
	.value	6813
	.value	-1597
	.value	6813
	.value	-1597
	.value	6813
	.value	-1597
	.value	6813
	.value	-1597
	.align 16
.LC35:
	.value	-1597
	.value	4552
	.value	-1597
	.value	4552
	.value	-1597
	.value	4552
	.value	-1597
	.value	4552
	.align 16
.LC36:
	.value	1131
	.value	4816
	.value	1131
	.value	4816
	.value	1131
	.value	4816
	.value	1131
	.value	4816
	.align 16
.LC37:
	.value	4816
	.value	-5681
	.value	4816
	.value	-5681
	.value	4816
	.value	-5681
	.value	4816
	.value	-5681
	.align 16
.LC38:
	.long	512
	.long	512
	.long	512
	.long	512
	.align 16
.LC39:
	.long	16842752
	.long	16842752
	.long	16842752
	.long	16842752
	.section	.rodata.cst8
	.align 8
.LC40:
	.long	0
	.long	1072693248
	.section	.rodata.cst4
	.align 4
.LC41:
	.long	1077936128
	.set	.LC42,.LC242+8
	.align 4
.LC47:
	.long	172994847
	.align 4
.LC48:
	.long	1132462080
	.section	.rodata.cst16
	.align 16
.LC49:
	.quad	5638868765947084579
	.quad	7598231316865893699
	.align 16
.LC50:
	.quad	2340009372826301556
	.quad	7449355557986792563
	.align 16
.LC51:
	.quad	3343206294633275237
	.quad	6071218788584786536
	.align 16
.LC52:
	.quad	6878238401287566141
	.quad	7305515286472780914
	.set	.LC55,.LC19
	.set	.LC59,.LC20
	.set	.LC60,.LC20
	.set	.LC61,.LC21
	.set	.LC62,.LC22
	.set	.LC71,.LC251
	.align 16
.LC73:
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.align 16
.LC74:
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.byte	63
	.align 16
.LC75:
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.align 16
.LC76:
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.set	.LC88,.LC155
	.section	.rodata.cst8
	.align 8
.LC105:
	.long	31744
	.long	992
	.section	.rodata.cst16
	.align 16
.LC106:
	.long	16711680
	.long	65280
	.long	255
	.long	-16777216
	.align 16
.LC127:
	.long	0
	.long	4
	.long	0
	.long	2
	.section	.rodata.cst8
	.align 8
.LC128:
	.long	0
	.long	1
	.section	.rodata.cst16
	.align 16
.LC129:
	.long	0
	.long	0
	.long	4
	.long	0
	.section	.rodata.cst8
	.align 8
.LC130:
	.long	2
	.long	0
	.section	.rodata.cst16
	.align 16
.LC131:
	.long	8
	.long	8
	.long	4
	.long	4
	.set	.LC132,.LC221
	.align 16
.LC133:
	.long	8
	.long	8
	.long	8
	.long	4
	.set	.LC134,.LC251+8
	.align 16
.LC138:
	.long	1077216499
	.long	1074674138
	.long	1069805333
	.long	1061668290
	.align 16
.LC140:
	.long	1077216499
	.long	1081808063
	.long	1080853343
	.long	1079302960
	.section	.rodata.cst4
	.align 4
.LC141:
	.byte	-1
	.byte	-64
	.byte	0
	.byte	17
	.section	.rodata.cst2,"aM",@progbits,2
	.align 2
.LC142:
	.byte	3
	.byte	1
	.section	.rodata.cst16
	.align 16
.LC143:
	.long	1058424226
	.long	1058424226
	.long	1058424226
	.long	1058424226
	.set	.LC144,.LC143
	.align 16
.LC145:
	.long	1050220167
	.long	1050220167
	.long	1050220167
	.long	1050220167
	.set	.LC146,.LC145
	.align 16
.LC147:
	.long	1038710997
	.long	1038710997
	.long	1038710997
	.long	1038710997
	.set	.LC148,.LC147
	.align 16
.LC149:
	.long	-1023410176
	.long	-1023410176
	.long	-1023410176
	.long	-1023410176
	.set	.LC150,.LC149
	.align 16
.LC151:
	.long	-1104360914
	.long	-1104360914
	.long	-1104360914
	.long	-1104360914
	.set	.LC152,.LC151
	.align 16
.LC153:
	.long	1051302633
	.long	1051302633
	.long	1051302633
	.long	1051302633
	.set	.LC154,.LC153
	.align 16
.LC155:
	.long	1056964608
	.long	1056964608
	.long	1056964608
	.long	1056964608
	.align 16
.LC156:
	.long	1054236297
	.long	1054236297
	.long	1054236297
	.long	1054236297
	.set	.LC157,.LC156
	.align 16
.LC158:
	.long	1034323419
	.long	1034323419
	.long	1034323419
	.long	1034323419
	.set	.LC159,.LC158
	.set	.LC160,.LC143
	.set	.LC161,.LC145
	.set	.LC162,.LC147
	.set	.LC163,.LC149
	.set	.LC164,.LC151
	.set	.LC165,.LC153
	.set	.LC166,.LC155
	.set	.LC167,.LC156
	.set	.LC168,.LC158
	.section	.rodata.cst4
	.align 4
.LC169:
	.long	1124073472
	.section	.rodata.cst16
	.align 16
.LC170:
	.long	13
	.long	13
	.long	13
	.long	13
	.section	.rodata.cst8
	.align 8
.LC171:
	.long	7
	.long	7
	.section	.rodata.cst16
	.align 16
.LC172:
	.long	1048576000
	.long	1048576000
	.long	1048576000
	.long	1048576000
	.section	.rodata.cst4
	.align 4
.LC187:
	.long	1199570688
	.set	.LC188,.LC242
	.section	.rodata.cst8
	.align 8
.LC189:
	.long	0
	.long	-1
	.section	.rodata.cst16
	.align 16
.LC217:
	.long	0
	.long	0
	.long	1
	.long	1
	.align 16
.LC220:
	.long	16
	.long	16
	.long	16
	.long	16
	.align 16
.LC221:
	.long	2
	.long	2
	.long	2
	.long	2
	.align 16
.LC222:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC223:
	.long	6
	.long	6
	.long	6
	.long	6
	.align 16
.LC224:
	.long	8
	.long	8
	.long	8
	.long	8
	.align 16
.LC225:
	.long	10
	.long	10
	.long	10
	.long	10
	.align 16
.LC226:
	.long	12
	.long	12
	.long	12
	.long	12
	.align 16
.LC227:
	.long	14
	.long	14
	.long	14
	.long	14
	.align 16
.LC242:
	.long	1132396544
	.long	1132396544
	.long	1065353216
	.long	1065353216
	.section	.rodata.cst8
	.align 8
.LC245:
	.long	1
	.long	128
	.align 8
.LC249:
	.long	2
	.long	1
	.section	.rodata.cst16
	.align 16
.LC251:
	.long	-1
	.long	0
	.long	4
	.long	2
	.section	.rodata.cst8
	.align 8
.LC252:
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	73
	.byte	72
	.byte	68
	.byte	82
	.align 8
.LC253:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	73
	.byte	69
	.byte	78
	.byte	68
	.section	.rodata.cst4
	.align 4
.LC254:
	.byte	-82
	.byte	66
	.byte	96
	.byte	-126
	.section	.rodata.cst16
	.align 16
.LC257:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC259:
	.long	1719614413
	.long	1072079006
	.align 8
.LC260:
	.long	1719614412
	.long	1072079006
	.align 8
.LC263:
	.long	1413754136
	.long	1072243195
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
