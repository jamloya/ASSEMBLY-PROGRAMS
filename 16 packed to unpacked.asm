data segment
             
             pack dd 15249685h,78961235h
             result db ? 
data ends

code segment

    assume data:ds,code:cs
    
    start: 

      mov ax,data 
      mov ds,ax  
      mov bp,0
      mov cx,8
      mov si,0
   
  un:
      mov ax,0
      mov al, byte ptr pack[si]
      shl ax,4
      shr al,4
      mov result[bp],al
      mov result[bp+1],ah
      inc si
      add bp,2
      loop un:
      code ends


  end start