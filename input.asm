; This file is to demonstrate user input storage and use

section .bss ; to reserve a buffer where we will store the user input
    buffer resb 100 ; reserve 100 bytes

section .data
    bufferSize db 100 ; store ths size of the buffer in here
    placeholder db 'You have entered: ',0xa
    len equ $- placeholder

section .text
  global _start
  _start:

  ;To call the system input
  mov eax, 3 ; system call for system input
  mov ebx ,0 ; file descriptor for stdin
  mov ecx, buffer ; move address of message/input to ecx
  mov edx, bufferSize ; size of input
  int 0x80 ; call kernel

   ; to output the message that the person has entered
  mov eax,4 ; sys write
  mov ebx, 1; stdout
  mov ecx, placeholder ; message to output
  mov edx, len ; size of message to output
  int 0x80 ; call kernel

 ; to output the message that the person has entered
  mov eax,4 ; sys write
  mov ebx, 1; stdout
  mov ecx, buffer ; message to output
  mov edx, bufferSize ; size of message to output
  int 0x80 ; call kernel

  ;exit the program
  mov eax, 1 ; sys exit
  xor ebx,ebx 
  int 0x80

