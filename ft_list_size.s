;int ft_list_size(t_list *begin_list-rdi)
section .note.GNU-stack
section .data
section .bss
section .text
	global  ft_list_size
ft_list_size:
	test	rdi, rdi
	jz		.done
	mov		rdi, [rdi + 8]
	call	ft_list_size
	add		rax, 1
	ret

.done:
	xor	rax, rax                 ; Return 0
	ret
