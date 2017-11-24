; *******************************************************************
; Assembler Blink Example with blocking Delay function
; Arduino UNO - 16MHz
;
; Licensed under the GNU General Public License v3.0
; *******************************************************************
; Created: Nov2017
; Author : SCorreia
; *******************************************************************

.CSEG
.ORG 0x000

; *******************************************************************
; Configuracoes iniciais
; *******************************************************************
	// Porto B, Bit 5 (PIN13) como OUTPUT, restantes pinos como INPUT
	LDI R20, 0x20			// DDRB = 0x10;
	OUT DDRB, R20

; *******************************************************************
; Ciclo de Programa
; *******************************************************************
Loop:
	// Liga pino 13
	LDI R20, 0x20;		// PORTB = 0x10;
	OUT PORTB, R20
	// Temporizacao 1s
	CALL delay_1s		// _delay_ms(1000)
	// Desliga pino 
	LDI R20, 0x00;		// PORTB = 0x00;
	OUT PORTB, R20
	// Temporizacao 1s
	CALL delay_1s

	RJMP Loop

; *******************************************************************
; Temporizacao 1S
; *******************************************************************
delay_1s:
	LDI R23, 0x50				// Repete 246x
L3:	CALL delay_4ms
	DEC R23
	BRNE L3
	RET
delay_4ms:
	LDI R22, 0xFF				// Repete 255x
L2:	CALL delay_16us
	DEC R22
	BRNE L2
	RET
delay_16us:
	LDI R21, 0xFF				// Repete 255x
L1:	DEC R21
	BRNE L1
	RET
; *******************************************************************
