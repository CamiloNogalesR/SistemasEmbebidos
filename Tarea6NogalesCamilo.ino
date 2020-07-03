/*
 * CAPITULO 3: MEDIOS DE COMUNICACION/Comunicacion Serial
 * TAREA 6: Valide una contraseña de 4 dígitos ingresos por 
 * comunicación serial. Enciende un led verde si es la 
 * adecuada o un led rojo si es erróneo el ingreso. 
 * 
 */
const int led1 = 8;
const int led2 = 9;
String c = "1994";
String dato;
#include <string.h>
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(led1,OUTPUT);
  pinMode(led2,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()>0){
    dato=Serial.readStringUntil('#');
    if(dato==c){
      Serial.println("ACCESO CORRECTO");
      digitalWrite(led1,HIGH);
      digitalWrite(led2,LOW);
      delay(300);
    }
    else{
      Serial.println("ACCESO INCORRECTO");
      digitalWrite(led1,LOW);
      digitalWrite(led2,HIGH);
      delay(300);
    }
    dato="";
  }
}
