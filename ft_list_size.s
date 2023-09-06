;int ft_list_size(t_list *begin_list-rdi)
section .note.GNU-stack
section .data
section .bss
section .text
	global  ft_list_size
ft_list_size:
<<<<<<< HEAD
	test	rdi, rdi
	jz		.done
	mov		rdi, [rdi + 8]
	call	ft_list_size
	add		rax, 1
	ret
=======
    ; If lst is NULL, return 0
    test rdi, rdi
    jz .done

    ; Recursively call ft_lstsize(lst->next) and add 1
    mov rdi, [rdi + 8]           ; Load lst->next into rdi
    call ft_list_size              ; Call ft_lstsize recursively
    add rax, 1                   ; Add 1 to the result
    ret
>>>>>>> refs/remotes/origin/main

.done:
	xor	rax, rax                 ; Return 0
	ret
