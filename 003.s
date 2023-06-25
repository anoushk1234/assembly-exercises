; sum of two numbers and product of two numbers

global _start

buffer: times 16 db 0
section .bss
    num1: resb 8  ; Reserve a 8-byte buffer for input
    num2: resb 8  ; Reserve a 8-byte buffer for input
    sum: resb 8  ; Reserve a 16-byte buffer for output
    product: resb 64  ; Reserve a 16-byte buffer for output
section .text
    global _start
_start:
    ; write
    mov rax, 1
    mov rdi, 1
    lea rsi, [first_number]
    mov rdx, 16
    syscall

    ; read
    mov rax, 0
    mov rdi, 0
    lea rsi, [num1]
    mov rdx, 8
    syscall

    ; write
    mov rax, 1
    mov rdi, 1
    lea rsi, [second_number]
    mov rdx, 25
    syscall

    ; read
    mov rax, 0
    mov rdi, 0
    lea rsi, [num2]
    mov rdx, 8
    syscall

    ; calculate sum
    mov rsi, [num1]
    sub rsi,'0'
    mov rdi, [num2]
    sub rdi,'0'
    add rsi, rdi
    add rsi, '0'
    mov [sum], rsi
    
    ; write
    mov rax, 1
    mov rdi, 1
    lea rsi, [sum]
    mov rdx, 8
    syscall

    ; product
    mov rsi, [num1]
    sub rsi, '0'
    mov rdi, [num2]
    sub rdi,'0'
    imul rsi, rdi
    add rsi, '0'
    mov [product], rsi

    ; write
    mov rax, 1
    mov rdi, 1
    lea rsi, [product]
    mov rdx, 64
    syscall
    
    ; exit
    mov rax, 60
    mov rdi, 65
    syscall

first_number:
    db `Enter a number: \n`

second_number:
    db `Enter second number: \n`

; product_result:
;     db `Product of two numbers is: `
