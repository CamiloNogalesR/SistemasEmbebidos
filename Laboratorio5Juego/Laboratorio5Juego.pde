import ddf.minim.*;

Minim minim;
AudioPlayer playermusic;
PImage img;
PFont font;
Player p;
int u=10;
int r=11;
int d=12;
int l=13;
int g=14;
int k=15;
int h=16;
int hitboxCheck=2;
int [][][] level= 
  {
  //lvl 0
  {
    {2, 2, 2, 2, 2, 2, 2}, 
    {2, 1, 0, 0, 0, 0, 2}, 
    {2, 2, 2, 2, 2, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 2, 2, 2, 2, 2}, 
    {2, 0, 0, 0, 0, 3, 2}, 
    {2, 2, 2, 2, 2, 2, 2}
  }, 
  //lvl 1
  {
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4}, 
    {4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4}, 
    {4, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 2, 4, 2, 4, 2, 2, 2, 2, 4}, 
    {4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {4, 2, 2, 2, 2, 2, 2, 4, 2, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4}, 
    {2, 0, 2, 4, 2, 4, 2, 2, 2, 2, 4}, 
    {4, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4}, 
    {4, 2, 2, 2, 2, 2, 2, 4, 2, 2, 4}
  }, 
  //lvl 2
  {
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
    {2, 5, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2}, 
    {2, 0, 2, 2, 2, 2, 2, 5, 2, 2, 2, 2}, 
    {2, 0, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2}, 
    {2, 0, 2, 2, 5, 0, 0, 0, 0, 0, 5, 2}, 
    {2, 0, 2, 2, 0, 2, 2, 0, 2, 2, 0, 2}, 
    {2, 0, 2, 2, 0, 2, 2, 0, 2, 2, 0, 2}, 
    {2, 0, 2, 2, 0, 2, 2, 0, 2, 2, 0, 2}, 
    {2, 0, 2, 2, 5, 0, 0, 5, 2, 2, 0, 2}, 
    {2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 6, 2}, 
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}
  }, 
  //lvl 3
  {
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
    {2, 4, 2, 4, 2, 5, 0, 0, 5, 2}, 
    {2, 0, 5, 0, 4, 0, 4, 4, 0, 2}, 
    {2, 0, 2, 0, 4, 0, 4, 4, 0, 2}, 
    {2, 0, 4, 0, 4, 0, 4, 4, 0, 2}, 
    {2, 0, 4, 0, 4, 0, 4, 4, 0, 2}, 
    {2, 0, 4, 0, 4, 0, 0, 6, 0, 2}, 
    {2, 0, 4, 0, 2, 2, 2, 2, 0, 2}, 
    {2, 1, 4, 0, 5, 0, 0, 0, 0, 2}, 
    {2, 2, 2, 4, 2, 4, 2, 2, 2, 2}
  }, 
  //lvl 4
  {
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
    {2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 0, 0, 2, 2, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 0, 2, 5, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 2}, 
    {2, 0, 2, 2, 2, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 5, 2, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 0, 2, 0, 0, 2, 2, 0, 2}, 
    {2, 2, 2, 2, 2, 2, 5, 2, 5, 0, 0, 0, 0, 2, 2, 0, 2, 2, 0, 2}, 
    {2, 2, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 2, 0, 0, 2}, 
    {2, 2, 0, 2, 0, 2, 2, 0, 0, 0, 0, 0, 5, 2, 0, 2, 2, 5, 2, 2}, 
    {2, 2, 5, 2, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 0, 2, 5, 2, 5, 2}, 
    {2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 0, 2, 2, 2, 2, 2, 0, 2, 2, 0, 2, 0, 0, 0, 0, 5, 2, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 2, 0, 2, 5, 2, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 0, 2, 5, 2, 0, 2}, 
    {2, 5, 2, 0, 0, 0, 0, 0, 2, 5, 0, 0, 0, 0, 0, 0, 0, 2, 6, 2}, 
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}
  }, 
  //lvl 5
  {
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
    {2, 2, 2, 2, 2, 2, 2, 0, 0, 2, 7, 7, 7, 7, 7, 7, 7, 7, 7, 2}, 
    {2, 2, 4, 5, 0, 0, 2, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 2, 4, 0, 4, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 2, 4, 0, 4, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 2, 4, 0, 4, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 2, 4, 0, 4, 0, 4, 0, 0, 4, 0, 2, 2, 2, 2, 2, 2, 2, 5, 2}, 
    {2, 0, 0, 0, 0, 5, 2, 9, 9, 4, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2}, 
    {2, 0, 8, 8, 8, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2}, 
    {2, 0, 4, 0, 4, 5, 0, 2, 0, 4, 0, 2, 5, 2, 0, 0, 0, 2, 0, 2}, 
    {2, 0, 4, 0, 4, 0, 2, 0, 5, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2}, 
    {2, 0, 4, 0, 4, 0, 2, 0, 2, 5, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 2, 0, 2, 2, 2, 2, 0, 2, 2}, 
    {2, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 2, 0, 0, 0, 2, 0, 0, 0, 2}, 
    {2, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 2, 0, 2, 0, 0, 0, 2, 0, 2}, 
    {2, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 2, 0, 0, 2, 2, 2, 2, 2, 2}, 
    {2, 5, 0, 0, 0, 0, 2, 0, 4, 0, 4, 2, 2, 0, 2, 5, 0, 0, 0, 2}, 
    {2, 2, 8, 8, 8, 2, 4, 0, 4, 0, 4, 2, 0, 0, 0, 2, 2, 0, 2, 2}, 
    {2, 1, 0, 0, 2, 2, 2, 0, 0, 5, 2, 2, 0, 2, 0, 0, 0, 0, 6, 2}, 
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}
  }, 
  //lvl 6
  {
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
    {2, r, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, d, 2}, 
    {2, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 0, 2, r, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, d, 2, 0, 2}, 
    {2, 0, 2, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, r, 0, 0, 0, 0, 0, 0, 0, 5, d, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 5, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 2, r, 0, 0, 0, 5, d, 2, 0, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 2, 5, 2, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 2, 0, 2, r, d, 2, 0, 2, 0, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 2, 0, 2, 5, 6, 2, 0, 2, 0, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 5, 2, 0, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 2, 0, 2, u, 5, 0, l, 2, 0, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 5, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 2, u, 5, 0, 0, 0, 0, 0, l, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 2, 0, 2}, 
    {2, 0, 2, 0, 2, u, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, l, 2, 0, 2}, 
    {2, 1, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 2}, 
    {2, u, 2, u, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, l, 2}, 
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}
  }, 
  //lvl 7
  {
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
    {2, 1, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2}, 
    {2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 0, 2, 2, 0, 2, 0, 2, 0, 0, 2, 0, 2, 2, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2}, 
    {2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 2, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 2, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 2, 0, 2, 2, 0, 2}, 
    {2, 2, 0, 2, 0, 2, 0, 2, 2, 0, 2, 0, 2, 0, 2, 2, 0, 2, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 2, 0, 2, 2, 2, 0, 2, 0, 2, 2, 0, 2, 0, 2, 2, 0, 2}, 
    {2, 2, 0, 2, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 2, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 2, 2, 2, 0, 0, 2}, 
    {2, 2, 0, 2, 0, 2, 2, 0, 2, 2, 2, 2, 2, 0, 2, 2, 0, 2, 0, 0, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
    {2, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 2, 2, 0, 2, 0, 0, 0, 0, 2}, 
    {2, 2, 0, 2, 0, 2, 0, 2, 2, 0, 2, 0, 2, 0, 2, 2, 0, 2, 0, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 2, 2, 0, 2, 0, 0, 2, 0, 2, 2, 0, 2}, 
    {2, 2, 0, 2, 0, 2, 0, 2, 2, 0, 2, 0, 2, 0, 2, 2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 2, 0, 2, 0, 0, 2, 0, 2}, 
    {2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 2, 0, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 0, 2, 0, 0, 2, 2, 2, 2, 0, 0, 2, 2, 0, 2, 0, 2}, 
    {2, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 0, 2, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 0, 0, 0, 2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 2, 0, 2}, 
    {2, 0, 2, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 0, 2, 2, 0, 2}, 
    {2, 0, 0, 2, 0, 2, 2, 0, 2, 2, 2, 2, 2, 2, 0, 0, 0, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 0, 0, 2, 2, 0, 2, 2, 0, 2, 0, 0, 0, 0, 2}, 
    {2, 2, 2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 2, 0, 2, 2, 0, 2}, 
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 0, 0, 2, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 2, 0, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 0, 0, 2, 0, 2}, 
    {2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 0, 0, 0, 2, 2, 2, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 2, 2, 0, 2, 2, 0, 2, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 2, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 2, 0, 0, 2, 0, 0, 0, 0, 2}, 
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2}, 
    {2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 0, 0, 0, 2, 0, 2, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 2, 0, 2, 0, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2}, 
    {2, 0, 2, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 0, 0, 2, 0, 0, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 0, 2, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2}, 
    {2, 0, 2, 0, 2, 0, 2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 2, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 2, 2, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2}, 
    {2, 2, 2, 2, 0, 2, 0, 2, 2, 0, 2, 0, 0, 2, 2, 2, 2, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 0, 2, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 0, 0, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2}, 
    {2, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 2, 2, 0, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2}, 
    {2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 2, 2, 2, 0, 0, 2, 0, 2, 0, 0, 2, 0, 0, 2, 0, 2, 2, 0, 2, 2, 0, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 0, 2, 2, 0, 0, 0, 0, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 2, 0, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 0, 0, 2, 0, 2, 2, 0, 2, 2, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2}, 
    {2, 2, 2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 0, 0, 0, 2, 2, 0, 2, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 0, 0, 0, 2, 0, 2, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2}, 
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
  }, 
  //lvl 8
  {
    {2, 2, h, h, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
    {2, 0, r, 0, 0, d, h, 0, h, h, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, k, 2}, 
    {2, 0, 0, h, d, k, 0, 0, 0, l, 0, 2, 0, 7, 7, 7, 7, 7, 0, 7, 0, 7, 7, 7, 2}, 
    {2, h, 0, h, 0, 0, h, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 7, 0, 7, 0, 0, 0, 0, 2}, 
    {2, h, u, 0, l, r, 0, d, h, 0, 0, 2, 7, 7, 7, 7, 0, 7, 0, 7, 7, 7, 7, 0, 2}, 
    {2, h, h, h, h, h, h, 0, h, 0, h, 2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 7, 0, 2}, 
    {2, r, 0, 0, 0, 0, 0, 0, 0, u, h, 2, 0, 7, 7, 7, 7, 7, 7, 7, 0, 7, 7, 0, 2}, 
    {2, 0, d, 0, 0, 0, 0, l, 0, 0, 0, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 7, 7, 0, 2}, 
    {2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 7, 7, 0, 7, 0, 7, 7, 7, 7, 7, 7, 0, 2}, 
    {2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
    {2, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 1, 0, g, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 2}, 
    {2, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
    {2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, h, 0, 0, 0, h, 0, 0, 0, h, k, 2}, 
    {2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 2}, 
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 2}, 
    {2, 4, h, h, h, 4, h, h, h, 4, 0, 2, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 2}, 
    {2, k, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 2}, 
    {2, h, h, 4, h, h, h, 4, h, h, h, 2, h, 0, 0, 0, h, 0, 0, 0, h, 0, 0, 0, h}, 
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
  }, 
  //lvl 9
  {
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
    {2, 1, l, l, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, l, l, l, 2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2}, 
    {2, l, l, l, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2}, 
    {2, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2}, 
    {2, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2}, 
    {2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 2, 2, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2, 0, 2, 0, 2, 2, 2}, 
    {2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2}, 
    {2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 2, 2, 2}, 
    {2, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2}, 
    {2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 2}, 
    {2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2, 0, 2}, 
    {2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2}, 
    {2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2, 0, 2, 2, 2, 2, 2}, 
    {2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 3, 2}, 
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
  }, 
  //lvl 10
  {
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, h, h, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
    {2, 0, 0, h, d, 0, 0, 0, 0, 0, 0, 0, l, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 0, h, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 0, 0, 0, 0, h, h, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 0, 0, 0, 0, 0, r, 5, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, d, h, 0, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, h, 0, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, h, 0, 0, 0, 0, 0, 0, 0, 0, 0, h, h, 0, 2}, 
    {2, h, h, 0, 0, 0, 0, 0, 0, 0, 0, h, u, 0, 0, 0, 0, 0, 0, 0, 0, 0, l, 0, 2}, 
    {2, r, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, d, h, 0, 0, 2}, 
    {h, 0, h, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, h, 0, 0, 2}, 
    {h, u, l, h, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 2, u, h, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, h, h, 0, 0, 0, 0, 4, 4}, 
    {2, 1, r, h, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, r, 0, 0, 0, 0, 0, 6, 4}, 
    {2, 2, d, h, 0, 0, 0, h, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4}, 
    {2, h, r, 0, 0, 0, u, h, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, h, h, h, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, h, 0, 0, 0, 0, 0, 2}, 
    {2, r, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, u, h, 0, 0, 0, 0, h, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, h, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, h, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, r, 5, u, h, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, h, h, h, 0, 2}, 
    {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {h, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {h, u, 0, 5, l, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}, 
    {2, 2, 2, h, h, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}, 
  },
  };
float slide=0.9;
int win=0;
int levels=0;
int d_d=0;
int a_a=0;
int s_s=0;
int w_w=0;
int s_sp=0;
int[] key_log;
int[] skip={1,3,1,3,2,4,2,4,5,5};
float[] ball_size={10, 10, 10, 10, 10, 10, 10, 5, 10, 10, 10, 10, 10, 10, 10, 10, 10};
int mode=1;
//Si un nivel es muy dificil, presiona "w s w s a d a d r r" para pasar de nivel.
void setup() {
  size(600, 600); //tamaño de la ventana
  minim = new Minim(this);
  playermusic = minim.loadFile("strgup.wav");
  playermusic.play();
  playermusic.loop(10);
  //img=loadImage("win.png");
  //font = loadFont("FuturaBT-Medium-48.vlw");
  key_log=new int[10]; //vector almacena 
  p=new Player();
  p.prep();
  frameRate(60);

}
void draw() {
  background(51);
    if (win==1) {
    levels++;
    if (levels==level.length) {
        println("!!!GANASTE!!!");
      }
    levels=levels%level.length;
    win=0;
    p.prep();
  }
  p.move();
  p.show();
  if(key_log[0]==skip[0]&&key_log[1]==skip[1]&&key_log[2]==skip[2]&&key_log[3]==skip[3]&&key_log[4]==skip[4]&&key_log[5]==skip[5]&&key_log[6]==skip[6]&&key_log[7]==skip[7]
  &&key_log[8]==skip[8]&&key_log[9]==skip[9]){
    win=1;
    key_log=new int[10];
  }
}
void keyReleased() {
  if (key==' ') {
    s_s=0;
    p.sd=1;
  }
  if (key=='a') {
    a_a=0;
    key_logAdd(2);
  }
  if (key=='w') {
    w_w=0;
    key_logAdd(1);
  }
  if (key=='s') {
    s_sp=0;
    key_logAdd(3);
  }
  if (key=='d') {
    d_d=0;
    key_logAdd(4);
  }
  if (key=='A') {
    a_a=0;
    key_logAdd(2);
  }
  if (key=='W') {
    w_w=0;
    key_logAdd(1);
  }
  if (key=='S') {
    s_sp=0;
    key_logAdd(3);
  }
  if (key=='D') {
    d_d=0;
    key_logAdd(4);
  }
  if (keyCode==LEFT) {
    a_a=0;
    key_logAdd(2);
  }
  if (keyCode==RIGHT) {
    d_d=0;
    key_logAdd(4);
  }
  if (keyCode==UP) {
    w_w=0;
    key_logAdd(1);
  }
  if (keyCode==DOWN) {
    s_sp=0;
    key_logAdd(3);
  }
  if(key=='r' || key=='R'){
    key_logAdd(5);
  }
}
void keyPressed() {
  if (key==' ') {
    s_s=1;
  }
  if (key=='r') {
    p.prep();
  }
  if (key=='R') {
    p.prep();
  }
  if (key=='a') {
    a_a=1;
  }
  if (key=='d') {
    d_d=1;
  }
  if (key=='w') {
    w_w=1;
  }
  if (key=='s') {
    s_sp=1;
  }
  if (key=='A') {
    a_a=1;
  }
  if (key=='D') {
    d_d=1;
  }
  if (key=='W') {
    w_w=1;
  }
  if (key=='S') {
    s_sp=1;
  }
  if (keyCode==LEFT) {
    a_a=1;
  }
  if (keyCode==RIGHT) {
    d_d=1;
  }
  if (keyCode==UP) {
    w_w=1;
  }
  if (keyCode==DOWN) {
    s_sp=1;
  }
}
class Player {
  PVector pos;
  PVector vel=new PVector(0, 0);
  PVector acc=new PVector(0, 0);
  PVector maxvel=new PVector(ball_size[levels]/2, ball_size[levels]/2);
  int p=0;
  int sd=1;
  //velocidad de movimiento
  float mm=2;
  //gravedad
  float g=1;
  float hg=0;
  float bounce=0.5;
  float bounce_2=1.5;
  void prep() {
    maxvel=new PVector(ball_size[levels]/2, ball_size[levels]/2);
    for (int i=0; i<level[levels].length; i++) {
      for (int j=0; j<level[levels][i].length; j++) {
        if (level[levels][i][j]==1) {
          pos=new PVector((width/level[levels][i].length)*j+(width/level[levels][i].length)/2, (height/level[levels].length)*i+(height/level[levels].length)/2);
          vel.x=0;
          vel.y=0;
          g=1;
          hg=0;
          return;
        }
      }
    }
  }
  
  void move() {
    if (keyPressed==false) {
      if (g!=0) {
        float save=vel.y;
        vel.set(vel.x*slide, save);
      } else {
        float save=vel.x;
        vel.set(save, vel.y*slide);
      }
    }
    PVector att=new PVector(pos.x, pos.y);
    int k=0;
    if ((d_d==1)&&(g!=0)) {
      att.add(mm, 0);
      att.sub(pos);
      k=1;
    }
    if ((a_a==1)&&(g!=0)) {
      att.add(-mm, 0);
      att.sub(pos);
      k=1;
    }
    if ((w_w==1)&&(hg!=0)) {
      att.add(0, -mm);
      att.sub(pos);
      k=1;
    }
    if ((s_sp==1)&&(hg!=0)) {
      att.add(0, mm);
      att.sub(pos);
      k=1;
    }
    if ((s_s==1)&&(sd==1)) {
      g*=-1;
      hg*=-1;
      sd=0;
    }
    if (k==0) {
      att.sub(pos);
    }
    if (g!=0) {
      acc.set(att.x, 0);
    } else {
      acc.set(0, att.y);
    }
    if (mode==0) {
      acc.add(hg, g);
    }
    acc.setMag(0.5);
    if (mode==1) {
      acc.add(hg, g);
    }
    vel.add(acc);
    if (vel.x>maxvel.x) {
      vel.x=maxvel.x;
    }
    if (vel.y>maxvel.y) {
      vel.y=maxvel.y;
    }
    if (vel.x<-maxvel.x) {
      vel.x=-maxvel.x;
    }
    if (vel.y<-maxvel.y) {
      vel.y=-maxvel.y;
    }
    vel.div(hitboxCheck);
    for (int lo=0; lo<hitboxCheck; lo++) {
      pos.add(vel);
      hitbox();
    }
    vel.mult(hitboxCheck);
    if (pos.x<0) {
      prep();
    }
    if (pos.x>width) {
      prep();
    }
    if (pos.y<0) {
      prep();
    }
    if (pos.y>height) {
      prep();
    }
    int gs=0;
    for (int i=0; i<level[levels].length; i++) {
      for (int j=0; j<level[levels][i].length; j++) {
        if (level[levels][i][j]==5) {
          gs=1;
        }
      }
    }

    if (gs==0) {
      for (int i=0; i<level[levels].length; i++) {
        for (int j=0; j<level[levels][i].length; j++) {
          if (level[levels][i][j]==6) {
            level[levels][i][j]=3;
          }
        }
      }
    } else {
      for (int i=0; i<level[levels].length; i++) {
        for (int j=0; j<level[levels][i].length; j++) {
          if (level[levels][i][j]==3) {
            level[levels][i][j]=6;
          }
        }
      }
    }
    //-------------------------------
    gs=0;
    for (int i=0; i<level[levels].length; i++) {
      for (int j=0; j<level[levels][i].length; j++) {
        if (level[levels][i][j]==15) {
          gs=1;
        }
      }
    }

    if (gs==0) {
      for (int i=0; i<level[levels].length; i++) {
        for (int j=0; j<level[levels][i].length; j++) {
          if (level[levels][i][j]==14) {
            level[levels][i][j]=-14;
          }
        }
      }
    } else {
      for (int i=0; i<level[levels].length; i++) {
        for (int j=0; j<level[levels][i].length; j++) {
          if (level[levels][i][j]==-14) {
            level[levels][i][j]=14;
          }
        }
      }
    }
//Control de frames 60fps
    if (frameCount%60==0) {
      for (int i=0; i<level[levels].length; i++) {
        for (int j=0; j<level[levels][i].length; j++) {
          if ((level[levels][i][j]==9)||(level[levels][i][j]==8)) {
            if (level[levels][i][j]==8) {
              level[levels][i][j]=9;
            } else {
              level[levels][i][j]=8;
            }
          }
        }
      }
    }
  }
  void hitbox() {
    for (int i=0; i<level[levels].length; i++) {
      for (int j=0; j<level[levels][i].length; j++) {
        //block
        if ((level[levels][i][j]==2)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          pos.set(pos.x, (height/level[levels].length)*i-(ball_size[levels]/2+1));
          vel.y*=-bounce;
        }
        if ((level[levels][i][j]==2)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          pos.set(pos.x, (height/level[levels].length)*(i+1)+(ball_size[levels]/2+1));
          vel.y*=-bounce;
        }
        if ((level[levels][i][j]==2)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          pos.set((width/level[levels][i].length)*j-(ball_size[levels]/2+1), pos.y);
          vel.x*=-bounce;
        }
        if ((level[levels][i][j]==2)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          pos.set((width/level[levels][i].length)*(j+1)+(ball_size[levels]/2+1), pos.y);
          vel.x*=-bounce;
        }
        //change block
        if ((level[levels][i][j]==8)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          pos.set(pos.x, (height/level[levels].length)*i-(ball_size[levels]/2+1));
          vel.y*=-bounce;
        }
        if ((level[levels][i][j]==8)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          pos.set(pos.x, (height/level[levels].length)*(i+1)+(ball_size[levels]/2+1));
          vel.y*=-bounce;
        }
        if ((level[levels][i][j]==8)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          pos.set((width/level[levels][i].length)*j-(ball_size[levels]/2+1), pos.y);
          vel.x*=-bounce;
        }
        if ((level[levels][i][j]==8)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          pos.set((width/level[levels][i].length)*(j+1)+(ball_size[levels]/2+1), pos.y);
          vel.x*=-bounce;
        }
        //death
        if ((level[levels][i][j]==4)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          for (int l=0; l<level[levels].length; l++) {
            for (int o=0; o<level[levels][l].length; o++) {
              if (level[levels][l][o]==-1) {
                level[levels][l][o]=5;
              }
              if (level[levels][l][o]==-15) {
                level[levels][l][o]=15;
              }
            }
          }
          g=1;
          hg=0;
          prep();
          vel.set(0, 0);
        }
        if ((level[levels][i][j]==4)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          for (int l=0; l<level[levels].length; l++) {
            for (int o=0; o<level[levels][l].length; o++) {
              if (level[levels][l][o]==-1) {
                level[levels][l][o]=5;
              }
              if (level[levels][l][o]==-15) {
                level[levels][l][o]=15;
              }
            }
          }
          g=1;
          hg=0;
          prep();
          vel.set(0, 0);
        }
        if ((level[levels][i][j]==4)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          for (int l=0; l<level[levels].length; l++) {
            for (int o=0; o<level[levels][l].length; o++) {
              if (level[levels][l][o]==-1) {
                level[levels][l][o]=5;
              }
              if (level[levels][l][o]==-15) {
                level[levels][l][o]=15;
              }
            }
          }
          g=1;
          hg=0;
          prep();
          vel.set(0, 0);
        }
        if ((level[levels][i][j]==4)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          for (int l=0; l<level[levels].length; l++) {
            for (int o=0; o<level[levels][l].length; o++) {
              if (level[levels][l][o]==-1) {
                level[levels][l][o]=5;
              }
              if (level[levels][l][o]==-15) {
                level[levels][l][o]=15;
              }
            }
          }
          g=1;
          hg=0;
          prep();
          vel.set(0, 0);
        }

        //avance de nivel

        if ((level[levels][i][j]==3)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          win=1;
          g=1;
          hg=0;
        }
        if ((level[levels][i][j]==3)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          win=1;
          g=1;
          hg=0;
        }
        if ((level[levels][i][j]==3)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          win=1;
          g=1;
          hg=0;
        }
        if ((level[levels][i][j]==3)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          win=1;
          g=1;
          hg=0;
        }

        //llaves
        if ((level[levels][i][j]==5)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          level[levels][i][j]=-1;
        }
        if ((level[levels][i][j]==5)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          level[levels][i][j]=-1;
        }
        if ((level[levels][i][j]==5)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          level[levels][i][j]=-1;
        }
        if ((level[levels][i][j]==5)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          level[levels][i][j]=-1;
        }

        //saltos
        if ((level[levels][i][j]==7)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          vel.y=-maxvel.y;
          vel.y*=bounce_2;
        }
        if ((level[levels][i][j]==7)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          vel.y=maxvel.y;
          vel.y*=bounce_2;
        }
        if ((level[levels][i][j]==7)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          vel.x=-maxvel.x;
          vel.x*=bounce_2;
        }
        if ((level[levels][i][j]==7)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          vel.x=maxvel.x;
          vel.x*=bounce_2;
        }

        //cambio de gravedad

        // up
        if ((level[levels][i][j]==10)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          g=-1;
          hg=0;
        }
        if ((level[levels][i][j]==10)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          g=-1;
          hg=0;
        }
        if ((level[levels][i][j]==10)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          g=-1;
          hg=0;
        }
        if ((level[levels][i][j]==10)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          g=-1;
          hg=0;
        }
        // right
        if ((level[levels][i][j]==11)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          g=0;
          hg=1;
        }
        if ((level[levels][i][j]==11)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          g=0;
          hg=1;
        }
        if ((level[levels][i][j]==11)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          g=0;
          hg=1;
        }
        if ((level[levels][i][j]==11)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          g=0;
          hg=1;
        }
        // down
        if ((level[levels][i][j]==12)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          g=1;
          hg=0;
        }
        if ((level[levels][i][j]==12)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          g=1;
          hg=0;
        }
        if ((level[levels][i][j]==12)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          g=1;
          hg=0;
        }
        if ((level[levels][i][j]==12)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          g=1;
          hg=0;
        }
        // left
        if ((level[levels][i][j]==13)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          g=0;
          hg=-1;
        }
        if ((level[levels][i][j]==13)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          g=0;
          hg=-1;
        }
        if ((level[levels][i][j]==13)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          g=0;
          hg=-1;
        }
        if ((level[levels][i][j]==13)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          g=0;
          hg=-1;
        }
        //ppuerta
        if ((level[levels][i][j]==14)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          pos.set(pos.x, (height/level[levels].length)*i-(ball_size[levels]/2+1));
          vel.y*=-bounce;
        }
        if ((level[levels][i][j]==14)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          pos.set(pos.x, (height/level[levels].length)*(i+1)+(ball_size[levels]/2+1));
          vel.y*=-bounce;
        }
        if ((level[levels][i][j]==14)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          pos.set((width/level[levels][i].length)*j-(ball_size[levels]/2+1), pos.y);
          vel.x*=-bounce;
        }
        if ((level[levels][i][j]==14)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          pos.set((width/level[levels][i].length)*(j+1)+(ball_size[levels]/2+1), pos.y);
          vel.x*=-bounce;
        }
        //llave de puerta
        if ((level[levels][i][j]==15)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          if (level[levels][i][j]>0) {
            level[levels][i][j]*=-1;
          }
        }
        if ((level[levels][i][j]==15)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          if (level[levels][i][j]>0) {
            level[levels][i][j]*=-1;
          }
        }
        if ((level[levels][i][j]==15)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          if (level[levels][i][j]>0) {
            level[levels][i][j]*=-1;
          }
        }
        if ((level[levels][i][j]==15)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          if (level[levels][i][j]>0) {
            level[levels][i][j]*=-1;
          }
        }
        //parado
        if ((level[levels][i][j]==16)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y+(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y+(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          pos.set(pos.x, (height/level[levels].length)*i-(ball_size[levels]/2+1));
          bounce/=10;
          vel.y*=-bounce;
          bounce*=10;
          vel.x*=bounce;
        }
        if ((level[levels][i][j]==16)&&(pos.x>=(width/level[levels][i].length)*j)&&(pos.x<=(width/level[levels][i].length)*(j+1))&&
          (pos.y-(ball_size[levels]/2+1)>=(height/level[levels].length)*i)&&(pos.y-(ball_size[levels]/2+1)<=(height/level[levels].length)*(i+1))) {
          pos.set(pos.x, (height/level[levels].length)*(i+1)+(ball_size[levels]/2+1));
          bounce/=10;
          vel.y*=-bounce;
          bounce*=10;
          vel.x*=bounce;
        }
        if ((level[levels][i][j]==16)&&(pos.x+(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x+(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          pos.set((width/level[levels][i].length)*j-(ball_size[levels]/2+1), pos.y);
          bounce/=10;
          vel.x*=-bounce;
          bounce*=10;
          vel.y*=bounce;
        }
        if ((level[levels][i][j]==16)&&(pos.x-(ball_size[levels]/2+1)>=(width/level[levels][i].length)*j)&&(pos.x-(ball_size[levels]/2+1)<=(width/level[levels][i].length)*(j+1))&&
          (pos.y>=(height/level[levels].length)*i)&&(pos.y<=(height/level[levels].length)*(i+1))) {
          pos.set((width/level[levels][i].length)*(j+1)+(ball_size[levels]/2+1), pos.y);
          bounce/=10;
          vel.x*=-bounce;
          bounce*=10;
          vel.y*=bounce;
        }
      }
    }
  }

  void show() {
    fill(0, 255, 0);
    noStroke();
    ellipse(pos.x, pos.y, ball_size[levels], ball_size[levels]);
    for (int i=0; i<level[levels].length; i++) {
      for (int j=0; j<level[levels][i].length; j++) {
        noFill();
        noStroke();
        if (level[levels][i][j]==2) {
          fill(255);
          stroke(255);
        } else if (level[levels][i][j]==3) {
          fill(0, 255, 0, 100);
          stroke(0, 255, 0, 100);
        } else if (level[levels][i][j]==4) {
          fill(255, 0, 0);
          stroke(255, 0, 0);
        } else if (level[levels][i][j]==5) {
          fill(255, 255, 0, 100);
          stroke(255, 255, 0, 100);
        } else if (level[levels][i][j]==6) {
          fill(0, 0, 255, 100);
          stroke(0, 0, 255, 100);
        } else if (level[levels][i][j]==7) {
          fill(0, 255, 255, 100);
          stroke(0, 255, 255, 100);
        } else if (level[levels][i][j]==8) {
          fill(180, 100, 100);
          stroke(180, 100, 100);
        } else if (level[levels][i][j]==9) {
          fill(180, 100, 50, 100);
          stroke(180, 100, 50, 100);
        } else if (level[levels][i][j]==14) {
          fill(100, 25, 25);
          stroke(100, 25, 25);
        } else if (level[levels][i][j]==15) {
          fill(255, 225, 125);
          stroke(255, 225, 125);
        } else if (level[levels][i][j]==16) {
          fill(0);
          stroke(0);
        } else {
          noFill();
          noStroke();
        }
        rect((width/level[levels][i].length)*j, (height/level[levels].length)*i, (width/level[levels][i].length), (height/level[levels].length));
        if (level[levels][i][j]==10) {
          up((width/level[levels][i].length)*j, (height/level[levels].length)*i, (width/level[levels][i].length), (height/level[levels].length));
        }
        if (level[levels][i][j]==11) {
          right((width/level[levels][i].length)*j, (height/level[levels].length)*i, (width/level[levels][i].length), (height/level[levels].length));      
        }
        if (level[levels][i][j]==12) {
          down((width/level[levels][i].length)*j, (height/level[levels].length)*i, (width/level[levels][i].length), (height/level[levels].length));
        }
        if (level[levels][i][j]==13) {
          left((width/level[levels][i].length)*j, (height/level[levels].length)*i, (width/level[levels][i].length), (height/level[levels].length));
        }
      }
    }
  }
}
void left(float x, float y, float w, float h) {
  noStroke();
  strokeWeight(1.5);
  fill(255, 10, 255, 125);
  rect(x, y, w, h);
  fill(0);
  stroke(0);
  line(x, y+(h/2), x+(w/2), y+h);
  line(x+(w/2), y+(h/2), x+w, y+(h/2));
  line(x, y+(h/2), x+(w/2), y);
  line(x+(w/2), y, x+(w/2), y+h);
  noStroke();
}
void up(float x, float y, float w, float h) {
  noStroke();
  strokeWeight(1.5);
  fill(255, 10, 255, 125);
  rect(x, y, w, h);
  fill(0);
  stroke(0);
  line(x, y+(h/2), x+w, y+(h/2));
  line(x+(w/2), y, x, y+(h/2));
  line(x+(w/2), y, x+w, y+(h/2));
  line(x+(w/2), y+(w/2), x+(w/2), y+h);
  noStroke();
}
void down(float x, float y, float w, float h) {
  noStroke();
  strokeWeight(1.5);
  fill(255, 10, 255, 125);
  rect(x, y, w, h);
  fill(0);
  stroke(0);
  line(x, y+(h/2), x+w, y+(h/2));
  line(x+(w/2), y+h, x, y+(h/2));
  line(x+(w/2), y+h, x+w, y+(h/2));
  line(x+(w/2), y+(w/2), x+(w/2), y);
  noStroke();
}
void right(float x, float y, float w, float h) {
  noStroke();
  strokeWeight(1.5);
  fill(255, 10, 255, 125);
  rect(x, y, w, h);
  fill(0);
  stroke(0);
  line(x+w, y+(h/2), x+(w/2), y+h);
  line(x+w, y+(h/2), x+(w/2), y);
  line(x+(w/2), y, x+(w/2), y+h);
  line(x+(w/2), y+(w/2), x, y+(h/2));
  noStroke();
}
void key_logAdd(int num){
  int[] temp_key;
  temp_key=new int[10];
  for(int i=1;i<temp_key.length;i++){
    temp_key[i-1]=key_log[i];
  }
  temp_key[temp_key.length-1]=num;
  key_log=temp_key;
}

//Ganaste
void ganaste(int x, int y){
  fill(200);
  noStroke();
  rect(x,y-10,width,120);
  textAlign(CENTER);
  //textFont(font, 24);
  fill(100);
  ellipse(width/2,y+50,150,150);
  fill(200);
  text("GANASTE", x, y+30, width, 125);
  //textFont(font, 18);
 // text("Press 'k'", x, y+60, width, 125);
}
