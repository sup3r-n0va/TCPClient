	.file	"tcp_client.c"
# GNU C (Debian 4.9.2-10) version 4.9.2 (x86_64-linux-gnu)
#	compiled by GNU C version 4.9.2, GMP version 6.0.0, MPFR version 3.1.2-p3, MPC version 1.0.2
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu tcp_client.c -mtune=generic
# -march=x86-64 -O -Wall -fverbose-asm
# options enabled:  -faggressive-loop-optimizations
# -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
# -fdefer-pop -fdelete-null-pointer-checks -fdwarf2-cfi-asm
# -fearly-inlining -feliminate-unused-debug-types -fforward-propagate
# -ffunction-cse -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fident -fif-conversion -fif-conversion2
# -finline -finline-atomics -finline-functions-called-once -fipa-profile
# -fipa-pure-const -fipa-reference -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots -fivopts
# -fkeep-static-consts -fleading-underscore -fmath-errno -fmerge-constants
# -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
# -fpeephole -fprefetch-loop-arrays -freg-struct-return
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fshow-column -fshrink-wrap -fsigned-zeros
# -fsplit-ivs-in-unroller -fsplit-wide-types -fstrict-volatile-bitfields
# -fsync-libcalls -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop
# -ftree-copyrename -ftree-cselim -ftree-dce -ftree-dominator-opts
# -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-if-convert
# -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
# -ftree-parallelize-loops= -ftree-phiprop -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-sink -ftree-slsr -ftree-sra -ftree-ter
# -funit-at-a-time -funwind-tables -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -malign-stringops
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store
# -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc -mieee-fp
# -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone -msse -msse2
# -mtls-direct-seg-refs

	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Usage: %s <Server IP> <Echo Word> [<Echo Port>]\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"socket() failed"
.LC2:
	.string	"connect() failed"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"send() sent a different number of bytes than expected"
	.section	.rodata.str1.1
.LC4:
	.string	"Recieved: "
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"recv() failed or connection closed prematurely"
	.text
	.globl	main
	.type	main, @function
main:
.LFB34:
	.cfi_startproc
	pushq	%r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp	#,
	.cfi_def_cfa_offset 96
	leal	-3(%rdi), %eax	#, D.4168
	cmpl	$1, %eax	#, D.4168
	jbe	.L2	#,
	movq	(%rsi), %rdx	# *argv_13(D),
	movl	$.LC0, %esi	#,
	movq	stderr(%rip), %rdi	# stderr,
	movl	$0, %eax	#,
	call	fprintf	#
	movl	$1, %edi	#,
	call	exit	#
.L2:
	movq	8(%rsi), %r13	# MEM[(char * *)argv_13(D) + 8B], servIP
	movq	16(%rsi), %rbp	# MEM[(char * *)argv_13(D) + 16B], echoString
	movl	$7, %ebx	#, __x
	cmpl	$4, %edi	#, argc
	jne	.L3	#,
	movq	24(%rsi), %rdi	# MEM[(char * *)argv_13(D) + 24B], MEM[(char * *)argv_13(D) + 24B]
	movl	$10, %edx	#,
	movl	$0, %esi	#,
	call	strtol	#
	movl	%eax, %ebx	# D.4173, __x
.L3:
	movl	$6, %edx	#,
	movl	$1, %esi	#,
	movl	$2, %edi	#,
	call	socket	#
	movl	%eax, %r12d	#, sock
	testl	%eax, %eax	# sock
	jns	.L4	#,
	movl	$.LC1, %edi	#,
	call	DieWithError	#
	leaq	32(%rsp), %rdx	#, tmp111
	movl	$4, %ecx	#, tmp114
	movl	$0, %eax	#, tmp113
	movq	%rdx, %rdi	# tmp111, tmp112
	rep stosl
	movw	$2, 32(%rsp)	#, echoServAddr.sin_family
	movq	%r13, %rdi	# servIP,
	call	inet_addr	#
	movl	%eax, 36(%rsp)	# D.4170, echoServAddr.sin_addr.s_addr
.L10:
#APP
# 50 "tcp_client.c" 1
	rorw $8, %bx	# __v
# 0 "" 2
#NO_APP
	movw	%bx, 34(%rsp)	# __v, echoServAddr.sin_port
	movl	$16, %edx	#,
	leaq	32(%rsp), %rsi	#, tmp132
	movl	%r12d, %edi	# sock,
	call	connect	#
	testl	%eax, %eax	# D.4171
	jns	.L5	#,
	movl	$.LC2, %edi	#,
	call	DieWithError	#
.L5:
	movq	%rbp, %rdi	# echoString, echoString
	movl	$0, %eax	#, tmp122
	movq	$-1, %rcx	#, tmp121
	repnz scasb
	notq	%rcx	# tmp119
	leaq	-1(%rcx), %rbx	#, D.4172
	movl	%ebx, %r13d	# D.4172, echoStringLen
	movl	%ebx, %r14d	# D.4172, D.4172
	movl	$0, %ecx	#,
	movq	%r14, %rdx	# D.4172,
	movq	%rbp, %rsi	# echoString,
	movl	%r12d, %edi	# sock,
	call	send	#
	cmpq	%r14, %rax	# D.4172, D.4173
	je	.L6	#,
	movl	$.LC3, %edi	#,
	call	DieWithError	#
.L6:
	movl	$.LC4, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	testl	%ebx, %ebx	# D.4172
	je	.L7	#,
	movl	$0, %ebp	#, totalBytesRcvd
.L9:
	movl	$0, %ecx	#,
	movl	$31, %edx	#,
	movq	%rsp, %rsi	#,
	movl	%r12d, %edi	# sock,
	call	recv	#
	movq	%rax, %rbx	#, D.4173
	testl	%eax, %eax	# D.4173
	jg	.L8	#,
	movl	$.LC5, %edi	#,
	call	DieWithError	#
.L8:
	addl	%ebx, %ebp	# D.4173, totalBytesRcvd
	movslq	%ebx, %rbx	# D.4173, bytesRcvd
	movb	$0, (%rsp,%rbx)	#, echoBuffer
	movq	%rsp, %rdi	#,
	movl	$0, %eax	#,
	call	printf	#
	cmpl	%ebp, %r13d	# totalBytesRcvd, echoStringLen
	ja	.L9	#,
.L7:
	movl	$10, %edi	#,
	call	putchar	#
	movl	%r12d, %edi	# sock,
	call	close	#
	movl	$0, %edi	#,
	call	exit	#
.L4:
	leaq	32(%rsp), %rdx	#, tmp126
	movl	$4, %ecx	#, tmp129
	movl	$0, %eax	#, tmp128
	movq	%rdx, %rdi	# tmp126, tmp127
	rep stosl
	movw	$2, 32(%rsp)	#, echoServAddr.sin_family
	movq	%r13, %rdi	# servIP,
	call	inet_addr	#
	movl	%eax, 36(%rsp)	# D.4170, echoServAddr.sin_addr.s_addr
	jmp	.L10	#
	.cfi_endproc
.LFE34:
	.size	main, .-main
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
