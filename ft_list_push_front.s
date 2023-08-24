;ft_push_front(t_list **lst-rdi, void *data-rsi)
section .note.GNU-stack
section .data
section .bss
section .text
	global	ft_list_push_front
	extern	malloc
ft_list_push_front:
	push	rdi
	push	rsi
	mov		rdi, 16 ; sizeof(t_list)
	call	malloc wrt ..plt
	cmp		rax, 0
	jz		quit
	pop		rsi
	pop		rdi
	mov		[rax], rsi
	mov		rcx, [rdi]
	mov		[rax + 8], rcx
	mov		[rdi], rax

quit:
	ret

