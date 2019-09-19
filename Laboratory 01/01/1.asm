.MODEL small
.DATA
; variable que contiene el texto
nombre DB 'Lester Andres Garcia Aquino$' ; $ significa el final de la cadena
carnet DB ' 1003115$'

.STACK
.CODE

Programa: ; etiqueta de inicio del Programa
;inicializar programa 
MOV AX, @Data ; guardando dirección de inicio segmento de datos
MOV DS, AX

; Imprimir la cadena
MOV DX, OFFSET nombre ;Asignando a DX la variable nombre
MOV AH, 09h           ;Decimos que se imprimirá una cadena
INT 21h               ;Ejecuta la interrupción, imprimirá

MOV DX, OFFSET carnet ;Asignando a DX la variable nombre
MOV AH, 09h           ;Decimos que se imprimirá una cadena
INT 21h               ;Ejecuta la interrupción, imprimirá

; finalización programa
MOV AH, 4Ch ; finalizar proceso
INT 21h ; Ejecuta interrupción
END Programa