/*
 * LABORATORIO DE SISTEMAS EMBEBIDOS 1: PUERTOS DIGITALES
 * ARDUINO CON SENSORES
 * Elaborado por: Camilo Nogales R.
 */

#include<LiquidCrystal.h> //libreria LCD

LiquidCrystal lcd (13,12,11,10,9,8); //RS,E, D4,D5,D6,D7
const int PIRPin1= 2;
const int PIRPin2= 3;
int cont=0;
int val = LOW, va = LOW, ver=0;                  // estado del pin, ver es el verificador
int pirState1 = LOW, pirState2 = LOW;           // de inicio no hay movimiento

void setup()
{
  pinMode(PIRPin1, INPUT);
  pinMode(PIRPin2, INPUT);
  lcd.begin(16,2);
}
 
void loop(){
va = digitalRead(PIRPin1);
val = digitalRead(PIRPin2);
if(cont == 0){
        cont=0;
        lcd.setCursor(0,0);
        lcd.print("PASAJEROS:");
        lcd.setCursor(11,0);
        lcd.print(cont);
        lcd.setCursor(0,1);
        lcd.print("NO HAY PASAJEROS");
}
    if(va == LOW && val == HIGH && ver == 0){
      ver = 1;
      }
    if(va == HIGH && val == HIGH && ver == 1){
      ver = 2;
      }
    if(va == HIGH && val == LOW && ver == 2){
      ver = 3;
    }
    if (va == LOW && val == LOW && ver == 3)   //si está activado
     { 
        ver = 0;
        cont++;
        lcd.setCursor(0,0);
        lcd.print("PASAJEROS:");
        lcd.setCursor(11,0);
        lcd.print(cont);
        lcd.setCursor(0,1);
        lcd.print("           ");
        if(cont>=30){
          cont=30;
          lcd.setCursor(0,0);
          lcd.print("PASAJEROS:");
          lcd.setCursor(11,0);
          lcd.print(cont);
          lcd.setCursor(0,1);
          lcd.print("CAPACIDAD MAXIMA"); 
        }
     }
     ///////////////////////////
    if(va == HIGH && val == LOW && ver == 0){
      ver = 4;
      }
    if(va == HIGH && val == HIGH && ver == 4){
      ver = 5;
      }
    if(va == LOW && val == HIGH && ver == 5){
      ver = 6;
    }
    if (va == LOW && val == LOW && ver == 6){ //activado  
        ver = 0;
        cont--;
        lcd.setCursor(0,0);
        lcd.print("PASAJEROS:");
        lcd.setCursor(11,0);
        lcd.print(cont);
        lcd.setCursor(0,1);
        lcd.print("                 ");
     } 
}
