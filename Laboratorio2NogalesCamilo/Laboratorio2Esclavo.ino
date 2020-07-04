/*
 * Laboratorio 2: Comunicacion Serial y I2C
 * Código RECEPTOR
 */

#include <Wire.h>
#include <LiquidCrystal.h>
LiquidCrystal lcd (13,12,11,10,9,8); //RS,E, D4,D5,D6,D7
int t,j,index,k;
String cod,men,sal,sali;
char vecrec;
char vec;
void setup() {
  // put your setup code here, to run once:
  Wire.begin(20);
  Serial.begin(9600);
  Wire.onReceive(receiveEvent); //Evento de excepcion
  lcd.begin(16,2);
}

void loop() {
  // put your main code here, to run repeatedly:
}

void receiveEvent (int bytes){
    lcd.setCursor(0,0);
    lcd.print("                                ");
    lcd.setCursor(0,1);
    lcd.print("                                ");
  while(Wire.available()){
    //vec=Wire.read();
    //men=men+String(vec);
    vecrec=Wire.read();
    cod=cod+String(vecrec);
    }
    Serial.println(String(cod));
    t=cod.length()+1;
    index=cod.indexOf('.');
    for(j=0;j<index;j++){
      sal=sal+String(cod[j]);
    }
    lcd.setCursor(0,0);
    lcd.print("cod:");
    lcd.setCursor(5,0);
    lcd.print(sal);
    Serial.println(sal);
    for(j=index+1;j<t-1;j++){
      sali=sali+String(cod[j]);
    }
    lcd.setCursor(0,1);
    lcd.print("msg:");
    lcd.setCursor(5,1);
    lcd.println(sali);
    Serial.println(sali);
    cod="";
    sal="";
    sali="";
    } 
