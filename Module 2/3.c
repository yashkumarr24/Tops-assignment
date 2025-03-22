/* Write a C program that includes variables, constants, and comments. Declare
 * and use different data types (int, char, float) and display their values */

#include <stdio.h>

int main() {
  int a = 40;
  float b = 12.50;
  char c = 's';
  const char *str = "immutable string";

  printf("the value of a = %d\n", a);
  printf("the value of b = %.2f\n", b);
  printf("the value of c = %c\n", c);
  printf("the value of constant str = %s\n", str);
  return 0;
}
