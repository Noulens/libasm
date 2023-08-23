;ft_write
section .note.GNU-stack
section .data
section .bss
section .text
	extern	__errno_location
	global	ft_write
ft_write:
	xor	rax, rax
	mov	rax, 1
	syscall
	cmp	rax, 0
	jl	error
	ret
error:
	; not		rax
	; add		rax, 1 ; f = (~f) + 1
	neg		rax
	mov		rdi, rax
	call	__errno_location wrt ..plt
	mov		[rax], rdi
	mov		rax, -1
	ret
	