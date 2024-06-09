.model small
.stack 100h
.data

.code
main proc
    
    mov ax, 4400h
    mov ds, ax

   
    mov si, 0100h
    mov al, [si]

   
    add al, 10h

   
    mov di, 0200h
    mov [di], al

    
    mov ah, 4Ch
    int 21h
main endp
end main
