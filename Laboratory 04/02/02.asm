.MODEL small

.STACK

.DATA
    numero01 DB ?
    numero02 DB ?
    IgualQue DB 10,13,"Los dos numeros son iguales$"
    MenorQue DB 10,13,"El primer numero es mayor al segundo numero$"
    MayorQue DB 10,13,"El segundo numero es mayor al primer numero$"
    Mensaje01 DB 10,13,"Ingrese el primer numero: $"
    Mensaje02 DB 10,13, "Ingrese el segundo numero: $"
    
.CODE
Programa02:

    MOV AX,@DATA
    MOV DS,AX

    LEA DX, Mensaje01
    MOV Ah, 09
    INT 21H

    MOV AH, 01
    INT 21H

    MOV numero01, AL
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0AH
    INT 21h
    MOV AH,02h
    MOV DL,0DH
    INT 21h 

    LEA DX, Mensaje02
    MOV Ah, 09
    INT 21H

    MOV AH, 01
    INT 21H
    
    MOV numero02, AL

    ;Movimientos y comparaciones necesarias luego de leer valores ingresados por el usuario
    MOV DL, numero02
    CMP DL, numero01
    
    ;Aqu? se crean los saltos a diferentes etiquetas con funcionalidades distintas
    Jg Mayor
    Jl Menor
    Jz Igual
    
    ;Aqu? est? el c?digo de las diferentes etiquetas a utilizar
    ;Primer etiqueta --> N?meros iguales
    Igual:
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0AH
    INT 21h
    MOV AH,02h
    MOV DL,0DH
    INT 21h
    LEA DX, IgualQue
    jmp FinalPrograma

    ;Segunda etiqueta --> Primer n?mero mayor que segundo n?mero
    Mayor: 
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0AH
    INT 21h
    MOV AH,02h
    MOV DL,0DH
    INT 21h
    LEA DX, MayorQue
    jmp FinalPrograma

    
    ;Tercera etiqueta --> Primer n?mero menor que segundo n?mero
    Menor:
   ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0AH
    INT 21h
    MOV AH,02h
    MOV DL,0DH
    INT 21h
    LEA DX, MenorQue
    jmp FinalPrograma

    ;Aqu? finaliza el programa
    FinalPrograma:
    MOV AH, 09
    INT 21H
    MOV AH, 4CH
    INT 21H

End Programa02