; rdi = t_list **begin, rsi = int (*cmp)(d1, d2)
section .note.GNU-stack
section .data
section .bss
section	.text
	global	ft_list_sort

ft_list_sort:
	push	r12
	push	r13
	push	rbx
	jmp		.check

.begin:
	lea		r12, [rdi]
	mov		r13, [rdi]
	cmp		r13, 0
	je		.quit
	mov		rbx, rsi
	jmp		.advance

.advance:
	cmp		qword [r13 + 8], 0		; while (ptr->next)
	je		.reset
	jmp		.call_func

.call_func:
	mov		rdi, [r13]
	mov		r10, [r13 + 8]
	mov		rsi, [r10]
	call	rbx
	cmp		eax, 0
	jg		.swap

.next:
	mov		r13, [r13 + 8]			; ptr = ptr->next;
	jmp		.advance

.swap:
	xor		r9, r9					; (void *) temp
	mov		r9, [r13]				; temp = ptr->data;
	mov		qword rax, [r13 + 8]	; ptr->data = ptr->next->data;
	mov		qword rax, [rax]		; ptr->data = ptr->next->data;
	mov		qword [r13], rax		; ptr->data = ptr->next->data;
	mov		qword rax, [r13 + 8]	; ptr->next->data = temp;
	mov		qword [rax], r9			; ptr->next->data = temp;
	mov		r13, [r12]				; ptr = *begin_list;
	jmp		.advance

.check:
	test	rdi, rdi
	jz		.quit
	test	rsi, rsi
	jz		.quit
	jmp		.begin

.reset:
	lea		rdi, [r12]				; put **begin and *begin back in place
	mov		rax, [r12]
	mov		qword [rdi], rax

.quit:
	pop		r13
	pop		r12
	pop		rbx
	ret

; void	ft_list_sort(t_list **begin_list, int (*cmp)())
; {
; 	t_list	*ptr;
; 	void	*temp;

; 	ptr = *begin_list;
; 	if (!ptr)
; 		return ;
; 	while (ptr->next)
; 	{
; 		if (cmp(ptr->data, ptr->next->data) > 0)
; 		{
; 			temp = ptr->data;
; 			ptr->data = ptr->next->data;
; 			ptr->next->data = temp;
; 			ptr = *begin_list;
; 		}
; 		else
; 			ptr = ptr->next;
; 	}
; }
