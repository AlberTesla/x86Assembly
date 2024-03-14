#include<stdio.h>
#include<string.h>

int __cdecl asm_main(void);
int __cdecl get_flags(void);

const char* flagString = "C P A ZS   O     ";

void printFlagBits(unsigned int flags){
    int carry = 0;
    int parity = 0;
    int zero = 0;
    int overflow = 0;
    int sign = 0;
    int auxCarry = 0;
    unsigned int data = flags;
    int j = 0;

    if (data & 0x00000001){
        carry = 1;
    }
    else{
        carry = 0;
    }

    if (data & 0x00000004){
        parity = 1;
    }
    else{
        parity = 0;
    }

    if (data & 0x00000010){
        auxCarry = 1;
    }
    else{
        auxCarry = 0;
    }

    if (data & 0x00000040){
        zero = 1;
    }
    else{
        zero = 0;
    }

    if (data & 0x00000080){
        sign = 1;
    }
    else{
        sign = 0;
    }

    if (data & 0x00000800){
        overflow = 1;
    }
    else{
        overflow = 0;
    }

    data = flags;

    for (int i = 0; i < sizeof(int); i++){
        if (j > 1  && j % 8 == 0){
            printf(" ");
        }
        for (j = 0; j < 8; j++){
            if (data & 0x80000000){
                printf("1");
            }
            else{
                printf("0");
            }
            data = data << 1;
        }
    }

    printf(
    "\ncarry     : %d"
    "\nparity    : %d"
    "\nauxCarry  : %d"
    "\nzero      : %d"
    "\nsign      : %d"
    "\noverflow  : %d"
    , carry, parity, auxCarry, zero, sign, overflow);
    return;
}

void checkEndian(){
    unsigned int x = 0x0000001;
    if (*((unsigned char*)(&x)) == 0x01){
        printf("little endian\n");
    }
    else{
        printf("big endian\n");
    }
    return;
}

int main(){
    checkEndian();
    int retstatus = 1;
    unsigned int flags = 0;
    retstatus = asm_main();
    flags = get_flags();
    printf("result : %02x\n", retstatus);
    printf("flag register : %08x\n", flags);
    printf("                  ");
    for (int i = 0; i < strlen(flagString); i++){
        printf("%c", flagString[strlen(flagString) - i - 1]);
    }
    printf("\n");
    printFlagBits(flags);
    return retstatus;
}