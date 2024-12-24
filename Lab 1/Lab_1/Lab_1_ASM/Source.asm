;// Program  LAB 1
;// Program Description : Meet the requirements of Lab 1, which mostly include computing stuff
;// Author: May Wandyez
;// Creation Date : 2/4/2024 (the last minute)
;// Revisions: None! 
;// Date: Modified by : MODIFIED NEVER, THIS IS THE GREATEST PROGRAM


;//  Lab Assignmnet :
;//  write a program that calculates the following expression using registers:
;//  A = (A + B) - (C + D).THIS IS A DIFFERENT PROBLEM THAN ONE THE PROGRAM CURRENTLY DOES
;//  Assign integer values to the EAX,EBX, ECX, and EDX registers.
; // Using ADD, SUB, MOVE

;// THIS BIT DOES IMPORTANT STUFF, DON'T TOUCH IT
;//=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;
.386; //.386 directive, which identifies this as a 32-bit program 
;// that can access 32-bit registers and addresses


.model flat, stdcall;// selects the program’s memory model (flat), 
;// and identifies the calling convention (named stdcall)
;// for procedures 

;// We use this because 32-bit Windows services require the  
;// stdcall convention to be used 
;// We always use the flat memory model, 
;// which is associated with the processor’s protected mode
;// sets aside 4096 bytes of storage for the runtime stack, 
;// which every program must have

.stack 4096;// Used by the CPU for pushing and pulling from the stack

comment !
// A function prototype consists of the function name, 
// the PROTO keyword, a comma, and a list of input parameters. 
// The input parameter for ExitProcess is named dwExitCode
// it as a return value passed back to the Window operating system
// return value of zero usually means our program was successful
// Any other integer value generally indicates an error code number
!

ExitProcess PROTO, dwExitCode: DWORD;// declares a prototype for the ExitProcess function, 


;// which is a standard Windows service
;//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;// Okay, this looks like the bit that actually does stuff, declare your variables here.


.data

A DWORD ?
B DWORD ?
Cvar DWORD ?
D DWORD ?

;//this is the data section, apparently this is needed for an external function




;// Remember, assembly doesn't tell you what is actually going on, you kinda just have to remember the registers

.code; // .code directive marks the beginning of the code area of a program		

main PROC; // A program’s entry point is the first statement a program executes. 
; // The label main was declared on Line 10,
; // and it marks the address at which the program will begin to execute

;//OKAY, now we have to move the variables onto the register, I think
;// Apparently the error I was having was that you can't declare variables
;//with the keyword C, which makes me feel very very silly. 

;// Assign initial values for variables using MOV (I thought I had an error here so I did it this way)
mov A, 4
mov B, 3
mov Cvar, 2
mov D, 1

;// move the variables onto the register for the actual math to take place
mov	eax, A
mov	ebx, B
mov ecx, Cvar
mov edx, D

;//  A = (A + B) - (C + D)
;//the actual desired math

;// perform the additions on the eax and ecx registers, then subtract them
add eax, ebx
add ecx, edx
sub eax, ecx



call ExitProcess



INVOKE ExitProcess, 0
main ENDP;// The ENDP directive marks the end of a procedure. 
;// Our program had a procedure named main, 
;// so the endp must use the same name

END main;// the END directive marks the end of the program,		
;// and references the program entry point
