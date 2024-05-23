; Assembly  code to ask a user what element they want to be outputed

section .data
 numArray db 5,8,7,9 ; an array with 4 elements
 eol db 0xa ;end-of-line character
 string db "Enter an index for the array",0xa ; eol terminated string
 strlen equ $- string

section .bss
    index resb 1 ; a byte to store the user input
    mynum resb 1 ; byte to store the number we want to output

section .text
    global _start
    _start:
    ; Ask user to enter a number
    mov ecx, string
    mov edx, strlen
    mov eax,4
    mov ebx,1
    int 0x80
    ; Read user input
    mov eax,3
    mov ebx,0
    mov ecx,index
    mov edx,1
    int 0x80
    ; To select the number that the user wants
    ;convert input to number from ascii
    sub [index],byte '0'
    ; put base address of the array into esi
    mov esi, numArray
    add esi,[index] ; adding the input to the address that we want 
    mov al, [esi] ; get the value at the address
    mov [mynum], al
    add [mynum], byte '0' ; convert to ascii
    ;To output it to the console
    mov eax,4
    mov ebx,1
    mov ecx, mynum
    mov edx,1
    int 0x80
    ; output end of line
    mov ecx, eol
    mov edx, 1
    mov eax,4
    mov ebx,1
    int 0x80
    ;exit the program
    mov eax,1
    xor ebx,ebx
    int 0x80
