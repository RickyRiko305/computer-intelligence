#include<bits/stdc++.h>
using namespace std;

int main(){
//  int *a = new(nothrow) int[]
    double x[4][9] = {{1,1,1,1,0,0,0,0,0}, {1,0,1,0,0,0,0,0,0}, {0,1,1,0,0,0,0,0,0},{0,0,1,0,0,0,0,0,0}};
    double cons =0.3 ,b=1,w1=0,w2=0;
    int temp=1;
  //  cout<<"target value   calculate value    w1       w2       b"<<endl;
    while(temp){
      temp =0;
      for(int i=0; i<4; i++){
        // for(int j=0; j<9; j++){
        //
        // }

        x[i][4] = b +(x[i][0]*w1)+(x[i][1]*w2);
        if(x[i][4]>=0) x[i][5] = 1;
        else x[i][5] = 0;

        w1 = w1 + cons*(x[i][3]-x[i][5])*x[i][0];
        w2 = w2 + cons*(x[i][3]-x[i][5])*x[i][1];
        b = b + cons*(x[i][3]-x[i][5])*x[i][2];
        //cout<<"    "<<x[i][3]<<"               "<<x[i][5]<<"              "<<w1<<"       "<<w2<<"       "<<" "<<b<<endl;
      //  cout<<x[i][3]<<"   "<<x[i][5]<<"   "<<w1<<"   "<<w2<<"   "<<"   "<<b<<endl;
      }

      for(int i=0; i<4; i++){
        if(x[i][3] != x[i][5]){
          temp = 1;
        }
      }
    //  cout<<endl;
    }
    cout<<"weight value w1 = "<<w1<<" w2 = "<<w2<<" bias = "<<b;
    // for(int i=0; i<4; i++){
    //   for(int i)
    // }

  return 0;
}
