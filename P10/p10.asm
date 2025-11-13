%include "../LIB/pc_iox.inc"
	
    global suma
    global strlen

	section	.text

   
    suma:
    push ebp
    mov ebp, esp
    mov eax,[ebp+8]
    add eax, [ebp+12]
    pop ebp
    ret

    strlen:
    push ebp
    mov ebp, esp
    mov ecx, [ebp+8];
    cmp [ecx], 0
    je fin
    inc eax

    


	mov eax, 1
	int 0x80     