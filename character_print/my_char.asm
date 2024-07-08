; bootloader.asm 
; A Simple bootloader
;********************************************
org 0x7c00
bits 16
start: jmp boot

;; constant and variable definitions 

msg db "Welcome to SanOS", 0ah, 0dh, 0h

boot:
	cli; no interrupts, this doesn't affect software interrupts
	cld ; all that we need to init
	mov ah, 0x09 ;See ralfh's interrupts
	mov bh,0 ;this is page number, still can't figure out what this is
	mov bl, 01101011b ;this is the color information
	mov cx, 5 ; this is number times to show the character
	mov al, '#' ;this is the character that needs to be drawn
	int 10h ;this is the interrupt that needs to evoked

	hlt ; halt the system

; We have to be 512 bytes. Clear the rest of the bytes with 0 

times 510 - ($-$$) db 0
dw 0xAA55	; Boot signature
