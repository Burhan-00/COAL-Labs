org 100h

mov [sp_in], sp

mov si, codes
mov di, reversed
mov bx, flags
mov cx, 4

next_code:
    push cx
    push si
    push di
    push bx

    call reverse5

    pop bx
    pop di
    pop si
    pop cx

    add si, 5
    add di, 5
    inc bx
    loop next_code

mov [sp_out], sp

mov ax, 4C00h
int 21h

reverse5:
    push ax
    push cx
    push si
    push di

    mov cx, 5

push_chars:
    mov al, [si]
    xor ah, ah
    push ax
    inc si
    loop push_chars

    mov cx, 5

pop_chars:
    pop ax
    mov [di], al
    inc di
    loop pop_chars

    pop di
    pop si
    pop cx
    pop ax
    ret

codes db 'RADAR', 'HELLO', 'LEVEL', 'STACK'
reversed db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
flags db 0,0,0,0
sp_in dw 0
sp_out dw 0