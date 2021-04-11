public class baby{
  boolean brandHarBaby = false;
  
  void tegnBaby(int x,int y, int w, int b){
    PImage bb = loadImage("baby.png");
        fill(192, 57, 43);
        image(bb, x,y,w,b);
  }
  
  void babyReddet(int x, int y){
   if(brandHarBaby == true || x>= 35 && x <= 310 && y >= 375 && y <= 450){ //barneværelsets koordinater
     brandHarBaby = true; //sætter boolean til true
     bX = x-25; //giver babyen brandmandens gåkoordinater -25 for at sidde på den venste skulder
     bY = y; 
  }
  }
  
}
