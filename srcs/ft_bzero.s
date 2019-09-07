segment .text

		global _ft_bzero

_ft_bzero:
		cmp rdi, 0
		jz exit

while:
		cmp rsi, 0
		jle exit
		mov byte[rdi], 0
		inc rdi
		dec rsi
		jmp while

exit:
		ret
