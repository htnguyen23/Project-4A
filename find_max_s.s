	.file	"find_max.c"
	.text
	.section	.rodata
.LC0:
	.string	"The number is %dn"
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
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
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
	.string	"The length of the array is %d\n"
	.text
	.globl	Find_Max
	.type	Find_Max, @function
Find_Max:
// prologue
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
    
	subq	$32, %rsp           # reserve space for var
	movl	%edi, -20(%rbp)     # get array length n (1st arg in %edi) and store as var
	movq	%rsi, -32(%rbp)     # get address (ptr) of a (2nd arg in %rsi)
	movl	-20(%rbp), %eax     # 31 
	movl	%eax, %esi          # 32
	leaq	.LC1(%rip), %rdi    # 33
	movl	$0, %eax            # 34
	call	printf@PLT          # 35
	movl	$0, -8(%rbp)        # intialize max index (imax=0)
	movl	$1, -4(%rbp)        # initialize counter (i=1)
	jmp	.L4

.L6: # WHILE_DO:
	movl	-4(%rbp), %eax      # get counter (i)
	cltq                        # sign extend to do addition
	leaq	0(,%rax,4), %rdx    # get array a ? 
	movq	-32(%rbp), %rax     # get address of a
	addq	%rdx, %rax          # add counter*intsize to addr a to get elem at index i
	movl	(%rax), %eax        # get elem at index i 
	movl	%eax, %edi          # get elem value to %edi to pass as arg to Print_One_Number
	call	Print_One_Number    # print current elem

	movl	-8(%rbp), %eax      # get imax
	cltq                        # sign extend to do addition
	leaq	0(,%rax,4), %rdx    # get array a
	movq	-32(%rbp), %rax     # get address of a
	addq	%rdx, %rax          # add imax*intsize to addr a to get elem at index imax
	movl	(%rax), %edx        # get elem at index imax (and store in %edx)

	movl	-4(%rbp), %eax      # get counter (i)
	cltq                        # sign extend to do addition
	leaq	0(,%rax,4), %rcx    # get array a
	movq	-32(%rbp), %rax     # get address of a (first elem)
	addq	%rcx, %rax          # add i*intsize to first elem addr to get elem at index i 
	movl	(%rax), %eax        # get elem at index i (and store in %eax)

	cmpl	%eax, %edx          # compare a[i] and a[imax] by subtraction
	jge	.L5                     # if (-), ie. a[i] < a[imax], jump to NEXT_ITERATION to keep moving through array
	
    movl	-4(%rbp), %eax      # update imax since a new max elem is found (get i and store in %eax)
	movl	%eax, -8(%rbp)      # change current imax to current i

.L5: # NEXT_ITERATION:
	addl	$1, -4(%rbp)        # increment counter i (i += 1) 

.L4: # WHILE_CONDITION:
	movl	-4(%rbp), %eax      # get counter i=1
	cmpl	-20(%rbp), %eax     # compare counter i w/ loop max (array length n)
	jl	.L6                     # jump to END_OF_LOOP if i > n
	movl	-8(%rbp), %eax      # get index of max value element to return

// epilogue
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc

.LFE1:
	.size	Find_Max, .-Find_Max
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
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
