%include "../LIB/pc_iox.inc"



	global _start      

_start: 
	mov eax, 0x2219166
	mov ebx, 0x5C4B2A60
    add eax, ebx

	call pHex_dw	

	mov al,10	
	call putchar

	


	mov eax, 1
	int 0x80        

