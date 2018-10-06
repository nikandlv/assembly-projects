global print
print:
    mov edx,[esp+4]
    mov ecx,[esp+8]
    mov eax, 4
    mov ebx, 1
    int 0x80
    pop ebx
    pop eax
    pop eax
    jmp ebx
    
