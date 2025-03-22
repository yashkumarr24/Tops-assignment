/* Write a C program to demonstrate pointer usage. Use a pointer to modify the
 * value of a variable and print the result. */

#include <stdio.h>

int main() {
  int num = 10;
  int *ptr = &num;

  printf("Original value: %d\n", num);

  // Modifying value using pointer
  *ptr = 20;

  printf("Modified value: %d\n", num);
  printf("Value through pointer: %d\n", *ptr);

  return 0;
}
