.stack 100h
.model small
.data
msg db "Enter any number: $"
msg1 db "Number is Prime$"
msg2 db "Number is Not Prime$"
.code

MOV AX, @data
MOV DS, AX
LEA DX, msg
MOV AH, 09H
INT 21H

MOV AH, 01H
INT 21H
SUB AL, 30H 
MOV BL, AL 
MOV AH, 0 
MOV BH, 0
MOV AL, 0

MOV CX, BX
DEC CX

CHECK:
CMP CX, 1
JE PRIME
MOV AX, CX
DIV BX
CMP DX, 0
JE NOTPRIME 
LOOP CHECK 

NOTPRIME:
LEA DX, msg2
MOV AH, 09H
INT 21H   
HLT

PRIME:
LEA DX, msg1
MOV AH, 09H
INT 21H
HLT
