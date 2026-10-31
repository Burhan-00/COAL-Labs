org 0x0100
jmp start

dates dw 5B4Bh, 2E67h, 279Fh
days dw 0, 0, 0
months dw 0, 0, 0
years dw 0, 0, 0
quarter dw 0
earliest dw 0
record dw 0

start:
mov si, dates
mov di, days
mov bx, months
mov bp, years
mov cx, 3

again:
mov ax, [si]

mov dx, ax
and dx, 1Fh
mov [di], dx

mov dx, ax
shr dx, 5
and dx, 0Fh
mov [bx], dx

shr ax, 9
add ax, 1980
mov [bp], ax

mov dx, [bx]
cmp dx, 10
jb next
inc word [quarter]

next:
add si, 2
add di, 2
add bx, 2
add bp, 2
dec cx
jnz again

mov ax, [years]
mov dx, [years+2]
cmp dx, ax
jb second
mov ax, dx
mov word [record], 2

second:
mov dx, [years+4]
cmp dx, ax
jb third
jmp done

third:
mov ax, dx
mov word [record], 3

done:
mov [earliest], ax
mov ax, 4C00h
int 21h