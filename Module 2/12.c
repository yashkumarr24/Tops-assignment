/* Write a C program that takes two strings from the user and concatenates them
 * using `strcat()`. Display the concatenated string and its length using
 * `strlen()`. */

#include <stdio.h>
#include <string.h>

int main() {
  const unsigned int MAX_LENGTH = 100;

  char str1[MAX_LENGTH], str2[MAX_LENGTH];

  // 99 (input characters) + 1 (null terminator) = 100 (MAX_LENGTH)
  printf("Enter first string: ");
  scanf("%99s", str1);
  printf("Enter second string: ");
  scanf("%99s", str2);

  if (strlen(str1) + strlen(str2) >= MAX_LENGTH) {
    printf("Error: Combined string length would exceed buffer size\n");
    return 1;
  }

  strcat(str1, str2);

  printf("Concatenated string: %s\n", str1);
  printf("Length of concatenated string: %lu\n", strlen(str1));

  return 0;
}
