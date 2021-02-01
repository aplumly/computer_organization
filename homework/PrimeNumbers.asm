;Austin Plumly
;Computer Organization
;COSC 2325 2801
;4/22/2020
;Write a program that generates all prime numbers between 2 and 1000, using the Sieve of Eratosthenes method.
;You can find many articles that describe the method for finding primes in this manner on the internet.
;Display all the prime values.






.386
.model flat,stdcall
.stack 4096
includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib
include C:\Irvine\Irvine32.inc


PrintPrimes PROTO, count:DWORD

FIRST_PRIME = 2
LAST_PRIME = 1000
SIZE_OF_DWORD = 4

.data
commaStr BYTE ", ",0
temp    DWORD 0
curpos  DWORD 0


.data?
sieve DWORD LAST_PRIME DUP(?) 

.code
main proc
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0
    



    call fillArray
    call filter
    call printArray






    mov  ecx,0
    call ExitProcess

exit
main endp
            ;fills array with FIRST_PRIME - LAST_PRIME
fillArray proc
    pusha
    lea esi, sieve
    mov ecx, FIRST_PRIME
    _loop:
        cmp ecx, LAST_PRIME
        jg _end
        mov [esi],ecx
        inc ecx
        add esi, SIZE_OF_DWORD
        jmp _loop
    _end:
    popa
    ret
fillArray endp



filter proc
    pusha


                    ;load address of sieve then store the last address of sieve in temp
    lea esi, sieve
    mov eax, SIZE_OF_DWORD
    mov ecx, LAST_PRIME
    mul ecx
    mov edx, eax
    add edx, esi
    lea ecx, temp
    mov [ecx], edx
                    ;save the begining of the array in curpos
    lea ecx, curpos
    mov [ecx], esi
                    ;get the offset (currentprime*sizeofdword) to find next multiple
    l2:
    mov eax, [esi]
    mov ecx, SIZE_OF_DWORD
    mul ecx
    add esi, eax


                   ;move end of the array into temp and move 0 to ecx
                   ;ecx (0) will be passed into non prime numbers
    mov edx, temp
    mov ecx, 0


                   ;adds the offset to esi & replaces [esi] with 0 until the end of the array is reached
    l1:
        cmp esi, edx
        jge _next
        mov [esi], ecx
        add esi, eax
        jmp l1

    _next:

                ;find next prime number. iterates through array until non zero value is reached, then jumps back to filter
    mov esi, curpos
    l3:
        add esi, SIZE_OF_DWORD
        lea ecx, curpos
        mov [ecx], esi
        mov ecx, 0
        cmp esi, edx
        jge _finish
        cmp [esi], ecx
        jg l2
        jmp l3 



    _finish:
    popa
    ret
filter endp





                       ;prints the array, does not print 0
printArray proc
    pusha
    lea esi, sieve
    mov ecx, FIRST_PRIME
    _loopPrintArray:
        cmp ecx, LAST_PRIME
        jg _EndPrintArray
        mov eax, [esi]
        cmp eax, 0
        je skip
        call WriteDec
        lea edx, commaStr
        call WriteString
        skip:
        add esi, SIZE_OF_DWORD
        inc ecx
        jmp _loopPrintArray
    _EndPrintArray:
    popa
    ret
printArray endp






end main