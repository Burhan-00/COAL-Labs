org 100h

start:
    mov [stack_before], sp

    mov bx, 3
    mov cx, 4
    call sumsq
    mov [first_result], ax

    mov bx, 5
    mov cx, 12
    call sumsq
    mov [second_result], ax

    mov [bx_after], bx
    mov [cx_after], cx
    mov [stack_after], sp

    mov ax, 4C00h
    int 21h

square:
    mov [stack_deep], sp
    mul ax
    ret

sumsq:
    push bx
    push cx

    mov ax, bx
    call square
    mov [temp_square], ax

    mov ax, cx
    call square
    add ax, [temp_square]

    pop cx
    pop bx
    ret

first_result dw 0
second_result dw 0
bx_after dw 0
cx_after dw 0
stack_before dw 0
stack_after dw 0
stack_deep dw 0
temp_square dw 0