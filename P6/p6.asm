%include "../LIB/pc_iox.inc"

section .text
    global _start

_start:
;----------------- Inciso A -----------------
    mov eax, 0x22446688    
    ror eax, 4              ; Rotación a la derecha por 4 bits
    call pHex_dw           ; Mostrar el valor resultante
    mov al, 0x0A
    call putchar

;----------------- Inciso B -----------------
    mov cx, 0x3F48
    shl cx, 3              ; Desplazar CX a la izquierda por 3 bits (multiplicar por 8)
    movzx eax, cx
    call pHex_w            ; Mostrar el valor resultante
    mov al, 0x0A
    call putchar

;----------------- Inciso C -----------------
    mov esi, 0x20D685F3
    xor esi, 0x40042021      ; Invertir bits 0, 5, 13, 18, 30
    mov eax, esi
    call pHex_dw
    mov al, 0x0A
    call putchar

;----------------- Inciso D -----------------
    push esi                 ; Guardar ESI en la pila

;----------------- Inciso E -----------------
    mov ch, 0xA7             
    or ch, 0b01001000        ; Activar bits 3 y 6
    movzx eax, ch
    call pHex_b
    mov al, 0x0A
    call putchar

;----------------- Inciso F -----------------
    mov bp, 0x67DA
    and bp, 0b1011101110111010 ; Desactivar bits 1,4,6,10,14
    movzx eax, bp
    call pHex_w
    mov al, 0x0A
    call putchar

;----------------- Inciso G -----------------
    shr bp, 3              ; Dividir BP entre 8
    call pHex_w            ; Mostrar el resultado
    mov al, 0x0A
    call putchar

;----------------- Inciso H -----------------
    mov ebx, 0x000000FF    
    shr ebx, 5             ; Dividir EBX entre 32
    call pHex_dw           ; Mostrar el resultado
    mov al, 0x0A
    call putchar

;----------------- Inciso I -----------------
    mov cx, 0x3F48         ; Volver a cargar el valor en CX
    shl cx, 3              ; Multiplicar CX por 8 (desplazar 3 bits a la izquierda)
    call pHex_w            ; Mostrar el resultado
    mov al, 0x0A
    call putchar

;----------------- Inciso J -----------------
    pop esi                ; Sacar el valor de la pila y guardarlo en ESI
    call pHex_dw           ; Mostrar el valor de ESI
    mov al, 0x0A
    call putchar

;----------------- Inciso K -----------------
    mov eax, esi           ; Cargar el valor de ESI en EAX
    shl eax, 3             ; Multiplicar por 8
    add eax, esi           ; Sumar el valor original para completar la multiplicación por 10
    call pHex_dw           ; Mostrar el resultado
    mov al, 0x0A
    call putchar

;----------------- Final -----------------
    mov eax, 1             ; Llamada al sistema para salir
    int 0x80               ; Finalizar el programa
