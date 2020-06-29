/*
 * CAPITULO 2: PUERTOS DIGITALES
 * TAREA 3: Realizar un contador binario hasta 6 bits. Cuando se presione un pulsador, 
 * se debe observar el aumento de la variable en su número binario visto en leds. 
 */
#include<LiquidCrystal.h>

LiquidCrystal lcd (A0,A1,A2,A3,A4,A5);
const int vectorled [6] = {8,9,10,11,12,13};
const int btn = 7;
int i = 0, j=0, k;
void setup() {
  // put your setup code here, to run once:
  pinMode(btn,INPUT);
  lcd.begin(16, 2);
  lcd.setCursor(0,0);
  lcd.print("CONTADOR BINARIO");
  lcd.setCursor(0,1);
  lcd.print("     6-BITS     ");
  delay(2000);
  lcd.setCursor(0,0);
  lcd.print("                ");
  lcd.setCursor(0,1);
  lcd.print("                ");
  for(i=0;i<6;i++){
    pinMode(vectorled[i],OUTPUT);
  }
}

void loop() {
  
  // put your main code here, to run repeatedly:
  if(digitalRead(btn)==HIGH){
  delay(300); //antirebote
  j++;
  
  //funcion toogle
  //digitalWrite(led1,!digitalRead(led1));
  if(j>63){//contador maximo
    j=0;
    lcd.setCursor(0,0);
    lcd.print("CONT:");
    lcd.setCursor(8,0);
    lcd.print(j);
    lcd.setCursor(9,0);
    lcd.print("   ");
    
  }
  lcd.setCursor(0,0);
  lcd.print("CONT:");
  lcd.setCursor(8,0);
  lcd.print(j);
  while(digitalRead(btn)==HIGH){}
  }
  k=j;
  for(i=0;i<6;i++){
    digitalWrite(vectorled[i],k%2);
    k=k/2;
  }
}
