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

  LDA #$01
  STA PLAYER_1
  LDA #$00
  STA PLAYER_1

ReadA: 
  LDA PLAYER_1 ; Player 1 - A  
  AND #%00000001  
  BEQ ReadADone  
                 
ReadADone:       

  LDA PLAYER_1 ; Player 1 - B
  LDA PLAYER_1 ; player 1 - Select
  LDA PLAYER_1 ; player 1 - Start

ReadUp:
  LDA PLAYER_1 ; Player 1 - Up
  AND #%00000001
  BEQ ReadUpDone

  LDA SPRITE0_Y
  SEC
  SBC #$01
  STA SPRITE0_Y

  LDA SPRITE1_Y
  SEC
  SBC #$01
  STA SPRITE1_Y

  LDA SPRITE2_Y
  SEC
  SBC #$01
  STA SPRITE2_Y

  LDA SPRITE3_Y
  SEC
  SBC #$01
  STA SPRITE3_Y

ReadUpDone:

ReadDown:
  LDA PLAYER_1 ; Player 1 - Down
  AND #%00000001
  BEQ ReadDownDone

  LDA SPRITE0_Y
  CLC
  ADC #$01
  STA SPRITE0_Y

  LDA SPRITE1_Y
  CLC
  ADC #$01
  STA SPRITE1_Y

  LDA SPRITE2_Y
  CLC
  ADC #$01
  STA SPRITE2_Y

  LDA SPRITE3_Y
  CLC
  ADC #$01
  STA SPRITE3_Y


ReadDownDone:

ReadLeft:
  LDA PLAYER_1 ; Player 1 - Left
  AND #%00000001
  BEQ ReadLeftDone

  LDA SPRITE0_X
  SEC
  SBC #$01
  STA SPRITE0_X

  LDA SPRITE1_X
  SEC
  SBC #$01
  STA SPRITE1_X

  LDA SPRITE2_X
  SEC
  SBC #$01
  STA SPRITE2_X

  LDA SPRITE3_X
  SEC
  SBC #$01
  STA SPRITE3_X

ReadLeftDone:

ReadRight:
  LDA PLAYER_1
  AND #%00000001
  BEQ ReadRightDone

  LDA SPRITE0_X
  CLC
  ADC #$01
  STA SPRITE0_X

  LDA SPRITE1_X
  CLC
  ADC #$01
  STA SPRITE1_X

  LDA SPRITE2_X
  CLC
  ADC #$01
  STA SPRITE2_X

  LDA SPRITE3_X
  CLC
  ADC #$01
  STA SPRITE3_X

ReadRightDone:

;   LDA $4017     ; player 2 - A
;   LDA $4017     ; player 2 - B
;   LDA $4017     ; player 2 - Select
;   LDA $4017     ; player 2 - Start
;   LDA $4017     ; player 2 - Up
;   LDA $4017     ; player 2 - Down
;   LDA $4017     ; player 2 - Left
;   LDA $4017     ; player 2 - Right