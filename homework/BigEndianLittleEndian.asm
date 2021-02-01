;Austin Plumly
;Computer Organization
;COSC 2325 2801
;2/29/2020
;Write a program that uses the variables below and MOV instructions to copy the value from bigEndian to littleEndian, reversing the order of the bytes.
;The number's 32 - bit value is understood to be 12345678 hexadecimal. 



ExitProcess proto

.data
    
    bigEndian       BYTE    12h, 34h, 56h, 78h
    littleEndian    DWORD   ?
    




.code
main proc

                                ;set our registers to 0
    mov rax,0
    mov ah,[bigEndian+3]       
    mov al,[bigEndian+2]        
    shl eax, 16                 ;grabbed two values and shifted them left
    mov ah,[bigEndian+1]
    mov al,[bigEndian]
    mov littleEndian,eax        ;move the 32 bits into our dword
 
    call ExitProcess

main endp
end