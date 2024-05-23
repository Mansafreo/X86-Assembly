; An assembly file to work on the array data structure

section .data
 nums db 1,2,3,4,5,6 ; declare an array of 6 numbers
 eol db 0xa ; end-of-line character

section .bss 
    mynum resb 1 ; reserve one byte for the variable

section .text
    global _start
    _start:
    ; Let's try to output the first element of the array
    add [nums+2],byte '0' ; convert to ascii
    mov ecx, nums+2
    mov edx, 1
    mov eax,4
    mov ebx,1
    int 0x80
    ; Output the end-of-line character
    mov eax, 4
    mov ebx,1
    mov ecx, eol
    mov edx,1
    int 0x80
    ; To exit the program
    mov eax, 1
    xor ebx,ebx
    int 0x80
