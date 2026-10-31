org 0x0100
jmp start
temp dw 22,-5,31,0,14,-12,35,8

freezing dw 0
cold dw 0
moderate dw 0
hot dw 0
highest dw 0
lowest dw 0

start:

mov bx,temp
mov cx,8

mov ax,[bx]
mov [highest],ax
mov [lowest],ax

next:

mov ax,[bx]

cmp ax,0
jl freezingcase

cmp ax,15
jl coldcase

cmp ax,30
jl moderatecase

inc word [hot]
jmp check

freezingcase:
inc word [freezing]
jmp check

coldcase:
inc word [cold]
jmp check

moderatecase:
inc word [moderate]

check:

cmp ax,[highest]
jg newhigh

jmp checklow

newhigh:
mov [highest],ax

checklow:

cmp ax,[lowest]
jl newlow

jmp nextnumber

newlow:
mov [lowest],ax

nextnumber:

add bx,2
sub cx,1
jnz next

mov ax,0x4C00
int 0x21