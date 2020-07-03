/*
 * CAPITULO 3: COMUNICACION I2C
 * TAREA 7: Realizar un programa donde el sistema máster tenga 4 switchs, al activarlos, 
 * envíe un mensaje por comunicación i2c al esclavo y encienda un led por cada switch. 
 * 
 */
 ////////ESCLAVO////////

 #include <Wire.h>
 const int led1=8,led2=9,led3=10,led4=11;
 int t,j,led,i;
 char mess;
 String mes;
void setup() {
  // put your setup code here, to run once:
  pinMode(led4,OUTPUT);
  pinMode(led3,OUTPUT);
  pinMode(led2,OUTPUT);
  pinMode(led1,OUTPUT);
  Wire.begin(11);
  //Wire.onReceive(receiveEvent);
  Wire.onRequest(requestEvent);
  Wire.onReceive(prendoLed);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
}

/*void receiveEvent (int bytes){
  while(Wire.available()){
   mess=Wire.read();
   mes=mes+String(mess);
   mes=mes.readStringUntil('#');
  }
  Serial.println("Recibido:"+mes);
  mes="";
}*/

void prendoLed(int bytes){
  while(Wire.available()){
    led=Wire.read();
    switch(led){
      case 0:
        digitalWrite(led1,HIGH);
        digitalWrite(led2,LOW);
        digitalWrite(led3,LOW);
        digitalWrite(led4,LOW);
      break;
      case 1:
        digitalWrite(led1,LOW);
        digitalWrite(led2,HIGH);
        digitalWrite(led3,LOW);
        digitalWrite(led4,LOW);
      break;
      case 2:
        digitalWrite(led1,LOW);
        digitalWrite(led2,LOW);
        digitalWrite(led3,HIGH);
        digitalWrite(led4,LOW);
      break;
      case 3:
        digitalWrite(led1,LOW);
        digitalWrite(led2,LOW);
        digitalWrite(led3,LOW);
        digitalWrite(led4,HIGH);
      break;
      case 4:
        digitalWrite(led1,HIGH);
        digitalWrite(led2,HIGH);
        digitalWrite(led3,LOW);
        digitalWrite(led4,LOW);
      break;
      case 5:
        digitalWrite(led1,HIGH);
        digitalWrite(led2,LOW);
        digitalWrite(led3,HIGH);
        digitalWrite(led4,LOW);
      break;
      case 6:
        digitalWrite(led1,HIGH);
        digitalWrite(led2,LOW);
        digitalWrite(led3,LOW);
        digitalWrite(led4,HIGH);
      break;
      case 7:
        digitalWrite(led1,LOW);
        digitalWrite(led2,HIGH);
        digitalWrite(led3,HIGH);
        digitalWrite(led4,LOW);
      break;
      case 8:
        digitalWrite(led1,LOW);
        digitalWrite(led2,HIGH);
        digitalWrite(led3,LOW);
        digitalWrite(led4,HIGH);
      break;
      case 9:
        digitalWrite(led1,LOW);
        digitalWrite(led2,LOW);
        digitalWrite(led3,HIGH);
        digitalWrite(led4,HIGH);
      break;
      case 10:
        digitalWrite(led1,HIGH);
        digitalWrite(led2,HIGH);
        digitalWrite(led3,HIGH);
        digitalWrite(led4,LOW);
      break;
      case 11:
        digitalWrite(led1,HIGH);
        digitalWrite(led2,HIGH);
        digitalWrite(led3,LOW);
        digitalWrite(led4,HIGH);
      break;
      case 12:
        digitalWrite(led1,HIGH);
        digitalWrite(led2,LOW);
        digitalWrite(led3,HIGH);
        digitalWrite(led4,HIGH);
      break;
      case 13:
        digitalWrite(led1,LOW);
        digitalWrite(led2,HIGH);
        digitalWrite(led3,HIGH);
        digitalWrite(led4,HIGH);
      break;
      case 14:
        //mess=Wire.read();
        i=0;
        requestEvent(i);
        while(Wire.available()){
        mess=Wire.read();
        mes=mes+String(mess);}
        Serial.println("Recibido:"+mes);
        //mes="";
        digitalWrite(led1,HIGH);
        digitalWrite(led2,HIGH);
        digitalWrite(led3,HIGH);
        digitalWrite(led4,HIGH);
      break;
      case 15:
        digitalWrite(led1,LOW);
        digitalWrite(led2,LOW);
        digitalWrite(led3,LOW);
        digitalWrite(led4,LOW);
      break;
      default:
        digitalWrite(led1,LOW);
        digitalWrite(led2,LOW);
        digitalWrite(led3,LOW);
        digitalWrite(led4,LOW);
      break;
    }
  }
}

void requestEvent(int i){
  Wire.write(i);
}
