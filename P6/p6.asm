%include "../LIB/pc_iox.inc"
extern pbin.o

section .text
    global _start

_start:
;----------------INCISO A)--------------
    mov eax, 0x22446688    
    ror eax, 4            

    call pHex_dw          
    mov al, 0x0A         
    call putchar
;----------------INCISO B)--------------
    mov cx, 0x3F48

    sal cx, 4

    movzx eax, cx
    call pHex_w

    mov al, 0x0A
    call putchar
;----------------FIN DEL PROGRAMA--------------
    mov eax, 1            
    int 0x80
