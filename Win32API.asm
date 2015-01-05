 .586
 .MODEL flat, stdcall

;********************************************************
; Masm Include File for Windows 32-Bit API Functions
;
; The information contained in this file can be found at
; http://msdn.microsoft.com/en-us/library/default.aspx
;
;********************************************************

;********************************************************
; WINDOWS API FUNCTION PROTOTYPES
;********************************************************
ExitProcess PROTO : DWORD
GetStdHandle PROTO : DWORD
ReadConsoleA PROTO : DWORD, : DWORD, : DWORD, : DWORD, : DWORD
SetConsoleCursorPosition PROTO : DWORD, : DWORD
SetConsoleMode PROTO : DWORD, : DWORD
SetConsoleTextAttribute PROTO : DWORD, : DWORD
WriteConsoleA PROTO : DWORD, : DWORD, : DWORD, : DWORD, : DWORD


CreateThread PROTO : DWORD, : DWORD, : DWORD, :  DWORD, : DWORD, : DWORD
CreateMutexA PROTO : DWORD, : DWORD, : DWORD
ReleaseMutex PROTO :DWORD
Sleep PROTO : DWORD
WaitForSingleObject PROTO :DWORD,:DWORD
SuspendThread PROTO : DWORD
ResumeThread PROTO : DWORD


CreateFileA PROTO : DWORD, : DWORD, : DWORD, : DWORD, : DWORD, : DWORD, : DWORD
ReadFile  PROTO : DWORD, : DWORD, : DWORD, : DWORD, : DWORD
GetFileSize  PROTO : DWORD, : DWORD
CloseHandle PROTO : DWORD


;********************************************************
; EQUATES
;********************************************************
NULL                          EQU     0

;*****************************************************
; Standard Handles
;*****************************************************
STD_INPUT_HANDLE              EQU     -10             ;Standard Input Handle
STD_ERROR_HANDLE              EQU     -11             ;Standard Error Handle
STD_OUTPUT_HANDLE             EQU     -12             ;Standard Output Handle


GENERIC_ALL                   EQU     10000000h
GENERIC_READ                  EQU     80000000h
GENERIC_WRITE                 EQU     40000000h
GENERIC_EXECUTE               EQU     20000000h

FILE_SHARE_NONE               EQU     0
FILE_SHARE_DELETE             EQU     4
FILE_SHARE_READ               EQU     1
FILE_SHARE_WRITE              EQU     2

CREATE_NEW                    EQU     1
CREATE_ALWAYS                 EQU     2
OPEN_EXISTING                 EQU     3
OPEN_ALWAYS                   EQU     4
TRUNCATE_EXISTING             EQU     5


FILE_ATTRIBUTE_NORMAL         EQU     80h

;*****************************************************
; Set Console Mode Equates
;
; Refer to Microsoft's documentation on SetConsoleMode
; for a complete description of these equates.
;*****************************************************
ENABLE_NOTHING_INPUT          EQU     0000h           ;Turn off all input options
ENABLE_ECHO_INPUT             EQU     0004h           ;Characters read are written to the active screen buffer (can be used with ENABLE_LINE_INPUT)
ENABLE_INSERT_MODE            EQU     0020h           ;When enabled, text entered in a console window will be inserted at the current cursor location
ENABLE_LINE_INPUT             EQU     0002h           ;The ReadConsole function returns only when a carriage return character is read.
ENABLE_MOUSE_INPUT            EQU     0010h           ;If the mouse is within the borders of the console window & the window has the keyboard focus, mouse events are placed in the input buffer. These events are discarded by ReadFile or ReadConsole. 
ENABLE_PROCESSED_INPUT        EQU     0001h           ;CTRL+C is processed by the system and is not placed in the input buffer. 
ENABLE_QUICK_EDIT_MODE        EQU     0040h           ;This flag enables the user to use the mouse to select and edit text. To enable this option, use the OR to combine this flag with ENABLE_EXTENDED_FLAGS.  
ENABLE_WINDOW_INPUT           EQU     0008h           ;User interactions that change the size of the console screen buffer are reported in the console's input buffer.


;If the hConsoleHandle parameter is a screen buffer handle, the mode can be one or more of the following values. When a screen buffer is created, both output modes are enabled by default.
ENABLE_PROCESSED_OUTPUT       EQU     0001h           ;Characters written by the WriteFile or WriteConsole function or echoed by the ReadFile or ReadConsole function are examined for ASCII control sequences and the correct action is performed. 
ENABLE_WRAP_AT_EOL_OUTPUT     EQU     0002h           ;When writing with WriteFile or WriteConsole or echoing with ReadFile or ReadConsole, the cursor moves to the beginning of the next row when it reaches the end of the current row.


;********************************************************
; CONSOLE FOREGROUND AND BACKGROUND COLOR EQUATES
;********************************************************
FOREGROUND_BLACK              EQU     0
FOREGROUND_DARK_BLUE          EQU     1
FOREGROUND_DARK_GREEN         EQU     2
FOREGROUND_DARK_CYAN          EQU     3
FOREGROUND_DARK_RED           EQU     4
FOREGROUND_DARK_MAGENTA       EQU     5
FOREGROUND_DARK_YELLOW        EQU     6
FOREGROUND_GRAY               EQU     7
FOREGROUND_DARK_GRAY          EQU     8
FOREGROUND_BLUE               EQU     9
FOREGROUND_GREEN              EQU     10
FOREGROUND_CYAN               EQU     11
FOREGROUND_RED                EQU     12
FOREGROUND_MAGENTA            EQU     13
FOREGROUND_YELLOW             EQU     14
FOREGROUND_WHITE              EQU     15

BACKGROUND_BLACK              EQU     FOREGROUND_BLACK * 10h
BACKGROUND_DARK_BLUE          EQU     FOREGROUND_DARK_BLUE * 10h
BACKGROUND_DARK_GREEN         EQU     FOREGROUND_DARK_GREEN * 10h
BACKGROUND_DARK_CYAN          EQU     FOREGROUND_DARK_CYAN * 10h
BACKGROUND_DARK_RED           EQU     FOREGROUND_DARK_RED * 10h
BACKGROUND_DARK_MAGENTA       EQU     FOREGROUND_DARK_MAGENTA * 10h
BACKGROUND_DARK_YELLOW        EQU     FOREGROUND_DARK_YELLOW * 10h
BACKGROUND_GRAY               EQU     FOREGROUND_GRAY * 10h
BACKGROUND_DARK_GRAY          EQU     FOREGROUND_DARK_GRAY * 10h
BACKGROUND_BLUE               EQU     FOREGROUND_BLUE * 10h
BACKGROUND_GREEN              EQU     FOREGROUND_GREEN * 10h
BACKGROUND_CYAN               EQU     FOREGROUND_CYAN * 10h
BACKGROUND_RED                EQU     FOREGROUND_RED * 10h
BACKGROUND_MAGENTA            EQU     FOREGROUND_MAGENTA * 10h
BACKGROUND_YELLOW             EQU     FOREGROUND_YELLOW * 10h
BACKGROUND_WHITE              EQU     FOREGROUND_WHITE * 10h

END