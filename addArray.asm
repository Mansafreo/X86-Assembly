; code to add the values in an array
section .data 
 array db 1,2,3,2
 arrlen equ $- array

section .bss
    sum resb 1 

section .text
    global _start
    _start:
    ;Initialize loop values
    mov ecx,arrlen
    mov esi,array

    loopSum:
    ; To get the value at the current position in the array
    mov al,[esi]
    mov dh,[sum]
    add dh,al
    mov [sum],dh 
    inc esi
    loop loopSum ; call the loop

    ;output the value of sum
    add [sum], byte '0'
    mov eax,4
    mov ebx,1
    mov ecx,sum
    mov edx,1
    int 80h

    ;exit 
    mov eax,1
    xor ebx,ebx
    int 80h


