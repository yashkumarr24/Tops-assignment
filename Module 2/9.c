//Write a C program that stores 5 integers in a one-dimensional array and prints
//them. Extend this to handle a two-dimensional array (3x3 matrix) and
//calculate the sum of all elements.

#include <stdio.h>

int main() {
    // One-dimensional array
    int arr1D[5] = {10, 20, 30, 40, 50};
    int arr2D[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    int i, j, sum = 0;

    printf("One-Dimensional Array Elements:\n");
    for (i = 0; i < 5; i++) {
        printf("%d ", arr1D[i]);
    }

    // Two-dimensional array (3x3 matrix)
 

    printf("\n\nTwo-Dimensional Array (3x3 Matrix):\n");
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            printf("%d ", arr2D[i][j]);
            sum += arr2D[i][j]; // Summing elements
        }
        printf("\n");
    }

    printf("\nSum of all elements in the matrix: %d\n", sum);

    return 0;
}

