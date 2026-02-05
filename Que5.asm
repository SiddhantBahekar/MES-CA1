ORG 0000H

MOV R0, #40H       ; Read pointer
MOV R1, #40H       ; Write pointer
MOV R2, #20H       ; Counter = 32 bytes

SCAN:
    MOV A, @R0     ; Read data
    CJNE A, #0FFH, VALID
    SJMP SKIP      ; If FFH ? skip

VALID:
    MOV @R1, A     ; Store valid data
    INC R1         ; Advance write pointer

SKIP:
    INC R0         ; Advance read pointer
    DJNZ R2, SCAN  ; Repeat for all bytes

; Fill remaining memory with 00H
MOV A, #00H

FILL:
    CJNE R1, #60H, CONT
    SJMP DONE

CONT:
    MOV @R1, A
    INC R1
    SJMP FILL

DONE:
END