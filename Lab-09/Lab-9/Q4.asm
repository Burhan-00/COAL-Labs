org 100h
jmp start

bitmap dw 0
booked_count dw 0
rejected dw 0

requests dw 1,3, 1,7, 1,3, 1,12, 2,7, 2,9, 1,15

make_mask:
    push cx
    mov cx, ax
    mov ax, 1
    shl ax, cl
    pop cx
    ret

is_booked:
    push bp
    mov bp, sp
    push bx

    mov ax, [bp+4]
    call make_mask

    mov bx, [bitmap]
    test bx, ax
    jz not_booked

    stc
    pop bx
    pop bp
    ret 2

not_booked:
    clc
    pop bx
    pop bp
    ret 2

book_seat:
    push bp
    mov bp, sp
    push bx

    mov ax, [bp+4]
    push ax
    call is_booked
    jc book_reject

    mov ax, [bp+4]
    call make_mask
    or [bitmap], ax
    inc word [booked_count]

    clc
    pop bx
    pop bp
    ret 2

book_reject:
    stc
    pop bx
    pop bp
    ret 2

cancel_seat:
    push bp
    mov bp, sp
    push bx

    mov ax, [bp+4]
    push ax
    call is_booked
    jnc cancel_reject

    mov ax, [bp+4]
    call make_mask
    not ax
    and [bitmap], ax
    dec word [booked_count]

    clc
    pop bx
    pop bp
    ret 2

cancel_reject:
    stc
    pop bx
    pop bp
    ret 2

start:
    mov si, requests
    mov cx, 7

request_loop:
    mov ax, [si]
    cmp ax, 1
    je do_book

    push word [si+2]
    call cancel_seat
    jmp check_result

do_book:
    push word [si+2]
    call book_seat

check_result:
    jnc request_done
    inc word [rejected]

request_done:
    add si, 4
    loop request_loop

    mov ax, 4C00h
    int 21h