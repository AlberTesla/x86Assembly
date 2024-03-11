extern _printf
extern _scanf

global _asm_main

section .data
    str1 db "enter the number to print prime numbers upto", 0
    format db "%u", 0
    newLine db 10
    lineFormat db "%c", 0

section .bss
    inputNum resd 1
    divisor resd 1
    dividend resd 1

section .code
    _asm_main:
    push ebp
    mov ebp, esp

;print string to get number
    lea eax, [str1]
    push eax
    call _printf
    add esp, 4

;read data into inputNumber variable
    lea eax, [inputNum]
    push eax
    lea eax, [format]
    push eax
    call _scanf
    add esp, 8

;make copy of inputnum in eax and check if it's greater than 2
    mov eax, [inputNum]
    cmp eax, 2
    jbe anotherNum
    push DWORD 2
    lea eax, [format]
    push eax
    call _printf
    add esp, 8
    call println

;make copy of inputnum in eax and check if it's greater than 3
anotherNum:
    mov eax, [inputNum]
    cmp eax, 3
    jbe nextLabel
    push DWORD 3
    lea eax, [format]
    push eax
    call _printf
    add esp, 8
    call println

nextLabel:
    mov [dividend], DWORD 5
    
whileLabel:
    ;;here is pending

    mov eax, [inputNum]
    mov esp, ebp
    pop ebp
    ret
;end of asm_main function

;function print new line
println:
    push ebp
    mov ebp, esp

    push DWORD 10
    lea eax, [lineFormat]
    push eax
    call _printf
    add esp, 8

    mov esp, ebp
    pop ebp
    ret