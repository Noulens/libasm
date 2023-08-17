;ft_strcmp(s1-arg0-rdi, s2-arg1-rsi)
section .note.GNU-stack
section .data
section .bss
section .text
	global ft_strcmp
ft_strcmp:
	xor	edx, edx
compare:
	mov byte	al, [rdi]
	mov byte	ah, [rsi]
	cmp byte	al, ah
	je	check_zero
	jmp	check_cmp
check_zero:
	cmp byte	al, 0
	je	done_zero
	inc			rdi
	inc			rsi
	jmp	compare
check_cmp:
	cmp byte	al, ah
	jg	done_greater
	movzx		edx, ah
	movzx		eax, al
	sub			eax, edx
	ret
done_greater:
	movzx		edx, ah
	movzx		eax, al
	sub			eax, edx
	ret
done_zero:
	xor			rax, rax
	ret
