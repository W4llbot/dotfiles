#include <stdio.h>

int foo(int a, int b);

int calc_area(int w, int h);

int main() {
    int w, h;

    printf("Enter a width: ");
    scanf("%d", &w);
    printf("Enter a height: ");
    scanf("%d", &h);

    int area = calc_area(w, h);

    printf("The area of the rectangle is: %d\n", area);
    return (0);
}

int calc_area(int w, int h) { return w * h; }

int foo(int a, int b) {
    int sum = a + b;
    return sum;
}
