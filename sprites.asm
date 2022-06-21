.include "header.asm"


; ************** NEW CODE ****************
LoadPalettes:
  LDA $2002    ; read PPU status to reset the high/low latch
  LDA #$3F
  STA $2006    ; write the high byte of $3F00 address
  LDA #$00
  STA $2006    ; write the low byte of $3F00 address
  LDX #$00
LoadPalettesLoop:
  LDA palette, x        ;load palette byte
  STA $2007             ;write to PPU
  INX                   ;set index to next byte
  CPX #$20            
  BNE LoadPalettesLoop  ;if x = $20, 32 bytes copied, all done



LoadSprites:

  LDX #$00              ; start at 0

LoadSpritesLoop:
  LDA sprites, x        ; load data from address (sprites + x)
  STA $0200, x          ; store into RAM address ($0200 + x)
  INX                   ; X = X + 1
  CPX #$10              ; Compare X to hex $10, decimal 16
  BNE LoadSpritesLoop   ; Branch to LoadSpritesLoop if compare was Not Equal to zero

                        ; if compare was equal to 16, continue down



  LDA #%10000000   ; enable NMI, sprites from Pattern Table 0
  STA $2000

  LDA #%00010000   ; enable sprites
  STA $2001



Forever:
  JMP Forever     ;jump back to Forever, infinite loop
  
 

NMI:
  LDA #$00
  STA $2003  ; set the low byte (00) of the RAM address
  LDA #$02
  STA $4014  ; set the high byte (02) of the RAM address, start the transfer
  
.include "controller.asm"

  RTI        ; return from interrupt
 
;;;;;;;;;;;;;;  
  
  
  
palette:
  .byte $0F,$31,$32,$33,$0F,$35,$36,$37,$0F,$39,$3A,$3B,$0F,$3D,$3E,$0F
  .byte $0F,$1C,$15,$14,$0F,$02,$38,$3C,$0F,$1C,$15,$14,$0F,$02,$38,$3C


sprites:
  .byte $80, $32, $00, $80   ;sprite 0
  .byte $80, $33, $00, $88   ;sprite 1
  .byte $88, $34, $00, $80   ;sprite 2
  .byte $88, $35, $00, $88   ;sprite 3
  

  .segment "VECTORS"
    .word NMI ; time between image on screen and refreshed 
    .word RESET
    
.segment "CHARS"
    .incbin "mario.chr"
