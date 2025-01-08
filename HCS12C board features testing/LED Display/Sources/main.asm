********************************************************************
* Switch LED Display*
* Reads the switches SW1 and immediately displays
* their states on the LED1
* Author: Julian Goncalves *
********************************************************************
; export symbols
  XDEF Entry, _Startup ; export ‘Entry’ symbol
  ABSENTRY Entry ; for absolute assembly: mark
; this as applicat. entry point
; Include derivative-specific definitions
  INCLUDE 'derivative.inc'
********************************************************************
* Code section *
********************************************************************
********************************************************************
* The actual program starts here *
********************************************************************
  ORG $3100      ; Another Start Address
Entry:
_Startup:
  LDAA #$FF ; ACCA = $FF
  STAA DDRH ; Config. Port H for output
  STAA PERT ; Enab. pull-up res. of Port T
Loop: LDAA PTT ; Read Port T
  STAA PTH ; Display SW1 on LED1 connected to Port H
  BRA Loop ; Loop
  SWI ; break to the monitor
********************************************************************
* Interrupt Vectors *
********************************************************************
  ORG $FFFE
  FDB Entry ; Reset Vector