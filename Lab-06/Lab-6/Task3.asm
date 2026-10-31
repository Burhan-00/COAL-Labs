org 0x0100
jmp start

flags db 5Ah
res_or db 0
res_and db 0
res_xor db 0
res_not db 0
res_t4 db 0
res_t5 db 0

start:
mov al, [flags]
or al, 81h
mov [res_or], al

mov al, [flags]
and al, 0F5h
mov [res_and], al

mov al, [flags]
xor al, 44h
mov [res_xor], al

mov al, [flags]
not al
mov [res_not], al

mov al, [flags]
test al, 10h
jz zero4
mov byte [res_t4], 1
jmp next

zero4:
mov byte [res_t4], 0

next:
mov al, [flags]
test al, 20h
jz zero5
mov byte [res_t5], 1
jmp swap

zero5:
mov byte [res_t5], 0

swap:
mov al, 3Ch
mov bl, 0C3h
xor al, bl
xor bl, al
xor al, bl

mov ax, 4C00h
int 21h