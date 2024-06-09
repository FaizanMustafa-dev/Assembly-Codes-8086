.MODEL SMALL
.DATA    
    MSG1 DB "ENTER A NUMBER : $"
    MSG2 DB 10,13,"ENTERED NUMBER IS EVEN.$"
    MSG3 DB 10,13,"ENTERED IS ODD.$"
.CODE  
MAIN PROC
       MOV AX,@DATA
       MOV DS,AX
       LEA DX,MSG1
       MOV AH,9
       INT 21H       
       MOV AH,1
       INT 21H
       
       AND AL,01h
  
       JZ EVEN     
       LEA DX,MSG3
       MOV AH,9
       INT 21H
       MOV AH,4CH
       INT 21H    
       EVEN:   
       LEA DX,MSG2
       MOV AH,9
       INT 21H 
MOV AH,4CH
INT 21H

