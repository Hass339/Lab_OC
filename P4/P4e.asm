%include "../LIB/pc_io.inc"  

section .text
    global _start      
    
_start:
    lea esi, [msg]     
    mov byte [esi+25], 'Z'  

    mov edx, msg       
    call puts          

    mov eax, 1         
    int 0x80           

section .data
msg db  'abcdefghijklmnopqrstuvwxyz0123456789', 0xa, 0  ; Cadena original
