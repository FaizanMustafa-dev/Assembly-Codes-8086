.stack 100h
.model small
.data 
values dw 450,0,487,101,500,0,359,0,458
newvalues dw 6 dup(0)  
.code 

MOV AX,@DATA
MOV DS,AX

MOV SI,OFFSET values 
MOV CX,9 

PushStack:
MOV AX,[SI]
PUSH AX
add si,2

loop PushStack

mov di,offset newvalues 


mov cx,9
Check:
POP BX
cmp bx,0 
je skip

mov [di],bx

skip:
add di,2 

loop Check 


MOV SI,OFFSET newvalues 
MOV CX,6 

PushNewStack:
MOV AX,[SI]
PUSH AX
add si,2

loop PushNewStack
                  
mov cx,6
 

MOV ah,4ch
int 21h











