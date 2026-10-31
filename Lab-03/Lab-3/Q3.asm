[org 0x0100]

mov bx , 0400h         ;BX = 0400h (an address, not data yet)
mov [bx],42            ;store 42 at the address BX points to (0400h)
mov ax,[bx]            ; read the byte back from address 0400h into Ax



mov ax,0x4c00
int 21h