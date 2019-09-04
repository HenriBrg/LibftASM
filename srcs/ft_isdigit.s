segment .data
segment .bss
segment .text

global _ft_isdigit

_ft_isdigit:
  cmp rdi, '1'
  jge greaterOrEqual9
  jmp ret0

greaterOrEqual9:
  cmp rdi, '9'
  jle ret1
  jmp ret0

ret0:
  mov rax, 0
  ret

ret1:
  mov rax, 1
  ret

; Code source en C :

; int ft_isdigit(int c)
; {
;   if (c >= '0' && c <= '9')
;     return (1);
;   else
;     return (0);
; }
