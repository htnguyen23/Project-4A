	.file	"mikes_driver.c"
	.text
	.section	.rodata
.LC0:
	.string	"The number is %d\n"
	.text
	.globl	Print_One_Number
	.type	Print_One_Number, @function
Print_One_Number:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	pushq	$16
	pushq	$15
	pushq	$14
	pushq	$13
	pushq	$12
	pushq	$11
	pushq	$10
	pushq	$9
	pushq	$8
	pushq	$7
	pushq	$6
	pushq	$5
	movl	$4, %r9d
	movl	$3, %r8d
	movl	$2, %ecx
	movl	$1, %edx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$96, %rsp
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	Print_One_Number, .-Print_One_Number
	.section	.rodata
	.align 8
.LC1:
	.string	"The maximum value in the array is found at index %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1034, -64(%rbp)    # i = 0
	movl	$95, -60(%rbp)      # i = 1
	movl	$52, -56(%rbp)      # i = 2
	movl	$95, -52(%rbp)      # i = 3
	movl	$101, -48(%rbp)     # i = 4
    movl    $0, -44(%rbp)       # i = 5
    movl    $0, -40(%rbp)       # i = 6
    movl    $0, -36(%rbp)       # i = 7
    movl    $134, -32(%rbp)     # i = 8
    movl    $-3,  -28(%rbp)     # i = 9
    movl    $-9, -24(%rbp)      # i = 10
    movl    $2000, -20(%rbp)    # max elem at index 11
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$12, %edi            # array size: 12
	call	Find_Max@PLT
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
