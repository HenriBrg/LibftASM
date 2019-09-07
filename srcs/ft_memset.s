section .text

    global _ft_memset

_ft_memset:
  	push rdi
    ; On met l'adresse (sur le premier char) de rdi dans la stack
    ; car ensuite on va itérer dessus, donc l'adresse va être incrémentée
    ; or, on doit retourner l'addresse de début du string
  	mov rax, rsi
    ; L'instruction "cld" met le flag DF à 0
    ; DF (« Direction Flag ») est utilisé pour les opérations sur les chaînes de
    ; caractères. S'il vaut 1, celles-ci seront parcourues dans le sens des
    ; adresses décroissantes, sinon les adresses seront croissantes.
    cld
    ; Stosb : Store String Byte
    ; L'instruction "stosb" stocke le contenu de AL (c.a.d la partie 8 Bits basse de RAX)
    ; dans l'octet adressé par RDI
    ; Si DF = 0, alors (E:R)DI est ensuite incrémenté, sinon il est décrémenté.
    ; L'instruction "rep" est utilisé comme préfixe avec d'autres instructions pour effectuer des répétitions d'instructions tant que CX ne vaut pas 0
    ; rep s'arrete quand stosb n'aura pas mis le flag CX à 1 (c.a.d à la fin du string)
  	rep stosb

exit:
  	pop rax
    ; On dépile la stack dans laquelle on avait push rdi (l'addresse de début du string)
    ; Et on demande que la valeur dépilée (rdi) soit rangée dans rax, qu'on retournera ensuite
  	ret
