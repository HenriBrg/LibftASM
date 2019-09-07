segment .data

    newLine db 10

segment .text

    global _ft_puts
    extern _ft_strlen

_ft_puts:
    call _ft_strlen         ; rax = strlen(str)
    mov r10, rax
    ; Comme rdi est incrémenté dans strlen, à la sortie de strlen on se retrouve
    ; avec rdi dont l'adresse est positionnée sur le '\0' du string.
    ; Donc si on sub pas, on affichera rien
    ; Ducoup, on sub de la taille de str pour revenir au début du string
    sub rdi, rax
    mov rax, 0x2000004     ; Syscall Number pour write (NB : les syscalls commencent toujours à partir de 0x2000000)
    mov rsi, rdi           ; const void *buf --> string à afficher
    mov rdi, 1             ; File Descriptor
    mov rdx, r10           ; Size (on aura stocké la size dans r10 ligne 10)
    syscall                ; write(int fd, const void *buf, size_t count)
    mov rax, 0x2000004
    mov rdi, 0x1
    lea rsi, [rel newLine] ; lea sinon erreur : warning: PIE disabled. Absolute addressing
    mov rdx, 1             ; size_t 1
    syscall
    ret
