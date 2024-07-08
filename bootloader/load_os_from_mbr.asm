;******************************************
; Bootloader.asm
; A Simple Bootloader
;******************************************
org 0x7c00
bits 16
start: jmp boot

;; constant and variable definitions
msg	db	"Welcome to My Operating System!", 0ah, 0dh, 0h

boot:
  cli	; no interrupts
  cld	; all that we need to init

  mov		ax, 0x50

  ; ;; set the buffer
	mov	es, ax
	xor	bx, bx ;we are going to read the sector into es:bx which is 0x500 

  	mov	al, 2		        ; read 2 sector
	mov	ch, 0x0			; we are reading the second sector past us, so its still on track 0
	mov	cl, 0x2		      ; sector to read (The second sector)
	mov	dh, 0x0		      ; head number
	mov	dl, 0x0		      ; drive number. Remember Drive 0 is floppy drive.

  mov	ah, 0x02			      ; read floppy sector routine
  int	0x13				      ; call BIOS - Read the sector
  jmp  0x500	;jumping to 0x500 (we read the sectors into this address)
		; We have to be 512 bytes. Clear the rest of the bytes with 0
	;hlt ;
times 510 - ($-$$) db 0
  dw 0xAA55				  ; Boot Signiture
