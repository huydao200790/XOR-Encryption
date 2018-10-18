;Modified by: Huy Dao
;Compiler: visual studio 2010
;title HW6
;This program count character in string
;Date: 12/6/2016

INCLUDE Irvine32.inc
.data
msg BYTE "Enter a string of characters: ",0
time BYTE " time ", 0;
charInput BYTE 132 DUP(0)
byteCount DWORD ?

arraycount BYTE 127 DUP(0)

     .code
main proc
	xor eax,eax
	lea edx, msg
    call WriteString
	mov edx, OFFSET charInput
	mov ecx, SIZEOF charInput
    call ReadString
	mov byteCount,eax

	mov esi,OFFSET charInput
	
	XOR EBX,EBX				;clear regester
	XOR EAX,EAX
	XOR EDX,EDX
	
	mov ecx,byteCount
	l1:
	mov al,[esi+ebx]		;go through each the charInput
	sub eax,0				;so that Character will equal to asscii number
	
	mov dl,[arraycount+eax] 
	inc dl					;increase character count
	mov [arraycount+eax],dl	
	
	inc ebx
	loop l1
	
	mov ecx,127
	xor ebx,ebx			
l2:
	cmp [arraycount+ebx],0
	jne output
	jmp aa

output:
	mov eax,ebx
	add eax,0      
	
	cmp eax,' '
	je aa
	call WriteChar				;output result
	lea edx, time
    call WriteString
	mov al,[arraycount+ebx]
	call WriteDec
	call Crlf
aa:
	inc ebx
	loop L2

l3:
	
	
	call DumpRegs
    call WaitMsg
     exit

main ENDP
END main

