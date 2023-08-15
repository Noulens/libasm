;ft_strlen
.intel_syntax
section .note.GNU-stack
section .data
section .bss
section .text
global  ft_strlen
ft_strlen:
	xor rax, rax
.loop:
	cmp byte [rdi + rax], 0
	je  .done
	inc rax
	jmp .loop
.done:
	ret