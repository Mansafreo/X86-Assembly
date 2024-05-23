section .data
    mystr db "String",0xa
    strlen equ $- mystr

section .bss
    position resb 2 ; reserve 2 bytes for the user input (1 for the number and 1 for the newline character)
    char resb 2 ; reserve 2 bytes for the character to replace with (1 for the character and 1 for the newline character)

section .text
    global _start
    _start:
    ; Get the input from the user
    mov ecx, position
    mov ebx, 0
    mov edx, 2
    mov eax, 3
    int 80h

    ; Get the character to replace it with
    mov ecx, char
    mov ebx, 0
    mov edx, 2
    mov eax, 3
    int 80h

    ; Convert input to num
    sub byte [position], '0'
    movzx eax, byte [position] ; zero extend the byte to a dword
    lea esi, [mystr + eax] ; calculate the address of the character to replace

    ; Replace the character
    mov al, byte [char]
    mov [esi], al

    ; Output the changed string
    mov ecx, mystr
    mov edx, strlen
    mov ebx, 1
    mov eax, 4
    int 80h

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 80h
