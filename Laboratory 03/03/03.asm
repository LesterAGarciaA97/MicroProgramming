.MODEL SMALL
.STACK
.DATA

numero01 DB ?                           
numero02 DB ?                           
Residuo DB 0000h                   
Cociente DB 0000h                    
Decenas DB ?
Unidades DB ?

PedirNumero01 DB 10, 13, "Ingrese el primer numero: $"
PedirNumero02 DB 10, 13, "Ingrese el segundo numero: $"
ResultadoSuma DB 10, 13, "Suma: $"
ResultadoResta DB 10, 13, "Diferencia: $"
ResultadoMulti DB 10, 13, "Producto: $"
ResultadoDiv DB 10, 13, "Cociente (DIV): $"
ResultadoMod DB 10, 13, "Residuo (MOD): $"

.CODE

Programa03:

    MOV AX, @DATA
    MOV DS, AX 

    ;Ingreso del primer n?mero
    MOV DX, Offset numero01
    MOV AH, 09H
    INT 21H
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h

    ;Leer el primer n?mero ingresado
    MOV AH, 01H                     
    INT 21H 
    MOV numero01, AL                    
    SUB numero01, 30H                   
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h
    
    ;Ingreso del segundo n?mero
    MOV DX, Offset numero02
    MOV AH, 09H
    INT 21H
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h
    
    ;Leer el segudo n?mero ingresado
    MOV AH, 01H                     
    INT 21H 
    MOV numero02, AL                    
    SUB numero02, 30H                    

    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h    
    
    ;Se realiza la suma
    MOV DX, Offset ResultadoSuma
    MOV AH, 09H
    INT 21H
    
    XOR AX, AX                      
    XOR BX, BX
    MOV AL, numero01                    
    ADD AL, numero02                    
    
    MOV BL, 10                      
    DIV BL                          
    MOV Decenas, AL                  
    MOV Unidades, AH                  
    MOV DL, Decenas                  
    ADD DL, 30H                     
    MOV AH, 02H                     
    INT 21H
    
    MOV DL, Unidades                  
    ADD DL, 30H                        
    MOV AH, 02H                     
    INT 21H
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h 

    ;Se realiza la resta
    MOV DX, offset ResultadoResta
    MOV AH, 09H
    INT 21H
    
    XOR AX, AX                     
    XOR BX, BX
    MOV AL, numero01                    
    SUB AL, numero02                    
    ADD AL, 30H                     
    MOV DL, AL                      
    MOV AH, 02H                     
    INT 21H
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h 
  
    ;Se realiza la multiplicaci?n
    MOV DX, offset ResultadoMulti
    MOV AH, 09H
    INT 21H
    
    XOR AX, AX                      
    XOR BX, BX
    MOV AL, numero01                    
    MUL numero02                        
    
    ;Imprimir? las decenas
    MOV BL, 10                      
    DIV BL                          
    MOV Decenas, AL                  
    MOV Unidades, AH                  
    MOV DL, Decenas                  
    ADD DL, 30H                     
    MOV AH, 02H                     
    INT 21H
    
    ;Imprimir? las unidades
    MOV DL, Unidades                  
    ADD DL, 30H                        
    MOV AH, 02H                      
    INT 21H
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h
    
    ;Se realiza la divisi?n y se imprime
    MOV DX, Offset ResultadoDiv
    MOV AH, 09H
    INT 21H
    
    XOR AX, AX                      
    XOR BX, BX                      
    MOV AL, numero01                    
    DIV numero02                        
    MOV cociente, AL                
    MOV residuo, AH                 
    ADD cociente, 30H               
    ADD residuo, 30H                
    MOV DL, cociente                
    MOV AH, 02H                     
    INT 21h
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h
    
    ;Se imprime el resultado del residuo de la divisi?n previamente realizada
    MOV DX, Offset ResultadoMod
    MOV AH, 09H
    INT 21H
    
    MOV DL, ResultadoMod
    MOV AH, 02H
    INT 21H
   
    MOV AH, 4CH                     
    INT 21h

END Programa03