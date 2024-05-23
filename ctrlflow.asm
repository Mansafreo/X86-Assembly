; A simple file to demonstrate control flow using jump instruction

section .data
    num db 7 ; The number to compare with 
    prompt db "Enter a number",0xa
    prmptlen equ $- prompt
    ;Declare some messages to print
    str1 db "The number is less",0xa
    str1len equ $- str1
    str2 db "The number is the same" ,0xa
    str2len equ $- str2
    str3 db "The number is greater",0xa
    str3len equ $- str3

section .bss
    ;Reserve a byte to store user input
    input resb 1 

section .start
    global _start
_start:
    ;Ask the user to enter the data
    mov ecx,prompt
    mov edx,prmptlen
    mov eax,4
    mov ebx,1
    int 80h
    ;Store the user input
    mov ecx,input
    mov edx,1
    mov ebx,0
    mov eax,3
    int 80h
    ;To perform the comparison
    ;convert the input to ascii
    mov al,[input]
    sub al, byte '0'
    cmp al,[num]
    jl less
    je equal
    jg greater

less:
    ;To output if the number is less
    mov eax,4
    mov edx,str1len
    mov ecx,str1
    mov ebx,1
    int 80h
    jmp end

equal:
    ;To output if the number is the same
    mov eax,4
    mov edx,str2len
    mov ecx,str2
    mov ebx,1
    int 80h
    jmp end

greater:
    ;To output if the number is greater
    mov eax,4
    mov edx,str3len
    mov ecx,str3
    mov ebx,1
    int 80h
    jmp end

end:
    mov eax,1
    int 80h
    

