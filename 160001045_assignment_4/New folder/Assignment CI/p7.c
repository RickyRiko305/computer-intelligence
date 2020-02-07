#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void testDataGeneration(int *a, int x, int n){
	int k = n-1, y = x, i;
	while(y > 0){
		a[k] = y%2;
		y = y/2;
		k--;
	}
	for(i=0;i<=k;i++){
		a[i] = 0;
	}
}

int main(){
	int n, i;
	printf("Enter the value of 'n' \n");
	scanf("%d",&n);
	int rows = pow(2,n), cols = n;
	int **u = (int **)malloc(rows*sizeof(int *));
	for(i=0;i<rows;i++){
		u[i] = (int *)malloc(cols*sizeof(int));
	}
	for(i=0;i<rows;i++){
		testDataGeneration(u[i],i,cols);
	}
	float *w = (float *)malloc(cols*sizeof(float));
	for(i=0;i<cols;i++){
		w[i] = 0;
	}
	float *v = (float *)malloc(rows*sizeof(float));
	for(i=0;i<rows-1;i++){
		v[i] = 1;
	}
	v[rows-1] = 0;
	float alpha = 0.3, bias = 1.0, threshold = (float) (cols+1);
	int c = 0, j, numberOfEpoch = 0;
	while(c < rows){
		c = 0;
		for(i=0;i<rows;i++){
			float sigma = 0.0;
			for(j=0;j<cols;j++){
				sigma += u[i][j]*w[j];
			}
			sigma += bias;
			int val = 0;
			if(sigma >= threshold){
				val = 1;
			}
			if(val != v[i]){
				for(j=0;j<cols;j++){
					w[j] = w[j] + alpha*(v[i] - val)*u[i][j];
				}
				bias = bias + alpha*(v[i] - val);
			}
			else{
				c += 1;
			}
		}
		numberOfEpoch += 1;
	}
	for(j=0;j<cols;j++){
		printf("Weight %d = %f \n",j+1,w[j]);
	}
	printf("Bias = %f \n",bias);
	printf("Number of epoch = %d \n",numberOfEpoch);
	return 0;
}
