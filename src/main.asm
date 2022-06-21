.include "header.asm"

LoadPalettes:
  LDA PPUSTATUS
  BPL LoadPalettes
  LDA #$3F
  STA PPUADDR    ; write the high byte of $3F00 address
  LDA #$00
  STA PPUADDR    ; write the low byte of $3F00 address

  LDX #$00
LoadPalettesLoop:
  LDA palette, x        ;load palette byte
  STA PPUDATA             ;write to PPU
  INX                   ;set index to next byte
  CPX #$20            
  BNE LoadPalettesLoop  ;if x = $20, 32 bytes copied, all done

LoadBackground1:
  LDA #$20
  STA PPUADDR
  LDA #$00
  STA PPUADDR
  LDX #$00
LoadBackgroundLoop1:
  LDA background, X
  STA $2007
  INX
  CPX #$00
  BNE LoadBackgroundLoop1
LoadBackgroundLoop2:
  LDA background, X
  STA $2007
  INX
  CPX #$00
  BNE LoadBackgroundLoop2
LoadBackgroundLoop3:
  LDA background, X
  STA $2007
  INX
  CPX #$00
  BNE LoadBackgroundLoop3
LoadBackgroundLoop4:
  LDA background, X
  STA $2007
  INX
  CPX #$D0
  BNE LoadBackgroundLoop4

LoadSprites:
  LDX #$00              ; start at 0

LoadSpritesLoop:
  LDA sprites, x        ; load data from address (sprites + x)
  STA $0200, x          ; store into RAM address ($0200 + x)
  INX                   ; X = X + 1
  CPX #$10              ; Compare X to hex $10, decimal 16
  BNE LoadSpritesLoop   ; Branch to LoadSpritesLoop if compare was Not Equal to zero

  LDA #%10000000   ; enable NMI, sprites from Pattern Table 0
  STA PPUCTRL
  LDA #%00011110   ; enable sprites
  STA PPUMASK

Forever:
  JMP Forever     ;jump back to Forever, infinite loop

NMI:
  LDA #$00
  STA $2003  ; set the low byte (00) of the RAM address
  LDA #$02
  STA $4014  ; set the high byte (02) of the RAM address, start the transfer
  
.include "controller.asm"

  RTI        ; return from interrupt
  
palette:
  .byte $0F,$10,$20,$30 ; background palette 0
  .byte $0F,$10,$20,$30 ; background palette 1
  .byte $0F,$10,$20,$30 ; background palette 2
  .byte $0F,$10,$20,$30 ; background palette 3

  .byte $0F,$10,$20,$30 ; foreground palette 0
  .byte $0F,$10,$20,$30 ; foreground palette 1
  .byte $0F,$10,$20,$30 ; foreground palette 2
  .byte $0F,$10,$20,$30 ; foreground palette 3

background:
  .byte $00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03
  .byte $02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01
  .byte $00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03
  .byte $02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01
  .byte $00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03
  .byte $02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01
  .byte $00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03
  .byte $02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03,$00,$01

sprites:
  ; y, sprite, flags, x
  .byte $80, $00, $00, $80   ;sprite 0
  .byte $80, $01, $00, $88   ;sprite 1
  .byte $88, $02, $00, $80   ;sprite 2
  .byte $88, $03, $00, $88   ;sprite 3

.segment "VECTORS"
  .word NMI 
  .word RESET
    
.segment "CHARS"
    .incbin "../assets/assets.chr"
