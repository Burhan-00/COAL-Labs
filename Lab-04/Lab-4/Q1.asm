[org 0x0100]

mov ax, 0
jmp start

add ax, 1
add ax, 2

start:
add ax, 3
add ax, 4

mov ax, 0x4C00
int 21h