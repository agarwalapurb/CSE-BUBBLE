// Garvit Arora - 200372
// Apurb Agarwal - 200179
#include<stdio.h>
#include<stdlib.h>

void BubbleSort(int n, int * arr){
    int i, j;
    int temp;
    for (i=0; i<n-1; i++){
        for(j=0; j<n-i-1; j++){
            if(arr[j] > arr[j+1]){
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
    for(i=0; i<n; i++){
        printf("%d \t", arr[i]);
    }
}

int main(){
    int n = 3;
    int arr[] = {5,4,2};
    BubbleSort(n, arr);

    return 0;
}