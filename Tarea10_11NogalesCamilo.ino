/*
 *  Tarea 9: PERIFERICOS ESPECIFICOS
 *  Camilo Nogales R.
 * 
 */
 #include <LiquidCrystal.h>
 #include<TimerOne.h>
 #include<MsTimer2.h> 
LiquidCrystal lcd (53,52,51,50,49,48);
const int buzz = 22;
 int on=0; //INT0
 int mod; //INT1
 int co; //INT2
 int i,j=0,k=0,cont=0,m=-1,h;
 int am=0, ah=0; 
 int leer=0,ho;
 long randLed,randLed2;
void setup() {
  // put your setup code here, to run once:
  pinMode(buzz,OUTPUT);
  i=0;
  Serial.begin(9600);
  lcd.begin(16,2);
  attachInterrupt(2,encendido,LOW);
  attachInterrupt(3,modo,LOW);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(mod==1){
    lcd.setCursor(0,1);
    lcd.print("                 ");
    leer=analogRead(0);
    leer=map(leer,0,1023,0,60);
    ho=analogRead(1);
    ho=map(ho,0,1023,0,24);
    am=leer;
    ah=ho;
    Serial.println(leer);
    Serial.println(ho);
    if(am<10){
       lcd.setCursor(3,1);
       lcd.print(" "); 
      }
    if(am==10){
       lcd.setCursor(3,1);
       lcd.print(" "); }
    if(am==60){
      lcd.setCursor(3,1);
      lcd.print(" "); 
      lcd.setCursor(5,1);
      lcd.print(" ");
      am=0;
      ah++;
      if(ah==24){
        lcd.setCursor(1,1);
        lcd.print(" ");
        ah=0;
       }   
     }
    lcd.setCursor(0,1);
    lcd.print(ah);
    lcd.setCursor(2,1);
    lcd.print(":");
    lcd.setCursor(4,1);
    lcd.print(am);
    lcd.setCursor(7,1);
    lcd.print("Alarma");
}
if(mod==2){
      if (am==m && ah==h){
      for(cont=0;cont<20;cont++){  
      Serial.println("ESTOY EJECUTANDO");
      digitalWrite(buzz,HIGH);
      }
      digitalWrite(buzz,LOW);
      leer=0;
      ho=0;
     }
}
}
void encendido(){
  switch(on){
    case 0:
      Timer1.initialize(1000000);//1 segundo
      Timer1.attachInterrupt(reloj);
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
      digitalWrite(buzz,LOW);
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
      Timer1.detachInterrupt();
      mod++;
    break;
    case 1:
      Timer1.initialize(1000000);//1 segundo
      Timer1.attachInterrupt(reloj);
      mod++;
    break;
    default:
      mod=0;
    break;
    }
  }
}

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
    Serial.print(m);
  lcd.setCursor(0,0);
  lcd.print(h);
  lcd.setCursor(2,0);
  lcd.print(":");
  lcd.setCursor(4,0);
  lcd.print(m);
  }
