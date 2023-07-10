#include <SPI.h>
#include <SD.h>
#include <String.h>

#define encoderPinA 3
#define encoderPinB 2
#define buttonPin 7
#define SD_PIN 10

File logFile;
bool enableWriteToSD=false;

int newDirectoryName=0;
int newFileName=0;

bool startRecord;
volatile long encoderPosition=0;
volatile bool aStatePrev,bStatePrev,aState,bState;


void setup() {
  Serial.begin(9600);

  //setup rotary encoder
  DDRD &= ~((1 << encoderPinA) | (1 << encoderPinB));
  // Abilita i pull-up interni
  PORTD |= (1 << encoderPinA) | (1 << encoderPinB);
  attachInterrupt(digitalPinToInterrupt(encoderPinA),handleEncoderInterrupt,CHANGE);
  attachInterrupt(digitalPinToInterrupt(encoderPinB),handleEncoderInterrupt,CHANGE);

  //setup SD
  if(!SD.begin(SD_PIN)){ while(true); }

  while(SD.exists(String(newDirectoryName))){ newDirectoryName++; }
  if (SD.mkdir(String(newDirectoryName))){
    Serial.print("Created new directory: ");
    Serial.println(newDirectoryName);
  }


  //setup record button
  DDRD &= ~(1 << buttonPin);
  PORTD |= (1 << buttonPin);
  
  Serial.println("setup completed");
}

void loop() {
  startRecord=PIND&(1<<buttonPin);
  if(startRecord && !enableWriteToSD){
    logFile = SD.open(String(newDirectoryName) + "/" +  String(newFileName++) +".txt", FILE_WRITE);
    if (logFile) { Serial.println("Writing to "+ String(newFileName-1)); }
    enableWriteToSD=true;
  }
  else if(startRecord && enableWriteToSD) {
     logFile.print(String(encoderPosition)+",");
  }
  else if(!startRecord && enableWriteToSD){
    enableWriteToSD=false;
    logFile.close();
  }
}


void handleEncoderInterrupt(){
  // Leggi lo stato corrente dei segnali A e B
  aState = PIND & (1 << encoderPinA);
  bState = PIND & (1 << encoderPinB);

  // Verifica se il fronte di salita è avvenuto sul segnale A
  if (aState != aStatePrev) {
    aStatePrev = aState;
    // Verifica il cambiamento di direzione dell'encoder
    if (aStatePrev == bStatePrev) {
      encoderPosition--;
    } else {
      encoderPosition++;
    }
  }
  // Memorizza lo stato corrente dei segnali A e B per il prossimo interrupt
  bStatePrev = bState;
}
