; Assembly file to add two numbers

section .data
  num1 db 50 ; the first number
  num2 db 4 ; the second number

section .text
    global _start
    _start:
    ;Add num1 to num2
    ;move the address of num1 to a register
    mov si, [num1]
    mov di, [num2]
    add si, di ; add num1 to num2
    mov [num1],si 
    ; add [num1],byte '0' ; ascii operation
    mov ecx, num1
    mov edx , 1 ; one byte length
    ;To output it
    mov eax,4 ; system output
    mov ebx, 1; sdout
    int 0x80
    ; exit
    mov eax, 1 
    xor ebx, ebx
    int 0x80