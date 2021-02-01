;Austin Plumly
;Computer Organization
;COSC 2325 2801
;3/8/2020
;Write a program that uses a loop to calculate the first seven values of the Fibonacci number
;sequence described by the following formula: Fib(1) = 1, Fib(2) = 1, Fib(n) = Fib(n -1) +Fib(n-2).

includelib  legacy_stdio_definitions.lib
includelib legacy_stdio_wide_specifiers.lib
includelib ucrt.lib
extern printf: PROC

ExitProcess proto

.data
    
    
    count           QWORD   -1          ;start count at -1
    printvar        QWORD   ?
    dig             QWORD      " ,d%"    ;prints digits using printf



.code
main proc

                                    ;clear our registers
    mov rcx,0
    mov rax,0
    mov rbx,0
    mov rdx,0



    _loop:                      
        mov rdx, count      ;increase count by 1
        inc rdx
        mov count, rdx
                            ;setup variables for fib calculation
        mov rax,1
        mov rbx,0
        mov rcx,0
        fib:                ;calculate fib(count //stored in rdx) result will be stored in rbx
            cmp rdx,-1
            je _end
            mov rcx,rax
            add rax,rbx
            mov rbx,rcx
            dec rdx
            jmp fib

        _end:
        

                                    ;print the char to the console
        sub rsp, 40
        mov rdx,rbx                 ;move integer stored in rbx to rdx to be printed
        lea rcx, dig                ;load address of " %d" string
        call printf                 ;call printf function
        add rsp, 40
                                    ;check if count is equal to our desired number of iterations and jump if not equal
        mov rdx,count               
        cmp rdx, 7                  ;0-6 should give us our first 7, but i'll just put 7
        jne _loop

 
    call ExitProcess

main endp
end



;REVISITED/REVISED/REFACTORED!
;this one is better
;more effecient
;the other would be better if i just wanted a fibonacci function
;I wish I had turned this in

;Austin Plumly
;Computer Organization
;COSC 2325 2801
;2/1/2021
;Write a program that uses a loop to calculate the first seven values of the Fibonacci number
;sequence described by the following formula: Fib(1) = 1, Fib(2) = 1, Fib(n) = Fib(n -1) +Fib(n-2).

; includelib  legacy_stdio_definitions.lib
; includelib legacy_stdio_wide_specifiers.lib
; includelib ucrt.lib
; extern printf: PROC

; ExitProcess proto

; .data
    
    

;     dig             QWORD      " ,d%"    ;prints digits using printf



; .code
; main proc

;                                     ;clear our registers
;     mov rcx,0
;     mov rax,1
;     mov rbx,0
;     mov rdx,20

;     fib:
;             cmp rdx, -1
;             je _end
;             mov rcx,rax
;             add rax,rbx
;             mov rbx,rcx
;             push rax
;             push rbx
;             push rdx
;             push rcx
;             sub rsp,40
;             mov rdx,rbx                 ;move integer stored in rbx to rdx to be printed
;             lea rcx, dig                ;load address of " %d" string
;             call printf
;             add rsp,40
;             pop rcx
;             pop rdx
;             pop rbx
;             pop rax
;             dec rdx
;             jmp fib
;         _end:
;         mov rcx, 0

 
;     call ExitProcess

; main endp
; end