ORG 100H
.MODEL SMALL
.DATA
MSG1 DB "Enter First Number : $"
MSG2 DB 10,13,"Enter Second Number : $"
MSG3 DB 10,13,"Enter Third Number : $"
MSG4 DB 10,13,"Maximum : $:" 
MSG5 DB 10,13,"Minimum : $:"
.CODE
  MOV AX,@DATA
  MOV DS,AX
  LEA DX,MSG1   
  MOV AH,9H
  INT 21H
MOV AH,01H
INT 21H
MOV BH,AL     
LEA DX,MSG2
MOV AH,9H
  INT 21H 
MOV AH,01H
INT 21H
MOV BL,AL   
 LEA DX,MSG3   
  MOV AH,9H
  INT 21H
MOV AH,01H
INT 21H
MOV CH,AL             ;1ST IN BH(1)    
LEA DX,MSG4           ;2ND IN BL(2)
MOV AH,09H            ;3RD IN CH(3)
INT 21H
MAXIMUM:
CMP BH,BL
JA FIRST_GREATER_SECOND
 SECONDT_GREATER_FIRST:             
CMP BL,CH
JA SECOND_GREATER_THIRD
 THIRD_GREATER_SECOND:                
MOV DL,CH 
JMP PRINT_MAXIMUM               
 FIRST_GREATER_SECOND:
CMP BH,CH
JA FIRST_GREATER_THIRD
 THIRD_GREATER_FIRST:
MOV DL,CH
JMP PRINT_MAXIMUM
FIRST_GREATER_THIRD:
MOV DL,BH 
JMP PRINT_MAXIMUM
SECOND_GREATER_THIRD:
MOV DL,BL    
JMP PRINT_MAXIMUM
PRINT_MAXIMUM:
MOV AH,02H
INT 21H   
LEA DX,MSG5
MOV AH,09H
INT 21H
MINIMUM:
CMP BH, BL
JB FIRST_LESS_SECOND
CMP BL, CH
JB SECOND_LESS_THIRD  
MOV DL, CH 
JMP PRINT_MINIMUM
FIRST_LESS_SECOND:   
CMP BH, CH
JB FIRST_LESS_THIRD
MOV DL, CH
JMP PRINT_MINIMUM
FIRST_LESS_THIRD:
MOV DL, BH 
JMP PRINT_MINIMUM
SECOND_LESS_THIRD:
MOV DL, BL 
JMP PRINT_MINIMUM
PRINT_MINIMUM:
MOV AH, 02H
INT 21H
MOV AH, 4CH
INT 21H