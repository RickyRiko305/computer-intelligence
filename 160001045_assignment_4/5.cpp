#include<bits/stdc++.h>

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
	int row = pow(2,n), colm = n;
	int **u = (int **)malloc(row*sizeof(int *));
	for(int i=0;i<row;i++){
		u[i] = (int *)malloc(colm*sizeof(int));
	}
	for(int i=0;i<row;i++){
		dataGenerate(u[i],i,colm);
	}

  double *w = new(nothrow) double [colm];
	for(int i=0;i<colm;i++){
		w[i] = 0;
	}

    double *v = new(nothrow) double [row];
	for(int i=0;i<row-1;i++){
		v[i] = 0;
	}
	v[row-1] = 1;
	double alpha = 0.3, bias = 1.0, threshold = (double) (colm+1);
	int c = 0, epoch = 0;
	while(c < row){
		c = 0;
		for(int i=0;i<row;i++){
			double sigma = 0.0;
			for(int j=0;j<colm;j++){
				sigma += u[i][j]*w[j];
			}
			sigma += bias;
			int val = 0;
			if(sigma >= threshold){
				val = 1;
			}
			if(val != v[i]){
				for(int j=0;j<colm;j++){
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
	for(int j=0;j<colm;j++){

    cout<<"weight "<<j+1<<" = "<<w[j]<<endl;
	}

  cout<<"Bias = "<<bias<<endl;

  cout<<"number of epoch = "<<epoch<<endl;
	return 0;
}
