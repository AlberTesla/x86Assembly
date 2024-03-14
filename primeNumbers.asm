extern _printf
extern _scanf

section .data
    string db "hello world!", 0
    newline db 10
    lineformat db "%c", 0
    hexformat db "%08x %08x %08x %08x", 0
    hexformat1 db "%08x", 0

section .text
global _asm_main
_asm_main:
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
    push eax
    lea eax, [hexformat1]
    push eax
    call _printf
    call printLine

    mov eax, [ebp - 4*3 - 4*8]
    push eax
    lea eax, [hexformat1]
    push eax
    call _printf
    call printLine

    mov eax, [ebp - 4*4 - 4*8]
    push eax
    lea eax, [hexformat1]
    push eax
    call _printf
    call printLine

    mov eax, [ebp - 4*5 - 4*8]
    push eax
    lea eax, [hexformat1]
    push eax
    call _printf
    call printLine

    add esp, 4*13
    popa
    mov eax, 100
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