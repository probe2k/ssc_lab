#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char prod[3][10] = { "A->aBa", "B->bB", "B->@" }, stack[25], input[10];
int top = -1, j = 0, k, l;

void push(char item) {
	stack[++top] = item;
}

void pop() {
	top--;
}

void display() {
	for (int j = top; j >= 0; j--)
		printf("%c", stack[j]);
}

void stackpush(char p) {
	if (p == 'A') {
		pop();
		for (j = strlen(prod[0]) - 1; j >= 3; j--)
			push(prod[0][j]);
	} else {
		pop();
		for (j = strlen(prod[1]) - 1; j >= 3; j--)
			push(prod[1][j]);
	}
}

void main() {
	char c; int i;
	printf("\nEnter string terminated using $ : ");
	scanf("%s", input);
	for (i = 0; input[i] != '\0'; i++) {
		if ((input[i] != 'a') && (input[i] != 'b') && (input[i] != '$')) {
			printf("Invalid grammar");
			exit(0);
		}
	}

	if (input[i - 1] != '$') {
		printf("Termination string invalid");
		exit(0);
	}

	push('$');
	push('A');
	i = 0;
	printf("\n\nStack\nInput\nAction");
	while (i != strlen(input) && stack[top] != '$') {
		printf("\n");
		for (l = top; l >= 0; l--)
			printf("%c", stack[l]);
		printf("\t");
		for (l = i; l < strlen(input); l++)
			printf("%c", input[l]);
		printf("\t");
		if (stack[top] == 'A') {
			printf("A->aBa");
			stackpush('A');
		} else if (stack[top] == 'B') {
			if (input[i] != 'b') {
				printf("B->@\tmatched @");
				pop();
			} else {
				printf("B->bB");
				stackpush('B');
			}
		} else {
			if (stack[top] == input[i]) {
				printf("pop %c\tmatched %c", input[i], input[i]);
				pop();
				i++;
			} else break;
		}
	}

	if (stack[top] == '$' && input[i] == '$') {
		printf("\n$\t$");
		printf("\nValid string accepted\n");
	} else
		printf("\nInvalid string rejected\n");
}
