org 0x0100

jmp start
res_shl db 0
res_shr db 0
res_sar db 0
res_rol db 0
res_ror db 0
res_rc db 0
product dw 0

start:

mov al, 0xC6
shl al, 1
mov [res_shl], al

mov al, 0xC6
shr al, 1
mov [res_shr], al

mov al, 0xC6
sar al, 1
mov [res_sar], al

mov al, 0xC6
rol al, 1
mov [res_rol], al

mov al, 0xC6
ror al, 1
mov [res_ror], al

stc
mov al, 0x35
rcl al, 1
rcr al, 1
mov [res_rc], al

mov ax, 13
mov bx, ax

shl ax, 1
shl ax, 1
shl ax, 1

shl bx, 1
shl bx, 1

add ax, bx
mov [product], ax

mov ax, 0x4C00
int 0x21