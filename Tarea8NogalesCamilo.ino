/*
 * CAPITULO IV: PERIFERICOS ESPECÍFICOS
 * CODIGO 14: CAD Y PWM
 * 
 * Realice un programa donde se ingrese por comunicación serial la 
 * velocidad máxima y mínima de un motor en DC (no servo) . 
 * Donde su velocidad es controlada por un conversor análogo digital.  
 * Estos valores deben observarse en una LCD.
 * 
 * FUNCIONES: analogRead(conversor)
 *                       conversor -> A0-A5
 *            analogWrite(pin,dutty) -> pines con ~, dutty -> 0-255
 */

#include <LiquidCrystal.h> 
LiquidCrystal lcd (13,12,11,10,9,8);
int coma;
int conversor, mxm, mnm;
float voltaje;  //valor decimal hacia el V que recibe el Arduino
int dutty=0,j;
String vel, mi, mx;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("Ingrese las velocidades maxima y minima separadas por una coma (,):");
  lcd.begin(16,2);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()){
  vel=Serial.readString();
  }
  coma = vel.indexOf(',');
  int t = vel.length();
  for(j=0;j<coma;j++){
    mx=mx+String (vel[j]);
  }
  //Serial.println("Velocidad MX: "+mx);
  mxm=mx.toInt();
  mx="";
  for(j=coma+1;j<t;j++){
    mi=mi+String (vel[j]);
  }
  //Serial.println("Velocidad MIN: "+mi);
  mnm=mi.toInt();
  mi="";
  conversor=analogRead(0);
  dutty=conversor/4;
  conversor=map(conversor,0,1023,mnm,mxm);
  voltaje=(conversor*5.0)/mxm;    //1023   ->    5V 
                                  //conversor -> x?

  analogWrite(6,dutty);    
  lcd.setCursor(0,0);
  lcd.print("CAD:");
  lcd.setCursor(7,0);
  lcd.print(conversor);
  lcd.setCursor(0,1);
  lcd.print("V:");
  lcd.setCursor(3,1);
  lcd.print(voltaje,2); 
  lcd.setCursor(8,1);
  lcd.print("PWM:");
  lcd.setCursor(12,1);
  lcd.print((dutty*100)/255);
  delay(300);   
  lcd.clear(); 
}
