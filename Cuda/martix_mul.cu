#include "cuda_runtime.h"
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
/*
 * Author: MARTIN VIVANCO
 * ID: A01701167
*/
#define N (4096*4096)
#define HILOS_POR_BLOQUE 512

__global__ void matrixmul(int *a, int *b, int *c, int awith, int aheight, int bwith, int bheight){
	int index = threadIdx.x + blockIdx.x*blockDim.x;// get index of the thread
  int n = (bwith+1)*(aheight+1); //get length of result
	if (index < n){ // if thread id is smaller than c size
		int col = index%(bwith+1);//get col of a matrix
    int row = index/(bwith+1);//get row of b matrix
    int total = 0; // mult and sum of row per col
    for (int i = 0; i < (awith+1); i++) {
      total += a[i+row*(awith+1)]*b[col+i*(bwith+1)];
    }
    c[index] = total;// save total in the result matrix
	}
}

void examplem1(int *a){
  int j = 1;
	for (int i = 0; i < 6; i++){
		a[i] = j;
    j++;
	}
}
void examplem2(int *a){
	int j = 6;
	for (int i = 0; i < 4; i++){
		a[i] = j;
    j++;
	}
  a[4] = 0;
  a[5] = 1;
}
int main(){
	int *a, *b, *c;// hosts matrix
	int *d_a, *d_b, *d_c;// device matrix
  int awith, aheight, bwith, bheight; // with and heigth of matrix a and b
  printf("please give me a with and heigth starting 0\n");//For predefined example 1 2 or 2 1
	scanf("%i %i", &awith, &aheight);
  printf("please give me b with and heigth starting 0\n");//For predefined example 2 1 or 1 2
	scanf("%i %i", &bwith, &bheight);
	int tama = (awith+1)*(aheight+1)*sizeof(int);// sizes not starting in 0
  int tamb = (bwith+1)*(bheight+1)*sizeof(int);
  int tamc = (bwith+1)*(aheight+1)*sizeof(int);// size of the result
	//reserva memoria en DEVICE gpu
	cudaMalloc((void**)&d_a, tama);
	cudaMalloc((void**)&d_b, tamb);
	cudaMalloc((void**)&d_c, tamc);
	// reserva de memoria en HOST cpu
	a = (int*)malloc(tama);
	b = (int*)malloc(tamb);
	c = (int*)malloc(tamc);
	//init with predefined examples
	examplem1(a);
	examplem2(b);
	//copy values from cpu to gpu
	cudaMemcpy(d_a, a, tama, cudaMemcpyHostToDevice);
	cudaMemcpy(d_b, b, tamb, cudaMemcpyHostToDevice);
	//ejecute kernel
	matrixmul << <N / HILOS_POR_BLOQUE, HILOS_POR_BLOQUE >> >(d_a, d_b, d_c, awith, aheight, bwith, bheight);
	//copy result from gpu to cpu
	cudaMemcpy(c, d_c, tamc, cudaMemcpyDeviceToHost);
	// print result
	int cont = 0;
  for (int i = 0; i < (bwith+1)*(aheight+1); i++) {
    printf(" %i ",c[i]);
    if (cont == bwith) {
      printf("\n");
      cont = -1;
    }
    cont++;
  }

	//free memory
	free(a);
	free(b);
	free(c);
	cudaFree(d_a);
	cudaFree(d_b);
	cudaFree(d_c);
	return 0;
}
