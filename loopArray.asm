; A file to loop through a predefined array

section .data
    nums db 1,2,3,4,5
    arlen db 5

section .bss
    mynum resb 1;
    eol resb 1

section .text
    global _start
    _start:

    ;move the length of the array into ecx
    mov ecx, [arlen] 
    mov edi, nums ; Move the beginning address of the array into esi

    outputLoop:
    ;Temprarily store ecx
    mov esi,ecx
    ; To output the value
    mov al, [edi] ; get the value at the address
    add al, byte '0' ;convert to ascii
    mov [mynum],al
    ;To output it to the console
    mov eax,4
    mov ebx,1
    mov ecx, mynum; point ecx to the current array element
    mov edx,1
    int 0x80
    mov ecx,esi
    inc edi
    loop outputLoop ; call the loop


    ; ;output end of line
    mov [eol],byte 0xa
    mov eax,4
    mov ebx,1
    mov ecx, eol
    mov edx,1
    int 80h

    mov eax,1
    xor ebx,ebx
    int 80h
    