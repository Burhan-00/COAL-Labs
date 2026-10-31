org 0x0100

mov al, 125
cmp al, -126

ja unsigned
jg signed

unsigned:
mov bl, 1
jmp done

signed:
mov bl, 2

done:
mov ax, 0x4C00
int 21h