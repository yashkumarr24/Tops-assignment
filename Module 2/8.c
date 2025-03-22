/* Write a C program that calculates the factorial of a number using a function.
 * Include function declaration, definition, and call. */

#include <stdio.h>

// Function declaration (prototype)
unsigned long factorial(int num);

int main() {
  int num;

  printf("Enter a positive integer: ");
  scanf("%d", &num);

  if (num < 0) {
    printf("Error: Factorial is not defined for negative numbers.\n");
    return 1;
  }

  printf("Factorial of %d = %lu\n", num, factorial(num)); // Function call
  return 0;
}

// Function definition
// Recursive function
unsigned long factorial(int num) {
  if (num == 0 || num == 1) {
    return 1;
  } else {
    return num * factorial(num - 1);
  }
}
