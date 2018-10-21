DATA SEGMENT
             
    X DW 2508H
    Y DW 6000H
    Z DW 9200H 
    RES DW ?
    
DATA ENDS

CODE SEGMENT
    
    ASSUME:  CS:CODE,DS:DATA
    
START: 
    MOV AX,DATA  
    MOV DS,AX      
    MOV AL,BYTE PTR X        
    MOV AH,BYTE PTR X+1       
    ADD AL,BYTE PTR Y         
    ADC AH,BYTE PTR Y+1 
    ADD AL,24H             
    ADC AH,00H                
    SUB AL,BYTE PTR Z         
    SBB AH,BYTE PTR Z+1      
    MOV BYTE PTR RES,AL       
    MOV BYTE PTR RES+1,AH    

CODE ENDS

END START