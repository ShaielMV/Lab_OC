%include "../LIB/pc_iox.inc"
	
    global pBin8b
    extern putchar

	section	.text
   

    pBin8b:
        push ebp
        mov ebp, esp
        mov al, [ebp+8]
         push ecx
        mov cl,0
    verBit:
        inc cl
        shl al,cl
        jc uno
        mov al, '0'
        jmp cero
    uno:
        mov al, '1'    
    cero:   
        call myPutchar
        cmp cl, 8
        jz fin
        jmp verBit
      fin:
         pop ecx
        pop ebp
        ret
        



   myPutchar: 
        push edx
        push ecx
        push eax
        call putchar
        pop eax
        pop ecx
        pop edx
        ret
  

	mov eax, 1
	int 0x80     