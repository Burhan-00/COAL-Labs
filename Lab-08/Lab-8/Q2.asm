org 100h

start:
    mov [stack_before], sp

    mov bx, numbers
    mov cx, 4
    call sumsqarr

    mov [total], ax
    mov [bx_after], bx
    mov [cx_after], cx
    mov [stack_after], sp

    mov ax, 4C00h
    int 21h

square:
    mov [stack_deep], sp
    mul ax
    ret

sumsqarr:
    push bx
    push cx
    push dx
    push si

    mov si, bx
    mov dx, 0
    mov bx, 0

sum_loop:
    cmp cx, 0
    je sum_done

    mov ax, [si]
    call square
    add dx, ax

    add si, 2
    dec cx
    jmp sum_loop

sum_done:
    mov ax, dx

    pop si
    pop dx
    pop cx
    pop bx
    ret

numbers dw 2, 3, 4, 5
total dw 0
bx_after dw 0
cx_after dw 0
stack_before dw 0
stack_after dw 0
stack_deep dw 0