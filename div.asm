; A file to divide two numbers and output the result
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
    num1 dw 2
    num2 dw 9
    text db "Remainder is ",0xa
    tlen equ $- text
    eol db 0xa

section .bss
    result resb 1

section .text
    global _start
    _start:
    xor dx,dx ; clear dx
    mov ax,[num2]
    mov bx, [num1]
    div bx

    mov [result],al
    add [result],byte '0'

    print result,1
    print eol,1

    print text,tlen
    mov [result],dx
    add [result],byte '0'
    print result,1
    print eol,1

    mov eax,1
    xor ebx,ebx
    int 80h