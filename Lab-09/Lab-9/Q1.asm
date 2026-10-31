org 100h
jmp start

nums dw 1, 6, 64, 100, 1024, 0, 4096, 96
pow_count dw 0
exp_sum dw 0

is_pow2:
    mov bx, ax
    and bx, bx
    jz not_power
    dec bx
    and bx, ax
    jnz not_power
    stc
    ret

not_power:
    clc
    ret

bitpos:
    mov cx, ax
    mov bx, 0

check_bit:
    cmp cx, 1
    je position_found
    shr cx, 1
    inc bx
    jmp check_bit

position_found:
    mov ax, bx
    ret

classify:
    call is_pow2
    jc is_power
    clc
    ret

is_power:
    call bitpos
    stc
    ret

start:
    mov si, nums
    mov di, 8

next_num:
    mov ax, [si]
    call classify
    jc power_found
    jmp next_item

power_found:
    inc word [pow_count]
    add [exp_sum], ax

next_item:
    add si, 2
    dec di
    jnz next_num

    mov ax, 4C00h
    int 21h