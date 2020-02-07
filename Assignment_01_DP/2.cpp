#include<bits/stdc++.h>
using namespace std;

int main(){
	int t;
	cin>>t;
  ofstream myfile;
  myfile.open ("e1.txt");
//  myfile << "Writing this to a file.\n";

	for(int i=0; i<t; i++){
		string s;

		cin>>s;
    int B=0,dot=0;
		for(int j=0; j<s.length(); j++){
			if(s[j]=='B'){
				B++;
			}
			else if(s[j]=='.'){
				dot++;
			}
		}
		if(B>=dot && dot!=0 && B!=0){
			myfile<<"Case #"<<i+1<<": Y"<<endl;
		}
    else if(B<dot && dot!=0 && B!=0 && B>=2){
      myfile<<"Case #"<<i+1<<": Y"<<endl;
    }
		else{
			myfile<<"Case #"<<i+1<<": N"<<endl;
		}
	}
myfile.close();

	return 0;
}
