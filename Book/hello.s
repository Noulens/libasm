;hello
.intel_syntax:
section .data
	msg: db "Hello, world", 0x0A, 0 ;initialized values go there "d" prefix to b w d q
;	NL  db 0x0A
	len: equ $ - msg - 1 ; "$" contains the address of current instruction in memory
section .bss
;uninitialized values go there "res" prefix to b w d q
section .text
	global main
main:
	mov rax, 1
	mov rdi, 1
	mov rsi, msg
	mov rdx, len
	syscall
;	mov rax, 1
;	mov rdi, 1
;	mov rsi, NL
;	mov rdx, 1
;	syscall
	ret len
	mov     rax,    60  ; exit function sys code
	mov     rdi,    0   ; exit 0
	syscall
