; Similar to the array comparison code
; This one asks for the user to enter the value to be compared instead
; It loops until the number that the user enters is encountered

section .data
    message db "Enter the number to search :",0xa
    meslen equ $- message
    nums db 0,5,4,7,8,9,6,5 ;An array of values
    numlen equ $- nums
    eol db 0xa ;end-of-line

section .bss 
    input resb 1 ; a byte to store the value the user has entered
    num resb 1 ; a byte to store the value that is going to be printed

section .text
    global _start
    _start:
    ; Initialize loop variables
    mov ecx, numlen ; Length of the array -> counter
    mov edi, nums ; Start address of the array -> destination index 

    ;Ask the user to enter the number
    mov ecx, message
    mov edx,meslen 
    mov ebx,1 ;stdin
    mov eax, 4; system input
    int 80h

    mov ecx, input
    mov edx, 1 ; It reads only one byte
    mov ebx,0 ;stdin
    mov eax, 3; system input
    int 80h
    ;The value the user has entered is in ascii
    sub [input],byte '0' ; convert from ascii

    ;Declare the loop
    compLoop:
    ;preserve ecx in esi
    mov esi,ecx
    ; To output the value held in edi
    mov al,[edi] ; move value stored in edi address to al
    add al,byte '0' ;convert to ascii
    mov [num],al ; move the value into num
    ;Print out the number
    mov ecx,num
    mov edx,1
    mov eax,4
    mov ebx,1
    int 80h
    ;Increment 
    inc edi
    ;To perform comparison
    xor eax,eax ;clear al
    mov  al, [input]
    cmp [edi-1], byte al ; compare it with the number that has been input
    ;Call the loop when the comparison is not equal
    ;Return ecx
    mov ecx,esi
    loopne  compLoop

    ;Output the end-of-line
    mov ecx,eol
    mov edx,1
    mov ebx,1
    mov eax,4 ; system call for write
    int 80h

    ;Exit the program
    mov eax,1
    xor ebx,ebx
    int 80h
