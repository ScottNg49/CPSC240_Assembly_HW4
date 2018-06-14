TITLE Reverse an array (testasm5.asm)
;     Name: Scott Ng
; Due Date: 3-22-17
; Visual Studio 2012
; Reverse the contents of an array
; Write a prpogram with a loop and indirect addressing
INCLUDE Irvine32.inc
.data
dwarray dword 3, 9, 15, 6, 26, 35, 2, 19
.code
main PROC
	xor esi, esi                             ; clearing the contents for esi
	xor ecx, ecx                             ; clearing the contents for ecx

	mov esi, OFFSET dwarray                  ; getting the address/pointer for dwarry
	mov ecx, LENGTHOF dwarray                ; getting the length of the array into the loop counter
	                                         ; moves 8 into ecx

L1:
	mov eax, [esi]                           ; moves the contents at esi into eax
	push eax                                 ; saves eax on stack
	add esi, TYPE dwarray	                 ; moving the pointer forward by 4
	loop L1                                  ; loops until ecx is 0 

	mov ecx, LENGTHOF dwarray                ; restoring ecx counter to 8 for pop
	mov esi, OFFSET dwarray                  ; sets the index register back to 0

L2:
	pop eax                                  ; inversely restoring contents into eax
	mov [esi], eax                           ; moving eax into the address of esi
	add esi, TYPE dwarray                    ; moves the pointer forward by 4
	loop L2                                  ; loops until ecx is 0

	mov esi, OFFSET dwarray                  ; sets pointer to address for dwarray
 	mov ecx, LENGTHOF dwarray                ; sets ecx for number of elements displayed
	mov ebx, TYPE dwarray                    ; increments by 4 per ecx tick
	call DumpMem                             ; displys memory at esi location

	call DumpRegs                            ; display registers (Kips Library call)
	call WaitMsg                             ; Displays Press any key to continue and waits for key to be pressed
	exit	
main ENDP
END main