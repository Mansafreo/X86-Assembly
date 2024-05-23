; using what has been learnt sofar
; Ask User to enter two numbers
; Add those two numbers
; Output the sum

section .bss
    num1 resb 1 ; reserve 1 byte for the first number
    num2 resb 1; reserve 1 byte for the second number
    sum resb 1 ; reseve 1 byte for the sum of the numbers

section .data
    ask db "Enter Num1",0xa ; ask user to enter first number 
    asklen equ $- ask  ; length of first string
    ask2 db "Enter Num2",0xa ; ask user to enter second number
    ask2len equ $- ask2 ; length of second string
    output db 'The sum is :',0xa ; sum
    outlen equ $- output
    eol db 0xa ; end of line character

section .text
    global _start
    _start:
    ;To ask the user for num1
    mov ecx, ask 
    mov edx, asklen
    mov eax,4
    mov ebx,1
    int 0x80
    ;Take user input and store it
    mov eax,3
    mov edx,2
    mov ecx,num1
    mov ebx,0
    int 0x80
    ; Now ask for the second number
    mov ecx, ask2 
    mov edx, ask2len
    mov eax,4
    mov ebx,1
    int 0x80

    ; To store num2
    mov eax,3
    mov edx,2
    mov ecx,num2
    mov ebx,0
    int 0x80
    ; Add the two numbers
    mov al,[num1]
    sub al,'0' ;convert back to number from ascii
    add al,[num2]
    sub al,'0' ; convert back to number
    mov [sum],al
    add [sum],byte '0' ; convert to ascii from number
    ;Output the sum message
    mov ecx, output 
    mov edx, outlen
    mov eax,4
    mov ebx,1
    int 0x80
    ; to output the sum
    mov eax,4
    mov ebx,1
    mov ecx,sum
    mov edx,1
    int 0x80
    ; to output end of line
    mov eax,4
    mov ebx,1
    mov ecx,eol
    mov edx,1
    int 0x80
    ; to exit
    mov eax,1
    xor ebx,ebx
    int 0x80