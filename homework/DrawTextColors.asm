;Austin Plumly
;3/21/2020
;Write a program that displays the same string in four different colors, using a loop. Call the SetTextColor procedure from the book's link library.
;Any Colors may be chosen, but you may find it easierst to change the foreground color.


.386
.model flat,stdcall
.stack 4096
includelib C:\Irvine\Kernel32.Lib
includelib C:\Irvine\User32.Lib
includelib C:\Irvine\Irvine32.lib
include C:\Irvine\Irvine32.inc

.data
str1 byte "This line is displayed in color",0

.code
main proc


mov ecx,4 ; loop counter

L1: mov eax,ecx ;use the current count as our color
	call SetTextColor
	mov edx,OFFSET str1
	call WriteString
	call Crlf
	loop L1

exit
main endp
end main