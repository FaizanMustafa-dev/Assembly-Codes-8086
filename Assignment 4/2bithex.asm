.stack 100h
.data
msg1 db "Enter 2 bit hex number : $" 
ans db 10,dup("$")
.code
mov ax,@data
mov ds,ax
mov ah,9h
int 21h
mov ah,01h
int 21h

cmp al,'A' 
JE AInput
cmp al,'B' 
JE BInput:  
cmp al,'C' 
JE CInput:  
cmp al,'D' 
JE DInput:  
cmp al,'E' 
JE EInput:  
cmp al,'F' 
JE FInput:


Sub al,'0' 
JMP FirstDigit   
 

AInput:
mov al,10 
JMP FirstDigit

BInput:
mov al,11 
JMP FirstDigit

CInput:
mov al,12 
JMP FirstDigit

DInput:
mov al,13 
JMP FirstDigit

EInput:
mov al,14 
JMP FirstDigit

FInput:
mov al,15 
JMP FirstDigit
         
FirstDigit:      
MOV Ah,0

MOV BX,AX 
mov ax,0

Mov ax,16

mul bx 
      
mov bx,0
mov bl,al

mov ah,01h
int 21h  


cmp al,'A' 
JE a2Input
cmp al,'B' 
JE b2Input  
cmp al,'C' 
JE c2Input  
cmp al,'D' 
JE d2Input  
cmp al,'E' 
JE e2Input  
cmp al,'F' 
JE f2Input 

Sub al,'0' 
JMP secDigit    
 

a2Input:
mov al,10 
JMP secDigit

b2Input:
mov al,11 
JMP secDigit

c2Input:
mov al,12 
JMP secDigit

d2Input:
mov al,13 
JMP secDigit

e2Input:
mov al,14 
JMP secDigit

f2Input:
mov al,15 
JMP secDigit 




secDigit:

mov ah,0

add bx,ax 


MOV CX,bx

MOV AX,1

Factorial:
mul cx
loop Factorial  


MOV AH,4CH
INT 21H




      
 

