#include <stdio.h>

int foo(int a, int b);

typedef struct {
        int x;
        int y;
} point;

int main() {
	int a = 5;
	int b = 10;
	int sum = foo(a, b);

	printf("Hello from nvim!, and the sum is %d", sum);

        point p = { 1, 3 };

	return 0;
}

int foo(int a, int b) {
	return a + b;
}

int fun() {
        return 1;
}
