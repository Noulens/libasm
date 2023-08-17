;jump
section .note.GNU-stack
section .data
	nb1 dq 42
	nb2 dq 41
	str1 db "nb1 > nb2", 10, 0
	str2 db "nb2 > nb1", 10, 0
section .bss
section .text
	global main
	extern printf
main:
	push rbp
	mov rbp, rsp
	mov rax, [nb1]
	mov rbx, [nb2]
	cmp rax, rbx
	jge greater
	mov rdi, str2
	mov rax, 0
	call printf
	jmp exit
greater:
	mov rdi, str1
	mov rax, 0
	call printf
exit:
	mov rsp, rbp
	pop rbp
	ret