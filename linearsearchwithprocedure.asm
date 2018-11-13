d segment
    arr db 50 dup(?) 
    count dw ?
    el db ?
    msg dw 'enter the size of array','$'
    msg1 dw 'enter the elements of array','$'
    msg2 dw 'enter the element to search','$' 
    found dw 'element found','$'
    notfound dw 'element not found','$'
    table dw 3 dup(?)
        dw 100 dup(?)
    tos LABEL WORD
d ends
c segment
    assume ds:d,cs:c ss:d
   start: mov ax,d
    mov ds,ax
    mov ss,ax
    mov sp,offset tos   
    
    mov ax,0h
    mov ah,9h           ; printing the msg for size of array
    mov dx,offset msg
    int 21h
      
    mov ax,0h            ;taking the size of array
    mov ah,01h
    int 21h 
    shl ax,4
    shr al,4
    mov byte ptr count,al 
    

    MOV dl, 10        ; for new line
    MOV ah, 02h
    INT 21h
    MOV dl, 13
    MOV ah, 02h
    INT 21h    
   
   
   
    mov ah,9h         ;printing msg before taking input of array
    mov dx, offset msg1
    int 21h
    
    
    mov cx,count
    mov si,0
    input:
        mov ax,0h          ;input the elements of array
        mov ah,01h
        int 21h 
        shl ax,4
        shr al,4
        mov arr[si],al
        inc si
        MOV dl, 10        ; for new line
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h
        loop input
                
    mov ah,09h          ;printing msg to take element to be searched
    mov dx,offset msg2
    int 21h
    
    mov ax,0
    mov ah,1h           ;input the element to be searched
    int 21h
    shl ax,4
    shr al,4
    mov el,al 

    MOV dl, 10        ; for new line
    MOV ah, 02h
    INT 21h
    MOV dl, 13
    MOV ah, 02h
    INT 21h        
    
      
    
    call far ptr search
    
c ends  
c1 segment

    assume cs:c1,ds:d
    
    search proc far
       
        mov si,0
        mov cx,count
        mov al,el
         
        lsearch:
             cmp al,arr[si]
             jz found1
             add si,1
        loop lsearch
    search endp    
    nfound1:
        mov dx,offset notfound
        mov ah,9h
        int 21h
        hlt
    found1:
        mov dx,offset found
        mov ah,9h
        int 21h
        hlt
            
c1 ends             
    
end start
