
#include "datos.h" //porque es un archivo local
float test[10][5]={
{5,3.5,1.3,0.3,1},
{4.5,2.3,1.3,0.3,1},
{4.4,3.2,1.3,0.2,1},
{6.2,2.9,4.3,1.3,2},
{5.1,2.5,3,1.1,2},
{5.7,2.8,4.1,1.3,3}, //ERROR
{6.3,2.5,5,1.9,3},
{6.5,3,5.2,2,3},
{6.2,3.4,5.4,2.3,3},
{5.9,3,5.1,1.8,3},
}; //datos de sensores
int fil=0;
int col=0;
int n,cont1=0,cont2=0,cont3=0;
float dist [90];
float distancia=0.0;
float distancia_menor=20000;
float etiqueta;
int k,p,ndata;
String kn,nd;
struct numeros
{
   float num1;
   float num2;
} numeros[90];
int compara_numeros( const void *a, const void *b)
{
    struct numeros *n1, *n2;
   n1 = (struct numeros *)a;
   n2 = (struct numeros *)b;
   if(n1->num1 > n2->num1) return 1;
   if(n1->num1 < n2->num1) return -1;
   if(n1->num2 > n2->num2) return 1;   
   if(n1->num2 < n2->num2) return -1;
   return 0;
};

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  for(;fil<90;fil++){
    for(col=0;col<4;col++){
      //distancia
      distancia=distancia+pow(matriz[fil][col]-test[8][col],2);
    }
    distancia=sqrt(distancia);
    dist[fil]=distancia;
    numeros[fil].num1 = distancia ;numeros[fil].num2=matriz[fil][4];
    //Serial.println(distancia);
    }
    qsort((void *)numeros,90,sizeof(numeros[0]), compara_numeros);
    //Serial.println(dist[3]);
     for(n=0;n<90;n++)
   {
       Serial.print(numeros[n].num1); Serial.print("  ");
       Serial.println(numeros[n].num2);
   }
   delay(500);
   Serial.print("Escoger un numero de k vecinos: ");
   }

void loop() {
  // put your main code here, to run repeatedly:

  if(Serial.available()>0){
    kn=Serial.readString();
    k=kn.toInt();
    switch(k){
      case 1:
        Serial.println("");
        Serial.println(String("datos son de etiqueta: ")+String(numeros[k-1].num2));
        etiqueta=numeros[k-1].num2;
      break;
      default:
        for(p=0;p<k;p++){
          if(numeros[p].num2==1){
            cont1++; 
          }
          if(numeros[p].num2==2){
            cont2++;
          }
          if(numeros[p].num2==3){
            cont3++;
          }
        }   
     Serial.println("");
     Serial.println(String("Hay ")+String(cont1)+String(" vecinos con la etiqueta ")+String(1));
     Serial.println(String("Hay ")+String(cont2)+String(" vecinos con la etiqueta ")+String(2));
     Serial.println(String("Hay ")+String(cont3)+String(" vecinos con la etiqueta ")+String(3));
     if(cont1>cont2 && cont1>cont3){
      etiqueta=1;
    }
    if(cont2>cont1 && cont2>cont3){
      etiqueta=2;
    } 
    if(cont3>cont2 && cont3>cont1){
      etiqueta=3;
    }  
    }
    //RENDIMIENTO
    if(etiqueta==test[8][4]){
    Serial.println("ACIERTO");
    Serial.println("RENDIMIENTO 90%,Test 10 datos");
  }
    else
    Serial.println("ERROR");
    //Serial.println("RENDIMIENTO 90%,Test 10 datos");
    //RENDIMIENTO 90%
    cont1=0;cont2=0;cont3=0;
} 
}
