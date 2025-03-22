/* Write a C program that uses the break statement to stop printing numbers when
 * it reaches 5. Modify the program to skip printing the number 3 using the
 * continue statement. */
#include <stdio.h>

int main() {
    int i;

    printf("Using break statement (Stops at 5):\n");
    for (i = 1; i <= 10; i++) {
        if (i == 5) {
            break; // Stop the loop when i is 5
        }
        printf("%d ", i);
    }

    printf("\n\nUsing continue statement (Skips 3):\n");
    for (i = 1; i <= 10; i++) {
        if (i == 3) {
            continue; // Skip printing 3
        }
        printf("%d ", i);
    }

    printf("\n");

    return 0;
}

