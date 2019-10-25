.MODEL small
.DATA
    Numero01 DB ?
    Numero02 DB ?
    Numero03 DB ?
    Residuo DB ?                      
    Cociente DB ?                      
    AUX DB ?
.STACK
.CODE

Programa03:
    MOV AX,@DATA
    MOV DS, AX
    
    MOV AUX, 05H
    ADD AUX, 05h
    
    XOR AX, AX ;Se limpia el registro para evitar imprimir basura
    MOV AH, 01H
    INT 21H
    MOV Numero01, AL

    INT 21H
    MOV Numero02, AL
    
    SUB Numero01, 30h
    SUB Numero02, 30h

    XOR AX, AX ;Se limpia el registro para evitar imprimir basura        
    MOV AL, Numero01        
    MUL AUX
    ADD AL, Numero02       
    MOV Numero01, AL
    
    MOV CL, Numero01
    DEC CL             
    MOV Numero03, CL
Ciclo:
    XOR AX, AX ;Se limpia el registro para evitar imprimir basura
    MOV AL, Numero01
    DIV Numero03
    CMP AH, 0h
    JZ Impresion
Ciclo2:
    DEC Numero03
    LOOP Ciclo
    JMP Finalizar
Impresion:
    MOV AH, 02H
    MOV DL, 0AH
    INT 21H
    XOR AX, AX ;Se limpia el registro para evitar imprimir basura
    MOV AL, Numero03   
    DIV AUX
    MOV Cociente, AL          
    MOV Residuo, AH          
    XOR AX, AX ;Se limpia el registro para evitar imprimir basura
    
    ADD Cociente, 30H        
    ADD Residuo, 30H         
    MOV DL, Cociente
    MOV AH, 02H         
    INT 21H
    MOV DL, Residuo       
    INT 21H
    JMP Ciclo2
Finalizar: 
    MOV AH,4CH
    INT 21H             
end Programa03