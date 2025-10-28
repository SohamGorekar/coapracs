.MODEL SMALL
.STACK 100H
.DATA
 NUM1 DB 25H ; Packed BCD → 25 (2 and 5)
 NUM2 DB 38H ; Packed BCD → 38 (3 and 8)
 RESULT DB ? ; To store the BCD result
.CODE
MAIN PROC
 MOV AX, @DATA
 MOV DS, AX
 MOV AL, NUM1 ; Load first BCD number
 ADD AL, NUM2 ; Add second BCD number (binary addition first)
 DAA ; Decimal Adjust after Addition → BCD correction
 MOV RESULT, AL ; Store BCD result
 MOV AH, 4CH
 INT 21H
MAIN ENDP
END MAIN

To Execute
Open DOSBOX
Z:\> Mount D ~(curl)
Z:\> D:
• D:\>cd MASM
• D:\Masm>
• D:\MASM > MASM EXP6.asm
• D:\MASM > LINK EXP6.obj
• D:\MASM >DEBUG EXP6.exe
• T