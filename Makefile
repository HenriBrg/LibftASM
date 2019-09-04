NAME = libfts.a

SRCS = srcs/ft_isalpha.s srcs/ft_isdigit.s srcs/ft_isalnum.s \
			 srcs/ft_isascii.s srcs/ft_isprint.s

OBJS = ${SRCS:.s=.o}

# Pour un seul programme
# nasm -f macho64 minima.s -o minima.o
# ld minima.o -macosx_version_min 10.8 -lSystem


ifndef VERBOSE
.SILENT:
endif

all: $(NAME)

.s.o:
	nasm -f macho64 $< -o $@

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

run: $(NAME)
	gcc -Wall -Wextra -Werror  -L. libfts.a main.c
	./a.out

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re s
