/*
** main de test pour la libft codée en assembleur
*/

#include "./includes/libtfasm.h"

int main()
{
  printf("-------- ISALPHA --------> ");
  (ft_isalpha('+') == 0 && ft_isalpha('H') == 1 && ft_isalpha('o') == 1) ? printf("OK\n") : printf("KO\n");
  /* ------------------------------------------------------------------------ */
  printf("-------- ISDIGIT --------> ");
  (ft_isdigit('+') == 0 && ft_isdigit('7') == 1 && ft_isdigit('o') == 0) ? printf("OK\n") : printf("KO\n");
  /* ------------------------------------------------------------------------ */
  printf("-------- ISALNUM --------> ");
  (ft_isalnum('+') == 0 && ft_isalnum('H') == 1 && ft_isalnum('7') == 1) ? printf("OK\n") : printf("KO\n");
  /* ------------------------------------------------------------------------ */
  printf("-------- ISASCII --------> ");
  (ft_isascii(-1) == 0 && ft_isascii(77) == 1 && ft_isascii(128) == 0) ? printf("OK\n") : printf("KO\n");
  /* ------------------------------------------------------------------------ */
  printf("-------- ISPRINT --------> ");
  (ft_isprint(-1) == 0 && ft_isprint(77) == 1 && ft_isprint(128) == 0) ? printf("OK\n") : printf("KO\n");
  /* ------------------------------------------------------------------------ */
  printf("-------- TOLOWER --------> ");
  (ft_tolower(42) == 42 && ft_tolower(77) == 109 && ft_tolower(100) == 100) ? printf("OK\n") : printf("KO\n");
  /* ------------------------------------------------------------------------ */
  printf("-------- TOUPPER --------> ");
  (ft_toupper(42) == 42 && ft_toupper(77) == 77 && ft_toupper(100) == 68) ? printf("OK\n") : printf("KO\n");
  /* ------------------------------------------------------------------------ */
  char s[5] = "Hello";
  printf("-------- BZERO   --------> ");
  ft_bzero(s, 5);
  (s[0] == 0) ? printf("OK\n") : printf("KO\n");
  /* ------------------------------------------------------------------------ */

  char src3[5]  = "SRC";
  char dst3[15] = "DST";
  char src4[5]  = "SRC";
  char dst4[15] = "DST";
  strcat(dst3, src3);
  ft_strcat(dst4, src4);
  printf("-------- STRCAT  --------> ");
  strcmp(dst3, dst4) == 0 ? printf("OK\n") : printf("KO\n");

  /* ------------------------------------------------------------------------ */
  printf("-------- STRLEN  --------> ");
  (ft_strlen("Hello") == 5 && ft_strlen("AZERTYUIOP") == 10) ? printf("OK\n") : printf("KO\n");

  /* ------------------------------------------------------------------------ */
  write(1, "-------- PUTS    --------> ", 27);
  char strPuts[30] = "OK";
  ft_puts(strPuts);
  return (0);
}
