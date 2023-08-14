;ft_strcpy
section .data
section .bss
section .text
global ft_strcpy
ft_strcpy:
	xor rax,    rax
	xor bl,     bl
loop:
	mov bl, [rsi + rax]
	mov [rdi + rax], bl
	inc rax
	cmp byte bl, 0
	je  done
	jmp loop
done:
	xor rax, rax
	mov rax, rdi
	ret