#include <stdlib.h>
#include <stdio.h>
#include <time.h>

void matrixmulsingle(int *a, int *b, int *c, int awith, int aheight, int bwith, int bheight){
  int n = (bwith+1)*(aheight+1);
	for (int i = 0; i < n; i++){
    int col = i%(bwith+1);//of a matrix
    int row = i/(bwith+1);//of b matrix
    printf("row col %i %i \n", row, col);
    int total = 0;
    for (int i = 0; i < (awith+1); i++) {
      total += a[i+row*(awith+1)]*b[col+i*(bwith+1)];
      printf("%i %i \n", a[i+row*(awith+1)],b[col+i*(bwith+1)]);
    }
    c[i] = total;
	}
}

void numerosAleatorios1(int *a){
  int j = 1;
	for (int i = 0; i < 6; i++){
		a[i] = j;
    j++;
	}
}
void numerosAleatorios(int *a){
	int j = 6;
	for (int i = 0; i < 4; i++){
		a[i] = j;
    j++;
	}
  a[4] = 0;
  a[5] = 1;
}

int main(){
	int *a, *b, *c;
  int awith, aheight, bwith, bheight;
  printf("please give me a with and heigth\n");
	scanf("%i %i", &awith, &aheight);
  printf("please give me b with and heigth\n");
	scanf("%i %i", &bwith, &bheight);
	int tama = (awith+1)*(aheight+1)*sizeof(int);
  int tamb = (bwith+1)*(bheight+1)*sizeof(int);
  int tamc = (bwith+1)*(aheight+1)*sizeof(int);

	a = (int*)malloc(tama);
	b = (int*)malloc(tamb);
	c = (int*)malloc(tamc);
	//inicializamos con aleatorios
	numerosAleatorios1(a);
	numerosAleatorios(b);

	//ejecucion del kernel

  for (int i = 0; i < (awith+1)*(aheight+1); i++) {
    printf("%i",a[i]);
  }
  printf("\n" );
  for (int i = 0; i < (bwith+1)*(bheight+1); i++) {
    printf("%i",b[i]);
  }
  matrixmulsingle(a, b, c, awith, aheight, bwith, bheight);
  printf("\n" );
  int cont = 0;
  for (int i = 0; i < (bwith+1)*(aheight+1); i++) {
    printf(" %i ",c[i]);
    if (cont == bwith) {
      printf("\n");
      cont = -1;
    }
    cont++;
  }

	//borramos
	free(a);
	free(b);
	free(c);
	return 0;
}
