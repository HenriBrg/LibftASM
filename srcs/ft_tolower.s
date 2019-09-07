segment .text

    global _ft_tolower

_ft_tolower:
    cmp rdi, 'A'
    jge isMaj
    jmp retC

isMaj:
    cmp rdi, 'Z'
    jle lower
    jmp retC

lower:
    add rdi, 32

retC:
    mov rax, rdi
    ret
