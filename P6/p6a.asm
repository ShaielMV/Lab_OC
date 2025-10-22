%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point
    mov eax, 0x2219166
	mov ebx, 0x5C4B2A60
    add dword ebx
	call pHex_dw	; muestra en pantalla 64

	mov al,10	; cambio de linea
	call putchar

	


	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

