
ExitProcess proto

.data
sum sqword 0
a   sqword 42
b   sqword 15
c   sqword 21
d   sqword 53
                ;sum of these is 131.
.code
main proc
mov al,  00001111b
test  al,  00000010b 
mov al, 00000110b
cmp al, 00000101b



   mov  ecx,0
   call ExitProcess

main endp
end