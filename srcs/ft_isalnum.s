segment .text

    extern _ft_isalpha
    extern _ft_isdigit
    global _ft_isalnum

_ft_isalnum:
    call _ft_isalpha
    cmp rax, 1
    je ret1
    call _ft_isdigit
    cmp rax, 1
    je ret1
    jmp ret0

ret0:
    mov rax, 0
    ret

ret1:
    mov rax, 1
    ret
