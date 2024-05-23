; File to ask user for two numbers and compare the numbers

section .data
    ; First Prompt
    prompt1 db "Enter the first number ", 0xa
    pr1len equ $- prompt1
    prompt2 db "Enter the second number" ,0xa
    pr2len equ $- prompt2
    ;Declare some messages to print
    str1 db "The number is less",0xa
    str1len equ $- str1
    str2 db "The number is the same" ,0xa
    str2len equ $- str2
    str3 db "The number is greater",0xa
    str3len equ $- str3

section .bss
    num1 resb 1 ; Reserve 1 byte for num1
    num2 resb 1 ; Reserve 1 byte for num2

section .text
    global _start
    _start:
    ;Ask user for the input 
    mov ecx,prompt1
    mov edx,pr1len
    mov eax,4
    mov ebx,1
    int 80h

    ;Read input
    mov ecx,num1
    mov edx,2
    mov ebx,0
    mov eax,3
    int 80h

    ;Ask for the second number
    mov eax,4
    mov ebx,1
    mov ecx,prompt1
    mov edx,pr2len
    int 80h

    ;Read the second input
    mov eax,3
    mov ebx,0
    mov ecx,num2
    mov edx,2
    int 80h

    ;To perform the comparison
    ;convert input to ascii
    sub [input1]

    jmp exit ; Jump to exit 

exit:
    ;To exit the function
    mov eax,1
    xor ebx,ebx
    int 80h