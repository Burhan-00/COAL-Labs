[org 0x100h]

mov [sp_start], sp

mov ax, 1111h
mov bx, 2222h
mov cx, 3333h

push ax
push bx
push cx

mov [sp_after], sp

pop dx
mov [rev], dx

pop si
mov [rev+2], si

pop di
mov [rev+4], di

mov [sp_end], sp

push ax
push bx
pop ax
pop bx

mov [swapped], ax
mov [swapped+2], bx

mov ax, 4C00h
int 21h

sp_start dw 0
sp_after dw 0
sp_end dw 0
rev dw 0, 0, 0
swapped dw 0, 0