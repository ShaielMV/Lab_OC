%include "../LIB/pc_iox.inc"
	
	section	.text


	global _start  
    

	section .data
     msgnoLetra	db  'El caracter ingresado no es una letra',0xa,0
    msgMenorM	db  'La letra ingreada es menor a m',0xa,0 
    msgMayorM	db  'La letra ingreada es mayor a m',0xa,0 
    msgLetra	db  'El caracter ingresado es una letra',0xa,0 
    msgNum	db  'El caracter ingresado es un numero',0xa,0 
    arrey db '
 
    
	
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
 mov bx, cx   
    cant:
        mov al, '*'
        call putchar
        dec bx
        cmp bx, 0
        ja cant
        mov al, 10
        call putchar      
 loop print


    mov cx, 10        ;inciso d
    mov ebx, 0
    captura:          
        call getche
       
    

    mov cx, 10 
    mostrar:
     
    

         

	mov eax, 1
	int 0x80        