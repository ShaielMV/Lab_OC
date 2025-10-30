%include "../LIB/pc_iox.inc"
	
	section	.text


	global _start  
    

	section .data
     msgnoLetra	db  'El caracter ingresado no es una letra',0xa,0
    msgMenorM	db  'La letra ingreada es menor a m',0xa,0 
    msgMayorM	db  'La letra ingreada es mayor a m',0xa,0 
    msgLetra	db  'El caracter ingresado es una letra',0xa,0 
    msgNum	db  'El caracter ingresado es un numero',0xa,0 
    asterisco db '*',0
    array db 10
	
_start: 
	call getche     ;inciso a
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
    jmp sigb
   
    noLetra:
    mov edx, msgnoLetra
    call puts
	jmp sigb

    menorM:
    mov edx, msgMenorM
    call puts
    jmp sigb


    sigb:        ;inciso b
    call getche  
    cmp al, 'a'
    jb num
    cmp al, 'z'
    ja num

    mov edx, msgLetra
    call puts
    jmp sigc

    num:
    cmp al, '0'
    jae esnum
    cmp al, '9'
    jbe esnum
    jmp sigc

    esnum:
    mov edx, msgNum
    call puts

    sigc:       ;inciso c
    mov cx, 3
    
 print: 
    mov ax, cx
    mov edx, asterisco
    cant:
        call puts
        dec ax
        cmp ax, 0
        ja cant
        mov al, 10
        call putchar
 loop print

                ;inciso d

         

	mov eax, 1
	int 0x80        