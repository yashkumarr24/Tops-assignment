#include <stdio.h>

int main() {
    int a, b;

    // Input two integers
    printf("Enter first integer: ");
    scanf("%d", &a);
    printf("Enter second integer: ");
    scanf("%d", &b);

    // Arithmetic Operations
    printf("\nArithmetic Operations:\n");
    printf("Addition (a + b) = %d\n", a + b);
    printf("Subtraction (a - b) = %d\n", a - b);
    printf("Multiplication (a * b) = %d\n", a * b);
    if (b != 0) {
        printf("Division (a / b) = %d\n", a / b);
        printf("Modulus (a %% b) = %d\n", a % b);
    } else {
        printf("Division and modulus operation not possible (division by zero).\n");
    }

    // Relational Operations
    printf("\nRelational Operations:\n");
    printf("a == b: %d\n", a == b);
    printf("a != b: %d\n", a != b);
    printf("a > b: %d\n", a > b);
    printf("a < b: %d\n", a < b);
    printf("a >= b: %d\n", a >= b);
    printf("a <= b: %d\n", a <= b);

    // Logical Operations
    printf("\nLogical Operations:\n");
    printf("(a > 0 && b > 0) (Both positive): %d\n", (a > 0 && b > 0));
    printf("(a > 0 || b > 0) (At least one positive): %d\n", (a > 0 || b > 0));
    printf("!(a > 0) (Negation of a > 0): %d\n", !(a > 0));

    return 0;
}

