org 100h
jmp start

num1 dw 1170h, 0001h
num2 dw 0FBD0h, 0001h
num3 dw 0D090h, 0003h

total_lo dw 0
total_hi dw 0

limit_lo dw 1A80h
limit_hi dw 0006h

over db 0

half_lo dw 0
half_hi dw 0

add32:
    push bp
    mov bp, sp

    mov ax, [bp+10]
    add ax, [bp+6]

    mov dx, [bp+8]
    adc dx, [bp+4]

    pop bp
    ret 8

start:
    push word [total_lo]
    push word [total_hi]
    push word [num1]
    push word [num1+2]
    call add32

    mov [total_lo], ax
    mov [total_hi], dx

    push word [total_lo]
    push word [total_hi]
    push word [num2]
    push word [num2+2]
    call add32

    mov [total_lo], ax
    mov [total_hi], dx

    push word [total_lo]
    push word [total_hi]
    push word [num3]
    push word [num3+2]
    call add32

    mov [total_lo], ax
    mov [total_hi], dx

    mov byte [over], 0

    mov ax, [total_hi]
    cmp ax, [limit_hi]
    ja set_over
    jb divide_total

    mov ax, [total_lo]
    cmp ax, [limit_lo]
    ja set_over
    jmp divide_total

set_over:
    mov byte [over], 1

divide_total:
    mov ax, [total_lo]
    mov dx, [total_hi]

    shr dx, 1
    rcr ax, 1

    mov [half_lo], ax
    mov [half_hi], dx

    mov ax, 4C00h
    int 21h