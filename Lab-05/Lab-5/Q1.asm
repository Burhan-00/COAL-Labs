[org 0x0100]
jmp start
numbers: dw 34, 87, 12, 99, 56, 73, 21, 64, 8, 45
smallest: dw 0
count:  dw 0

start:

mov bx,numbers
mov cx,10
mov dx,0FFFFh   ;DX samllest value
mov si,0

next:
mov ax,[bx]
cmp ax,dx
jae notsmall
mov dx,ax

notsmall:
cmp ax,20
jbe notcount

cmp ax,80
jae notcount

inc si

notcount:
add bx,2
sub cx,1
jnz next

mov [smallest],dx
mov [count] ,si

mov ax,0x4c00
int 21h

