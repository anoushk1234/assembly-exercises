; print hello
global _start

_start:
        ; write
        mov rax, 1
        mov rdi, 1 ; STDOUT
        lea rsi, [message]       ; load effective address
        mov rdx, 8
        syscall

        ; exit
        mov rax, 60
        mov rdi, 65
        syscall
        
message:
        db `Hello\n`




