/*
 *  CAPITULO 2: PUERTOS DIGITALES
 *  CODIGO DE MANEJO DE DISPLAY 7-SEG
 *  OBJETIVO: Representar los numeros del 0 al 9
 *  FUNCIONES: 
 *          pinMode(pin,MODO), MODO---> INPUT/OUTPUT
 *          digitalWrite(pin,ESTADO), ESTADO---> HIGH/LOW
 *          delay(ms), ms---> tiempo en milisegundos
 *  Realizado por: Camilo Nogales Romero
 *  Contacto: jcnogalesr@utn.edu.ec
 */


//const int vectorled [6] = {8,9,10,11,12,13};
const int D=11; //bit mas significativo
const int C=10;
const int B=9;
const int A=8;//bit menos significativo
const int decenas=13;
const int unidades=12;
const int btn=7;
int i=0,dec,uni,l=0,m=0,n=2;
void setup() {
  // put your setup code here, to run once:
pinMode(D,OUTPUT);
pinMode(C,OUTPUT);
pinMode(B,OUTPUT);
pinMode(A,OUTPUT);
pinMode(decenas,OUTPUT);
pinMode(unidades,OUTPUT);
pinMode(btn,INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
if(digitalRead(btn)==LOW){
  delay(100);
    if (i<100){
      l = 1;
      for (m = 2; m < n; m++) {
        if (n % m == 0) {
                l = 0;
                break;
            }
        }
    }
    if (l==1) {
    //variable que almacena para la impresion es n
    dec=n/10; //  15/10->1.5-> 1
    uni=n-(dec*10); //  15-(10)=5
    digitalWrite(decenas,HIGH);
    digitalWrite(unidades,LOW);
    //imprimir valor decenas
    segmentos(dec);
    delay(400);
    digitalWrite(decenas,LOW);
    digitalWrite(unidades,HIGH);
    //imprimir valor unidades
    segmentos(uni);  
    delay(200);
    i++;
        }
    n++;
    if(n>=100){
    n=2;}        
}

}

void segmentos (int j){
  switch(j){
      case 0: 
        digitalWrite(D,LOW);
        digitalWrite(C,LOW);
        digitalWrite(B,LOW);
        digitalWrite(A,LOW);
        break;

      case 1: 
        digitalWrite(D,HIGH);
        digitalWrite(C,LOW);
        digitalWrite(B,LOW);
        digitalWrite(A,LOW);
        break;

      case 2: 
        digitalWrite(D,LOW);
        digitalWrite(C,HIGH);
        digitalWrite(B,LOW);
        digitalWrite(A,LOW);
        break;

      case 3: 
        digitalWrite(D,HIGH);
        digitalWrite(C,HIGH);
        digitalWrite(B,LOW);
        digitalWrite(A,LOW);
        break;

      case 4: 
        digitalWrite(D,LOW);
        digitalWrite(C,LOW);
        digitalWrite(B,HIGH);
        digitalWrite(A,LOW);
        break;

      case 5: 
        digitalWrite(D,HIGH);
        digitalWrite(C,LOW);
        digitalWrite(B,HIGH);
        digitalWrite(A,LOW);
        break;

      case 6: 
        digitalWrite(D,LOW);
        digitalWrite(C,HIGH);
        digitalWrite(B,HIGH);
        digitalWrite(A,LOW);
        break;

      case 7: 
        digitalWrite(D,HIGH);
        digitalWrite(C,HIGH);
        digitalWrite(B,HIGH);
        digitalWrite(A,LOW);
        break;

      case 8: 
        digitalWrite(D,LOW);
        digitalWrite(C,LOW);
        digitalWrite(B,LOW);
        digitalWrite(A,HIGH);
        break;

      case 9: 
        digitalWrite(D,HIGH);
        digitalWrite(C,LOW);
        digitalWrite(B,LOW);
        digitalWrite(A,HIGH);
        break;
  }

  
}
