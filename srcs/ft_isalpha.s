segment .data ; VIDE  - Section pour la création de variables initialisées
segment .bss  ; VIDE  - Section pour la création de variables non-initialisées
section .text ; Code - Section contenant les procédures / fonctions
global _ft_isalpha ; Déclaration du nom de la fonction

; L'argument passé en paramètre se mettra automatiquement dans les registres,
; dans l'ordre suivant : RDI 1, RS1 2, RDX 3, RCX 4 ...

_ft_isalpha:
  cmp rdi, 'a' ; RDI contient donc automatiquement le premier argument
  jge greaterOrEqualMin ; Si rdi >= 'a', on jump
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
  mov rax, 0 ; Par convention, rax contient la valeur de retour d'une fonction
  ret        ; ret jump à l'adresse de l'instruction qui suit le call

ret1:
  mov rax, 1 ; Par convention, rax contient la valeur de retour d'une fonction
  ret        ; ret jump à l'adresse de l'instruction qui suit le call

; Code source en C :

; int ft_isalpha(int c)
; {
;   if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z'))
;     return (1);
;   else
;     return (0);
; }
