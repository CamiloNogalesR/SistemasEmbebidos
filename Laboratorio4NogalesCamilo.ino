/*
 * ENCABEZADO EN EL REPOSITORIO
 * OBJETIVO: Realizar lecturas del conversor AD y apagarlo por el tiempo
 *           establecido por el usuario
 * 
 */

#include <TimerOne.h>
#include <LiquidCrystal.h>
#include <MsTimer2.h>
#include <avr/power.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <EEPROM.h>

LiquidCrystal lcd (13,12,11,10,9,8);
const int leds[3]={5,4,3};
const int sens[3]={A0,A1,A2};
int cont=-1,i,m,h,j;
int com=0,cm;
int coh=0,ch;
int dato, dato0,leer;
String con,pass;
String est;
long randLed,randLed2;
void setup() {
  // put your setup code here, to run once:
  for(i=0;i<3;i++){
    pinMode(leds[i],OUTPUT);
  }
  for(i=0;i<3;i++){
    pinMode(sens[i],INPUT);
  }
  EEPROM.write(0,17);
  EEPROM.write(1,11);
  //EEPROM.write(5,7);
  m=EEPROM.read(2);
  h=EEPROM.read(3);
  com=EEPROM.read(4);
  coh=EEPROM.read(5);
  Timer1.initialize(1000000);//1 segundo
  Timer1.attachInterrupt(reloj);
  Serial.begin(9600);
  lcd.begin(16,2);
  set_sleep_mode(SLEEP_MODE_STANDBY);
  Serial.println("INICIO DEL SISTEMA, Ingrese password...");
  dato=EEPROM.read(0);
  dato0=EEPROM.read(1);
  con=String(dato)+String(dato0);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()>0){
    pass=Serial.readString();
    if(con==pass){
    sleep_disable();
    Serial.println("***ACCESO CORRECTO***");
    lcd.setCursor(0,0);
    lcd.print("ACCESO CORRECTO");
    MsTimer2::set(1000,contador);
    MsTimer2::start();
  }
  if(con!=pass){
    Serial.println("FAIL, TRY AGAIN ");
    lcd.setCursor(0,0);
    lcd.print("FAIL, TRY AGAIN");
    if(Serial.available()>0){
    pass=Serial.readString();
    }
  }
 }
 while(cont==21){ 
    randLed = random(0,3);
    randLed2 = random (0,3);
    digitalWrite(leds[randLed],HIGH);
    delay(500);
    digitalWrite(leds[randLed2],LOW);
    delay(500);
    leer=digitalRead(sens[randLed]);
    if (leer==0){
      est="APAGADO";
    }
    else{
      est="ENCENDIDO";
    }
    Serial.println(String("Leyendo Sensor: ")+String(randLed+1)+String(". Estado: ")+String(est));
    delay(500);
 }
}

void contador(){
  cont++;
  if(cont<20){
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print(String("Tiempo rest: ")+String(20-cont));
    lcd.setCursor(0,1);
    lcd.print("SALGA DE LA CASA");
    }
  if(cont>20){
    cont=21;
    //MsTimer2::stop();
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("SISTEMA ACTIVO");
    if(m<10){
    lcd.setCursor(3,1);
    lcd.print("0"); 
       }
    if(m==10){
      lcd.setCursor(3,1);
      lcd.print(" "); }
    if(m==60){
      lcd.setCursor(3,1);
      lcd.print("0"); 
      lcd.setCursor(5,1);
      lcd.print(" ");
       if(h==24){
        lcd.setCursor(1,1);
        lcd.print(" ");
        h=0;
       }
      }
      lcd.setCursor(0,1);
      lcd.print(h);
      lcd.setCursor(2,1);
      lcd.print(":");
      lcd.setCursor(4,1);
      lcd.print(m); 
      attachInterrupt(0,activacion,LOW);
  }
}

void reloj(){
  m++;
  if(m==60){
    m=0;
    h++;
    if(h==24){
      h=0;
     }   
   }
//  Serial.println(String(com)+String(":")+String(coh));
//  Serial.println(String(h)+":"+String(m));
  if(com==m && coh==h){
    Serial.println("Time Backup");
    Serial.println(String("Hora: ")+String(coh)+String(":")+String(com));
    if(m<4){
    com=m+55;
    coh=h;
    }
  if(m>=5){
    com=m-5;
    coh=h+1;
    if (coh==24){
      coh=0;
    }
    }
  EEPROM.write(4,com);
  EEPROM.write(5,coh);
  }
  EEPROM.write(2,m);
  EEPROM.write(3,h);
}

void activacion(){
  for(i=0;i<3;i++){
        digitalWrite(leds[i], LOW);
        delay(500);
       }
  wdt_disable();
  wdt_enable(WDTO_500MS); //reiniciar en 0.5 segundos
  Serial.println(digitalRead(A0));
  sleep_mode();
}
