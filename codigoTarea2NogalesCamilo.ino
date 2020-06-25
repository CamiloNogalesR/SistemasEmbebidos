/*
 *  CAPITULO 2: PUERTOS DIGITALES
 *  TAREA 2: Realice un programa que al presionar un pulsador, active un juego de 6 luces led que solo se enciendan. 
 *  Este juego se ejecutará 8 veces cada vez que se presione el pulsador. 
 *  Con otro pulsador, active un juego de 6 luces led que encienda  y apague  en grupos de dos en dos de la forma:
 *  1 y 6, 2 y 5 , 3 y 4
 *  Este juego se ejecutará 10 veces cada vez que se presione este pulsador.
 *  FUNCIONES: 
 *          pinMode(pin,MODO), MODO---> INPUT/OUTPUT
 *          digitalWrite(pin,ESTADO), ESTADO---> HIGH/LOW
 *          delay(ms), ms---> tiempo en milisegundos
 */


const int vectorled [6] = {8,9,10,11,12,13};
const int btn2=7;
const int btn=6;
int i=0,j=0,k=0,l=0,m=0;
void setup() {
  // put your setup code here, to run once:
pinMode(btn,INPUT);
pinMode(btn2,INPUT);
for(i=0;i<6;i++){
  pinMode(vectorled[i],OUTPUT);
  }
}

void loop() {
  // put your main code here, to run repeatedly:
//Al presionar el boton se encienden los 6 leds 8 veces

if(digitalRead(btn)==HIGH){
  m=0;
  delay(300); //antirebote
  while(m<16){
  //funcion toogle
    for(j=0;j<6;j++){
      digitalWrite(vectorled[j],!digitalRead(vectorled[j]));
    }
  delay(300);
  m++;
  digitalWrite(btn,digitalRead(btn));
  }
}
//Al presionar se enciende la secuencia de 6 leds 10 veces
if(digitalRead(btn2)==HIGH){
  l=0;
  delay(300); //antirebote
  while(l<10){
    for(k=0;k<3;k++){
      digitalWrite(vectorled[k],HIGH);
      digitalWrite(vectorled[5-k],HIGH);
      delay(300);
      digitalWrite(vectorled[k],LOW);
      digitalWrite(vectorled[5-k],LOW);
    }
  l++;
  }
}
}
