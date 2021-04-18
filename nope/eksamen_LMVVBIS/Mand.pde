public class brandmand {


  void tegnBrandmand(int x, int y, int w, int b) { //laver en plads til manden
    imageMode(CORNER);
    PImage bm = loadImage("brandmand.png");
    fill(192, 57, 43);
    image(bm, x, y, w, b);
  }

}
