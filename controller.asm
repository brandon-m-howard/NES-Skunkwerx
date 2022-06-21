  
player1 = $4016
player2 = $4017

marioTopLeft_X = $0203

  LDA #$01
  STA $4016
  LDA #$00
  STA $4016     ; tell both the controllers to latch buttons

ReadA: 
  LDA player1       ; player 1 - A
  AND #%00000001  ; erase everything but bit 0
  BEQ ReadADone   ; branch to ReadADone if button is NOT pressed (0)
                  ; add instructions here to do something when button IS pressed (1)
ReadADone:        ; handling this button is done


  LDA $4016     ; player 1 - B
  LDA $4016     ; player 1 - Select
  LDA $4016     ; player 1 - Start

ReadUp:
  LDA player1     ; player 1 - Up
  AND #%00000001  ; erase everything but bit 0
  BEQ ReadUpDone

  ; Move Mario Left
  LDA $0200   ; load sprite X (horizontal) position
  SEC         ; make sure the carry flag is clear
  SBC #$01    ; A = A + 1
  STA $0200   ; save sprite X (horizontal) position

  LDA $0204   ; load sprite X (horizontal) position
  SEC         ; make sure the carry flag is clear
  SBC #$01    ; A = A + 1
  STA $0204   ; save sprite X (horizontal) position

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
  LDA player1     ; player 1 - Down
  AND #%00000001  ; erase everything but bit 0
  BEQ ReadDownDone

  ; Move Mario Right
  LDA $0200   ; load sprite X (horizontal) position
  CLC         ; make sure the carry flag is clear
  ADC #$01    ; A = A + 1
  STA $0200   ; save sprite X (horizontal) position

  LDA $0204   ; load sprite X (horizontal) position
  CLC         ; make sure the carry flag is clear
  ADC #$01    ; A = A + 1
  STA $0204   ; save sprite X (horizontal) position

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
  LDA player1     ; player 1 - Left
  AND #%00000001  ; erase everything but bit 0
  BEQ ReadLeftDone

  ; Move Mario Left
  LDA marioTopLeft_X   ; load sprite X (horizontal) position
  SEC         ; make sure the carry flag is clear
  SBC #$01    ; A = A + 1
  STA marioTopLeft_X   ; save sprite X (horizontal) position

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
  LDA player1     ; player 1 - Right
  AND #%00000001  ; erase everything but bit 0
  BEQ ReadRightDone

  ; Move Mario Right
  LDA $0203   ; load sprite X (horizontal) position
  CLC         ; make sure the carry flag is clear
  ADC #$01    ; A = A + 1
  STA $0203   ; save sprite X (horizontal) position

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