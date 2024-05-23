; A file with two functions
; Ask user for input and store it
; Double input if it's less than 5, otherwise tell the user that the number is too large
; Output the input

section .data
    prompt db "Please enter a number",0xa
    prlen equ $- prompt

section .bss
    input resb 1

section .start 
    global _start
    _start:
    call double
    jmp exit

    double:
        mov ecx,prompt
        mov edx, prlen
        call print
        call getInput
        ret
    
    getInput:
        mov ecx, input
        mov edx, 1
        mov eax,3
        mov ebx,0
        int 80h
        call calc
        ret

    calc:
        sub [input], byte '0'
        mov al,[input]
        add al,al
        mov [input],al
        add [input], byte '0'
        mov ecx,input
        mov edx,1
        call print
        ret

    print:
        mov eax,4
        mov ebx,1
        int 80h
        ret

    exit:
        mov eax,1
        xor ebx,ebx
        int 80h