/*
 * CAPITULO 3: COMUNICACION I2C
 * TAREA 7: Realizar un programa donde el sistema máster tenga 4 switchs, al activarlos, 
 * envíe un mensaje por comunicación i2c al esclavo y encienda un led por cada switch. 
 * 
 */
 ////////MASTER////////
 #include <Wire.h>
 const int sw1=7,sw2=6,sw3=5,sw4=4;
 int tam,i;
 byte l;
 String men=("!!!HOLA ESCLAVO!!!");
void setup() {
  // put your setup code here, to run once:
  pinMode(sw1,INPUT);
  pinMode(sw2,INPUT);
  pinMode(sw3,INPUT);
  pinMode(sw4,INPUT);
  Wire.begin();
  Serial.begin(9600);
  
}

void loop() {
  // put your main code here, to run repeatedly:
    if(digitalRead(sw1)==HIGH && digitalRead(sw2)==HIGH && digitalRead(sw3)==HIGH && digitalRead(sw4)==HIGH){
      delay(300);
      l=14;
      tam=men.length()+1;
      char mens[tam];
      men.toCharArray(mens,tam);
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
      Wire.requestFrom(11,1);
      i=Wire.read();
      if(i==0){
        Wire.beginTransmission(11);
        Wire.write(mens,tam);
        Wire.endTransmission();
      }
      Serial.println(String("Enviado:")+String(mens));
      //men=("!!!HOLA ESCLAVO!!!");
    }
    if(digitalRead(sw1)==HIGH && digitalRead(sw2)==LOW && digitalRead(sw3)==LOW && digitalRead(sw4)==LOW){
      delay(300);
      l=0;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==LOW && digitalRead(sw2)==HIGH && digitalRead(sw3)==LOW && digitalRead(sw4)==LOW){
      delay(300);
      l=1;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==LOW && digitalRead(sw2)==LOW && digitalRead(sw3)==HIGH && digitalRead(sw4)==LOW){
      delay(300);
      l=2;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==LOW && digitalRead(sw2)==LOW && digitalRead(sw3)==LOW && digitalRead(sw4)==HIGH){
      delay(300);
      l=3;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==HIGH && digitalRead(sw2)==HIGH && digitalRead(sw3)==LOW && digitalRead(sw4)==LOW){
      delay(300);
      l=4;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==HIGH && digitalRead(sw2)==LOW && digitalRead(sw3)==HIGH && digitalRead(sw4)==LOW){
      delay(300);
      l=5;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==HIGH && digitalRead(sw2)==LOW && digitalRead(sw3)==LOW && digitalRead(sw4)==HIGH){
      delay(300);
      l=6;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==LOW && digitalRead(sw2)==HIGH && digitalRead(sw3)==HIGH && digitalRead(sw4)==LOW){
      delay(300);
      l=7;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==LOW && digitalRead(sw2)==HIGH && digitalRead(sw3)==LOW && digitalRead(sw4)==HIGH){
      delay(300);
      l=8;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==LOW && digitalRead(sw2)==LOW && digitalRead(sw3)==HIGH && digitalRead(sw4)==HIGH){
      delay(300);
      l=9;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==HIGH && digitalRead(sw2)==HIGH && digitalRead(sw3)==HIGH && digitalRead(sw4)==LOW){
      delay(300);
      l=10;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==HIGH && digitalRead(sw2)==HIGH && digitalRead(sw3)==LOW && digitalRead(sw4)==HIGH){
      delay(300);
      l=11;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==HIGH && digitalRead(sw2)==LOW && digitalRead(sw3)==HIGH && digitalRead(sw4)==HIGH){
      delay(300);
      l=12;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==LOW && digitalRead(sw2)==HIGH && digitalRead(sw3)==HIGH && digitalRead(sw4)==HIGH){
      delay(300);
      l=13;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
    if(digitalRead(sw1)==LOW && digitalRead(sw2)==LOW && digitalRead(sw3)==LOW && digitalRead(sw4)==LOW){
      delay(300);
      l=15;
      Wire.beginTransmission(11);
      Wire.write(l);
      Wire.endTransmission();
    }
}
