
org 0x0100
jmp start

big  dw 0x86A0, 0x0001
prod dw 0, 0

start:
mov bx, 25

mov ax, [big]
mul bx
mov [prod], ax
mov cx, dx

mov ax, [big+2]
mul bx
add ax, cx
mov [prod+2], ax

mov ax, 0x4C00
int 0x21
