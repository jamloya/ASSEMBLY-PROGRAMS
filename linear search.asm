d segment
    var db 1h,6h,9h,5h,3h 
    el db ?
    found db 'element found','$'
    nfound db 'element not found','$'
d ends
c segment
    start:
        mov ax,d
        mov ds,ax
        mov ax,0
        mov ah,1h
        int 21h 
        shl al,4
        shr al,4    ;taking input from user
        mov el,al   ;storing input into element
        mov cx,5
        mov si,0
        
    
    lsearch:
        mov al,var[si]
        sub al,el 
        jz elfound           ;jump if zero flag is 1
        inc si
        loopnz lsearch :
        
        jnz elnfound 
        hlt 
    elfound:                   ;jump to this if element found
        mov ah,9h
        mov dx,offset found 
        mov cx,0h
        int 21h
        hlt
    elnfound:                  ;jump to this if element not found
        mov ah,9h
        mov dx,offset nfound
        int 21h 
    
    c ends
end start
        
     
        