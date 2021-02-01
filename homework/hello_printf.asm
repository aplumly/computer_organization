includelib  legacy_stdio_definitions.lib
includelib legacy_stdio_wide_specifiers.lib
includelib ucrt.lib
extern printf: PROC
;try puts
.data
msg db 'hello world', 0Ah, 00

.code
main proc
    sub rsp, 40
    lea rcx, msg
    call printf
    add rsp, 40
    ret
main endp

End