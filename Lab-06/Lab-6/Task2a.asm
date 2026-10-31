 org 0x0100
jmp start

a   dw 0xFFFF, 0xFFFF, 0x1234, 0x0000
b   dw 0x0001, 0x0000, 0x0001, 0x0000
sum dw 0, 0, 0, 0

start:
mov ax, [a]
add ax, [b]
mov [sum], ax

mov ax, [a+2]
adc ax, [b+2]
mov [sum+2], ax

mov ax, [a+4]
adc ax, [b+4]
mov [sum+4], ax

mov ax, [a+6]
adc ax, [b+6]
mov [sum+6], ax

mov ax, 0x4C00
int 0x21