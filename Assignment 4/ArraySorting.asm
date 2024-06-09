.STACK 100H
.MODEL  SMALL
.DATA
MSG1 DB "Enter 5 Values in Array  : $" 
MSG2 DB ,10,13,"After Sorting  :  $"
Arr DB  5 DUP(?)
.CODE

MOV AX,@DATA
MOV DS,AX  
MOV SI,0  
MOV CX,5 
LEA DX,MSG1
MOV AH,9H
INT 21H 

INPUT:
MOV AH,1H
INT 21H 
MOV Arr[SI],AL
INC SI

LOOP INPUT
MOV CX,0
MOV CX,5  

LEA DX,MSG2
MOV AH,9H
INT 21H 


MOV CX,5
DEC CX
OUTERLOOP:
MOV BX,CX
MOV SI,0 

COMPLOOP:

MOV AL,Arr[SI]
MOV DL,Arr[SI+1]
CMP AL,DL    
JC NOSWAP
          
MOV Arr[SI],DL
MOV Arr[SI+1],AL


NOSWAP:
INC SI  
DEC BX
JNZ COMPLOOP 

LOOP OUTERLOOP   


MOV CX,5 
MOV SI,0

PRINT: 

MOV AL,Arr[SI] 
MOV AH,0
INC SI  
MOV DX,AX
MOV AH,2H
INT 21H 
LOOP PRINT


MOV AH,4CH
INT 21H