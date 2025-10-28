model small
.data
msg db 0dh, 0ah, ".................. OF DF IF TF SF ZF ... AF ... PF ... CF $"
newl db 0dh, 0ah, "$"
flag dw 1
.code
start:
mov ax,@data
mov ds,ax

mov dx,offset msg
mov ah,09h
int 21h

mov dx,offset newl
mov ah,09h
int 21h

cli
stc
std

pushf
pop bx
mov flag,bx
mov cx,16
mov bx,8000h

loops:
    mov ax,flag
    and ax,bx
    jz zero
    mov dl,31h
    mov ah,02h
    int 21h
    jmp space

zero:
    mov dl,30h
    mov ah,02h
    int 21h

space:
    mov dl,' '
    mov ah,02h
    int 21h

    mov ah,02h
    int 21h

    ror bx,1
    loop loops

mov ah,4ch
int 21h
end start


; To Execute:
; Open DOSBOX
; Z:\> Mount D ~(curl)
; Z:\> D:
; • D:\>cd MASM
; • D:\Masm>
; • D:\MASM > MASM display_flags.asm
; • D:\MASM > LINK display_flags.obj
; • D:\MASM > DEBUG display_flags.exe
; • G (Run the program)