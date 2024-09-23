	.text
	.file	"main.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	.L.str(%rip), %rdi
	leaq	4(%rsp), %rsi
	xorl	%eax, %eax
	callq	__isoc99_scanf@PLT
	movl	4(%rsp), %edx
	testl	%edx, %edx
	jle	.LBB0_1
# %bb.2:
	leaq	-1(%rdx), %rcx
	movl	%edx, %eax
	andl	$7, %eax
	cmpq	$7, %rcx
	jae	.LBB0_8
# %bb.3:
	movl	$1, %ecx
	movl	$1, %esi
	testq	%rax, %rax
	jne	.LBB0_6
	jmp	.LBB0_7
.LBB0_1:
	movl	$1, %esi
	jmp	.LBB0_7
.LBB0_8:
	andl	$-8, %edx
	negq	%rdx
	movl	$1, %esi
	movl	$8, %ecx
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	leaq	-7(%rcx), %rdi
	imulq	%rsi, %rdi
	leaq	-6(%rcx), %rsi
	leaq	-5(%rcx), %r8
	imulq	%r8, %rsi
	imulq	%rdi, %rsi
	leaq	-4(%rcx), %rdi
	leaq	-3(%rcx), %r8
	imulq	%r8, %rdi
	leaq	-2(%rcx), %r8
	imulq	%rdi, %r8
	imulq	%rsi, %r8
	leaq	-1(%rcx), %rsi
	imulq	%rcx, %rsi
	imulq	%r8, %rsi
	leaq	(%rdx,%rcx), %rdi
	addq	$8, %rdi
	addq	$8, %rcx
	cmpq	$8, %rdi
	jne	.LBB0_9
# %bb.4:
	addq	$-7, %rcx
	testq	%rax, %rax
	je	.LBB0_7
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	imulq	%rcx, %rsi
	incq	%rcx
	decq	%rax
	jne	.LBB0_6
.LBB0_7:
	leaq	.L.str.1(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%llu\n"
	.size	.L.str.1, 6

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
