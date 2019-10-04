.model small

.stack

.data
numero01 DB 4
numero02 DB 2
ResultadoSuma DB 10, 13, "Suma: $"
ResultadoResta DB 10, 13, "Diferencia: $"
ResultadoMulti DB 10, 13, "Producto: $"
ResultadoDiv DB 10, 13, "Cociente (DIV): $"
ResultadoMod DB 10, 13, "Residuo (MOD): $"

.code

Programa01:

    MOV AX,@DATA
    MOV DS,AX
   
    ;Se efect?a la operaci?n de la suma
    XOR AX, AX
    XOR BX, BX
    
    MOV AX, 0000
    MOV AL, numero01
    ADD AL, numero02

    MOV AH, 0
    ADD AH, 30H
    ADD AL, 30H

    MOV BX, AX
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h 

    ;Se imprime el resultado de la suma
    LEA DX, ResultadoSuma
    MOV AH, 09
    INT 21H

    MOV AH, 02
    MOV DL, BH
    INT 21H

    MOV AH, 02
    MOV DL, BL
    INT 21H                        

    ;Se efect?a la operaci?n de la resta
    XOR AX, AX
    XOR BX, BX
    
    MOV AX, 0000
    MOV AL, numero01
    SUB AL, numero02

    MOV AH, 0
    ADD AH, 30H
    ADD AL, 30H

    MOV BX, AX
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h 

    ;Se imprime el resultado de la resta
    LEA DX, ResultadoResta
    MOV AH, 09
    INT 21H

    MOV AH, 02
    MOV DL, BH
    INT 21H

    MOV AH, 02
    MOV DL, BL
    INT 21H
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h 

    ;Se efect?a la operaci?n de la multiplicaci?n
    XOR AX, AX
    XOR BX, BX
    
    MOV AX, 0000
    MOV AL, numero01
    MUL numero02

    MOV AH, 0
    ADD AH, 30H
    ADD AL, 30H

    MOV BX, AX

    ;Se imprime el resultado de la multiplicaci?n
    LEA DX, ResultadoMulti
    MOV AH, 09
    INT 21H

    MOV AH, 02
    MOV DL, BH
    INT 21H

    MOV AH, 02
    MOV DL, BL
    INT 21H
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h
    
    ;Se efect?a la operaci?n de la divisi?n
    XOR AX, AX
    XOR BX, BX
    
    MOV AX, 0000
    MOV AL, numero01
    DIV numero02

    MOV CH, AH
    ADD CH, 30H

    MOV AH, 0
    ADD AH, 30H
    ADD AL, 30H

    MOV BX, AX

    ;Se imprime el resultado de la divisi?n
    LEA DX, ResultadoDiv
    MOV AH, 09
    INT 21H

    MOV AH, 02
    MOV DL, BL
    INT 21H
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h 

    ;Se imprime el resultado del residuo de la divisi?n previamente realizada
    LEA DX, ResultadoMod
    MOV AH, 09
    INT 21H

    MOV AH, 02
    MOV DL, CH
    INT 21H

    Mov AH,4CH
    int 21h
    
    End Programa01