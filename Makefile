NAME = libfts.a

SRCS = srcs/isalpha.s

OBJS = ${SRCS:.s=.o}

# Pour un seul programme
# nasm -f macho64 minima.s -o minima.o
# ld minima.o -macosx_version_min 10.8 -lSystem

all: $(NAME)

.s.o:
	nasm -f macho64 $< -o $@

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

start:
	gcc -Wall -Wextra -Werror  -L. libfts.a main.c
	./a.out

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
