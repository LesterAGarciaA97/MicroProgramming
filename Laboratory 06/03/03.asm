.MODEL small
.STACK
.DATA
    Mensaje01 db 'Ingrese la cadena a evaluar: $'
    Mensaje02 db 'Es un palindromo$'
    Mensaje03 db 'No es un palindromo$'                     
    Contador DB ?
    Resultado01 DB 0FFH DUP(?) 
.CODE
Programa03:
    ;Se inicializa el programa
    MOV AX,@DATA
    MOV DS, AX
    MOV SI, 0
    MOV Contador, 0
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
Lectura:
    XOR AX,AX ;Se limpian lo registros para evitar recolecci?n de basura
    MOV AH, 01H
    INT 21H
    
    CMP AL, 0DH
    JZ Siguiente
    MOV Resultado01[SI], AL
    PUSH AX
    INC SI
    INC Contador
    JMP Lectura
Siguiente:
    MOV SI, 0
    MOV CL, Contador
Validar:
    XOR AX,AX ;Se limpian lo registros para evitar recolecci?n de basura
    POP AX ;Se hace un POP en la stack
    CMP Resultado01[SI], AL
    JNE Diferentes
    INC SI
    LOOP Validar
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
    
    MOV DX, OFFSET Mensaje02
    MOV AH, 09H
    INT 21H
Finalizar:
    MOV AH, 4CH
    INT 21H
END Programa03