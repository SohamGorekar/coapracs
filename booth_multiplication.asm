DATA SEGMENT
    Q DB 8H
    M DB 5H
    RESULT DW ?
    DB 100 DUP(00)
DATA ENDS

CODE SEGMENT
    ASSUME CS: CODE, DS: DATA

START: 
    MOV AX, DATA
    MOV DS, AX

    MOV AX, 0000H
    MOV BX, 0000H
    MOV AL, Q
    MOV BL, M
    MOV CL, 8
    CLC
BACK: 
    MOV DX, 00H
    MOV DX, AX
    RCL DX, 01
    AND DX, 03H

    CMP DX, 01H
    JE Q01
    CMP DX, 02H
    JE Q10
NEXT: 
    SAR AX, 01
    LOOP BACK
    JMP EXIT

Q10: 
    SUB AH, BL
    JMP NEXT
Q01: 
    ADD AH, BL
    JMP NEXT

EXIT: 
    MOV RESULT, AX

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START



; To Execute:
; Open DOSBOX
; Z:\> Mount D ~(curl)
; Z:\> D:
; • D:\>cd MASM
; • D:\Masm>
; • D:\MASM > MASM booth_multiplication.asm
; • D:\MASM > LINK booth_multiplication.obj
; • D:\MASM > DEBUG booth_multiplication.exe
; • G (Run the program)