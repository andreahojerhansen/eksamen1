public class ild {
  private boolean onFire = true;




  void tegnIld2(int xIld, int yIld, int xBrandmand, int yBrandmand, boolean vandStartet, int tidISekund) { // tegn en flottere brandmand

    int tid = tidISekund / 10;
    int b = 0; 
    int h = 0;

    if (onFire) {
      //      b = 150 / (tid-20);
      //      h = 150 / (tid-20);
      b = 110;
      h = 110;
    }

    int xDiff = abs(xIld - xBrandmand);
    int yDiff = abs(yIld - yBrandmand);
    if (xDiff < 50 && yDiff < 50 && vandStartet) {
      b = 0;
      h = 0;

      onFire = false;
    }


    PImage ild1 = loadImage("ild1.png");
 //   PImage ild2 = loadImage("ild2.png");
  //  PImage ild3 = loadImage("ild3.png");

    //fill(100, 80, 20);
    image(ild1, xIld, yIld, b, h);
//   image(ild2, xIld, yIld, b, h);
   // image(ild3, xIld, yIld, b, h);
  }
}
