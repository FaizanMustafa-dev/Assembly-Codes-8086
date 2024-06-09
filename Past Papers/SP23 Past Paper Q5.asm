.stack 100h
.model small
.data
arr db 1,2,3,4,5,6,7,8,9,10
even db 5 dup(?)
odd db 5 dup(?)
evenCount DB 0            
oddCount  DB 0  
msg1 db 13,10, "Even Values : $" 
msg2 db 13,10, "ODD Values : $"
msg3 db 13,10, "Total Even Numbers : $"
msg4 db 13,10, "Total Odd Numbers : $"     
.code 
main proc
mov ax, @data
mov ds, ax        

lea si, arr        
lea di, even       
lea bx, odd 
mov cx,10      
         
MOV AH,0
Check:
mov al, [si]      
TEST AL, 1      
JNZ IsOdd 
           
IsEven:

          
mov [di],al
inc si
inc di 
inc evenCount 
JMP Next
IsOdd:
mov [bx],al
inc si
inc bx 
inc oddCount
Next:
     looP Check 
ADD oddCount,'0'
 ADD evenCount,'0'
 
 LEA DX,MSG3
MOV AH,9H
INT 21H     
     
mov al,evenCount
sub al,'0'
mov ah,0
call print_num
     
     
LEA DX,MSG1
MOV AH,9H
INT 21H     
     
mov si,0
mov di,0   
mov cl,evenCount 
mov dx,0
mov ax,0
EvenPrint:
MOV AX,0
MOV DX,0

mov dl,even[si]
mov al,dl   
CMP AL,0
JE EXIT
mov ah,0
call print_num
inc si 
CMP SI,5
JE EXIT
jmp EvenPrint
   

EXIT:

  LEA DX,MSG4
MOV AH,9H
INT 21H     
     
mov al,oddCount
sub al,'0' 
mov ah,0
call print_num
     
LEA DX,MSG4
MOV AH,9H
INT 21H  
mov si,0
mov di,0   
mov cl,OddCount  

OddPrint:

mov dl,odd[si] 
mov al,dl      
mov ah,0 
cmp al,0
JE EXIT1
call print_num
inc si  
CMP SI,5
JE EXIT1
JMP OddPrint

 EXIT1:
mov si,0
mov di,0   
mov cx,5 

mov ah,4ch
int 21h

main endp  



print_num proc
     
mov cx,0
mov bx,10

print_loop:

xor dx,dx
div bx
push dx
inc cx
test ax,ax
jnz print_loop

output:
pop dx
add dl,'0'
mov ah,2h
int 21h
loop output
ret 
print_num endp


   
     
                      