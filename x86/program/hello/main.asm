section .data
    hi db "Hello World!", 0x0a
    hil equ $ - hi
    bye db "Bye World", 0x0a
    byel equ $ - bye

section .text
extern print
global _start

_start:
    push hi
    push hil
    call print
    push bye
    push byel
    call print
    mov ebx, 0
    mov eax, 1
    int 0x80
    
