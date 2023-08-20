; ;main strcpy
; section .note.GNU-stack
; section .data
; 	src:    db  "Hello, world!", 0
; 	dest:   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 14 bytes
; 	len:    equ $ - dest - 1
; section .bss
; section .text
; 	global main
; 	extern ft_strcpy
; main:
; 	push    rbp
; 	mov     rbp, rsp  ; prologue

; 	mov     rdi, dest ; cpy
; 	mov     rsi, src
; 	call    ft_strcpy
; 	mov     rax, 1    ; write syscall
; 	mov     rcx, rdi
; 	mov     rdi, 1    ; stdoutput
; 	mov     rsi, rcx
; 	mov     rdx, len
; 	syscall

; 	mov     rsp, rbp   ; epilogue
; 	pop     rbp

; 	mov		rax,    60 ; exit
; 	mov     rdi,    0
; 	syscall

; ;main strcmp
; section .note.GNU-stack
; section .data
; 	s1:	db	"Hellp, world!", 0
; 	s2:	db	"Hello, world!", 0
; 	s3:	db	"Hello, world", 0
; 	s4:	db	"", 0
; 	s5: db	"", 0
; 	str: db	"This is the result: %d", 10, 0
; section .bss
; section .text
; 	global main
; 	extern ft_strcmp
; 	extern printf
; main:
; 	push	rbp
; 	mov		rbp, rsp  ; prologue

; 	mov		rdi, s1 ; cmp
; 	mov		rsi, s3
; 	call	ft_strcmp
; 	mov		rcx, rax
; 	mov     rax,    0
; 	mov     rdi,    str
; 	mov     rsi,    rcx
; 	call    printf wrt ..plt

; 	mov		rsp, rbp   ; epilogue
; 	pop		rbp

; 	mov		rax,    60 ; exit
; 	mov		rdi,    0
; 	syscall

;main strcmp
section .note.GNU-stack
section .data
	s1:	db	"Hellp, world!", 0
	s2:	db	"Hello, world!", 0
	s3:	db	"Hello, world", 10, 0
	s4:	db	"", 0
	s5: db	"", 0
	str: db	"This is the result: %d", 10, 0
section .bss
section .text
	global main
	extern ft_write
	extern printf
main:
	push	rbp
	mov		rbp, rsp  ; prologue

	mov		rdi, 1 ; cmp
	mov		rsi, s3
	mov		rdx, 12
	call	ft_write

	mov		rcx, rax
	xor		rax, rax
	mov		rdi, str
	mov		rsi, rcx
	call	printf wrt ..plt

	mov		rsp, rbp   ; epilogue
	pop		rbp

	mov		rax,    60 ; exit
	mov		rdi,    0
	syscall