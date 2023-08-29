; rdi = t_list **begin, rsi = int (*cmp)(d1, d2)
section .note.GNU-stack
section .data
section .bss
section	.text
    global	ft_list_sort
ft_list_sort:
	xor     rax, rax
	cmp     qword rdi, 0
    jz      exit
	mov     rcx, [rdi]
	mov     rdx, rsi
	cmp     qword rcx, 0
	jz      exit
	cmp     qword rdx, 0
	jz      exit
	jmp     do_the_thing

do_the_thing:
	cmp     qword [rcx + 8], 0
	je      exit
	mov     qword rcx, [rcx + 8]
	inc     rax
	jmp     do_the_thing

exit:
	ret