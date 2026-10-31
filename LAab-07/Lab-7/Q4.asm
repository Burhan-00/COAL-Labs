org 100h

mov [stackstart], sp

mov si, 0
mov di, 0
mov cx, 5
mov word [totalfine], 0
mov word [capcount], 0

L1:
    mov ax, [lateDays+si]
    push ax
    mov ax, 20
    push ax

    call finecalc

    mov [fines+di], ax
    add [totalfine], ax

    cmp ax, 500
    jne next
    inc word [capcount]

next:
    add si, 2
    add di, 2
    loop L1

mov [stackend], sp

mov ax, 4C00h
int 21h

finecalc:
    push bp
    mov bp, sp
    push bx
    push dx

    mov ax, [bp+6]
    mov bx, [bp+4]
    mul bx

    cmp ax, 500
    jbe done
    mov ax, 500

done:
    pop dx
    pop bx
    pop bp
    ret 4

lateDays dw 3, 0, 12, 30, 7
fines dw 0, 0, 0, 0, 0
totalfine dw 0
capcount dw 0
stackstart dw 0
stackend dw 0