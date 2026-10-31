org 100h

start:
    mov [stack_before], sp

    call total_area
    mov [tarea], ax

    mov bx, 25
    mul bx
    mov [cost], ax

    mov [stack_after], sp

    mov ax, 4C00h
    int 21h

area:
    mul bx
    ret

total_area:
    push bx
    push cx
    push si
    push dx

    mov si, rooms
    mov cx, 3
    mov dx, 0

room_loop:
    mov ax, [si]
    mov bx, [si+2]
    call area

    add dx, ax
    add si, 4
    loop room_loop

    mov ax, dx

    pop dx
    pop si
    pop cx
    pop bx
    ret

rooms dw 5, 4, 6, 3, 7, 2
tarea dw 0
cost dw 0
stack_before dw 0
stack_after dw 0