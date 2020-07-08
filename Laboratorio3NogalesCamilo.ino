/*
 *  LABORATORIO 3: PERIFERICOS ESPECIFICOS
 *  OBJETIVO: Realizar un sistema domótico
 * 
 */
 #include <LiquidCrystal.h>
 #include<TimerOne.h>
 #include<MsTimer2.h> 
LiquidCrystal lcd (53,52,51,50,49,48);
const int leds[4] = {2,3,4,5};
 int on=0; //INT0
 int mod; //INT1
 int co; //INT2
 int i,j=0,k=0,cont=0,m=-1,h; 
 int leer=0,ho;
 long randLed,randLed2;
void setup() {
  // put your setup code here, to run once:
  for(i=0;i<4;i++){
    pinMode(leds[i],OUTPUT);
  }
  i=0;
  Serial.begin(9600);
  lcd.begin(16,2);
  attachInterrupt(2,encendido,LOW);
  attachInterrupt(3,modo,LOW);
  //attachInterrupt(4,apagado,LOW);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(mod==2){
    lcd.setCursor(0,1);
    lcd.print("                 ");
    leer=analogRead(0);
    leer=map(leer,0,1023,0,60);
    ho=analogRead(1);
    ho=map(ho,0,1023,0,24);
    m=leer;
    h=ho;
    Serial.println(leer);
    Serial.println(ho);
    if(m<10){
       lcd.setCursor(3,0);
       lcd.print(" "); 
      }
    if(m==10){
       lcd.setCursor(3,0);
       lcd.print(" "); }
    if(m==60){
      lcd.setCursor(3,0);
      lcd.print(" "); 
      lcd.setCursor(5,0);
      lcd.print(" ");
      m=0;
      h++;
      if(h==24){
        lcd.setCursor(1,0);
        lcd.print(" ");
        h=0;
       }   
     }
    lcd.setCursor(0,0);
    lcd.print(h);
    lcd.setCursor(2,0);
    lcd.print(":");
    lcd.setCursor(4,0);
    lcd.print(m);
    leer=0;
  }
}

void encendido(){
  switch(on){
    case 0:
      Timer1.initialize(1000000);//1 segundo
      Timer1.attachInterrupt(reloj);
//      MsTimer2::set(1000,reloj);
//      MsTimer2::start();
      on++;
      co=0;
    break;
    case 1:
      lcd.setCursor(0,1);      
      lcd.print("MODE SELECT");
      on++;
     break;
     case 2:
      Timer1.detachInterrupt();  
      MsTimer2::stop();   
      lcd.setCursor(0,0);
      lcd.print("                ");
      lcd.setCursor(0,1);      
      lcd.print("                ");
      for(i=0;i<4;i++){
        digitalWrite(leds[i],LOW);
      }
      on=0;
      mod=0;
      cont=0;
      i=0;
      j=0;
      m=-1;
      h=0;
     break;
     default:
        on=0;
     break;
  }
}
void modo(){
if(on==2){
  switch(mod){
    case 0:
      MsTimer2::set(1000,timer);
      MsTimer2::start();
      mod++;
    break;
    case 1:
      cont=0;
      MsTimer2::stop(); 
      Timer1.detachInterrupt();
      mod++;
    break;
    case 2:
      Timer1.initialize(1000000);//1 segundo
      Timer1.attachInterrupt(reloj);
      mod=0;
    break;
    default:
      mod=0;
    break;
    }
  }
}

//void apagado(){
//  switch(co){
//    case 0:
//      Timer1.detachInterrupt();  
//      MsTimer2::stop();   
//      lcd.setCursor(0,0);
//      lcd.print("                ");
//      lcd.setCursor(0,1);      
//      lcd.print("                ");
//      for(i=0;i<4;i++){
//        digitalWrite(leds[i],LOW);
//      }
//      on=0;
//      mod=0;
//      cont=0;
//      i=0;
//      j=0;
//      m=-1;
//      h=0;
//      co++;
//    break;
//    default:
//      co++;
//    break;
//  }
//}

void reloj(){
  m++;
  if(m<10){
   lcd.setCursor(3,0);
   lcd.print("0"); 
  }
  if(m==10){
   lcd.setCursor(3,0);
   lcd.print(" "); }
  if(m==60){
    lcd.setCursor(3,0);
    lcd.print("0"); 
    lcd.setCursor(5,0);
    lcd.print(" ");
    m=0;
    h++;
    if(h==24){
      lcd.setCursor(1,0);
      lcd.print(" ");
      h=0;
     }   
   }
  lcd.setCursor(0,0);
  lcd.print(h);
  lcd.setCursor(2,0);
  lcd.print(":");
  lcd.setCursor(4,0);
  lcd.print(m);
}

void timer(){
  if(cont<20){
    lcd.setCursor(0,1);
    lcd.print("***LED MODE ON***");
    cont++;
    randLed= random(0,4);
    randLed2 = random (0,4);
        digitalWrite(leds[randLed], HIGH);
        digitalWrite(leds[randLed2], LOW);   
    Serial.println(randLed);
    Serial.println(randLed2);
  if(cont==20){
    cont=20;
    for(j=0;j<cont;j++){
      for(i=0;i<4;i++){
        digitalWrite(leds[i], LOW);
        delay(500);
       }
    }
   lcd.setCursor(0,1);
   lcd.print("                "); 
  }
 //Serial.println(String(cont));
}
}
