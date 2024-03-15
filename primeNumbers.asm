extern _printf
extern _scanf

section .data
    string db "enter the number to print the prime numbers upto ", 0
    str1 db "prime numbers are : ", 0
    newline db 10
    lineformat db "%c", 0
    hexformat db "%08x %08x %08x %08x", 0
    hexformat1 db "%08x", 0
    intFormat db "%u", 0

section .bss
    inputNum resd 1
    divisor resd 1
    dividend resd 1

section .text
global _asm_main
_asm_main:
    push ebp
    mov ebp, esp

    lea eax, string
    push eax
    call _printf
    call printLine
    add esp, 4

    lea eax, [inputNum]
    push eax
    lea eax, [intFormat]
    push eax
    call _scanf
    add esp, 8

    lea eax, [inputNum]
    mov eax, [eax]
    cmp eax, 2
    jc exitWhile
    jz exitWhile
    lea eax, [str1]
    push eax
    call _printf
    add esp, 4
    call printLine
    mov eax, 2
    call printInt
    call printLine

    lea eax, [inputNum]
    mov eax, [eax]
    cmp eax, DWORD 3
    jc exitWhile
    jz exitWhile
    mov eax, DWORD 3
    call printInt
    call printLine

    lea eax, [dividend]
    mov [eax], DWORD 5

while:
    lea eax, [dividend]
    mov eax, [eax]
    lea ebx, [inputNum]
    mov ebx, [ebx]
    cmp eax, ebx
    jnc exitWhile

    lea eax, [divisor]
    mov [eax], DWORD 3

innerWhile:
    lea eax, [divisor]
    mov eax, [eax]
    mul eax
    jc innerWhileExit
    lea ebx, [dividend]
    mov ebx, [ebx]
    cmp eax, ebx
    jnc innerWhileExit
    jz innerWhileExit

    mov edx, 0
    lea eax, [dividend]
    mov eax, [eax]
    lea ebx, [divisor]
    mov ebx, [ebx]
    div ebx
    cmp edx, 0
    jz innerWhileExit
    lea eax, [divisor]
    mov ebx, [eax]
    add ebx, 2
    mov [eax], ebx
    jmp innerWhile
innerWhileExit:

    mov edx, 0
    lea eax, [dividend]
    mov eax, [eax]
    lea ebx, [divisor]
    mov ebx, [ebx]
    div ebx
    cmp edx, 0
    jz if3
    lea eax, [dividend]
    mov eax, [eax]
    call printInt
    call printLine
if3:

    lea eax, [dividend]
    mov ebx, [eax]
    add ebx, 2
    mov [eax], ebx
    jmp while
exitWhile:

    mov eax, 0
    mov esp, ebp
    pop ebp
    ret

stackTest:
    push ebp
    mov ebp, esp
    pusha

    lea eax, [string]
    push eax
    call _printf
    call printLine

    push DWORD 0
    push DWORD 1
    push DWORD 2
    push DWORD 3

    mov eax, [ebp - 4*2 - 4*8]
    call printHex
    call printLine

    mov eax, [ebp - 4*3 - 4*8]
    call printHex
    call printLine

    mov eax, [ebp - 4*4 - 4*8]
    call printHex
    call printLine

    mov eax, [ebp - 4*5 - 4*8]
    call printHex
    call printLine

    add esp, 4*4 + 4
    popa
    mov esp, ebp
    pop ebp
    ret

printLine:
    push ebp
    mov ebp, esp

    lea eax, [newline]
    mov eax, [eax]
    push eax
    lea eax, [lineformat]
    push eax
    call _printf
    add esp, 8

    mov esp, ebp
    pop ebp
    ret

printHex:
    push ebp
    mov ebp, esp

    push eax
    lea eax, [hexformat1]
    push eax
    call _printf
    add esp, 8

    mov esp, ebp
    pop ebp
    ret

printInt:
    push ebp
    mov ebp, esp

    push eax
    lea eax, [intFormat]
    push eax
    call _printf
    add esp, 8

    mov esp, ebp
    pop ebp
    ret