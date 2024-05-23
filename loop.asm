; An assembly file to loop 5 times while outputing a value
section .data
    mess db "Loop",0xa
    mlen equ $- mess

section .text
    global _start
    _start:
    
    mov ecx, 5

    output:
        mov edi, ecx ; store cx for later
        mov ecx, mess
        mov edx, mlen
        mov eax, 4
        mov ebx, 1
        int 80h
        mov ecx,edi
        loop output ; call the loop and decrement ecx
    
    mov eax,1
    xor ebx,ebx
    int 80h
