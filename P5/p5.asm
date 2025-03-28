%include "../LIB/pc_iox.inc"  

section .text
    global _start

_start:

    mov ebx, 0x5C4B2A60

    add ebx, 0x02210800

    mov eax, ebx           ; Colocar el valor de EBX en EAX para mostrarlo
    call pHex_dw           

    mov al, 0x0A           ; Cambio de linea HEX
    call putchar           ; Llamar a putchar para imprimir el salto de línea

    mov eax, 1             ; system call number (sys_exit)
    int 0x80               ; Fin de programa
