D SEGMENT
    var DD 1245678H,10258369H,123H,12365498H,7852H
    RES DD ?
D ENDS
C SEGMENT
    START:
        MOV AX,D
        MOV DS,AX
        MOV AX,0
        MOV SI,0
        MOV CX,5
    ARRAY:
        ADD AX,var[SI]
        ADC BX,var[SI+2]
        ADD SI,4
        LOOP ARRAY
        MOV WORD PTR RES,AX
        MOV WORD PTR RES+2,BX
C ENDS
END START