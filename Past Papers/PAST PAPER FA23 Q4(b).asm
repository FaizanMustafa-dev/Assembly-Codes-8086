.model small
.stack 100h

.data  
msg1 db "After moving array values : $"
array1 db 100 dup(1)  
array2 db 100 dup(?)  

.code
   
    mov ax, @data
    mov ds, ax    
   
    lea si, array1  
    lea di, array2  
 
    mov cx, 100

   
    cld          
    rep movsb    

    lea dx,msg1
    mov ah,09h
    int 21h
    mov si,0  
    mov cx,100   
    
PRINT:   

MOV AL,array2[SI] 
MOV AH,0
INC SI  
MOV DX,AX 
add dx,'0'
MOV AH,2H
INT 21H 
LOOP PRINT


MOV AH,4CH
INT 21H
