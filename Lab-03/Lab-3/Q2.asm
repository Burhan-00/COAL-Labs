[org 0x0100]

mov word [0300h],25
mov ax ,[0300h]
add ax,15
mov [0300h],ax


mov ax,0x4c00
int 21h