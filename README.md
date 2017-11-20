## 358 ##
#### 358.c ####
```c++
	long decode2(long x, long y, long z){
		y -= z;
		x *= y;
		long result = y;
		result <<= 63;
		result >>= 63;
		result ^= x;
		return result;
	}
```
#### 358.s ####
```c-objdump
    	.file	"358.c"
    	.text
    	.globl	decode2
    	.type	decode2, @function
    decode2:
    .LFB0:
    	.cfi_startproc
    	pushq	%rbp
    	.cfi_def_cfa_offset 16
    	.cfi_offset 6, -16
    	movq	%rsp, %rbp
    	.cfi_def_cfa_register 6
    	movq	%rdi, -24(%rbp)
    	movq	%rsi, -32(%rbp)
    	movq	%rdx, -40(%rbp)
    	movq	-24(%rbp), %rax
    	imulq	-32(%rbp), %rax
    	movq	%rax, -24(%rbp)
    	movq	-32(%rbp), %rax
    	subq	-40(%rbp), %rax
    	movq	%rax, -8(%rbp)
    	salq	$63, -8(%rbp)
    	sarq	$63, -8(%rbp)
    	movq	-24(%rbp), %rax
    	xorq	%rax, -8(%rbp)
    	movq	-8(%rbp), %rax
    	popq	%rbp
    	.cfi_def_cfa 7, 8
    	ret
    	.cfi_endproc
    .LFE0:
    	.size	decode2, .-decode2
    	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
    	.section	.note.GNU-stack,"",@progbits
```
    
## 360 ##
#### 360.c ####
```c++
    long loop(long x, long n){
    	long result = 0;
    	long mask;
    	for(mask = 1; mask != 0; mask = mask<<n){
    		result |= x & mask;
    	}
    	return result;
    }
```
#### 360.s ####
```assembly
		.file	"360.c"
		.text
		.globl	loop
		.type	loop, @function
	loop:
	.LFB0:
		.cfi_startproc
		movq	%rsi, %rcx
		movl	$1, %edx
		movl	$0, %eax
		jmp	.L2
	.L3:
		movq	%rdx, %r8
		andq	%rdi, %r8
		orq	%r8, %rax
		salq	%cl, %rdx
	.L2:
		testq	%rdx, %rdx
		jne	.L3
		rep ret
		.cfi_endproc
	.LFE0:
		.size	loop, .-loop
		.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
		.section	.note.GNU-stack,"",@progbits
```
## 362 ##
#### 362.c ####
```c++
	/* Enumerated type creates set of constants number 0 and upward*/
	typedef enum {MODE_A, MODE_B, MODE_C, MODE_D, MODE_E} mode_t;
	
	long switch3(long *p1, long *p2, mode_t action){
		long result = 0;
		switch(action){
			case MODE_A:
				result = *p2;
				*p2 = *p1;
				break;
			case MODE_B:
				result = *p1+*p2;
				*p1 = result;
				break;
			case MODE_C:
				*p1 = 59;
				result = *p2;
				break;
			case MODE_D:
				*p1 = *p2;
			case MODE_E:
				result = 27;
				break;
			default:
				result = 12;
		}
		return result;
	}
	
```
#### 362.s ####
```assembly
		.file	"362.c"
		.text
		.globl	switch3
		.type	switch3, @function
	switch3:
	.LFB0:
		.cfi_startproc
		cmpl	$4, %edx
		ja	.L2
		movl	%edx, %edx
		jmp	*.L4(,%rdx,8)
		.section	.rodata
		.align 8
		.align 4
	.L4:
		.quad	.L3
		.quad	.L5
		.quad	.L6
		.quad	.L7
		.quad	.L9
		.text
	.L2:
		movl	$12, %eax
		ret
	.L3:
		movq	(%rsi), %rax
		movq	(%rdi), %rdx
		movq	%rdx, (%rsi)
		ret
	.L5:
		movq	(%rsi), %rax
		addq	(%rdi), %rax
		movq	%rax, (%rdi)
		ret
	.L6:
		movq	$59, (%rdi)
		movq	(%rsi), %rax
		ret
	.L7:
		movq	(%rsi), %rax
		movq	%rax, (%rdi)
		movl	$27, %eax
		ret
	.L9:
		movl	$27, %eax
		ret
		.cfi_endproc
	.LFE0:
		.size	switch3, .-switch3
		.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
		.section	.note.GNU-stack,"",@progbits
```
## 364 ##
#### 364.c ####
```c++
	// A. &A[i][j][k] = A+L(S*T*i+T*j+k)
	// B. R = , S = , T = 
	
	#define R 7 
	#define S 5 
	#define T 13 
	
	long A[R][S][T];
	
	long store_ele(long i, long j, long k, long *dest){
		*dest = A[i][j][k];
		return sizeof(A);
	}
```
#### 364.s ####
```
		.file	"364.c"
		.text
		.globl	store_ele
		.type	store_ele, @function
	store_ele:
	.LFB0:
		.cfi_startproc
		leaq	(%rsi,%rsi,2), %rax
		leaq	(%rsi,%rax,4), %rax
		movq	%rdi, %rsi
		salq	$6, %rsi
		addq	%rsi, %rdi
		addq	%rax, %rdi
		addq	%rdx, %rdi
		movq	A(,%rdi,8), %rax
		movq	%rax, (%rcx)
		movl	$3640, %eax
		ret
		.cfi_endproc
	.LFE0:
		.size	store_ele, .-store_ele
		.comm	A,3640,32
		.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
		.section	.note.GNU-stack,"",@progbits
```
## 366 ##
#### 366.c ####
```c
	#define NR(n) 3*n
	#define NC(n) 4*n+1
	
	long sum_col(long n, long A[NR(n)][NC(n)], long j){
		long i;
		long result = 0;
		for(i=0; i<NR(n); i++){
			result += A[i][j];
		}
		return result;
	}
```
#### 366.s ####
```
		.file	"366.c"
		.text
		.globl	sum_col
		.type	sum_col, @function
	sum_col:
	.LFB0:
		.cfi_startproc
		leaq	1(,%rdi,4), %rax
		leaq	(%rdi,%rdi,2), %rcx
		movq	%rcx, %r8
		testq	%rcx, %rcx
		jle	.L4
		leaq	0(,%rax,8), %rdi
		leaq	(%rsi,%rdx,8), %rcx
		movl	$0, %eax
		movl	$0, %edx
	.L3:
		addq	(%rcx), %rax
		addq	$1, %rdx
		addq	%rdi, %rcx
		cmpq	%r8, %rdx
		jne	.L3
		rep ret
	.L4:
		movl	$0, %eax
		ret
		.cfi_endproc
	.LFE0:
		.size	sum_col, .-sum_col
		.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
		.section	.note.GNU-stack,"",@progbits
```
## 368 ##
#### 368.c ####
```c
	#define A 9
	#define B 5
	
	typedef struct {
		int x[A][B];
		long y;
	}str1;
	
	typedef struct {
		char array[B];
		int t;
		short s[A];
		long u;
	}str2;
	
	void setVal(str1 *p, str2 *q){
		long v1 = q->t;
		long v2 = q->u;
		p->y = v1+v2;
	}
```
#### 368.s ####
```
		.file	"368.c"
		.text
		.globl	setVal
		.type	setVal, @function
	setVal:
	.LFB0:
		.cfi_startproc
		movslq	8(%rsi), %rax
		addq	32(%rsi), %rax
		movq	%rax, 184(%rdi)
		ret
		.cfi_endproc
	.LFE0:
		.size	setVal, .-setVal
		.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
		.section	.note.GNU-stack,"",@progbits
```
## 370 ##
#### 370.c ####
```c
	/* A. 
		e1.p	0
		e1.y	8
		e2.x	0
		e2.next	8
	B.
		16 bytes
	C. 
		 */
		 
	union ele{
		struct{
			long *p;
			long y;
		}e1;
		struct{
			long x;
			union ele *next;
		}e2;
	};
	
	void proc(union ele* up){
		up->e2.x = *((up->e2.next)->e1.p)-(up->e2.next)->e1.y;
	}
```
#### 370.s ####
```c
		.file	"370.c"
		.text
		.globl	proc
		.type	proc, @function
	proc:
	.LFB0:
		.cfi_startproc
		movq	8(%rdi), %rdx
		movq	(%rdx), %rax
		movq	(%rax), %rax
		subq	8(%rdx), %rax
		movq	%rax, (%rdi)
		ret
		.cfi_endproc
	.LFE0:
		.size	proc, .-proc
		.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
		.section	.note.GNU-stack,"",@progbits
```
## 372 ##
```
	/* 
		A. 
			%rax = 8n+30，30的低四位值为14
			-16: 10000取反加一：111....110000，与它逻辑与会删除最低4位
			若n为奇数:%rax -= 8+14， %rax=8n+8
			若n为偶数:%rax -= 0+14， %rax=8n+16
			因此是取了[8n向上最小的16的倍数]作为所需分配的空间数
			最后用s2 = s1 - %rax来分配空间
		B. 
			举几个例子来归纳规律：
			s2 = 0, %r8 = 0
			s2 = 1, %r8 = 16
			s2 = 2, %r8 = 16
			...
			s2 = 16, %r8 = 16
			s2 = 17, %r8 = 32
			因此%r8(&p[0])是s2向上舍入到最近的16的倍数的结果
		C. 
			使e1最大(16)：s1 = 8的倍数，n偶数
			使e1最小( 0)：s1 = 8的倍数，n奇数
		D.
			s2的计算方式会使，不管s1的偏移量多少，s2始终为最接近的16的倍数。//来自课本P240 3.49 D第一句，但是他翻译错了，特此纠正
			p的地址会以8的倍数对齐，这正是八字节元素建议的对齐方式
	 */
```
