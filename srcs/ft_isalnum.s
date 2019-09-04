segment .text

extern _ft_isalpha
extern _ft_isdigit
global _ft_isalnum

_ft_isalnum:
  call _ft_isalpha ; ft_isalpha ira chercher le paramètres dans rdi
  cmp rax, 1
  je ret1
  call _ft_isdigit
  cmp rax, 1
  je ret1
  jmp ret0

ret0:
    mov rax, 0 ; rax c'est le registre dans lequel on place la valeur de retour
    ret

  ret1:
    mov rax, 1
    ret

; Code source en C - c'est équivalent à (isalpha(c) || isdigit(c))
;
; int ft_isalnum(int c)
; {
;   if ((c >= '0' && c <= '9') ||
;       (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z'))
;     return (1);
;   else
;     return (0);
; }
