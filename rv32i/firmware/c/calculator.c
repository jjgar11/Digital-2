#include <femtorv32.h>

	// TODO scanf funtion

int main() {
	int a = 15;
	int b = 5;
	int operation = 1;
	printf("Ingrese el primer operando: ");
	// scanf("%x", a);
	printf("%x \n\r", a);
	printf("Ingrese el segundo operando: ");
	// scanf("%x", b);
	printf("%x \n\r", b);
	printf("\nSeleccione la operacion:\n\r1.Suma\n\r2.Resta\n\r3.Multiplicacion\n\r4.Division\n\n\r");
	// scanf("%x", operation);
	printf("%x \n\r", operation);
	int result = 0;
	switch (operation)
	{
	case 1:
		result = sum(a, b);
		printf("El resultado de la suma es: %x \n\r", result);
		break;
	case 2:
		result = res(a, b);
		printf("El resultado de la resta es: %x \n\r", result);
		break;
	case 3:
		result = mult(a, b);
		printf("El resultado de la multiplicacion es: %x \n\r", result);
		break;
	case 4:
		result = div(a, b);
		printf("El resultado de la division es: %x \n\r", result);
		break;
	default:
		printf("Ingrese una opcion valida.\n\r");
		break;
	}

	return 0;
}

int sum(int a, int b) {
	return a+b;
}

int res(int a, int b) {
	return a-b;
}

int mult(int a, int b) {
	return a*b;
}

int div(int a, int b) {
	return a/b;
}