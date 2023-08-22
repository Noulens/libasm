;ft_strdup(s1-arg0-rdi)
section .note.GNU-stack
section .data
section .bss
section .text
	global	ft_strdup
	extern	malloc
	extern	__errno_location
ft_strdup:
	xor		rax, rax
	jmp		getlen

increase:
	inc		rax

getlen:
	cmp		byte [rdi + rax], 0
	jne		increase
	inc		rax ; for null termination

malloc_time:
	push	rdi	; save src
	mov		rdi, rax
	call	malloc wrt ..plt
	cmp		rax, 0
	je		error

do_the_dup:
	pop		rdi ; get src
	xor		rcx, rcx ; counter
	xor		rdx, rdx ; tmp var
	jmp		dup

increment:
	inc		rcx
	
dup:
	mov		dl, byte [rdi + rcx]
	mov		byte [rax + rcx], dl
	cmp		dl, 0
	jnz		increment

finish:
	ret

error:
	not		rax
	add		rax, 1 ; f = (~f) + 1
	mov		rdi, rax
	call	__errno_location wrt ..plt
	mov		[rax], rdi
	mov		rax, 0
	ret

