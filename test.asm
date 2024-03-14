segment .data
x db 0x01
y db 0xff

segment .text
    global _asm_main
    global _get_flags

_asm_main:
    push  ebp
    mov  ebp, esp
    
    lea eax, [x]
    mov cl, [eax]
    lea ebx, [y]
    mov dl, [ebx]

    mov eax, DWORD 0
    mov al, cl
    add al, dl

    mov esp, ebp
    pop ebp
    ret

_get_flags:
    push ebp
    mov ebp, esp
    
    pushf
    pop eax

    mov esp, ebp
    pop ebp
    ret