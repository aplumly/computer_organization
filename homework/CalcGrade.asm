;Austin Plumly
;Computer Organization
;COSC 2325 2801
;4/12/2020

;Create a procedure named CalcGrade that receives an integer value
;between 0 and 100, and returns a single capital letter in the AL
;register. Preserve all other register values between calls to the
;procedure. The letter returned by the procedure should be according
;to the following ranges:

;Score Range Letter Grade
;-------------------------
;90 to 100 A
;80 to 89 B
;70 to 79 C
;60 to 69 D
;0 to 59 F

;Write a test program that generates 10 random integers between 50 and 100,
;inclusive. Each time an integer is generated, pass it to the CalcGrade
;procedure. You can test your program using a debugger, or if you prefer
;to use the book's library, you can display each integer and its corresponding letter grade.
;letter grade.

.386
.model flat,stdcall
.stack 4096
includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib
include C:\Irvine\Irvine32.inc




.data
n = 10
j = 50
k = 100
_array dword n dup (?)


.code
main proc
    mov eax, 0
    mov ebx, 0
    mov ecx, n
    mov edx, 0
    
    lea esi,_array
    call fill_array
    call write_array
    
    call crlf

    call calc_grades



    mov  ecx,0
    call ExitProcess

exit
main endp


;array to fill in esi
;array size in ecx
;range should be stored in variables j-k
;(this is probaly not a good design decision but i've decided to leave it like this for some reason)
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

;array to print in esi
;array size in ecx
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


;array to be graded in esi
;sizeof in ecx
calc_grades proc
    pusha
    CL1:
        mov ebx, 10
        mov eax, [esi]
        mov dx, 0
        mov dl, 41h
        cmp eax, 90
        jge _end
        inc dl
        cmp eax, 80
        jge _end
        inc dl
        cmp eax, 70
        jge _end
        inc dl
        cmp eax, 60
        jge _end
        add dl, 2

        _end:
            call WriteInt
            mov al, 3Ah
            call WriteChar
            mov ax, dx
            call WriteChar
            call crlf
        add esi, 4

        loop CL1

    popa
    ret
calc_grades endp

end main