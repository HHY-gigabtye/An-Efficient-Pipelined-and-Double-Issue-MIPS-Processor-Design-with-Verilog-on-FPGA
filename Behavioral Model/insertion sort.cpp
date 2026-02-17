/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <iostream>

int main()
{
    int j,i,sort_reg;
    int a[16];
    a[0]=32;
    a[1]=30;
    a[2]=28;
    a[3]=26;
    a[4]=34;
    a[5]=22;
    a[6]=20;
    a[7]=18;
    a[8]=16;
    a[9]=14;
    a[10]=12;
    a[11]=10;
    a[12]=8;
    a[13]=6;
    a[14]=4;
    a[15]=2;
	for(j=0;j<16;j=j+1){
		i=15;
		while(i>=j){
			if(a[i]<a[i-1]){
				sort_reg=a[i-1];
				a[i-1]=a[i];
				a[i]=sort_reg;
				i=i-1;
			}
			else i=j-1;
		}
	}
	for(j=0;j<16;j=j+1){
	    printf("%d ",a[j]);
	}
    return 0;
}