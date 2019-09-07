segment .text

    global _ft_strcat

_ft_strcat:
    mov r10, 0

goDestEnd:
    cmp BYTE[rdi], 0
    jz copyLoop
    inc rdi
    inc r10
    jmp goDestEnd

copyLoop:
    cmp BYTE[rsi], 0
    jz exit
    mov al, BYTE[rsi]
    mov BYTE[rdi], al
    inc rsi
    inc rdi
    inc r10
    jmp copyLoop

exit:
    sub rdi, r10
    mov rax, rdi
    ret
