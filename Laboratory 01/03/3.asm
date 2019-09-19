.MODEL small
.DATA
; variable que contiene el texto
texto DB 'El simbolo escogido es: $' ; $ significa el final de la cadena
.STACK
.CODE
Programa: ; etiqueta de inicio del Programa
;inicializar programa 
MOV AX, @Data ; guardando dirección de inicio segmento de datos
MOV DS, AX
; Imprimir la cadena
MOV DX, OFFSET texto ;Asignando a DX la variable nombre
MOV AH, 09h           ;Decimos que se imprimirá una cadena
INT 21h               ;Ejecuta la interrupción, imprimirá
MOV DX, 40h ;Esto indica que se imprimirá el símbolo '@'
MOV AH, 02h
INT 21h
; finalización programa
MOV AH, 4Ch ; finalizar proceso
INT 21h ; Ejecuta interrupción
END Programa