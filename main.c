/*
** main de test pour la libft codée en assembleur
*/

#include "./includes/libtfasm.h"

int main()
{
  printf("-------- ISALPHA --------> ");
  (ft_isalpha('+') == 0 && ft_isalpha('H') == 1 && ft_isalpha('o') == 1) ? printf("OK\n") : printf("KO\n");
  printf("-------- ISDIGIT --------> ");
  (ft_isdigit('+') == 0 && ft_isdigit('7') == 1 && ft_isdigit('o') == 0) ? printf("OK\n") : printf("KO\n");
  printf("-------- ISALNUM --------> ");
  (ft_isalnum('+') == 0 && ft_isalnum('H') == 1 && ft_isalnum('7') == 1) ? printf("OK\n") : printf("KO\n");
  printf("-------- ISASCII --------> ");
  (ft_isascii(-1) == 0 && ft_isascii(77) == 1 && ft_isascii(128) == 0) ? printf("OK\n") : printf("KO\n");
  printf("-------- ISPRINT --------> ");
  (ft_isprint(-1) == 0 && ft_isprint(77) == 1 && ft_isprint(128) == 0) ? printf("OK\n") : printf("KO\n");
  return (0);
}
