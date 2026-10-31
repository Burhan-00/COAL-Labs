org 100h

mov [sp_in], sp
mov dx, 0BEEFh

mov si, 0
mov di, 0
mov cx, 6

L1:
    mov al, [nums+si]
    mov ah, 0
    call square
    mov [squares+di], ax
    inc si
    add di, 2
    loop L1

mov [dx_after], dx
mov [sp_out], sp

mov ax, 4C00h
int 21h

square:
    push bx
    mul al
    pop bx
    ret

nums db 3, 5, 7, 10, 12, 15
squares dw 0, 0, 0, 0, 0, 0
sp_in dw 0
sp_out dw 0
dx_after dw 0