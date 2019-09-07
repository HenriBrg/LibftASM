section .text

    global _ft_isalpha

_ft_isalpha:
    cmp rdi, 'a'
    jge greaterOrEqualMin
    cmp rdi, 'A'
    jge greaterOrEqualMaj
    jmp ret0

greaterOrEqualMin:
    cmp rdi, 'z'
    jle ret1
    jmp ret0

greaterOrEqualMaj:
    cmp rdi, 'Z'
    jle ret1
    jmp ret0

ret0:
    mov rax, 0
    ret

ret1:
    mov rax, 1
    ret
