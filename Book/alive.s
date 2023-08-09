;alive.s
.intel_syntax:
section .data
	msg1:   db  "Hello, world!", 0
	len1:   equ $ - msg1 - 1
	msg2:   db  "Alive and kicking!", 0
	len2:   equ $ - msg2 - 1
	radius: dq  357
	pi:     dq  3.14
	str:    db  "String: %s", 10, 0
	flstr:  db  "Float: %lf", 10, 0
	intstr: db  "Int: %d", 10, 0

section .bss
section .text
	global main
	extern printf
main:
	push    rbp         ; function prologue
	mov     rbp,    rsp ; function prologue

	mov     rdi,    str ; 1st arg of printf
	mov     rsi,    msg1; 2nd arg of printf
	mov     rax,    0   ; no floating point
	call    printf      ; call printf

	mov     rdi,    str
	mov     rsi,    msg2
	mov     rax,    0
	call    printf

	mov     rdi,    intstr
	mov     rsi,    [radius]
	xor     rax,    rax ; same as mov rax, 0 but faster
	call    printf

	mov     rdi,    flstr
	mov     rax,    1   ; 1 xmm register used for float
	movq    xmm0,   [pi]; [] for de-referencing addr and get value at this addr
	call    printf

	mov     rsp,    rbp ; function epilogue
	pop     rbp         ; function epilogue

	xor     eax,    eax ; 0 the eax register for return 0
ret                     ; return 0
