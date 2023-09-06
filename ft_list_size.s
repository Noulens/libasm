;int ft_list_size(t_list *begin_list-rdi)
section .note.GNU-stack
section .data
section .bss
section .text
	global  ft_list_size
ft_list_size:
    ; If lst is NULL, return 0
    test rdi, rdi
    jz .done

    ; Recursively call ft_lstsize(lst->next) and add 1
    mov rdi, [rdi + 8]           ; Load lst->next into rdi
    call ft_list_size              ; Call ft_lstsize recursively
    add rax, 1                   ; Add 1 to the result
    ret

.done:
	xor	rax, rax                 ; Return 0
	ret
