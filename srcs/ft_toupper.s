segment .text

    global _ft_toupper

_ft_toupper:
    cmp rdi, 'a'
    jge isMin
    jmp retC

isMin:
    cmp rdi, 'z'
    jle upper
    jmp retC

upper:
    sub rdi, 32

retC:
    mov rax, rdi
    ret
