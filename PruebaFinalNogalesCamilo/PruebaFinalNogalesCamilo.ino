#include<EEPROM.h>
#include "datosp.h"
#include "test.h"
int i,j=0,etiqueta;
int fil=0, fil1=0;
int col=0, col1=0;
int cont1=0,cont2=0,cont3=0,cont4=0,cont5=0,cont6=0,cont7=0,cont8=0,cont9=0,cont10=0,cont11=0,cont12=0;
float prom1=0.00, prom2=0.00, prom3=0.00, prom4=0.00,prom5=0.00, prom6=0.00, prom7=0.00, prom8=0.00,prom9=0.00, prom10=0.00, prom11=0.00, prom12=0.00;
float sum1=0.00, sum2=0.00, sum3=0.00, sum4=0.00,sum5=0.00, sum6=0.00, sum7=0.00, sum8=0.00,sum9=0.00, sum10=0.00, sum11=0.00, sum12=0.00;
float dist=0.00, dist1=0.00, dist2=0.00, dist3=0.00,distancia=0.00,distancia_menor=200000.00;
float vec1[40];
float vec[40], vec2[40], vec3[40];
float may1=0, may2=0, may3=0, may4=0;
float norm[157], ver[157];
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  for(fil=0;fil<157;fil++){
    for(col=0;col<3;col++){
      if(fil<157 && col==0 && matriz[fil][3]==1){
        cont1++;
        sum1=sum1+matriz[fil][0];
      }
      if(fil<157 && col==1 && matriz[fil][3]==1){
        cont2++;
        sum2=sum2+matriz[fil][1];
      }
      if(fil<157 && col==2 && matriz[fil][3]==1){
        cont3++;
        sum3=sum3+matriz[fil][2];
      }
      if(fil<157 && col==0 && matriz[fil][3]==2){
        cont4++;
        sum4=sum4+matriz[fil][0];
      }
      if(fil<157 && col==1 && matriz[fil][3]==2){
        cont5++;
        sum5=sum5+matriz[fil][1];
      }
      if(fil<157 && col==2 && matriz[fil][3]==2){
        cont6++;
        sum6=sum6+matriz[fil][2];
      }
      if(fil<157 && col==0 && matriz[fil][3]==3){
        cont7++;
        sum7=sum7+matriz[fil][0];
      }
      if(fil<157 && col==1 && matriz[fil][3]==3){
        cont8++;
        sum8=sum8+matriz[fil][1];
      }
      if(fil<157 && col==2 && matriz[fil][3]==3){
        cont9++;
        sum9=sum9+matriz[fil][2];
      }
      if(fil<157 && col==0 && matriz[fil][3]==4){
        cont10++;
        sum10=sum10+matriz[fil][0];
      }
      if(fil<157 && col==1 && matriz[fil][3]==4){
        cont11++;
        sum11=sum11+matriz[fil][1];
      }
      if(fil<157 && col==2 && matriz[fil][3]==4){
        cont12++;
        sum12=sum12+matriz[fil][2];
      }
     }
    }
  prom1=sum1/cont1;
  prom2=sum2/cont2;
  prom3=sum3/cont3;
  prom4=sum4/cont4;
  prom5=sum5/cont5;
  prom6=sum6/cont6;
  prom7=sum7/cont7;
  prom8=sum8/cont8;
  prom9=sum9/cont9;
  prom10=sum10/cont10;
  prom11=sum11/cont11;
  prom12=sum12/cont12;
  //DISTANCIAS
  for(fil1=0;fil1<157;fil1++){
      if(matriz[fil1][3]==1){
        dist=pow(prom1-matriz[fil1][0],2)+pow(prom2-matriz[fil1][1],2)+pow(prom3-matriz[fil1][2],2);
        dist=sqrt(dist);
        vec[fil1]=dist;
      }
   //Serial.println(vec[fil1]);
  }
  //MAYOR
  for(i=0;i<40;i++){
    if(vec[i]>may1){
      may1=vec[i];
    }
  }
  //Serial.println(may1);
  //NORMALIZACION
  for(i=0;i<40;i++){
    norm[i]=vec[i]/may1;
    //Serial.println(norm[i]);
  }
  //BUSQUEDA DE NUEVA BASE DE DATOS
  for(i=0;i<40;i++){
  if(norm[i]>0.4 && norm[i]<0.65){
    ver[i]=norm[i];
    //Serial.println(ver[i]);
  }
  }
  //TEST
  for(i=0;i<8;i++){
    for(j=0;j<3;j++){
    distancia=distancia+pow(ver[i]*may1-test[i][j],2);
    }
    distancia=sqrt(distancia);
    if(distancia<distancia_menor){
      distancia_menor=distancia;
    }
   etiqueta=test[i][3];
    if(test[i][3]==1){
      Serial.println(String("Los datos son de la prueba: ")+String(i+1)+String(" y su etiqueta es: ")+String(etiqueta));
      Serial.println("ACIERTO");
  }
  }
  for(fil1=0;fil1<157;fil1++){
      if(matriz[fil1][3]==2){
        dist1=pow(prom4-matriz[fil1][0],2)+pow(prom5-matriz[fil1][1],2)+pow(prom6-matriz[fil1][2],2);
        dist1=sqrt(dist1);
        vec1[fil1]=dist1;
      }
    //Serial.println(vec1[fil1]);
  }
    for(i=40;i<80;i++){
    if(vec1[i]>may2){
      may2=vec1[i];
    }
  }
  //Serial.println(may2);
    for(i=40;i<79;i++){
    norm[i]=vec1[i]/may2;
    //Serial.println(norm[i]);
  }
  for(i=40;i<79;i++){
  if(norm[i]>0.4 && norm[i]<0.65){
    ver[i]=norm[i];
    //Serial.println(ver[i]);
  }
  }
    //TEST
  for(i=0;i<8;i++){
    for(j=0;j<3;j++){
    distancia=distancia+pow(ver[i+12]*may1-test[i][j],2);
    }
    distancia=sqrt(distancia);
    if(distancia<distancia_menor){
      distancia_menor=distancia;
    }
   etiqueta=test[i][3];
    if(test[i][3]==2){
      Serial.println(String("Los datos son de la prueba: ")+String(i+1)+String(" y su etiqueta es: ")+String(etiqueta));
      Serial.println("ACIERTO");
  }
  }
  for(fil1=0;fil1<157;fil1++){
      if(matriz[fil1][3]==3){
        dist2=pow(prom7-matriz[fil1][0],2)+pow(prom8-matriz[fil1][1],2)+pow(prom9-matriz[fil1][2],2);
        dist2=sqrt(dist2);
        vec2[fil1]=dist2;
        //Serial.println(dist2);
      }
  }
  for(i=80;i<120;i++){
    if(vec2[i]>may3){
      may3=vec2[i];
    }
  }
  //Serial.println(may3);
    for(i=79;i<118;i++){
    norm[i]=vec2[i]/may3;
    //Serial.println(norm[i]);
  }
  for(i=79;i<118;i++){
  if(norm[i]>0.4 && norm[i]<0.65){
    ver[i]=norm[i];
    //Serial.println(ver[i]);
  }
  }
   //TEST
  for(i=0;i<8;i++){
    for(j=0;j<3;j++){
    distancia=distancia+pow(ver[i+12]*may1-test[i][j],2);
    }
    distancia=sqrt(distancia);
    if(distancia<distancia_menor){
      distancia_menor=distancia;
    }
   etiqueta=test[i][3];
    if(test[i][3]==3){
      Serial.println(String("Los datos son de la prueba: ")+String(i+1)+String(" y su etiqueta es: ")+String(etiqueta));
      Serial.println("ACIERTO");
  }
  }
  for(fil1=0;fil1<157;fil1++){
      if(matriz[fil1][3]==4){
        dist3=pow(prom10-matriz[fil1][0],2)+pow(prom11-matriz[fil1][1],2)+pow(prom12-matriz[fil1][2],2);
        dist3=sqrt(dist3);
        vec3[fil1]=dist3;
        }
  }
  for(i=120;i<157;i++){
    if(vec3[i]>may4){
      may4=vec3[i];
    }
  }
  //Serial.println(may4);
    for(i=118;i<157;i++){
    norm[i]=vec3[i]/may4;
    //Serial.println(norm[i]);
  }
  for(i=118;i<157;i++){
  if(norm[i]>0.4 && norm[i]<0.65){
    ver[i]=norm[i];
    //Serial.println(ver[i]);
  }
  }
   //TEST
  for(i=0;i<8;i++){
    for(j=0;j<3;j++){
    distancia=distancia+pow(ver[i+12]*may1-test[i][j],2);
    }
    distancia=sqrt(distancia);
    if(distancia<distancia_menor){
      distancia_menor=distancia;
    }
   etiqueta=test[i][3];
    if(test[i][3]==4){
      Serial.println(String("Los datos son de la prueba: ")+String(i+1)+String(" y su etiqueta es: ")+String(etiqueta));
      Serial.println("ACIERTO");
  }
  }
}
void loop() {
  // put your main code here, to run repeatedly:

  }
