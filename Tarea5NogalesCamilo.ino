/*
 * CAPITULO 2: PUERTOS DIGITALES - LCD
 * OBJETIVO: VISUALIZAR DATOS EN LA LCD Y UN CONTADOR
 * 
 */

#include<LiquidCrystal.h> //libreria LCD

LiquidCrystal lcd (13,12,11,10,9,8); //RS,E, D4,D5,D6,D7
const char vector [7]={'A','R','D','U','I','N','O'};
int i,cont=0;
const int btn=7;
void setup() {
  // put your setup code here, to run once:
  pinMode(btn,INPUT);
  lcd.begin(16,2);
}

void loop() {
  // put your main code here, to run repeatedly:
  lcd.setCursor(0,0);
  for(i=0;i<=7;i++){
    lcd.setCursor(i,0);
    lcd.print(vector[i]);
    delay(200);
    }
  if(digitalRead(btn)==LOW){ 
    for(i=7;i>=0;i--){
        lcd.setCursor(6-i,0);
        lcd.print(" ");
        lcd.setCursor(6-i,1);
        lcd.print(vector[i]);
        delay(200);
    }
    }
}
