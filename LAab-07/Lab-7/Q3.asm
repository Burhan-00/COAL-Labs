org 100h

mov [stackstart], sp

mov si, 0
mov di, 0
mov cx, 3

L1:
    mov ax, [values+si]
    push ax
    mov ax, [values+si+2]
    push ax
    mov ax, [values+si+4]
    push ax

    call findmax

    mov [results+di], ax

    add si, 6
    add di, 2
    loop L1

mov [stackend], sp

mov ax, 4C00h
int 21h

findmax:
    push bp
    mov bp, sp
    push bx
    push dx

    mov ax, [bp+4]
    mov bx, [bp+6]
    mov dx, [bp+8]

    cmp ax, bx
    jae checkc
    mov ax, bx

checkc:
    cmp ax, dx
    jae finish
    mov ax, dx

finish:
    pop dx
    pop bx
    pop bp
    ret 6

values dw 45, 90, 67, 12, 7, 5, 30, 30, 31
results dw 0, 0, 0
stackstart dw 0
stackend dw 0