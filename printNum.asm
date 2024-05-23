section .data
 num_to_print db 400 ; number to display
 buffer db 4 dup(0) ; buffer to store digits (up to 3 digits for 400)

section .text
 global _start
 _start:
 
 ; number to convert is in num_to_print
 mov eax, [num_to_print] ; move number to eax

 ; loop counter (initialize to number of digits expected, adjust if needed)
 mov ecx, 3 ; assuming at most 3 digits for 400

 ; conversion loop
 convert_loop:
  div edx, 10 ; divide eax by 10, remainder in edx (digit)
  add edx, byte '0' ; convert digit to ASCII
  mov [buffer+ecx-1], dl ; store digit in buffer (reverse order)
  loop convert_loop ; loop until ecx becomes 0

 ; print the buffer (implementation omitted for brevity)

 ; exit
 mov eax, 1 
 xor ebx, ebx
 int 0x80
