; Ask user for input then output using a macro

%macro print 2
    ; Preserve th registers
    push ebx
    push eax
    push edx
    push ecx
    ; Print the values
    mov ecx, %1
    mov edx, %2
    mov eax,4
    mov ebx,1
    int 80h
    ; return the registers
    pop ecx
    pop eax
    pop ebx
    pop edx
%endmacro

;Macro to read input
%macro readNum 2
    ; Preserve th registers
    push ebx
    push eax
    push edx
    push ecx
    ;Read the number of 
    mov ecx, %1
    mov edx, %2
    mov eax,3
    mov ebx,0
    int 80h
    ; return the registers
    pop ecx
    pop eax
    pop ebx
    pop edx
%endmacro

%macro double 1
    push eax
    mov al,[num]
    add al,al
    mov [num],al
    pop eax
%endmacro

section .data
    prompt db "Enter a number",0xa ; newline terminates string
    prlen equ $- prompt
    eol db 0xa

section .bss
    num resb 1

section .text
    global _start
    _start:
    ;Print the value for 
    print prompt,prlen
    readNum num,1
    ;Convert number to ascii
    sub [num],byte '0'
    ;double it
    double num
    ;convert to ascii
    add [num],byte '0'
    ;print it
    print num,1
    print eol,1

exit:
    mov eax,1
    xor ebx,ebx
    int 80h
   