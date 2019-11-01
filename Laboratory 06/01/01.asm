.MODEL small
.STACK
.DATA
    Resultado01 DB 0FFH DUP(?)
    Contador DB ?
.CODE
Programa01:
    ;Se inicializa el programa
    MOV AX,@DATA
    MOV DS, AX
    MOV AX, 03H
    INT 10H
    MOV SI, 0
    MOV Contador, 0
Leer:
    XOR AX,AX ;Se limpian lo registros para evitar recolección de basura
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH
    JZ Imprimir
    MOV Resultado01[SI], AL
    INC SI
    INC Contador
    JMP Leer
Imprimir: ;Imrpime resultados
    MOV CL, Contador
    MOV SI, 0
TEMP: ;Ayuda a tener un registro de procesos temporales
    MOV AH, 02H
    MOV DL, Resultado01[SI]
    SUB DL, 20H
    INT 21H
    INC SI
    LOOP TEMP
    MOV AH, 4CH ;Se finaliza el programa
    INT 21H  
END Programa01