%include "../LIB/pc_iox.inc"
	
	extern pBin_w
    extern pBin_b
    extern pBin_dw

	section	.text
	global _start  

	section .data
	  
	
_start: 
	mov eax, 0x22446688 ;inciso a
	ror eax, 4
	call pHex_dw	

    mov al, 10
    call putchar 
	call putchar

    mov cx, 0x3F48      ;inciso b
    shl cx, 3 
    mov ax, cx
    call pHex_w

    mov al, 10
    call putchar 
	call putchar

    mov eax, 0x20D685F3     ;inciso c
    MOV esi, eax
    call pBin_dw
     mov al, 10
    call putchar

    mov eax, 0x40042021
    xor esi, eax
    mov eax, esi
    call pBin_dw

    mov al, 10
    call putchar 
	call putchar

    push esi    ;inciso d


    mov ch, 0xA7    ;inciso e
    mov al, ch
    call pBin_b
     mov al, 10
    call putchar

    mov ah, 0x48
    or ch, ah
    mov al, ch
   call pBin_b

    mov al, 10
    call putchar 
	call putchar

    mov bp, 0x67DA  ;inciso f
    mov ax, bp
    call pBin_w
    mov al, 10
    call putchar 

    mov ax, 0xBBAD
    and bp, ax
    mov ax, bp
    call pBin_w

    mov al, 10
    call putchar 
	call putchar

	shr bp, 3   ;inciso g
    mov ax, bp
    call pHex_w

    mov al, 10
    call putchar 
	call putchar


    mov ebx, 0xFD135BA   ;inciso h
    shr ebx, 5 
    mov eax, ebx
    call pHex_dw

    mov al, 10
    call putchar 
	call putchar

    shl cx, 3   ;inciso i
    mov ax, cx
    call pHex_w

    mov al, 10
    call putchar 
	call putchar

    pop esi      ;inciso j
    mov eax, esi
    call pHex_dw

    mov al, 10
    call putchar 
	call putchar

    mov eax, esi     ;inciso k
    shl eax, 1                
    shl esi, 3                
    add eax, esi              
    call pHex_dw

    mov al, 10
    call putchar 
	call putchar


	mov eax, 1
	int 0x80        