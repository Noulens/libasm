;Copying a value in an 8-bit or 16-bit register does not clear the higher part
;of a 64-bit register.
;However, copying a value in a 32-bit register does clear the higher part of a
;64-bit register.
section .data
	bNum    db  123
	wNum    dw  12345
	dNum    dd  1234567890
	qNum1   dq  1234567890123456789
	qNum2   dq  123456
	qNum3   dq  3.14
section .bss
section .text
	global main
main:
	push    rbp
	mov     rbp,    rsp

	mov     rax,    -1
	mov     al,     byte [bNum] ; does NOT clear upper bits
	xor     rax,    rax
	mov     al,     byte [bNum]

	mov     rax,    -1
	mov     ax,     word [wNum]  ; does NOT clear upper bits
	xor     rax,    rax
	mov     ax,     word [wNum]

	mov     rax,    -1
	mov     eax,    dword [dNum]  ; does clear upper bits
	xor     rax,    rax
	mov     eax,    dword [dNum]

	mov     rax,    -1
	mov     rax,    qword [qNum1] ; does clear upper bits

	mov     rax,    qword [qNum2]

	mov     rax,    123456

	movq    xmm0,   [qNum3]

	mov     rsp,    rbp
	pop     rbp
ret