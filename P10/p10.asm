%include "../LIB/pc_iox.inc"
	
    global suma
    global Strlen

	section	.text

   
    suma:
    push ebp
    mov ebp, esp
    mov eax,[ebp+8]
    add eax, [ebp+12]
    pop ebp
    ret

    Strlen:
    push ebp
    mov eax,0
    niv edx, 0
    mov ebp, esp
    mov ecx, [ebp+8]
  leer:  mov edx, [ecx]
    cmp edx, 0
    je fin
    inc ecx
    inc eax
    jmp leer
    fin:
    ret

    


	mov eax, 1
	int 0x80     