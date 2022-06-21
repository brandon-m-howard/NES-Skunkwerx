.include "ppu.asm"
.segment "HEADER"
.byte "NES"
.byte $1a
.byte $02 ; 2 * 16KB PROG ROM
.byte $01 ; 1 * 8KM CHR ROM
.byte %00000000 ; mapper and mirroring
.byte $00
.byte $00
.byte $00
.byte $00
.byte $00, $00, $00, $00, $00 ; filler bytes

.segment "ZEROPAGE" ; LSB - 0 - FF

    
.segment "STARTUP"
RESET:
  SEI          ; disable IRQs
  CLD          ; disable decimal mode
  LDX #$40
  STX $4017    ; disable APU frame IRQ
  LDX #$FF
  TXS          ; Set up stack
  INX          ; now X = 0
  STX PPUCTRL    ; disable NMI
  STX PPUMASK    ; disable rendering
  STX $4010    ; disable DMC IRQs

vblankwait1:       ; First wait for vblank to make sure PPU is ready
  BIT PPUSTATUS
  BPL vblankwait1

clrmem:
  LDA #$00
  STA $0000, x
  STA $0100, x
  STA $0300, x
  STA $0400, x
  STA $0500, x
  STA $0600, x
  STA $0700, x
  LDA #$FE
  STA $0200, x
  INX
  BNE clrmem
   
; Second wait for vblank, PPU is ready after this
vblankwait2:
  BIT $2002
  BPL vblankwait2