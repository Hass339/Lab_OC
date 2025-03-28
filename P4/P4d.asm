%include "../LIB/pc_io.inc"   ; Incluir declaraciones de procedimiento externos

section .text
    global _start       ; referencia para inicio de programa
    
_start:
    lea esi, [msg]      ; Cargar la dirección de msg en esi
    mov byte [esi+25], 'Z'  ; Reemplazar 'z' por 'Z' (posición 25)

    mov edx, msg        ; edx = dirección de la cadena msg
    call puts           ; imprime cadena msg terminada en valor nulo (0)

    mov eax, 1          ; seleccionar llamada al sistema para fin de programa
    int 0x80            ; llamada al sistema - fin de programa

section .data
msg db  'abcdefghijklmnopqrstuvwxyz0123456789', 0xa, 0  ; Cadena original
