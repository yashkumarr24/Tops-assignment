#include <stdio.h>

int main() {
    int i;

    // Using for loop
    printf("Numbers using for loop:\n");
    for (i = 1; i <= 10; i++) {
        printf("%d ", i);
    }

    printf("\n\nNumbers using while loop:\n");
    i = 1; // Reset i
    while (i <= 10) {
        printf("%d ", i);
        i++;
    }

    printf("\n\nNumbers using do-while loop:\n");
    i = 1; // Reset i
    do {
        printf("%d ", i);
        i++;
    } while (i <= 10);

    printf("\n");

    return 0;
}

