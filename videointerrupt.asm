.model small
.stack 100h
.data
 menu db 13,10, 'case1. increase cursor (block)',13,10
 db 'case2. decrease cursor (underline)',13,10
 db 'Press key 1-7, any other key to exit...',13,10,'$'
.code
main:
 mov ax, @data
 mov ds, ax
 ; Display menu
 mov ah, 09h
 lea dx, menu
 int 21h
main_loop:
 ; Wait for key press
 mov ah, 07h; Read a char from keyboard without echo
 int 21h
 ; Check cases
 cmp al, '1'
 je increase_cursor
 cmp al, '2'
 je decrease_cursor
 jmp exit_program
increase_cursor:
mov ah, 01h
mov ch, 00h
mov cl, 07h
int 10h
jmp main_loop
decrease_cursor:
mov ah, 01h
mov ch, 06h
mov cl, 07h
int 10h
jmp main_loop
exit_program:
mov ah, 4Ch
int 21h
end main

Open DOSBOX
Z:\> Mount D ~(curl)
Z:\> D:
• D:\>cd MASM
• D:\Masm>
• D:\MASM > MASM EXP7.asm
• D:\MASM > LINK EXP7.obj
• D:\MASM > EXP7.exe
