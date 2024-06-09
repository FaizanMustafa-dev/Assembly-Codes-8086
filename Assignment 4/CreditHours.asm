.model small
.stack 100h
.data 
msg1 db "Taken credit hours : $"
msg2 db 10,13,"Required credit hours : $"  
result dw 1
.code
mov ax,@data
mov ds,ax  
lea dx,msg1
mov ah,09h
int 21h  
mov ah,1h
int 21h 
   
mov ah,0
sub al,48
mov bx,100 
mov ah,0
mul bx

mov cx,ax 
MOV BX,0
MOV AX,0

mov ah,1h
int 21h 
mov ah,0
sub al,48
mov bx,10 
mov ah,0
mul bx 
mov bx,AX
add cx,bx




mov ah,1h
int 21h  
mov ah,0
sub al,48

add cx,ax
push cx
 
lea dx,msg2
mov ah,09h
int 21h  
mov ah,1h
int 21h 
   
mov ah,0
sub al,48
mov bx,100 
mov ah,0
mul bx

mov cx,ax 
MOV BX,0
MOV AX,0

mov ah,1h
int 21h 
mov ah,0
sub al,48
mov bx,10 
mov ah,0
mul bx 
mov bx,AX
add cx,bx




mov ah,1h
int 21h  
mov ah,0
sub al,48

add cx,ax  

pop bx
sub cx,bx
 