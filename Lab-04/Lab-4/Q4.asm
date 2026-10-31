org 0x0100

start:
    mov bx, numbers      
    mov ax, 0            
    mov cx, 0            

loop1:
    add ax, [bx]         
    add bx, 2            
    add cx, 1            
    cmp cx, 10
    jne loop1

    mov [sum], ax        

    mov ax, 0x4C00
    int 21h

numbers dw 1,2,3,4,5,6,7,8,9,10
sum     dw 0