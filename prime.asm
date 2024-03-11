extern _scanf

section .data
format db "%d", 0

section .bss
inputNum resd 1

section .text
global _asm_main
global _get_address
_asm_main:
    push ebp
    mov ebp, esp

    lea eax, [inputNum]
    push eax
    lea eax, [format]
    push eax
    call _scanf
    lea eax, [inputNum]
    mov eax, [eax]
    add esp, 8

    mov esp, ebp
    pop ebp
    ret

_get_address:
    push ebp
    mov ebp, esp

    lea eax, [inputNum]

    mov esp, ebp
    pop ebp
    ret