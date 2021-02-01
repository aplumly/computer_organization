;AddTwo.asm
;Austin Plumly
;Computer Organization
;COSC 2325 2801
;1/21/2020
;This assignment will have you create your first assembly language project named AddTwo. The source code for AddTwo is provided in your book on page 63 and the complete name is AddTwo.asm. I would like for you to view the provided video on how to get started with Visual Studio and create an assembly language project. The video was created by Fred Kennedy, a professor in California and explains the steps to creating this file. You will provide a commented heading with the following information on it.
; AddTwoSum_64.asm - Chapter 3 example.


ExitProcess proto

.data
sum qword 0

.code
main proc
   mov  rax,5
   add  rax,6
   mov  sum,rax

   mov  ecx,0
   call ExitProcess

main endp
end