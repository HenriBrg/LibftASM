section .text

    global _ft_memcpy

_ft_memcpy:
    push rdi
    mov rcx, rdx  ; (cf. 1)
    cld           ; (voif ft_memset.s)
    rep movsb     ; (cf. 2)

exit:
    pop rax
    ret

; 1)  mov rcx, rdx

; Dans l'instruction qui suit : "rep movsb", il est necessaire d'avoir dans CX le
; nombre de répétition à executer

; 2) rep movsb

; movsb : Copie l'octet adressé par SI à l'adresse DI.
; Si DF = 0 (cld met DF à 1), alors DI et SI sont ensuite incrémentés, sinon ils sont décrémentés.

; Pour copier plusieurs octets, faire REP MOVSB (« Repeat Move String Byte »).
; Le nombre d'octets à copier doit être transmis dans (ici R) CX (cf. 1)
