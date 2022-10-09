;Max's first assembly language experiment
;
;'Hello, world!' in assembly language
;
; to build an executable:
;	nasm -f elf hello_world.asm
; 	ld -s -o hello_world hello_world.o
global _start:

; Export the entry point to the ELF linker or loader. The conventional
; entry point is '_start'. Use 'ld -e foo' to override the default
 

section .data:
	message: db "Hello, world!", 0x	; our string
	message_length equ $-message:		; length of string

section .text:

;linker puts the entry point here:
_start:

;Write the string to stdout:

  mov edx, message_length ;message length
  mov ecx, message 	;message to write
  mov ebx, 1 		;file descriptor (stdout)
  mov eax, 0x4 ;system call number (sys_write)
  int 0x80  ;call kernel

; Exit via the kernel:

  mov eax, 0x1  ; system call number (sys_exit)
  mov ebx, 0  ;process exit code
  int 0x80   ;call kernel - this interrupt won't return

