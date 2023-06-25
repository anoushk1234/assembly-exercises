; take an input and send that as output
global _start

_start:
        ; sys_write
        mov rax, 1
        mov rdi, 1 ; STDOUT
        lea rsi, [message]       ; load effective address
        mov rdx, 15
        syscall
        
        ; sys_read
        mov rax, 0
        mov rdi, 0 ; STDIN
        lea rsi, [rsp+3]
        mov rdx, 3
        syscall

        ; sys_write
        mov rax, 1
        mov rdi, 1 ; STDOUT
        lea rsi, [rsp+3]       ; load effective address
        mov rdx, 3
        syscall

        ; sys_exit
        mov rax, 60
        mov rdi, 65
        syscall
        
message:
        db `Input a number\n`





