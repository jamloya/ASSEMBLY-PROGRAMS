   DATA SEGMENT
    SUM DD 0
    ARRAY Dw 345H,0251H, 300H, 421H, 59H, 2878H, 900H, 78H, 100H, 6789H  
              
DATA ENDS
    
    
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START: 
        MOV AX, DATA       
        MOV DS, AX                  
        MOV SI, 0
        LEA BX, ARRAY               
        MOV CX, 10              
        MOV AX, 0
        MOV DX, 0                   
        
    ADDARRAY:
        ADD Al, BX[SI]              
        ADD SI, 1                   
        ADC ah, BX[SI]              
        ADD SI, 1                   
        LOOP ADDARRAY
        MOV BYTE PTR SUM, Al     
        MOV BYTE PTR SUM + 1, ah    
    
CODE ENDS
    END START