; Use a stack to output data to the user

section .text
    global _start
    _start:
    ; Clear some space in the stack
    sub esp , 4 ;remove 4 bytes from esp so we move down one position in the stack

    mov [esp], dword 'H'
    mov [esp+1], dword 'E'
    mov [esp+2], dword 'L'
    mov [esp+3], dword 'L'
    mov [esp+4], dword 'O'
    mov [esp+5], dword 0xa
    mov [esp+6], dword 0x7e

    ;To output 
    mov ecx,esp
    mov edx,7
    mov eax,4
    mov ebx,1
    int 80h

    mov eax,1
    xor ebx,ebx
    int 80h