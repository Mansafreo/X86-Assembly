global main

extern printf

section .data
    message db "Hello, the input is %i ",10,0

section .text

main:
    ;Function prologue
    push ebp
    mov ebp, esp
    
    push dword 125
    push message
    call printf
    add esp, 8 
    mov eax,0
    ;Function epilogue
    mov esp, ebp
    pop ebp
    ret
