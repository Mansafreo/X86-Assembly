; a file to use comparison operators in an array
; It prints all values and loops until it encounters a 3

section .data
  nums db 1,5,6,3,8,9,5 ; declare an array
  numlen equ $- nums ; length of the array
  eol db 0xa

section .bss
    num resb 1 ; reserve one byte to print the value 
    ;This is useful because we can avoid resgister size mismatches

section .text
    global _start
    _start:
    ; Put the length of the array in ecx
    mov ecx, numlen
    ;put the base address of the array in edi
    mov edi, nums

    ;To initialize the loop
    printArray:
    ;preserve ecx in esi
    mov esi, ecx
    ; Print out the current address in edi
    mov al,[edi] ; Move value to al
    add al, byte '0' ; convert to ascii
    mov [num],al
    mov ecx, num; move address to ecx
    mov edx,1
    mov ebx, 1
    mov eax,4
    int 80h
    ; Increment edi
    inc edi
    ; Return ecx
    mov ecx, esi
    ;Compare the value of what was just printed and see if it was equal to 3
    cmp [edi-1],byte 3
    loopne printArray ; call loop
    ;Print eol
    mov ecx, eol ;end-of-line
    mov edx,1
    mov ebx,1
    mov eax,4
    int 80h

    mov eax,1 ; system_exit
    xor ebx, ebx ; clear out ebx
    int 80h
