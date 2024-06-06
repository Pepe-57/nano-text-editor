org 0x7c00

bits 16

start:
    mov bx, msg
    call print_str
    mov al, 0x0d
    call print_chr
    mov al, 0x0a
    call print_chr
    jmp text_editor
    msg db 'Text editor v1.1', 0
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

print_str:
    mov ah, 0x0e
print_loop:
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    inc bx
    jmp print_loop
end:
    ret

times 510-($-$$) db 0
dw 0xaa55
