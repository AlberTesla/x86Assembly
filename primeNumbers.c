#include<stdio.h>
int __cdecl asm_main(void);

int main(){
    int x = asm_main();
    printf("return : %u", x);
    return 0;
}