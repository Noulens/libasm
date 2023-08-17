;print.s
.intel_syntax:
extern  printf
section .data
	msg:    db  "Hello, world!", 0
	str:    db  "This is the string: %s", 10, 0
section .bss
section .text
	global main
main:
	push    rbp
	mov     rbp,    rsp
	mov     rax,    0
	mov     rdi,    str
	mov     rsi,    msg
	call    printf
	mov     rsp,    rbp
	pop     rbp
	mov     rax,    60
	mov     rdi,    0
	syscall