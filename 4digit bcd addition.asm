d segment
   bcd dw 5623H,8569H,8102H
    res   dw ?
   
d ends


c segment 
    Assume: cs:c, ds:d
start:
    mov ax, d
    mov ds, ax  
   
    xor ax,ax
    mov cx,3
    mov si,0
    
    next:
        adc al,byte ptr bcd[si]
        daa 
        mov dl,al
        adc ah,byte ptr bcd[si+1]
        mov al,ah
        daa    
        mov ah,al
        mov al,dl
        inc si
        inc si
        LOOP next  
        
        mov res,ax
        
         
   
   
c ends

end start