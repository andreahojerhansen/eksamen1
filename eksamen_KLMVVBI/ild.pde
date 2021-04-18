public class ild {
  private boolean onFire = true;
  PImage ild1;
  float b = 10; 
  float h = 10;


  ild() {
    ild1 = loadImage("ild1.png");
  }


  void tegnIld2(int xIld, int yIld, int xBrandmand, int yBrandmand, boolean vandStartet, float tidISekund) { // tegn en flottere brandmand

    float tid = tidISekund / 10;


    if (onFire && b < 200 && h < 200) {
      println("tid: " + tidISekund);
      b = (150/(tid-1))*1.3;
      h = (150/(tid-1))*1.3;
    }
    
          int xDiff = abs(xIld - xBrandmand);
    int yDiff = abs(yIld - yBrandmand);
    if (xDiff < 50 && yDiff < 50 && vandStartet) {
      b = 0;
      h = 0;

      onFire = false;
     }

    imageMode(CENTER);
    image(ild1, xIld, yIld, b, h);
  }
  

  public boolean ildSlukket(){ //tjekker om ilden er slukket - bruges til at se om level er gennemført
  return onFire;
  }
  
}
