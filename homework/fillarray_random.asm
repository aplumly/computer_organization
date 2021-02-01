;Austin Plumly
;Computer Organization
;COSC 2325 2801
;4/12/2020
;Create a procedure that fills an array of doublewords with N random integers, making sure the values fall within the range j...k, inclusive.
;When calling the procedure, pass a pointer to the array that will hold the data, pass N, and pass the values of j and k. Preserve all register 
;values between calls to the procedure. Write a test program that calls the procedure twice, using different values for j and k. Verify your results using a debugger. 


.386
.model flat,stdcall
.stack 4096
includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib
include C:\Irvine\Irvine32.inc




.data
n = 30
j = 1
k = 6
_array dword n dup (?)


.code
main proc
    mov eax, 0
    mov ebx, j
    mov ecx, n
    mov edx, 0
    
    lea esi,_array
    call fill_array
    call write_array
    call crlf
    call fill_array
    call write_array




    mov  ecx,0
    call ExitProcess

exit
main endp



fill_array proc
    pusha

    call Randomize
    L1:
        mov eax, k
        sub eax, j
        inc eax
        call RandomRange
        add eax, j
        mov [esi],eax
        add esi, 4
        loop L1

    popa
    ret
fill_array endp

write_array proc
    pusha
    WL1:
        mov ebx, 10
        mov eax, [esi]
        add esi, 4
        call WriteInt
        loop WL1
    popa
    ret
write_array endp



end main