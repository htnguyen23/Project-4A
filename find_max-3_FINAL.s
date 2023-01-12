	.file	"find_max_template.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"The length of the array is %d\n"
	.text
	.globl	Find_Max
	.type	Find_Max, @function

Find_Max:
// prologue - write code for the prologue here
    .cfi_startproc
    endbr64             # security
    pushq   %rbp        # push the base ptr onto stack
    .cfi_def_cfa_offset 16
    .cfi_offset 6, -16
    movq    %rsp, %rbp  # move stack ptr to where base ptr is
    .cfi_def_cfa_register 6
    subq    $32, %rsp   # reserve space for local vars

// printf("The length of the array is %d\n", n);
// update this code if necessary to print the length of the array
// this block prints the value of register %edi
// initially the parameter n
/*	movl	%edi, %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
*/
// reserve space for local variables
/* make a table here the variables from 
 * your c code and the addresses used in assembly 
 * n    - -32(%rbp) - %edi
 * a    - -28(%rbp) - %rsi
 * i    - -4(%rbp)  - %rdx 
 * imax - -8(%rbp)
*/ 

// this code calls Print_One_Number to 
// print the number found in register %eax - use this code to debug 
// replace $999 with a register or memory address you wish to print
/*    movl    (%rax), %eax
	movl	%eax, %edi
	call	Print_One_Number@PLT
*/

// write your code to find the index of the maximum value here
    movl    $1, -4(%rbp)    # initialize the counter (i=1)

    movl    $0, -8(%rbp)    # initialize the index of max value (imax=0)
    
    movl    %edi, -32(%rbp) # store n on stack

    movq    %rsi, -28(%rbp) # store addr a[0] on stack (%rsi hold a ptr, so dereference to get to array?)

WHILE_DO:
// get a[i] and store in a reg (to compare to a[imax])
    movq    -28(%rbp), %rax         # get array a (dereference ptr?)
    movl    -4(%rbp), %edx          # get i
    movl    (%rax, %rdx, 4), %ecx   # array formula

// get a[imax] and store in a reg (to compare to a[i])
    movq    -28(%rbp), %rax         # get array a - use mov or lea?  
    movl    -8(%rbp), %edx          # get imax
    movl    (%rax, %rdx, 4), %edx   # array formula
    
    cmpq    %rcx, %rdx           # compare a[i] and a[imax] by subtraction
    
    jge     NEXT_ITERATION      # if a[imax] > a[i], continue loop

    movl    -4(%rbp), %eax      # update imax since a new max elem is found (get i and store in %eax)
    movl    %eax, -8(%rbp)      # change current imax to current i    

NEXT_ITERATION:
    addl    $1, -4(%rbp)        # increment counter i (i += 1)

WHILE_CONDITION:
    movl    -4(%rbp), %eax      # get counter i=1
    cmpl    -32(%rbp), %eax     # compare counter i w/ loop max (array length n)
    jl      WHILE_DO            # jump to WHILE_DO (loop body) if i > n

// prepare the return value
// the template returns -1, you will need to update this
	movl    -8(%rbp), %eax      # get index of max value elem to return

// epilogue - complete the epilogue below
    // popq    %rbp    # pop base ptr off stack
    leave
    .cfi_def_cfa 7,8
    ret
    .cfi_endproc
.LFE0:
	.size	Find_Max, .-Find_Max
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
