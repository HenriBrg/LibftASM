segment .text

    global _ft_strcat

_ft_strcat:
    push rdi  ; On garde en mémoire (c.a.d on met dans la stack) l'adresse de rdi car on va itérer dessus après

goDestEnd:
    cmp BYTE[rdi], 0
    jz copyLoop
    inc rdi
    jmp goDestEnd

copyLoop:
    cmp BYTE[rsi], 0
    jz exit
    mov al, BYTE[rsi]
    mov BYTE[rdi], al
    inc rsi
    inc rdi
    jmp copyLoop

exit:
    pop rax
    ; On remet rdi (push ligne 6 lorsque l'on avait pas encore itéré dessus, donc rdi pointe sur le début du string)
    ; Le pop prend le dernier push et le met dans le registre demandé
    ret
