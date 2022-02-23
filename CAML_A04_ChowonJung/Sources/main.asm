;********************************************************************
;* PROJECT			: CAML_A04_ChowonJung							*
;* FILE				: main.asm										*
;* NAME				: Chowon Jung									*
;* FIRST VERSION	: 2019-03-10									*
;* DESCRIPTION		: The function in this file is used to simulate *
;* 					  basic assembly instructions using variable	*
;*					  declarations, accumulator load, value store.	*
;********************************************************************


; Include derivative-specific definitions
            INCLUDE 'derivative.inc'
            

; export symbols
            XDEF _Startup, main
            ; we export both '_Startup' and 'main' as symbols. Either can
            ; be referenced in the linker .prm file or from C/C++ later on
            
            
            
            XREF __SEG_END_SSTACK  		; symbol defined by the linker for the end of the stack


; variable/data section
VAR1:			EQU		$100			; Map address of variable "VAR1" into address $100
VAR2:			EQU		$101			; Map address of variable "VAR2" into address $101
VAR3:			EQU		$102			; Map address of variable "VAR3" into address $102
FINAL:			EQU		$10A			; Map address of variable "FINAL" into address $10A


; code section
main:
_Startup:
            LDHX   #__SEG_END_SSTACK 	; initialize the stack pointer
            TXS							
			CLI							; enable interrupts

mainLoop:
           		LDA #48					; Load the constant value of 48 decimal number into accumulator
				STA VAR1				; Store the data in the accumulator into memory location of variable "VAR1"
				LDA #%10011001			; Load the constant value of 10011001 binary number into accumulator
				STA VAR2				; Store the data in the accumulator into memory location of variable "VAR2"
				LDA #$A3				; Load the constant value of A3 hexadecimal number into accumulator
				STA VAR3				; Store the data in the accumulator into memory location of variable "VAR3"
										; ----------------------- Empty line for visibility -----------------------
				LDA VAR1				; Load the data in the memory location of variable "VAR1" into accumulator
				ADD VAR2				; Add the data in the memory location of variable "VAR2" to the value accumulator holding
				NEGA					; Replace the value on accumulator with its two's complement 
				ADD VAR3				; Add the data in the memory location of variable "VAR3" to the value accumulator holding
				STA FINAL				; Store the data in the accumulator into memory location of variable "FINAL"
										; ----------------------- Empty line for visibility -----------------------
endOfProg:								; Function declaration named "endOfProg"
				BRA endOfProg			; Go to the line where "endOfProg" is


