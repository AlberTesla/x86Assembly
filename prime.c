#include<stdio.h>
int __cdecl asm_main(void);
unsigned int* __cdecl get_address(void);


//write this code in assembly

int test(){
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
        //check for each number until the divisor 2 >= N
        while (divisor * divisor < inputNum){
            if (dividend % divisor != 0){
                divisor += 2;//odd numbers only 
            }
            else {
                break;
            }
        }
        //after break loop we find divisor 2 >= N, check if that divides too.
        if (dividend % divisor != 0){
            printf("%d\n", dividend);
        }
        dividend += 2; //odd numbers only
    }
    return 0;
}

int main(){
    unsigned int ret = asm_main();
    unsigned int* data = get_address();
    
    printf("input : %u,data :  %u", ret, *data);
    return 0;
}