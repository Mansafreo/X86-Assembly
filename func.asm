; Function to print user input onto the terminal

section .data
    mess db "Please enter some text", 0xa
    mlen equ $- mess

section .bss 
    input resb 4

section .text
    global _start
    _start:
    mov eax,4
    mov ebx,1
    mov ecx,mess
    mov edx,mlen
    int 80h

    mov eax,3
    mov ebx,0
    mov ecx,input
    mov edx,4
    int 80h

    call echo
    jmp exit

    echo:
        mov ebp,esp ;preserve the stack pointer
        mov eax,4
        mov ebx,1
        mov ecx,input
        mov edx,4
        int 80h
        mov esp,ebp
        ret

    exit:
        mov eax,1
        xor ebx,ebx
        int 80h
