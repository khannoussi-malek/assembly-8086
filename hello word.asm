data segment
    helloMessage db "hello",13,10,"$"
    meMessage db "it's Malek Khannoussi $"
data ends

code segment
    Assume cs:code , ds:data
main:
    MOV dl , offset helloMessage
    mov ah,09h
    int 21h
    MOV dl , offset meMessage
   
    int 21h
    mov ah, 4ch
    int 21h

code ends
end main