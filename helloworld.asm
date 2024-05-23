; The classic beginning

section .data ; to define our variables
    message db 'Hello world!', 0xa ; Null-terminated string
    len equ $- message ; Get the length of the string

section .text ; where our functions are 
    global _start ; declare the entry label
    _start: ; call entry label
    mov ecx, message ; put address of message in ecx
    mov edx, len ; move length of message to edx

    mov eax, 4 ; system call for "write"
    mov ebx, 1 ; file descriptor
    int 0x80 ; call kernel

    ; exit the program
    mov eax, 1
    xor ebx,ebx
    int 0x80
   