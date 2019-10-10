.MODEL small

.STACK

.DATA
    numero01 DB ?
    numero02 DB ?
    ResultadoFinal DB ?
    AUXD DB ?
    AUXS DB ?
    AUX DB 0
    Divisor DB 10
    Mensaje01 DB 10, 13, "Ingrese el primer numero: $"
    Mensaje02 DB 10, 13, "Ingrese el segundo numero: $"
    ResultadoMulti DB 10, 13, "Producto: $"
    ResultadoDiv DB 10, 13, "Cociente: $"
    ResultadoMod DB 10, 13, "Residuo: $"

.CODE
Programa03:
    MOV AX,@DATA
    MOV DS,AX

    LEA DX, Mensaje01
    MOV AH, 09
    INT 21H

    MOV AH, 01
    INT 21H
    SUB AL, 30H
    MOV numero01, AL
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0AH
    INT 21h
    MOV AH,02h
    MOV DL,0DH
    INT 21h 

    LEA DX, Mensaje02
    MOV AH, 09
    INT 21H

    MOV AH, 01
    INT 21H
    SUB AL, 30H
    MOV numero02, AL
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0AH
    INT 21h
    MOV AH,02h
    MOV DL,0DH
    INT 21h 

    ;Aqu? se realizar? la multiplicaci?n utilizando sumas sucesivas
    MOV CL, numero01

    Multi:
    MOV AL, numero02
    ADD ResultadoFinal, AL
    LOOP Multi

    FinalMulti:
    MOV AX, 0000
    MOV AL, ResultadoFinal
    DIV Divisor

    ;Movimiento de variables
    MOV AUXD, AL
    MOV AUXS, AH

    LEA DX, ResultadoMulti
    MOV AH, 09
    INT 21H

    ADD AUXD, 30H

    MOV AH, 02
    MOV DL, AUXD
    INT 21H

    ADD AUXS, 30H

    MOV AH, 02
    MOV DL, AUXS
    INT 21H

    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0AH
    INT 21h
    MOV AH,02h
    MOV DL,0DH
    INT 21h 
    
    ;Aqu? se realizar? la divisi?n utilizando restas sucesivas
    MOV AL, numero01
    MOV ResultadoFinal, AL
    MOV CL, numero01

    OperacionDivision:
    MOV AL, numero02
    SUB ResultadoFinal, AL

    JS DivisionFinal

    ADD AUX, 1
    ;Este es un LOOP que permitir? el mismo procedimiento hecho arriba pero de forma sucesiva hasta salir
    LOOP OperacionDivision

    DivisionFinal:
    LEA DX, ResultadoDiv
    MOV AH, 09
    INT 21H

    ADD AUX, 30H

    MOV AH, 02
    MOV DL, AUX
    INT 21H

    ;Aqu? se calcula el residuo bas?ndonos en la parte entera de la divisi?n realizada previamente
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0AH
    INT 21h
    MOV AH,02h
    MOV DL,0DH
    INT 21h 

    LEA DX, ResultadoMod
    MOV AH, 09
    INT 21H

    SUB AUX, 30H

    MOV AX, 0000
    MOV AL, numero02
    MUL AUX
    MOV BX, AX

    MOV AL, numero01
    SUB AL, BL

    ADD AL, 30H
    MOV BL, AL

    MOV AH, 02
    MOV DL, BL
    INT 21H

    ;Aqu? finaliza el programa
    MOV AH, 4CH
    INT 21H

End Programa03