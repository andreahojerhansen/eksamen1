public class Knap {

  boolean knapRamt = false;
  void mouseClicked() {
    if (knapRamt) {
      buttonWasClicked = true;
      erSpilletStartet = true;
    }
  }
  void tegnKnap (int rectX, int rectY, int rectSizeX, int rectSizeY, String knapText) {
    fill(255, 0, 0);
    rect(rectX, rectY, rectSizeX, rectSizeY);
    fill(255);
    textSize(32);
    text(knapText, tX, tY); 
  }


  boolean knapRamt(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
        knapRamt = true;
      return true;
    } else {
      //println("x:" + x + " y: " + y + " width:" + width + " height: " + height + " mouseX: " + mouseX + " mouseY:" + mouseY);
      knapRamt = false;
      return false;
    }
  }
}
