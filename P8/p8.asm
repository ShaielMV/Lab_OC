%include "../LIB/pc_iox.inc"
	
	section	.text


	global _start  
    

	section .data
     msgnoLetra	db  'El caracter ingresado no es una letra',0xa,0xa,0
    msgMenorM	db  'La letra ingreada es menor a m',0xa,0xa,0 
    msgMayorM	db  'La letra ingreada es mayor a m',0xa,0xa,0 
    msgLetra	db  'El caracter ingresado es una letra',0xa,0xa,0 
    msgNum	db  'El caracter ingresado es un numero',0xa,0xa,0 
    arreglo db '',0
 
    
	
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
    cmp al, 'A'
    jb num
    cmp al, 'Z'
    ja num

    mov edx, msgLetra
    call puts
    jmp sigc

    num:
    cmp al, '0'
    jb sigc
    cmp al, '9'
    ja sigc

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
    mov al, 10
    call putchar

    mov esi, arreglo        ;inciso d
    mov cx, 10
    captura:          
        call getche
        mov [esi], al
        inc esi
    loop captura

    mov al, 10
    call putchar
    mov cx, 10
    mov esi, arreglo

    desplegar:
        mov al, [esi]
        call putchar
        inc esi
        mov al, 10
        call putchar
    loop desplegar
    

    mov cx, 10 
    mostrar:  

	mov eax, 1
	int 0x80        