;Austin Plumly
;Computer Organization
;COSC 2325 2801
;4/29/2020
;Create a procedure named FindThrees that returns 1 if an array has three consecutive values of 3 somewhere in the array. 
;Otherwise, return 0. The procedure’s input parameter list contains a pointer to the array and the array’s size. 
;Use the PROC directive with a parameter list when declaring the procedure. Preserve all registers (except EAX) that are modified by the procedure. 
;Write a test program that calls FindThrees several times with different arrays.





.386
.model flat,stdcall
.stack 4096
includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib
include C:\Irvine\Irvine32.inc
FindThrees proto aPtr:PTR SDWORD, arraySize:DWORD


.data
commaStr BYTE ", ",0
Array1 sdword  4, 6, 3, 3, 2, 5          ; false
Array2 sdword 3,3,3,9,5                  ; true
Array3 sdword 1,2,3,3,4,3,3,3,9          ; true
Array4 sdword 1,2,4,-4,-5,9              ; false

.code
main proc
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0
    

    invoke findThrees, ADDR Array1, LENGTHOF Array1
    call WriteInt
    
    invoke findThrees, ADDR Array2, LENGTHOF Array2
    call WriteInt

    invoke findThrees, ADDR Array3, LENGTHOF Array3
    call WriteInt

    invoke findThrees, ADDR Array4, LENGTHOF Array4
    call WriteInt
    mov  ecx,0
    call ExitProcess

exit
main endp

findThrees proc aPtr:PTR SDWORD, arraySize:DWORD
                ;push registers
    push ebx
    push ecx
    push edx
    push esi
                ;array address in esi and size in ecx
    mov esi, aPtr
    mov ecx, arraySize
    mov edx, [esi]
    


    l1:             ;if ecx is 0, no multiples found. jump to false
        cmp ecx, 0
        je fal
                    ;compare current value to last value stored in edx
        add esi, 4
        sub ecx, 1
        mov eax, [esi]
        cmp eax, edx
        je same     ;if compared == jump to same
        mov edx,eax ;else move current value to edx and loop
        jmp l1
        same:       ;move current value to edx, move next value to eax and compare. jump true if cmp == else jump back to l1
            mov edx,eax
            add esi, 4
            sub ecx, 1
            mov eax, [esi]
            cmp eax, edx
            je tru
            mov edx, eax
            jmp l1

    fal:
    mov eax,0
    jmp _end
    tru:
    mov eax,1
    _end:

    pop esi
    pop edx
    pop ecx
    pop edx
    ret
findThrees endp



end main