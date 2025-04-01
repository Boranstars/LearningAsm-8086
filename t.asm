.386
DATA SEGMENT
DATA ENDS
CODE 	SEGMENT
	START:
	mov AX,DX

	mov DS,AX
	mov CS:[07H],0CFH
	; in AL,60H
	
	; mov DL,AL

	; mov AH,02H
	; int 21H
	
	
	mov AH,4CH
	int 21H
CODE 	ENDS 
END START