; add two pre-defined numbers

section .data
 num1 db 5
 num2 db 3

section .bss
    sum resb 1 

section .text 
    global _start
    _start:
    ; Move the data into al
    mov al ,[num1]
    add al,[num2]

    mov [sum],al

    add [sum],byte '0'

    ;output 
    mov eax,4
    mov ebx,1 
    mov edx,1
    mov ecx,sum

    int 80h

    ;exit
    mov eax,1
    xor ebx,ebx
    int 80h

