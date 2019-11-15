.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.DATA
	mensaje db "Ingrese un numero para calcular su factorial: ",0
.DATA?
num DW 20 dup(?)
factorial DD 20 dup(?)
.CODE
programa:
	INVOKE StdOut, addr mensaje
	INVOKE StdIn, addr num, 8
	INVOKE atodw, addr num
	MOV num, AX
	MOV EAX, 1
	MOV factorial,1
	MOV BX,0
	LOOP1:
		INC BX
		MOV CX, BX
		CMP CX,2
		JB Fin
		SUB CX, 1
		MOV EDX, factorial
	LOOP2:
		ADD EDX,factorial
		SUB CX,1
		CMP CX,0
		JA LOOP2
		MOV factorial, EDX
	Fin:
		CMP BX,num
		JB LOOP1
	print str$(factorial)
Finalizar:
	INVOKE ExitProcess,0
END programa