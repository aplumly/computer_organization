;Austin Plumly
;Computer Organization
;COSC 2325 2801
;2/14/2020
;Write a program that defines symbolic constants for all seven days of the week. Create an array variable that uses the symbols as initializers.

;The hardest part of this assignment is figuring out what the problem is asking for. There is a section in the book and in the PPT about Symbolic Constants.
;There are three types. The first thing you want to do is define 7 variables (names) that represent the seven days of the week and assign them a unique value. 
;Look at the name of this assignment to determine what type value should be assigned. Then define an array and use the seven variables you just defined to initialize the array. 
;For extra credit, display the values that are in the array.

includelib  legacy_stdio_definitions.lib
includelib legacy_stdio_wide_specifiers.lib
includelib ucrt.lib
extern printf: PROC

ExitProcess proto

.data
    monday          =       6e6f6dh  
    tuesday         =       657574h
    wednesday       =       646577h
    thursday        =       756874h
    friday          =       697266h
    saturday        =       746173h
    sunday          =       6e7573h
    printvar        QWORD   ?
    days            DWORD   monday,tuesday,wednesday,thursday,friday,saturday,sunday
    endofdays       QWORD   $



.code
main proc

                                ;set our registers to 0
    mov rcx,0
    mov rax,0
    mov rbx,0
                                ;this bit feels a bit hacky: for some reason "endofdays" value was set as the start address of "days"
                                ;this was my workaround to free up the rdx register
    lea rdx, endofdays          ;get address for end of days array
    mov endofdays,rdx           ;tell end of days where it actually is
    mov rdx,0
                                ;note to self: look up proper usage of $



    lea rbx, days               ;get address for days array

    _loop:                      ;loop through the array
        mov rax, 0
        mov rax, 0dh                ;add carriage return values to rax
        shl rax, 8                  ;and shift them over
        add rax, 0ah
        shl rax, 24                  ;shifing
        mov rcx, [rbx]              ;grab the value at address pointed to by rbx
        shl rcx, 32                 ;shift left 4 bytes
        shr rcx, 32                 ;then right to clear the extra byte
        add rax,rcx                 ;add the string to our "next line" values
        mov printvar,rax
                                    ;print the char to the console
        sub rsp, 40
        lea rcx, printvar
        call printf
        add rsp, 40

        add rbx, 4                  ;add 4 to get the next set of values
        cmp rbx,endofdays           ;cmp current address to end of the array
        jne _loop                   ;if not equal, run it again


    mov  ecx,0
    call ExitProcess

main endp
end