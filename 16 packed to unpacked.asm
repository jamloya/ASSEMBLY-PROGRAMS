data segment
             
             var dd 15249685h,78961235h
             temp db ? 
             result db ?
              
data ends

code segment

    assume data:ds,code:cs
    
    start: 

      mov ax,data 
      mov ds,ax  
      mov di,0
      mov cx,4
      mov si,4
      lea bp,var
  un:
      mov ax,0
      mov al,byte ptr [bp][si]
      shl ax,4
      shr al,4
      mov temp[di],al
      mov temp[di+1],ah
      add si,1
      add di,2
      loop un:  ;last 8 digits
     
      mov cx,4
      mov si,0
   un1:
      mov ax,0
      mov al,byte ptr var[si]
      shl ax,4
      shr al,4
      mov temp[di],al
      mov temp[di+1],ah
      add si,1
      add di,2
      loop un1:   ; first 8 digits
      mov si,15
      mov di,0
      mov cx,8
      lea bp,temp
     
   code ends
  end start
