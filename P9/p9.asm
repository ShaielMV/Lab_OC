%include "../LIB/pc_iox.inc"
n equ 3	

	section	.text

	global _start  
    
	section .data
    captura1 db 'Ingrese el primer vector',0
    captura2 db 'Ingrese el segundo vector',0
    sumav db 'La suma de los 2 vectores es =',0
    arreglo db '0123456789',0
    arreglo2 db '0123456789',0
 
    
_start: 
	
    mov edx, captura1
    call puts
    call c_linea
    call capturar

    mov edx, captura2
    call puts
    mov dl, 1
    call c_linea
    call capturar

    mov edx, sumav
    call puts
    call c_linea
    call suma

    mov ecx, n
    mov ebx, arreglo
    despl:
        mov  al, [ebx]
        call pHex_b
        call c_linea
        inc ebx
    loop despl

 
    mov eax, 1
    int 0x80

    capturar:
    mov ebx, arreglo
    mov ecx, n

    cmp dl, 1
    jz v2

    ciclo:
        call getch
        r:
        cmp al,'0'
        jb r
        cmp al,'9'
        ja r
       
        sub al, '0'
        mov byte [ebx], al
        inc ebx
    loop ciclo
    ret

    v2:
        call getch
        t:
        cmp al,'0'
        jb t
        cmp al,'9'
        ja t
        sub al, '0'
        mov byte [edx], al
        inc edx
    loop v2
    ret
    


    desplegar:
    mov ebx, arreglo
    mov ecx, n
    ciclo2:
        mov al, byte[ebx]
        call putchar
        inc ebx
    loop ciclo2
    ret

    suma:
        mov ebx, arreglo
        mov edx, arreglo2
       
        ciclo3:
          
             
            
        loop ciclo3
    ret



    c_linea:
        push eax
        mov al,10
        call putchar
        pop eax
    ret
mov eax, 1
	int 0x80 