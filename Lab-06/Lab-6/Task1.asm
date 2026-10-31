org 0x0100
jmp start

num dw 0x91E4, 0x2B6D
left4 dw 0, 0
right3 dw 0, 0

start:
mov ax, [num]
mov dx, [num+2]
mov cx, 4

L1:
shl ax, 1
rcl dx, 1
dec cx
jnz L1

mov [left4], ax
mov [left4+2], dx

mov ax, [num]
mov dx, [num+2]
mov cx, 3

L2:
shr dx, 1
rcr ax, 1
dec cx
jnz L2

mov [right3], ax
mov [right3+2], dx

mov ax, 0x4C00
int 0x21