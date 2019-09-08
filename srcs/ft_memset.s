section .text

    global _ft_memset

_ft_memset:
  	push rdi       ; (cf. 1)
  	mov rax, rsi
    mov rcx, rdx   ; (cf. 2)
    cld            ; (cf. 3)
  	rep stosb      ; (cf. 4)

exit:
  	pop rax        ; (cf. 5)
  	ret

; 1) push rdi

; On met l'adresse (sur le premier char) de rdi dans la stack
; car ensuite on va itérer dessus, donc l'adresse va être incrémentée
; or, on doit retourner l'addresse de début du string

; 2) mov rcx, rdx

; Pour copier plusieurs octets, faire REP MOVSB (« Repeat Move String Byte »).
; Le nombre d'octets à copier doit être transmis dans (ici R) CX

; 3) cld

; L'instruction "cld" met le flag DF à 0
; DF (« Direction Flag ») est utilisé pour les opérations sur les chaînes de
; caractères. S'il vaut 1, celles-ci seront parcourues dans le sens des
; adresses décroissantes, sinon les adresses seront croissantes.

; 4) rep stosb

; Stosb : Store String Byte
; L'instruction "stosb" stocke le contenu de AL (c.a.d la partie 8 Bits basse de RAX)
; dans l'octet adressé par RDI
; Si DF = 0, alors (E:R)DI est ensuite incrémenté, sinon il est décrémenté.
; L'instruction "rep" est utilisé comme préfixe avec d'autres instructions pour effectuer des répétitions d'instructions tant que CX ne vaut pas 0
; rep s'arrete quand stosb n'aura pas mis le flag CX à 1 (c.a.d à la fin du string)

; 5) pop rax

; On dépile la stack dans laquelle on avait push rdi (l'addresse de début du string)
; Et on demande que la valeur dépilée (rdi) soit rangée dans rax, qu'on retournera ensuite
