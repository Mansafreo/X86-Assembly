; A file to multiply two numbers
%macro print 2
    ; Preserve th registers
    push ebx
    push eax
    push edx
    push ecx
    ; Print the values
    mov ecx, %1
    mov edx, %2
    mov eax,4
    mov ebx,1
    int 80h
    ; return the registers
    pop ecx
    pop eax
    pop ebx
    pop edx
%endmacro

section .data 
    num1 db 2
    num2 db 3
    eol db 0xa

section .bss
    result resb 1

section .text
    global _start
    _start:

    ; Move the data to the registers
    mov bx,[num1]
    mov ax, [num2]
    mul bx
    mov [result],ax 
    add [result],byte '0'

    print result,1
    print eol,1

    mov eax,1
    xor ebx,ebx
    int 80h

