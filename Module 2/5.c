/* Write a C program to check if a number is even or odd using an if-else
 * statement. Extend the program using a switch statement to display the month
 * name based on the user’s input (1 for January, 2 for February, etc.). */

#include<stdio.h>
int main() 
{
	int num;
	printf("Enter a number if it is even or odd = ");
	scanf("%d",&num);
	if (num % 2 == 0){
	
	printf("\nThe number is even ",num);
	}
	else 
	{
		printf("\n The number is odd",num);
	}
	printf("\nEnter the number between (1 to 12) tp get month name = ");
	scanf("%d",&num);
	switch (num)
	{
			case 1:
				printf("jan\n");
				break;
			case 2:
				printf("Feb\n");
				break;
			case 3:
				printf("march\n");
				break;
			case 4:
				printf("april\n");
				break;
			case 5:
				printf("may\n");
				break;
			case 6:
				printf("june\n");
				break;
			case 7:
				printf("july\n");
				break;
			case 8:
				printf("\nAugust\n");
				break;
			case 9:
				printf("\nSeptember\n");
				break;
			case 10:
				printf("\nOctober\n");
				break;
			case 11:
				printf("\nNovember\n");
				break;
			case 12:
				printf("\nDecember\n");
				break;
	}
 
	
	return 0;
}
