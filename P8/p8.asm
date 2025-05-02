%define N 5               

section .data
    msg db "Ingresa un numero (0-9): ", 0
    msg_len equ $ - msg
    espacio db ' '

section .bss
    buffer resb 2
    vector resb 10        

section .text
    global _start

_start:

    mov ecx, N 
    lea edi, [vector]
    call leer_vector

    mov ecx, N
    lea edi, [vector]
    call mostrar_vector

    ; Salida
    mov eax, 1
    xor ebx, ebx
    int 0x80

; --- Procedimiento para leer el vector ---

leer_vector:
    xor esi, esi
.leer_lazo:
    cmp esi, ecx
    jge .fin_leer

    ; Mostrar mensaje
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; Leer carácter

    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 2
    int 0x80

    ; Convertir de ASCII a número

    mov al, [buffer]
    sub al, '0'
    cmp al, 9
    ja .leer_lazo           ; si no es 0-9, repetir

    ; Guardar

    mov [edi + esi], al