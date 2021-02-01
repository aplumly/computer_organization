;Austin Plumly
;3/21/2020
;Write a program that displays a single character in all possible combinations of foreground and background colors (16 X 16 = 256). 
;The colors are numbered from 0 - 15, so you can use a nested loop to generate all possible combinations.


.386
.model flat,stdcall
.stack 4096
includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib
include C:\Irvine\Irvine32.inc

.data
str1 byte "A",0

.code
main proc


mov ecx,255 ; loop counter
L1: 
	mov eax,ecx		;mov current count to eax to set the color
	call SetTextColor
	mov edx,OFFSET str1
	call WriteString
	loop L1


exit
main endp
end main