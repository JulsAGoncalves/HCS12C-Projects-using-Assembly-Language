********************************************************************
* Unsigned Multiply Operation *
* *
* This program grabs one number and multiplies it by another *
* It stores this number
* in the �PRODUCT� location. *
* Author: Julian Goncalves *
********************************************************************
; export symbols
  XDEF Entry, _Startup ; export �Entry� symbol
  ABSENTRY Entry ; for absolute assembly: mark
; this as applicat. entry point
; Include derivative-specific definitions
  INCLUDE 'derivative.inc'
********************************************************************
* Code section *
********************************************************************
  ORG $3000  ; Start Address
MULTIPLICAND FCB 05 ; First Number
MULTIPLIER FCB 05 ; Second Number
PRODUCT RMB 2 ; Result of multiplication
********************************************************************
* The actual program starts here *
********************************************************************
  ORG $3100      ; Another Start Address
Entry:
_Startup:
  LDAA MULTIPLICAND ; Get the first number into ACCA
  LDAB MULTIPLIER ;  Get the second number into ACCB
  MUL ; Time to multiply baby ;)
  STAA PRODUCT ; Store the high byte of the result
  STAB PRODUCT+1 ;Store the low byte of the result
  SWI ; break to the monitor
********************************************************************
* Interrupt Vectors *
********************************************************************
  ORG $FFFE
  FDB Entry ; Reset Vector