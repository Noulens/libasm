; betterloop
section .data
	number  dq  5
	fmt     db  "The sum from 0 to %ld is %ld", 10 ,0
section .bss
section .text
	extern printf
	global main
main:
	push    rbp
	mov     rbp, rsp
	mov     rcx, [number]
	mov     rax, 0
; initialize rcx with number
bloop:
	add     rax,    rcx
	loop    bloop ; loop instruction that uses rcx as a
; decreasing loop counter. With every pass through the loop, rcx is decreased
; automatically, and as long as rcx is not equal to 0, the loop is executed
; again.
	mov     rdi, fmt; rcx = 0, continue here
	mov     rsi, [number]; sum to be displayed
	mov     rdx, rax
	mov     rax, 0; no floating point
	call    printf; display
	mov     rsp, rbp
	pop     rbp
ret
