;ft_strcpy(dest-arg0-rdi, src-arg1-rsi)
.intel_syntax
section .note.GNU-stack
section .data
section .bss
section .text
	global ft_strcpy
ft_strcpy:
	xor     rax, rax
	push    rdi     ; push rdi onto the stack
	cld             ; clear the DF to increment RSI
;If the direction flag is cleared (DF = 0), the RSI register is incremented after each string operation.
;If the direction flag is set (DF = 1), the RSI register is decremented after each string operation.
.loop:
	movsb           ; For 64-bit mode move byte from address (R|E)SI to (R|E)DI.
	cmp byte [rsi], 0
	je  .done
	jmp .loop
.done:
	pop rdi ; restore rdi
	mov rax, rdi
	ret

;       as an alternative, rep can be used but it needs strlen to set ecx counter
;	    mov ecx, strlen           ; Set the counter to copy strlen bytes
;
;        cld                  ; Clear the direction flag (incrementing)
;        rep movsb            ; Copy bytes from source to destination