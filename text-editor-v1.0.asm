org 0x7c00

bits 16

start:
    mov al, 't'
    call print_chr
    mov al, 'e'
    call print_chr
    mov al, 'x'
    call print_chr
    mov al, 't'
    call print_chr
    mov al, ' '
    call print_chr
    mov al, 'e'
    call print_chr
    mov al, 'd'
    call print_chr
    mov al, 'i'
    call print_chr
    mov al, 't'
    call print_chr
    mov al, 'o'
    call print_chr
    mov al, 'r'
    call print_chr
    mov al, ' '
    call print_chr
    mov al, 'v'
    call print_chr
    mov al, '1'
    call print_chr
    mov al, '.'
    call print_chr
    mov al, '0'
    call print_chr
    mov al, 0x0d
    call print_chr
    mov al, 0x0a
    call print_chr
    jmp text_editor
text_editor:
    call read
    call print_chr
    call if_enter
    call if_backspace
    jmp $

if_enter:
    cmp al, 0x0d
    jne text_editor
    mov al, 0x0a
    call print_chr
    mov al, 0x0d
    call print_chr
    ret

if_backspace:
    cmp al, 0x08
    jne text_editor
    mov al, 0x08
    call print_chr
    ret

read:
    mov ah, 0x00
    int 0x16
    ret

print_chr:
    mov ah, 0x0e
    int 0x10
    ret

times 510-($-$$) db 0
dw 0xaa55
