.MODEL small
.STACK
.DATA
    num DB ?
    espar DB 'El numero es par $'
    noespar DB 'El numero no es par $'
    residuo DB ?
.CODE

Programa01:
    MOV AX, @DATA
    MOV DS, AX
    
    ;LEER num
    XOR AX, AX
    MOV AH, 01H
    INT 21H
    MOV num, AL
    SUB num, 30H
    
    ;SALTO DE LINEA
    MOV DX, 10 
    MOV AH, 02H
    INT 21H
    
    ;Dividir entre 2
    XOR AX, AX
    MOV AL, num
    MOV CL, 2
    DIV CL
    
    ;Residuo en AH
    MOV residuo, AH
    
    ;Comparar
    CMP residuo, 0
    JZ Imprimirespar
    
    Imprimiresimpar:
    MOV DX, offset noespar
    MOV AH, 09H
    INT 21H
    JMP finalizar
    
    Imprimirespar:
    MOV DX, offset espar
    MOV AH, 09H
    INT 21H
    JMP finalizar
    
    ;FINALIZAR
    finalizar:
    MOV AH, 4CH
    INT 21H

END Programa01