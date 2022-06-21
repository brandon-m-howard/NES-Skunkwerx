PLAYER_1 = $4016
PLAYER_2 = $4017

SPRITE0_Y = $0200
SPRITE0_X = $0203
SPRITE1_Y = $0204
SPRITE1_X = $0207
SPRITE2_Y = $0208
SPRITE2_X = $020B
SPRITE3_Y = $020C
SPRITE3_X = $020F

BIT0_MASK = #%00000001

  LDA #$01
  STA PLAYER_1
  LDA #$00
  STA PLAYER_1     ; tell both the controllers to latch buttons

ReadA: 
  LDA PLAYER_1 ; Player 1 - A  
  AND BIT0_MASK  
  BEQ ReadADone  
                 
ReadADone:       

  LDA PLAYER_1 ; Player 1 - B
  LDA PLAYER_1 ; player 1 - Select
  LDA PLAYER_1 ; player 1 - Start

ReadUp:
  LDA PLAYER_1     ; player 1 - Up
  AND BIT0_MASK  ; erase everything but bit 0
  BEQ ReadUpDone

  LDA SPRITE0_Y
  SEC
  SBC #$01
  STA SPRITE0_Y

  LDA SPRITE1_Y   ; load sprite X (horizontal) position
  SEC         ; make sure the carry flag is clear
  SBC #$01    ; A = A + 1
  STA SPRITE1_Y   ; save sprite X (horizontal) position

  LDA $0208   ; load sprite X (horizontal) position
  SEC         ; make sure the carry flag is clear
  SBC #$01    ; A = A + 1
  STA $0208   ; save sprite X (horizontal) position

  LDA $020C   ; load sprite X (horizontal) position
  SEC         ; make sure the carry flag is clear
  SBC #$01    ; A = A + 1
  STA $020C   ; save sprite X (horizontal) position

ReadUpDone:

ReadDown:
  LDA PLAYER_1     ; player 1 - Down
  AND BIT0_MASK  ; erase everything but bit 0
  BEQ ReadDownDone

  LDA $0200   ; load sprite X (horizontal) position
  CLC         ; make sure the carry flag is clear
  ADC #$01    ; A = A + 1
  STA $0200   ; save sprite X (horizontal) position

  LDA SPRITE1_Y   ; load sprite X (horizontal) position
  CLC         ; make sure the carry flag is clear
  ADC #$01    ; A = A + 1
  STA SPRITE1_Y   ; save sprite X (horizontal) position

  LDA $0208   ; load sprite X (horizontal) position
  CLC         ; make sure the carry flag is clear
  ADC #$01    ; A = A + 1
  STA $0208   ; save sprite X (horizontal) position

  LDA $020C   ; load sprite X (horizontal) position
  CLC         ; make sure the carry flag is clear
  ADC #$01    ; A = A + 1
  STA $020C   ; save sprite X (horizontal) position


ReadDownDone:

ReadLeft:
  LDA PLAYER_1     ; player 1 - Left
  AND BIT0_MASK  ; erase everything but bit 0
  BEQ ReadLeftDone

  ; Move Mario Left
  LDA SPRITE0_X   ; load sprite X (horizontal) position
  SEC         ; make sure the carry flag is clear
  SBC #$01    ; A = A + 1
  STA SPRITE0_X   ; save sprite X (horizontal) position

  LDA $0207   ; load sprite X (horizontal) position
  SEC         ; make sure the carry flag is clear
  SBC #$01    ; A = A + 1
  STA $0207   ; save sprite X (horizontal) position

  LDA $020B   ; load sprite X (horizontal) position
  SEC         ; make sure the carry flag is clear
  SBC #$01    ; A = A + 1
  STA $020B   ; save sprite X (horizontal) position

  LDA $020F   ; load sprite X (horizontal) position
  SEC         ; make sure the carry flag is clear
  SBC #$01    ; A = A + 1
  STA $020F   ; save sprite X (horizontal) position

ReadLeftDone:

ReadRight:
  LDA PLAYER_1     ; player 1 - Right
  AND BIT0_MASK  ; erase everything but bit 0
  BEQ ReadRightDone

  ; Move Mario Right
  LDA SPRITE0_X   ; load sprite X (horizontal) position
  CLC         ; make sure the carry flag is clear
  ADC #$01    ; A = A + 1
  STA SPRITE0_X   ; save sprite X (horizontal) position

  LDA $0207   ; load sprite X (horizontal) position
  CLC         ; make sure the carry flag is clear
  ADC #$01    ; A = A + 1
  STA $0207   ; save sprite X (horizontal) position

  LDA $020B   ; load sprite X (horizontal) position
  CLC         ; make sure the carry flag is clear
  ADC #$01    ; A = A + 1
  STA $020B   ; save sprite X (horizontal) position

  LDA $020F   ; load sprite X (horizontal) position
  CLC         ; make sure the carry flag is clear
  ADC #$01    ; A = A + 1
  STA $020F   ; save sprite X (horizontal) position


ReadRightDone:

;   LDA $4017     ; player 2 - A
;   LDA $4017     ; player 2 - B
;   LDA $4017     ; player 2 - Select
;   LDA $4017     ; player 2 - Start
;   LDA $4017     ; player 2 - Up
;   LDA $4017     ; player 2 - Down
;   LDA $4017     ; player 2 - Left
;   LDA $4017     ; player 2 - Right