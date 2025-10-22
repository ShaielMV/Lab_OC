%include "../LIB/pc_iox.inc"
	
	

	section	.text
	global _start  

	section .data
	N dw 0    
	
_start: 
	mov eax, 0x2219166
	mov ebx, 0x5C4B2A60
    add eax, ebx

	call pHex_dw	

	mov al,10	
	call putchar 	;fin inciso a

	push bx
	mov ax, bx
	call pHex_w	

	mov al,10	
	call putchar 	;fin inciso b


	mov al, 8
	mul bl
	mov [N], ax
	call pHex_w	

	mov al,10	
	call putchar	 ;fin inciso c

	inc word [N]
	mov ax, [N]

	call pHex_w

	mov al,10	
	call putchar 	;fin inciso d

	mov ax, bx
	mov bx, 0xFF
	div bx
	call pHex_w

	mov al,10	
	call putchar

	mov ax, dx
	call pHex_w

	mov al,10	
	call putchar 	;fin inciso e

	add [N], dx
	mov ax, [N]
	call pHex_w

	mov al,10	
	call putchar 	;fin incisio f

	dec word [N]
	mov ax, [N]
	call pHex_w

	mov al,10	
	call putchar

	pushf
	pop ax
	call pHex_w    

	mov al, 10
	call putchar 	;fin inciso g

	pop ax
	call pHex_w

	mov al,10
	call putchar 	;fin inciso h

	
	mov eax, 1
	int 0x80        



 	
 	