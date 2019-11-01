.MODEL small
.STACK
.DATA
    Mensaje01 db 'Ingrese la primera cadena: $'
    Mensaje02 db 'Ingrese la segunda cadena: $'
    Mensaje03 db 'Las cadenas no son iguales$'
    Mensaje04 db 'Las cadenas son iguales$'                     
    Contador01 DB ?
    Contador02 DB ?
    Resultado01 DB 0FFH DUP(?)                      
    Resultado02 DB 0FFH DUP(?) 
.CODE
Programa02:
    ;Se inicializa el programa
    MOV AX,@DATA
    MOV DS, AX
    MOV SI, 0
    MOV Contador01, 0
    MOV DX, OFFSET Mensaje01
    MOV AH, 09H
    INT 21H
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h
Leer1:
    XOR AX,AX ;Se limpian lo registros para evitar recolecci?n de basura
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH
    JZ Continuar
    MOV Resultado01[SI], AL
    INC SI
    INC Contador01
    JMP Leer1
Continuar:
    MOV Contador02, 0
    MOV SI, 0
    MOV DX, OFFSET Mensaje02
    MOV AH, 09H
    INT 21H
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h
Leer2:
    XOR AX,AX ;Se limpian lo registros para evitar recolecci?n de basura
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH
    JZ AUX
    MOV Resultado02[SI], AL
    INC SI
    INC Contador02
    JMP Leer2
AUX:
    MOV AL, Contador01
    CMP Contador02, AL
    JNE Diferentes
    MOV SI, 0
    MOV CL, Contador01
Evaluacion:
    MOV AL, Resultado02[SI]
    CMP Resultado01[SI], AL
    JNE Diferentes
    LOOP Evaluacion
    JMP Iguales
Diferentes:
    MOV AX, 03H ;Se limpia la pantalla
    INT 10H
    MOV DX, OFFSET Mensaje03
    MOV AH, 09H
    INT 21H
    JMP Finalizar
Iguales:
    MOV AX, 03H ;Se limpia la pantalla
    INT 10H
    MOV DX, OFFSET Mensaje04
    MOV AH, 09H
    INT 21H
    
    ;Este bloque de c?digo realiza un salto de l?nea para que no se vea todo junto en la consola
    MOV AH,02h
    MOV DL,0ah
    INT 21h
    MOV AH,02h
    MOV DL,0dh
    INT 21h
Finalizar: ;Se finaliza el programa
    MOV AH, 4CH
    INT 21H             
END Programa02