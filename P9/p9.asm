%include "../LIB/pc_iox.inc"
n equ 5

	section	.text

    extern pHex_b
	global _start  
    
	section .data
    captura1 db 'Ingrese el primer vector',0
    captura2 db 'Ingrese el segundo vector',0
    sumav db 'La suma de los 2 vectores es= ',0
    escalarResultados db 'El producto escalar entre los 2 vectores es= ',0
    arreglo db "1234567890"
    arreglo2 db "1234567890"
 
    
_start: 
    mov edx, captura1
    call puts
    call saltoLinea
    mov ebx, arreglo
    mov ecx, n
    call capturarVector

    mov edx, captura2
    call puts
    call saltoLinea
    mov ebx, arreglo2
    call capturarVector

    mov edx, escalarResultados
    call puts
    call productoEscalar

    mov edx, sumav
    call puts
    mov ebx, arreglo
    mov edx, arreglo2
    call sumaVectores
    mov ebx, arreglo
    
    call desplegarVector


   
mov eax, 1
	int 0x80 

capturarVector:
    push ecx
    push ebx
    push eax

    repetir:
        call getch
        cmp al, '0'
        jb repetir
        cmp al, '9'
        ja repetir
        call putchar
        sub al, '0'
        mov [ebx],al
        inc ebx
    loop repetir
    pop eax
    pop ebx
    pop ecx
    call saltoLinea
    ret

    desplegarVector:
        push ecx
        push ebx
        push eax

        cmp ecx,10
        jae end

        mostrar:
            call saltoLinea
            mov al,[ebx]
            call pHex_b
            inc ebx
        loop mostrar
        pop eax
        pop ebx
        pop ecx
    end:
    call saltoLinea
    ret

    sumaVectores:
        push ebx
        push edx
        push ecx
        push eax

        sumar:
       
            mov al, [edx]
            add [ebx], al
            inc ebx
            inc edx
        loop sumar
    pop eax
    pop ecx
    pop edx
    pop ebx
    ret

    productoEscalar:
        push ecx
        push edi
        push esi
        push eax
        push ebx
        mov edx, 0
        mov esi, arreglo
        mov edi, arreglo2
        sums:
            mov bl, [esi]
            mov al, [edi]
            mul bl
            add dx, ax
            inc edi
            inc esi
        loop sums
    mov ax, dx
    call pHex_w
    call saltoLinea
    pop ebx
    pop eax
    pop esi
    pop edi
    pop ecx
ret



    
    saltoLinea:
        push eax
        mov al, 10
        call putchar
        pop eax
    ret