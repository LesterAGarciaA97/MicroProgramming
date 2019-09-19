.MODEL small
.DATA
; variable que contiene el texto
cadena DB 'Hola mundo$' ; $ significa el final de la cadena

.STACK
.CODE

Programa: ; etiqueta de inicio del Programa
;inicializar programa 
MOV AX, @Data ; guardando dirección de inicio segmento de datos
MOV DS, AX

; Imprimir la cadena
MOV DX, OFFSET cadena ;Asignando a DX la variable cadena
MOV AH, 09h           ;Decimos que se imprimirá una cadena
INT 21h               ;Ejecuta la interrupción, imprimirá

; finalización programa
MOV AH, 4Ch ; finalizar proceso
INT 21h ; Ejecuta interrupción
END Programa