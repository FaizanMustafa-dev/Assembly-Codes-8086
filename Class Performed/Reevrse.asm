.STACk 100H
.MODEL SMALL
.data
msg2 db "The reverse sring is :$"
msg1 db 10,13,"Enter a string  :$"
.code
MOV AX,@DATA
MOV DS,AX
LEA DX,MSG1
MOV AH,09H
INT 21H
MOV CX,0
Input:
MOV AH,01h
int 21h    
MOV AH,0
PUSH AX
INC CX  
CMP Al,0DH
JE PRINT:
JMP Input 
PRINT:
MOV DX,0DH
MOV AH,2H
INT 21H  
MOV DX,0AH
MOV AH,2H
INT 21H 
LEA DX,MSG2
MOV AH,09H      
INT 21H 
MOV DX,0DH
MOV AH,2H
INT 21H  
MOV DX,0AH
MOV AH,2H
INT 21H
Reverse:
POP DX
MOV AH,02H
INT 21H
Loop Reverse
MOV AH,4CH
INT 21H
