data segment
    inputMessage db "Write a cracter :$"
    backToLine db 0Dh,0Ah,"$"
    exitMessage db 13,10,"Press 'f' key to exit ",13,10,"$"
ends

code segment
    Assume cs:code , ds:data
main:
    repeat:
        mov dl, offset exitMessage
        mov ah,09h ; 09h is for printing string
        int 21h

        mov dl, offset inputMessage
        mov ah,09h ; 09h is for printing string
        int 21h

        mov ah,01h ;01h is for reading character
        int 21h

        mov dl, offset backtoline
        mov ah,09h 
        int 21h

        mov dl,al ;storing character in dl
        mov ah,02h ;02h is for printing character
        int 21h

        cmp al,"f"
        jne repeat
    
    mov ah,4ch
    int 21h
code ends
end main
