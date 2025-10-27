.MODEL SMALL
.STACK 100H
.DATA
 num1 DW 10 ; First operand
 num2 DW 5 ; Second operand
 result DW ? ; Variable to store result
.CODE
MAIN PROC
 MOV AX, @DATA
 MOV DS, AX
 ; ----------- ADD -----------
 MOV AX, num1
 ADD AX, num2
 MOV result, AX
 ; ----------- SUB -----------
 MOV AX, num1
 SUB AX, num2
 MOV result, AX
 ; ----------- AND -----------
 MOV AX, num1
 AND AX, num2
 MOV result, AX
 ; Exit program
 MOV AH, 4CH
 INT 21H
MAIN ENDP
END MAIN