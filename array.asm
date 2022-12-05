data segment
    lengthOfArray db "Input the length of array:",13,10,"$"
    inputErrorMessage db 13,10,"Error! Input the length of array:",13,10,"$"
    readElementp1 db "Input the element $",13,10
    array db 9 dup(?)
ends


showMessage macro msg 
	mov dl,offset msg
	mov ah,09h
	int 21h
endm


testNumber macro val
    cmp val,'0'
    jl inputArrayElementError
    cmp val,'9'
    jg inputArrayElementError
endm






testArrayLength macro val
    cmp val,'0'
    jl inputArrayLengthError
    cmp val,'9'
    jg inputArrayLengthError
endm

code segment

assume cs:code, ds:data
main:  
    showMessage lengthOfArray
    inputValue:
        mov ah,01h
        int 21h
        testArrayLength al
    sub al,30h
    mov bl,al
    mov ch,0
    mov cl,bl
    mov si,0
    readArray:
        showMessage readElementp1
        mov ah,01h
        int 21h
        testNumber al
        mov array[si],al
        inc si
        loop readArray
    mov ch,0
    mov cl,bl
    mov si,0
    showArray:
        mov dl,array[si]
        mov ah,06h
        int 21h
        inc si
        loop showArray
mov ah,4ch
int 21h
inputArrayLengthError:
    showMessage inputErrorMessage
    jmp inputValue

inputArrayElementError:
    showMessage inputErrorMessage
    jmp readArray
   
code ends
end main