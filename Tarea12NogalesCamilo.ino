/*
   CAPITULO V: FUNCIONES ESPECIFICAS
   TAREA 12: Programa que se reinicia cada 28 segundos

*/
#include <EEPROM.h>
#include <avr/wdt.h>
#include<MsTimer2.h>
#include <LiquidCrystal.h>

LiquidCrystal lcd (13, 12, 11, 10, 9, 8);
int i = 0;
int cont = 0;
void setup(){
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("RESET");
  MsTimer2::set(1000, reseteo);
  MsTimer2::start();
  i = EEPROM.read(0);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.println(i++);
  if (i < 255) {
    EEPROM.write(0, i);
  }
  else {
    i = 0;
  }
  delay(300);
}

void reseteo() {
  cont++;
  lcd.setCursor(0,0);
  lcd.print(cont);
  if (cont>=28){
  wdt_disable();
  wdt_enable(WDTO_500MS); //reiniciar en 4 segundos
  }
}
