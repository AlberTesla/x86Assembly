#include<stdio.h>

int main(){
    unsigned int inputNum;
    unsigned int divisor;
    unsigned int dividend;

    printf("enter the number to print prime numbers upto");
    scanf("%d", &inputNum);

    if (inputNum > 2){
        printf("2\n");
    }
    if (inputNum > 3){
        printf("3\n");
    }
    dividend = 5;
    while (dividend <= inputNum){
        divisor = 3;
        //check for each number until the divisor ^ 2 >= N
        while (divisor * divisor < dividend && dividend % divisor != 0){//asm
            divisor += 2;//odd numbers only 
        }
        //after break loop we find divisor 2 >= N, check if that divides too.
        if (dividend % divisor != 0){
            printf("%d\n", dividend);
        }
        dividend += 2; //odd numbers only
    }
    return 0;
}