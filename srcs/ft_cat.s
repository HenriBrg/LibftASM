%define READ 3
%define WRITE 4
%define STDOUT 1
%define MACH_SYSCALL(nb) 0x2000000 | nb

; 0x2000000 | nb = Opérateur binaire "ou inclusif"
; En binaire 0x2000000 = 10000000000000000000000000
; Exemple : MACH_SYSCALL(4) = 10000000000000000000000000 | 100 = 10000000000000000000000100 = 0x2000004


section .data
    buffer times 64 db 0       ; "réserve 64 bytes pour buffer" - Buffer is just an array, which in assembly is a sequence of bytes.
    bufsize equ $ - buffer     ;  Stock la taille de buffer dans bufsize

section .text

    global _ft_cat

; Recoder cat via une fonction qui prend en paramètre un fd
; L'open est fait en amont car on a le fd, donc on gère pas non plus le close

; Paramètres : ft_cat(int fd)

_ft_cat:
    push rbp
    mov rbp, rsp

readAndWrite:
    mov rax, MACH_SYSCALL(READ)   ; Identifiant syscall
    push rdi                      ; On stock le fd dans la stack
    lea rsi, [rel buffer]         ; Stockage du buffer qui va contenir le texte
    mov rdx, bufsize
    syscall
    cmp rax, 0
    jle exit
    mov rdi, STDOUT               ; Le FD étant stocké dans RDI, il est écrasé, mais on l'a stocké dans la stack :)
    mov rdx, rax                  ; On prend le retour de read comme size (nbr de caractères) à afficher
    mov rax, MACH_SYSCALL(WRITE)
    syscall
    pop rdi
    jmp readAndWrite

exit:
    mov rsp, rbp
    pop rbp
    ret
