        ORG     0000H
        SJMP     START

START:
        MOV     A, 50H
        MOV     R1, A

        MOV     A, 51H
        MOV     R2, A

        MOV     A, R1
        JZ      CHECK_R2_INITIAL
        SJMP     COMPARE_LOOP

COMPARE_LOOP:
        MOV     A, R1
        DEC     A
        MOV     R1, A
        JZ      R1_REACHED_ZERO

        MOV     A, R2
        DEC     A
        MOV     R2, A
        JZ      R2_REACHED_ZERO

        SJMP     COMPARE_LOOP

R1_REACHED_ZERO:
        MOV     A, R2
        DEC     A
        MOV     R2, A
        JZ      NUMBERS_EQUAL

        MOV     R0, #0FFH
        SJMP     STORE_RESULT

R2_REACHED_ZERO:
        MOV     R0, #01H
        SJMP     STORE_RESULT

CHECK_R2_INITIAL:
        MOV     A, R2
        JZ      NUMBERS_EQUAL

        MOV     R0, #0FFH
        SJMP     STORE_RESULT

NUMBERS_EQUAL:
        MOV     R0, #00H
        SJMP     STORE_RESULT

STORE_RESULT:
        MOV     A, R0
        MOV     52H, A
        SJMP     PROGRAM_END

PROGRAM_END:
        SJMP     PROGRAM_END

        END
