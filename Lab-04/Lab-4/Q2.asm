[org 0x0100]

mov ax, 5
mov bx, 8

cmp ax, bx
je equal

mov cx, 0
jmp done

equal:
mov cx, 1
jmp done

done:
mov ax, 0x4C00
int 21h