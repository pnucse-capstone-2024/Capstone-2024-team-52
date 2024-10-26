#include <stdio.h>

int main(void) {
	int a = 1;
	for (int i = 0; i < 100; i++) {
		a = a + i;
	}
	printf("hello world%d\n", a);
	return 0;
}
