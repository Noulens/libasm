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

; ;main write
; section .note.GNU-stack
; section .data
; 	s1:	db	"Hellp, world!", 0
; 	s2:	db	"Hello, world!", 0
; 	s3:	db	"Hello, world", 10, 0
; 	s4:	db	"", 0
; 	s5: db	"", 0
; 	str: db	"This is the result: %d", 10, 0
; section .bss
; section .text
; 	global main
; 	extern ft_write
; 	extern printf
; main:
; 	push	rbp
; 	mov		rbp, rsp  ; prologue

; 	mov		rdi, 1 ; cmp
; 	mov		rsi, s3
; 	mov		rdx, 13
; 	call	ft_write

; 	mov		rcx, rax
; 	xor		rax, rax
; 	mov		rdi, str
; 	mov		rsi, rcx
; 	call	printf wrt ..plt

; 	mov		rsp, rbp   ; epilogue
; 	pop		rbp

; 	mov		rax,    60 ; exit
; 	mov		rdi,    0
; 	syscall
;main read
; section .note.GNU-stack
; section .data
; 	s6: db "error", 0
; 	str: db	"This is the result: %d with string: %s", 10, 0
; 	array: times 28 db 0
; 	fd: dw 0
; 	txt: db "test.txt", 0
; section .bss
; section .text
; 	global main
; 	extern ft_read
; 	extern printf
; 	extern perror
; 	extern open
; main:
; 	push	rbp
; 	mov		rbp, rsp  ; prologue

; 	mov		rax, 2
; 	mov		rdi, txt
; 	xor		rsi, rsi
; 	syscall

; 	mov		rdi, rax ; read
; 	push	rax
; 	mov		rsi, array
; 	mov		rdx, 28
; 	call	ft_read

; 	cmp		rax, -1
; 	je		error

; 	mov		rcx, rax
; 	xor		rax, rax
; 	mov		rdi, str
; 	mov		rsi, rcx
; 	mov		rdx, array
; 	call	printf wrt ..plt

; 	pop		rax
; 	mov		r8, rax
; 	mov		rax, 3
; 	mov		rdi, r8
; 	syscall

; next:
; 	mov		rsp, rbp   ; epilogue
; 	pop		rbp

; 	mov		rax,    60 ; exit
; 	mov		rdi,    0
; 	syscall

; error:
; 	mov	rdi, s6
; 	call perror wrt ..plt
; 	jmp next
; section .note.GNU-stack
; section .data
; 	s6: db "error", 0
; 	todup: db "All those moments will be lost in time like tears in the rain...", 0
; 	str: db	"This is the result: %s", 10, 0
; 	array: times 28 db 0
; 	fd: dw 0
; 	txt: db "test.txt", 0
; section .bss
; section .text
; 	global main
; 	extern ft_strdup
; 	extern printf
; 	extern perror
; 	extern free
; main:
; 	push	rbp
; 	mov		rbp, rsp  ; prologue

; 	mov		rdi, todup ; read
; 	call	ft_strdup
; 	cmp		rax, 0
; 	je		error
; 	push	rax
; 	mov		rcx, rax
; 	xor		rax, rax
; 	mov		rdi, str
; 	mov		rsi, rcx
; 	call	printf wrt ..plt
; 	jmp		next

; next:
; 	pop		rax
; 	mov		rdi, rax
; 	call	free wrt ..plt
; 	mov		rsp, rbp   ; epilogue
; 	pop		rbp

; 	mov		rax,    60 ; exit
; 	mov		rdi,    0
; 	syscall

; error:
; 	mov	rdi, s6
; 	call perror wrt ..plt
; 	jmp next

;   --------+-2a ", "0123456789abcdef"

;main ft_atoi_base
; section .note.GNU-stack
; section .data
; 	s1:	db	09, "101010", 0
; 	s2:	db	"01", 0
; 	str: db	"This is the result: %d", 10, 0
; section .bss
; section .text
; 	global main
; 	extern ft_atoi_base
; 	extern printf
; main:
; 	push	rbp
; 	mov		rbp, rsp  ; prologue

; 	mov		rdi, s1 ; str
; 	mov		rsi, s2 ; base
; 	call	ft_atoi_base
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

;list_sort
section .note.GNU-stack
section .data
	str: db "a", 10, 0
    str1 db "b", 10, 0
	str2 db "c", 10, 0
	str3: db "text: %s", 10, 0
	str4: db "size: %d", 10, 0

section	.bss
list: 
	resq 1
section	.text
extern ft_list_sort
extern printf
extern ft_strcmp
extern strcmp
extern ft_list_push_front
extern ft_strdup
extern ft_list_size
global main

main:
	push	rbp
	mov		rbp, rsp  ; prologue
; create LL
	mov		rdi, str
	call	ft_strdup
	lea		rdi, [list]
	mov		rsi, rax
	call	ft_list_push_front
	mov		rdi, str1
	call	ft_strdup
	lea		rdi, [list]
	mov		rsi, rax
	call	ft_list_push_front
	mov		rdi, str2
	call	ft_strdup
	lea		rdi, [list]
	mov		rsi, rax
	call	ft_list_push_front
; Display size
	mov		rdi, [list]
	call	ft_list_size
	mov		rcx, rax

	xor		rax, rax
	lea		rdi, [rel str4]
	mov		rsi, rcx
	call	printf
; Display data at first node
	xor		rax, rax
	lea		rdi, [rel str3]
	mov		rcx, [list]
	mov		rsi, [rcx]
	call	printf

; Call ft_sort_list
	lea		rdi, [list]
	mov		rsi, strcmp
	call	ft_list_sort

; Display data at first node
	xor		rax, rax
	lea		rdi, [rel str3]
	mov		rcx, [list]
	mov		rsi, [rcx]
	call	printf

	mov		rsp, rbp   ; epilogue
	pop		rbp

	mov		rax,    60 ; exit
	mov		rdi,    0
	syscall

; ft_list_remove_if
; section .note.GNU-stack
; section .data
; 	to_delete: db "a", 0
; 	str: db "b", 0
;     str1 db "g", 0
; 	str2 db "a", 0
; 	str3: db "text: %s", 10, 0
; 	str4: db "size: %d", 10, 0

; section	.bss
; list: 
; 	resq 1
; section	.text
; extern ft_list_remove_if
; extern printf
; extern ft_strcmp
; extern strcmp
; extern ft_list_push_front
; extern ft_strdup
; extern ft_list_size
; extern free
; global main

; main:
; 	push	rbp
; 	mov		rbp, rsp  ; prologue
; ; create LL
; 	mov		rdi, str
; 	call	ft_strdup
; 	lea		rdi, [list]
; 	mov		rsi, rax
; 	call	ft_list_push_front
; 	mov		rdi, str1
; 	call	ft_strdup
; 	lea		rdi, [list]
; 	mov		rsi, rax
; 	call	ft_list_push_front
; 	mov		rdi, str2
; 	call	ft_strdup
; 	lea		rdi, [list]
; 	mov		rsi, rax
; 	call	ft_list_push_front
; ; Display size
; 	mov		rdi, [list]
; 	call	ft_list_size
; 	mov		rcx, rax

; 	xor		rax, rax
; 	lea		rdi, [rel str4]
; 	mov		rsi, rcx
; 	call	printf
; ; Display data at first node
; 	xor		rax, rax
; 	lea		rdi, [rel str3]
; 	mov		rcx, [list]
; 	mov		rsi, [rcx]
; 	call	printf

; ; Call ft_list_remove_if
; 	lea		rdi, [list]
; 	lea		rsi, [to_delete]
; 	lea		rcx, [strcmp]
; 	lea		rdx, [free]
; 	call	ft_list_remove_if

; ; Display data at first node
; 	xor		rax, rax
; 	lea		rdi, [rel str3]
; 	mov		rcx, [list]
; 	mov		rsi, [rcx]
; 	call	printf

; 	xor		rax, rax
; 	lea		rdi, [rel str4]
; 	mov		rsi, rcx
; 	call	printf

; 	mov		rsp, rbp   ; epilogue
; 	pop		rbp

; 	mov		rax,    60 ; exit
; 	mov		rdi,    0
; 	syscall