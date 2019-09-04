segment .text

global _ft_isascii

_ft_isascii:
  cmp rdi, 0
  jge lowerOrEqual127
  jmp ret0

lowerOrEqual127:
  cmp rdi, 127
  jle ret1
  jmp ret0

ret0:
  mov rax, 0
  ret

ret1:
  mov rax, 1
  ret
