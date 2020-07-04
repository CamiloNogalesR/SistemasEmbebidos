/*
 * Laboratorio 2: Comunicacion Serial y I2C
 * Código EMISOR
 */
 #include<Wire.h>
 #include <string.h>
 char dato,separador='.';
 String dato2;
 int j=0, tam, f,t;
 String salida;
 String men;
void setup() {
  // put your setup code here, to run once:
  Wire.begin();
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()>0){    
    dato2=Serial.readStringUntil('#');
    Serial.println("\n");
    Serial.println("Se ha comenzado a recibir datos...");
    tam=dato2.length()+1;
    char vector2[tam];
    dato2.toCharArray(vector2,tam);
    //codificacion del mensaje
    for (f=0;f<tam-1;f++){
     salida=salida+String(dato2[f],DEC);
    }
    //salida.toCharArray(vector2,tam+80);
    Serial.println(salida);
    Serial.println("");
    //dato2.toCharArray(vector,tam);
    men=salida+'.'+dato2;
    t=men.length()+1;
    char vector[t];
    men.toCharArray(vector,t);
    Wire.beginTransmission(20);
    Wire.write(vector,t);
    Wire.endTransmission();
    Serial.println("Mensaje Codificado Enviado!!");
    //Serial.println(String(vector));
    salida="";
    dato2="";
    
  }
}
