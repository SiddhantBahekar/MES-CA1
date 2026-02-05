ORG 0000H

MOV R0, #30H
MOV A, @R0       ; Indirect addressing
MOV 50H, A       ; Store output in memory (EdSim box)

END
