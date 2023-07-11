#define encoderPinA 3
#define encoderPinB 2
volatile long encoderPosition=0;
void setup() {
  //setup rotary encoder
  DDRD &= ~((1 << encoderPinA) | (1 << encoderPinB));
  // Abilita i pull-up interni
  PORTD |= (1 << encoderPinA) | (1 << encoderPinB);
  attachInterrupt(digitalPinToInterrupt(encoderPinA),handleEncoderInterrupt,RISING);

}

void loop() {
  // put your main code here, to run repeatedly:
}


void handleEncoderInterrupt(){
  // Leggi lo stato corrente del segnale B
  PIND & (1 << encoderPinB) ? encoderPosition +=1 : encoderPosition -=1;
  
}
