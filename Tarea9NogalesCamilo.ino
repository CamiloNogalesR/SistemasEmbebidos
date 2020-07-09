/*
 * CAPITULO IV: INTERRUPCIONES
 * CODIGO 16: MANEJO DE INTERRUPCIONES
 * 
 * Tarea 9
 * Camilo Nogales R.
 */
 int on=0; //INT0
 int cont=0; //INT1
 int i,j=0,as,n1,n2,sum,res; 
 String dato,num1,num2;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  //Serial.println("Ingrese 1 dato");
  attachInterrupt(0,act,LOW);
  attachInterrupt(1,sumres,LOW);
  }

void loop() {
  // put your main code here, to run repeatedly:
  if(on==1){
      if(Serial.available()){
      dato=Serial.readString();}
  }
  if(on==2){
    //Serial.println(dato);
    as=dato.indexOf('*');
    int t = dato.length();
    for(j=0;j<as;j++){
      num1=num1+String(dato[j]);
    }
    //Serial.print(dato);
    n1=num1.toInt();
    num1="";
    for(j=as+1;j<t;j++){
      num2=num2+String(dato[j]);
    }
    //Serial.println(n2);
    n2=num2.toInt();
    num2="";
  }
}

void act(){
  switch (on){
    case 0:
      Serial.println("Ingrese los numeros a evaluar separados por un (*)");
      on++;
    break;
    case 1:
      Serial.println("");
      Serial.println("INICIO Evaluacion, primer push suma, segundo push resta");
      on++;
    break;
    case 2:
      Serial.println("FIN DE EVALUACION");
      cont=0;
      on=0;
      i=0;
    break;
  }
}

void sumres(){
  switch (cont){
    case 0:
       sum=n1+n2;
//       Serial.println(n1);
//       Serial.println(n2);
       Serial.println("La suma es: "+String(sum));
       sum=0;
       cont++;
    break;
    case 1:
       res=n1-n2;
       Serial.println("La resta es: "+String(res));
       res=0;
       cont=0;
    break;
  }
}
