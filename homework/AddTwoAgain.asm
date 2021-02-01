;Austin Plumly
;Computer Organization
;COSC 2325 2801
;1/26/2020
;Using the AddTwo program, write a program that calculates the following expression,
;using registers: A = (A + B) + (C + D). Assign integer values to the EAX, EBX, ECX, and EDX registers.



ExitProcess proto

.data
sum dword 0
a   dword 42
b   dword 15
c   dword 21
d   dword 53
                ;sum of these is 131.
.code
main proc
   ;assigned method
   ;using four registers, but why would we do it like this?
   ;--------------------------------------
   mov eax,a
   mov ebx,b
   mov ecx,c
   mov edx,d
   add eax,ebx
   add ecx,edx
   add eax,ecx
   mov sum,eax
   ;--------------------------------------
   ;it seems we could achieve the same goal with less instructions.
   ;--------------------------------------
   ;mov  ebx,c    ;move c to ebx 
   ;add  ebx,d    ;add d to c : (c+d)
   ;mov  eax,a    ;move a to eax
   ;add  eax,b    ;add b to a : (a+b)
   ;add  eax,ebx  ;add the two registers together : (a+b)+(c+d)
   ;mov  sum,eax  ;store the value of eax to sum
   ;---------------------------------------
   ;i feel like we could do better than this because (a+b)+(c+d) = a+b+c+d.
   ;this should do the same thing without moving things around as much.
   ;i'm suspecting that when using () in situations that don't require their use in higher level languages yeilds less effecient machine code?
   ;---------------------------------------
   ;mov eax,a
   ;add eax,b
   ;add eax,c
   ;add eax,d
   ;mov sum,eax

   mov  ecx,0
   call ExitProcess

main endp
end