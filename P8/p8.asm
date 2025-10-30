%include "../LIB/pc_iox.inc"
	
    

	section	.text
    extern getche

	global _start  
    

	section .data
    msgMenorM	db  'La letra ingreada es menor a m',0xa,0 
    msgMayorM	db  'La letra ingreada es mayor a m',0xa,0 
    
	
_start: 
	call getche  ;inciso a
    cmp al, 'a'
    jb noLetra
    cmp al, 'z'
    ja noLetra
    jmp letra

    letra:
    cmp al, 'm'
    jb menorM

    mov edx, msgMayorM
    call puts
   
    noLetra:
	jmp sig

    menorM:
    mov edx, msgMenorM
    call puts
    jmp sig


    sig:        ;inciso b
    call getche  
    cmp al, 'a'
    
    cmp al, 'z'
    
    

	mov eax, 1
	int 0x80        