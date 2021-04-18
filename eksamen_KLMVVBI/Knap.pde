public class Knap {
  
  void tegnKnap (int rectX, int rectY, int rectSizeX, int rectSizeY, String knapText) {
    fill(255, 0, 0);
    rect(rectX, rectY, rectSizeX, rectSizeY);
    fill(255);
    textSize(32);
    text(knapText, tX, tY); 
  }


  boolean knapRamt(int x, int y, int width, int height) {
    boolean knapRamt = false;
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
        knapRamt = true;
      
    } else {
      knapRamt = false;
    }
    return knapRamt;
  }
}
