.model small
.stack 100h
.data

msg            db    'Enter binary number : $'
msg1           db    0dh,0ah,'CONVERSION IN HEXA DECIMAL :  $' 
decimalResult  dw    ?         
decimalBuffer  db    6 dup(?)  ; 
outputMsg      db    0dh,0ah,'Decimal number: $'

.code 
main proc
    MOV AX,@data
    MOV DS,AX 
    MOV AH,09H
    lea DX,msg
    int 21h
    MOV BX,0
    MOV CX,8  
    
AGAIN: 
    MOV AH,01H
    INT 21H
    CMP AL,13
    JE PRINT
           
    AND AL,0FH 
    SHL BL,1
    OR BL,AL
       
    loop AGAIN  
    
PRINT:
    MOV AH,09H
    lea DX,msg1
    int 21h
         
    MOV AL,BL
    
    AND AL,11110000B
    SHR AL,4   
    
    CMP AL,10
    JE CAPA
    CMP AL,11
    JE CAPB
    CMP AL,12
    JE CAPC
    CMP AL,13
    JE CAPD
    CMP AL,14
    JE CAPE
    CMP AL, 15
    JE CAPF  
    
    MOV DL,AL
    ADD DL,48
    MOV AH,02H
    INT 21H
    JMP NEXT
    
CAPA:
    MOV DL,'A'
    JMP PRINT_CHAR 

CAPB:
    MOV DL,'B'
    JMP PRINT_CHAR 
    
CAPC:
    MOV DL,'C'
    JMP PRINT_CHAR 
    
CAPD:  
    MOV DL,'D'
    JMP PRINT_CHAR 
    
CAPE:
    MOV DL,'E'
    JMP PRINT_CHAR 
    
CAPF:
    MOV DL,'F'
    
PRINT_CHAR:
    MOV AH,02H
    INT 21H
    JMP NEXT
    
NEXT:
    MOV AL,BL
    AND AL,0FH  
    
    CMP AL,10
    JE CAPA1
    CMP AL,11
    JE CAPB1 
    CMP AL,12
    JE CAPC1
    CMP AL,13
    JE CAPD1
    CMP AL,14
    JE CAPE1
    CMP AL,15
    JE CAPF1
    
    MOV DL,AL
    ADD DL,48 
    MOV AH,02H
    INT 21H
    JMP EXIT
        
CAPA1:
    MOV DL,'A'
    JMP PRINT_CHAR1
    
CAPB1:
    MOV DL,'B'
    JMP PRINT_CHAR1 
    
CAPC1:
    MOV DL,'C'
    JMP PRINT_CHAR1
    
CAPD1:  
    MOV DL,'D'
    JMP PRINT_CHAR1
    
CAPE1:
    MOV DL,'E'
    JMP PRINT_CHAR1
    
CAPF1:
    MOV DL,'F'
    
PRINT_CHAR1:
    MOV AH,02H
    INT 21H
    JMP EXIT 
    
EXIT:
    MOV AL, BL 
    MOV BL, 10      
    XOR BH, BH     
    XOR CX, CX      
    
CONVERTLOOP:
    SHL AL, 1       
    RCL DECIMALRESULT, 1  
    ADC DECIMALRESULT, 0  
    
    INC CX          
    
    CMP CX, 8      
    JNE CONVERTLOOP 
    
    MOV SI, OFFSET DECIMALBUFFER + 5 
    MOV AX, DECIMALRESULT            
    MOV BX, 10                       
    
DECIMALTOASCII:
    XOR DX, DX        
    DIV BX            
    ADD DL, '0'       
    DEC SI            
    MOV [SI], DL      
    TEST AX, AX       
    JNZ DECIMALTOASCII
     
    MOV DX, OFFSET OUTPUTMSG
    MOV AH, 09H       
    INT 21H   
    
    LEA DX, DECIMALBUFFER  
    MOV AH, 09H        
    INT 21H
              
              
      
    MOV AH, 4CH        
    INT 21H
MAIN ENDP
END MAIN
