public class baby {
  boolean brandHarBaby = false;


  void tegnBaby(int x, int y, int w, int b) {
    PImage bb = loadImage("baby.png");
    fill(192, 57, 43);
    image(bb, x, y, w, b);
  }

  void babyReddet(int x, int y) {
    if (brandHarBaby == true || x>= 35 && x <= 310 && y >= 375 && y <= 450) { //barneværelsets koordinater
      brandHarBaby = true; //sætter boolean til true
      bX = x-25; //giver babyen brandmandens gåkoordinater -25 for at sidde på den venste skulder
      bY = y;
    }
  }
  
  boolean babySafe (int x, int y) {
    boolean babyIsSafe = false;
    boolean babyMedFam = false;
textSize(14);

PImage nlb = loadImage("baggrund3.png");


    if (babyMedFam == true || x>= 250 && x <= 600 && y >= 600 && y <= 700 && brandHarBaby == true) {
      babyMedFam = true;
      
      text("yay babyen er reddet", 300,650);
      x = brx;
      y = bry;
      erSpilletStartet = false;
      babyIsSafe = true;
      background(nlb);
    } else { 
      text("red baby",300,650);
      
    }
    return babyIsSafe;
  }
}
