.MODEL small
.DATA
   Palabra  db 9 dup ('$')
   Numero01 db ?
   Numero02  db ?
   AUX  db ?
.STACK
.CODE
Programa04: 

   ;MOV AX,@DATA
   ;MOV DS,AX
   
   ;LEA DX, Palabra
   
   MOV Numero01, 0 
   MOV ah, 01h   
   INT 21h      
   sub AL, 30h   
   MOV Numero02, AL   

   MOV AL, Numero02  
   MOV BL,10    
   mul BL       
   MOV AUX, AL   

   MOV Numero01, 0   
   MOV AH, 01h
   int 21h      
   SUB AL, 30h
   ADD AUX, AL  
   MOV BL, AUX  
   MOV Numero02, BL   

   MOV AH, 02h 
   MOV DL, '='
   INT 21h

   MOV SI,6    
   Binario:        

   MOV AH, 00h
   MOV AL, Numero02
   MOV BL, 2
   DIV BL
   MOV Numero01, AH
   MOV Numero02, AL

   MOV DL, Numero01
   ADD DL, 30h

   MOV Palabra[SI], DL

   CMP Numero02, 1
   DEC SI
   JNE Binario
   JE Finalizar 

   CMP Numero02, 0 
   JNE Binario
   JMP Finalizar

   Finalizar:

   XOR DX, DX
   MOV DL,Numero02
   ADD DL,30h
      
   XOR AL,AL
   XOR AX,AX
   XOR AH,AH
   XOR BL,BL
   XOR DL,DL
   XOR DX,DX

   MOV AH,09h
   LEA DX, Palabra
   INT 21h
   MOV AH, 4CH
   INT 21h

  end Programa04