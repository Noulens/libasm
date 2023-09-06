; rdi = t_list **begin, rsi = *data_ref, rdx = int (*cmp)(data, data_ref), rcx = void (*free_fct)(data)
section .note.GNU-stack
section .data
section .bss
section .text
	global	ft_list_remove_if
	extern	free

ft_list_remove_if:						
	push	rbp
	push	rbx
	push	r12
	mov		r12, [rdi]
	xor		rbx, rbx
	cmp		rdi, 0
	jz		.quit
	cmp		rdx, 0
	jz		.quit
	cmp		rcx, 0
	jz		.quit
	jmp		.comp

.apply_free:
	mov		r8, [rdi]
	mov		rbp, [r8 + 8]		; tmp = (*begin)->next
	push	rsi
	push	rdx
	push	rcx
	push	rdi
	mov		rdx, [rdi]
	mov		rdi, [rdx]
	call	rcx					; (*free_fct)((*begin)->data)
	pop		rdi
	push	rdi
	mov		rdx, [rdi]
	lea		rdi, [rdx]
	call	free wrt ..plt		; free(*begin)
	pop		rdi
	pop		rcx
	pop		rdx
	pop		rsi
	mov		[rdi], rbp			; *begin = tmp
	cmp		rbx, 0				; previous == NULL
	jnz		.prev
	mov		r12, rbp			; first == tmp
	jmp		.comp
.prev:
	mov		[rbx + 8], rbp		; previous.next = tmp
	jmp		.comp
.comp_null:
	xor		rdi, rsi
	lea		rax, [rdi]
	jmp		.cmp_last
.next:
	mov		rbx, [rdi]
	mov		r8,	[rbx + 8]		; tmp = (*begin)->next
	mov		[rdi], r8			; *begin = tmp
.comp:
	cmp		qword [rdi], 0		; *begin == NULL
	jz		.quit
	push	rdi
	push	rsi					; data_ref already in rsi
	push	rdx
	push	rcx
	mov		r8, [rdi]
	mov		rdi, [r8]			; (*begin)->data in rdi
	cmp		rdi, 0				; (*begin)->data == NULL
	jz		.comp_null
	call	rdx					; (*cmp)((*begin)->data, data_ref)
.cmp_last:
	pop		rcx
	pop		rdx
	pop		rsi
	pop		rdi
	cmp		rax, 0
	jz		.apply_free
	jmp		.next
.quit:
	mov		[rdi], r12
	pop		r12
	pop		rbx
	pop		rbp
	ret

; void	my_free(t_list *ptr, void (*free_fct)(void *))
; {
; 	if (free_fct)
; 		free_fct(ptr->data);
; 	free(ptr);
; }

; void	ft_list_remove_if(t_list **begin_list, void *data_ref,
; 	int (*cmp)(), void (*free_fct)(void *))
; {
; 	t_list	*ptr;
; 	t_list	*tmp;

; 	ptr = *begin_list;
; 	tmp = NULL;
; 	while (ptr)
; 	{
; 		if (cmp(ptr->data, data_ref) == 0)
; 		{
; 			if (tmp)
; 				tmp->next = ptr->next;
; 			else
; 				*begin_list = ptr->next;
; 			my_free(ptr, free_fct);
; 			if (tmp)
; 				ptr = tmp->next;
; 			else
; 				ptr = *begin_list;
; 		}
; 		else
; 		{
; 			tmp = ptr;
; 			ptr = ptr->next;
; 		}
; 	}
; }