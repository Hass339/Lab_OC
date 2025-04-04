%include "../LIB/pc_iox.inc"

section .data
    N dw 0

section .text
    global _start

_start:
    mov ebx, 0x5C4B2A60
    add ebx, 0x02210800
    mov eax, ebx
    call pHex_dw
    mov al, 0x0A
    call putchar

    mov ax, bx
    push ax
    mov eax, ebx
    call pHex_dw
    mov al, 0x0A
    call putchar

    mov bl, 0x12
    shl bl, 3
    movzx ax, bl
    mov [N], ax
    mov eax, [N]
    call pHex_dw
    mov al, 0x0A
    call putchar

    mov ax, [N]
    inc ax
    mov [N], ax
    mov eax, [N]
    call pHex_dw
    mov al, 0x0A
    call putchar

    mov ax, [N]
    mov cx, 0xFF
    xor dx, dx
    div cx
    movzx eax, al
    call pHex_b
    mov al, 0x0A
    call putchar
    movzx eax, ah
    call pHex_b
    mov al, 0x0A
    call putchar

    mov ax, [N]
    movzx bx, ah
    add ax, bx
    mov [N], ax
    dec ax
    mov [N], ax
    mov eax, [N]
    call pHex_dw
    mov al, 0x0A
    call putchar

    pop ax
    movzx eax, al
    call pHex_dw
    mov al, 0x0A
    call putchar

    mov eax, 1
    int 0x80
