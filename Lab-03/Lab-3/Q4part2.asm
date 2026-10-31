[org 0x0100]

mov bx, 0600h            ; load the address into BX
mov word  [bx], 99    ; store 99 at the address BX points to
mov ax, [bx]              ; read it back into AX



mov ax,0x4c00
int 21h