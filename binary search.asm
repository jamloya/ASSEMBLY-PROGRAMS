d segment
    var db 1h,5h,6h,8h,9h
    el db ? 
    var2 db 02h
    found dw "  element found","$"
    nfound dw "  element not found","$"
d ends
c segment
    start:
       mov ax,d
       mov ds,ax
       mov ax,0
       mov ah,1h
       int 21h
       shl al,4
       shr al,4
       mov el,al
       mov si,2
       mov bp,0
       mov di,4
       mov cx,4 
   jmp bsearch:
   less:
        mov ax,si
        add ax,bp
        mov di,si
        div var2 
        mov ah,0
        mov si,ax
        dec cx
        jmp bsearch
    high: 
        dec di
        cmp di,si
        jz nfound1
        mov ax,si
        add ax,di
        mov bp,si
        div var2  
        mov ah,0
        mov si,ax 
        
        dec cx
        jmp bsearch       
        
    bsearch:  
            mov ax,0
           mov al,var[si]
           cmp al,el
           jz found1
           js high
           jns less
           loop bsearch
           jnz nfound1
   found1:
       mov dx,offset found
       mov ah,09h
       int 21h
       hlt
   nfound1:
       mov dx,offset nfound
       mov ah,09h
       int 21h  

    
c ends
end start
        
      