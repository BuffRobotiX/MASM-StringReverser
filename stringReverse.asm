                    .586
                    .MODEL flat, stdcall

                    include win32api.asm

                    .STACK 4096

                    .DATA

CR                  equ     13
LF                  equ     10
MAX_LENGTH          equ     255

UserInput           byte    MAX_LENGTH dup(0)                         ;Variable to store user input string
Reversed            byte    MAX_LENGTH dup(0)                         ;Buffer to store reversed input string

msg1                byte    "Please input a string", CR, LF            ;Message to prompt user

CharsRead           dword    0                                         ;Returned by ReadConsole

BytesWritten        dword    0

hStdOut             dword    0
hStdIn              dword    0

                    .CODE

Main                Proc

                    ;*********************************************
                    ;In order to write to windows console screen
                    ;we need to get a handle to the screen
                    ;*********************************************
                    invoke  GetStdHandle, STD_OUTPUT_HANDLE
                    mov     hStdOut,eax                    ;Save output handle
                                
                    ;*********************************************
                    ;Get a handle to the standard input device
                    ;*********************************************
                    invoke  GetStdHandle, STD_INPUT_HANDLE
                    mov     hStdIn,eax                    ;Save input handle
        
                    ;*********************************************
                    ;Prompt user to input a string
                    ;*********************************************
                    invoke  WriteConsoleA, hStdOut, OFFSET msg1, SIZEOF msg1, OFFSET BytesWritten, 0

                    ;*********************************************
                    ;Set Console Mode for Line Input
                    ;*********************************************
                    invoke  SetConsoleMode, hStdIn, ENABLE_LINE_INPUT + ENABLE_ECHO_INPUT 


                    ;*********************************************
                    ;Get User Input
                    ;*********************************************
                    invoke  ReadConsoleA, hStdIn, OFFSET UserInput, SIZEOF UserInput, OFFSET CharsRead, 0


                    ;*********************************************
                    ;If the last character is a carriage return character, then we need
                    ;to subtract one from the number of characters read
                    ;*********************************************
                    mov     edx,CharsRead               ;number of character user entered
                    dec     edx                         ;subtract one since we are zero based
                    cmp     UserInput[edx],CR           ;is the last character a carriage return?
                    jne     NoCR                        ;no...then jump
                    dec     CharsRead                   ;yes...then so subtract 1 from length
NoCR:

                    ;*******************************************************
                    ; Test to see if the user just pressed enter
                    ; If they did then Exit Program
                    ;*******************************************************
                    cmp     CharsRead,0                 ;Did user just press enter
                    je      ExitProg                    ;Yes...then exit

                    ;*******************************************************
                    ; Copy the string that the user input into the Reversed
                    ; buffer in reverse order
                    ;*******************************************************
                    mov     ecx,CharsRead               ;Number of characters to move/copy
                    mov     esi,ecx                     ;esi used as index into input string
                    dec     esi                         ;point to last character of user input - decrement since we are zero based
                    mov     edi,0                       ;edi is used as index into Reversed string
NextChar:           mov     al,UserInput[esi]           ;get input character
                    mov     Reversed[edi],al            ;store it in Reversed buffer
                    dec     esi                         ;point to next input character to read
                    inc     edi                         ;point to next address to store character
                    loopw   nextChar                    ;repeat until all characters are moved

                    ;*************************
                    ;Terminate Program
                    ;*************************
ExitProg:           invoke  ExitProcess,0
Main                ENDP
                    END     Main