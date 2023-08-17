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

;main strcmp
section .note.GNU-stack
section .data
	s1:	db	"Hello, world!", 0
	s2:	db	"Hello, world!"
	s3:	db	"Hello, world!"
	len:	equ	$ - dest - 1
section .bss
section .text
	global main
	extern ft_strcmp
	extern printf
main:
	push	rbp
	mov		rbp, rsp  ; prologue

	mov		rdi, s1 ; cpy
	mov		rsi, s2
	call	ft_strcmp
	mov		rax, 1    ; write syscall
	mov		rcx, rdi
	mov		rdi, 1    ; stdoutput
	mov		rsi, rcx
	mov		rdx, len
	syscall

	mov		rsp, rbp   ; epilogue
	pop		rbp

	mov		rax,    60 ; exit
	mov		rdi,    0
	syscall