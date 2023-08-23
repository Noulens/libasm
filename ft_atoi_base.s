;int ft_atoi_base(str-arg0-rdi, base-arg1-rsi)
section .note.GNU-stack
section .data
section .bss
section .text
	global	ft_atoi_base
ft_atoi_base:
	xor	rax, rax
	xor	r8, r8
	xor	r9, r9
	xor	r10, r10
	mov	r12, 1
	jmp	getlen

increase:
	inc	rax
	cmp	byte r8b, 0
	je	getlen
	cmp	byte r8b, 1
	je	check_base
	cmp	byte r8b, 2
	je	skip
	cmp	byte r8b, 3
	je	sign
	cmp	byte r8b, 4
	je	convert

getlen:
	cmp	byte [rsi + rax], 0
	jne	increase
	jmp	next

next:
	cmp		rax, 2
	jl		error
	mov		r9, rax ; save base length j
	xor		rax, rax
	mov		r8b, 1
	jmp		check_base

check_base:
	cmp	byte [rsi + rax], 0
	je	pre_skip
	cmp	byte [rsi + rax], 43 ; rax: i
	je	error
	cmp	byte [rsi + rax], 45
	je	error
	cmp	byte [rsi + rax], 32
	jl	error
	mov	rcx, rax ; rcx: k
	jmp	check_double

advance:
	mov	r8b, 1
	cmp	byte [rsi + rax], 0
	jne	increase

pre_skip:
	xor	rax, rax
	mov	r8b, 2
	jmp	skip

check_double:
	cmp	rcx, r9 ; k < j
	jge	advance
	mov	byte r10b, [rsi + rax]
	cmp	byte [rsi + rcx + 1], r10b
	je	error
	inc	rcx
	jmp	check_double

skip:
	cmp	byte [rdi + rax], 0
	je	error
	cmp	byte [rdi + rax], 9
	jge	check_upper
	jmp	sign

check_upper:
	cmp	byte [rdi + rax], 13	
	jle	increase
	cmp	byte [rdi + rax], 32
	jne	prep_sign
	jmp	increase

prep_sign:
	mov	r8b, 3
	jmp	sign

sign:
	cmp	byte [rdi + rax], 0
	je	error
	cmp	byte [rdi + rax], 43
	jne	check_minus
	jmp	increase

check_minus:
	cmp	byte [rdi + rax], 45
	je	minus
	jmp	prep_convert

prep_convert:
	xor	r11, r11
	mov	r8b, 4
	jmp	convert

minus:
	neg	r12
	jmp	increase

convert:
	cmp	byte [rdi + rax], 0
	je	finish
	mov	rcx, -1
	jmp	in_base

compute:
	imul	r11, r9
	add		r11, rcx
	jmp		increase

in_base:
	inc	rcx
	cmp	byte [rsi + rcx], 0
	je	finish
	mov	byte r10b, [rsi + rcx]
	cmp	byte [rdi + rax], r10b
	jne	in_base
	jmp	compute

finish:
	imul	r11, r12
	mov		rax, r11
	ret

error:
	xor	rax, rax
	ret