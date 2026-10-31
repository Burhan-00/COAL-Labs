[org 0x0100]

mov word [0600h],99
mov ax,[0600h]

mov ax,0x4c00
int 21h