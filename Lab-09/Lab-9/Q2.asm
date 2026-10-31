org 100h
jmp start

arr dw 9, -3, 14, 0, -8, 5, 22, -1
swaps dw 0

swap_if_greater:
    push ax
    push bx

    mov ax, [bx]
    cmp ax, [bx+2]
    jg swap

    clc
    pop bx
    pop ax
    ret

swap:
    push word [bx]
    push word [bx+2]
    pop word [bx]
    pop word [bx+2]

    stc
    pop bx
    pop ax
    ret

start:
    mov cx, 7

pass_loop:
    mov bx, arr
    mov dx, 7

compare_loop:
    call swap_if_greater
    jnc no_swap
    inc word [swaps]

no_swap:
    add bx, 2
    dec dx
    jnz compare_loop

    loop pass_loop

    mov ax, 4C00h
    int 21h