section .note.GNU-stack noalloc noexec nowrite progbits
section .text
global ft_strlen

ft_strlen:
    ; Input:
    ;   rdi: Pointer to the null-terminated string
    ; Output:
    ;   rax: Length of the string (excluding the null terminator)

    xor     rax, rax            ; Initialize rax to 0 (length of the string)

.loop:
    cmp     byte [rdi + rax], 0 ; Compare the current character with null terminator
    je      .done               ; If null terminator is found, jump to .done

    inc     rax                 ; Increment the string length
    jmp     .loop               ; Continue the loop to check the next character

.done:
    ret                         ; Return with the length of the string in rax
