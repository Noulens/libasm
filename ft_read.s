;syscall rax 0 ft_read(rdi unsigned int fd, rsi char *buf, rdx size_t count)
section .note.GNU-stack
section .data
section .bss
section .text
	global	ft_read
	extern	__errno_location
ft_read:
	xor	rax, rax
	syscall
	cmp	rax, 0
	jl	error
	ret
error:
	; not		rax
	; add		rax, 1
	neg		rax
	mov		rdi, rax
	call    __errno_location wrt ..plt
	mov		[rax], rdi
	mov		rax, -1
	ret