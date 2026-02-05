ORG 0000H

MOV A, #0AH        ; A = 10
MOV B, #6BH        ; B = 107

MUL AB             ; 10 × 107 = 1070 ? B:A = 04 2EH

ADD A, #07H        ; 1070 + 7 = 1077
JNC NEXT
INC B

NEXT:
MOV 30H, A         ; Store low byte (35H)
MOV 31H, B         ; Store high byte (04H)

END
