/*
 * Name:
 * Matric no:
 *
 */
#include <stdio.h>

int gcd(int u, int v) {
	//printf("%d %d\n", u, v);
	if (u == 0) {
		return v;
	} else {
		return gcd(v % u, u);
	}
}

int main() {
	int u, v;
	while (scanf("%d %d", &u, &v) == 2) {
		printf("GCD(%d,%d)=%d\n", u, v, gcd(u,v));
	}
	return 0;
}
