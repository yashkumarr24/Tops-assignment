/* Write a program that prints a right-angled triangle using stars (*) with a
 * nested loop. */

 #include <iostream>
 using namespace std;

 int main() {
   int rows;
 
    cout << "enter the number of rows for the triangle: ";
    cin >> rows;
 
   for (int i = 1; i <= rows; i++) {
     for (int j = 1; j <= i; j++) {
        cout << "*";
     }
      cout <<  endl;
   }
 
   return 0;
 }