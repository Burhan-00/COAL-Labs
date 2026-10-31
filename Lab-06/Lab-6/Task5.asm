org 0x0100
jmp start

fact dw 1, 0
count dw 0

start:
mov cx, 2

again:
mov ax, [fact]
mul cx
mov [fact], ax
mov [fact+2], dx
inc cx
cmp cx, 12
jbe again

mov ax, [fact]
mov dx, [fact+2]
mov cx, 32

bits
shr dx, 1
rcr ax, 1
jnc next
inc word [count]

next:
dec cx
jnz bits

mov ax, 4C00h
int 21h