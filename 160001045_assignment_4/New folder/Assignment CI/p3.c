#include <stdio.h>
#include <stdlib.h>

int main(){
	float threshold = 4.0;
	float v[4];
	v[0] = 1;
	v[1] = 1;
	v[2] = 1;
	v[3] = 0;
	int u1[4], u2[4];
	u1[0] = 0;
	u1[1] = 0;
	u1[2] = 1;
	u1[3] = 1;
	u2[0] = 0;
	u2[1] = 1;
	u2[2] = 0;
	u2[3] = 1;
	float w1 = 0, w2 = 0, alpha = 0.1, bias = 1;
	int c = 0, numberOfEpoch = 0, i;
	while(c < 4){
		c = 0;
		for(i=0;i<4;i++){
			float sigma = u1[i]*w1 + u2[i]*w2 + bias;
			int val = 0;
			if(sigma >= threshold){
				val = 1;
			}
			if(val != v[i]){
				w1 = w1 + alpha*(v[i] - val)*u1[i];
				w2 = w2 + alpha*(v[i] - val)*u2[i];
				bias = bias + alpha*(v[i] - val);
			}
			else{
				c += 1;
			}
		}
		numberOfEpoch += 1;
	}
	printf("Weight 1 = %f , Weight 2 = %f, bias = %f, No. of epoch = %d \n",w1,w2,bias,numberOfEpoch);
	return 0;
}