#include<bits/stdc++.h>
// #include <stdio.h>
// #include <stdlib.h>
// #include <math.h>
using namespace std;
void dataGenerate(int *a, int x, int n){
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
	int n;

  cout<<"enter the number of inputs :- ";

  cin>>n;
	int rows = pow(2,n), cols = n;
	int **u = (int **)malloc(rows*sizeof(int *));
	for(int i=0;i<rows;i++){
		u[i] = (int *)malloc(cols*sizeof(int));
	}
	for(int i=0;i<rows;i++){
		dataGenerate(u[i],i,cols);
	}
	double *w = (double *)malloc(cols*sizeof(double));
	for(int i=0;i<cols;i++){
		w[i] = 0;
	}
	double *v = (double *)malloc(rows*sizeof(double));
	for(int i=1;i<rows;i++){
		v[i] = 1;
	}
	v[0] = 0;
	double alpha = 0.3, bias = 1.0, threshold = (double) (cols+1);
	int c = 0, epoch = 0;
	while(c < rows){
		c = 0;
		for(int i=0;i<rows;i++){
			double sigma = 0.0;
			for(int j=0;j<cols;j++){
				sigma += u[i][j]*w[j];
			}
			sigma += bias;
			int val = 0;
			if(sigma >= threshold){
				val = 1;
			}
			if(val != v[i]){
				for(int j=0;j<cols;j++){
					w[j] = w[j] + alpha*(v[i] - val)*u[i][j];
				}
				bias = bias + alpha*(v[i] - val);
			}
			else{
				c += 1;
			}
		}
		epoch += 1;
	}
	for(int j=0;j<cols;j++){
		//printf("Weight %d = %f \n",j+1,w[j]);
    cout<<"weight "<<j+1<<" = "<<w[j]<<endl;
	}
	//printf("Bias = %f \n",bias);
  cout<<"Bias = "<<bias<<endl;
	//printf("Number of epoch = %d \n",epoch);
  cout<<"number of epoch = "<<epoch<<endl;
	return 0;
}
