import java.util.Timer;
import java.util.TimerTask;

int circleX = 100;
int circleY = 150;  // Position of circle button

int rectX = 300;
int rectY = 300;

int rectSizeX = 100;   
int rectSizeY = 70;
boolean knapRamt = false;

Timer myTimer = new Timer();
TimerTask myTask = new TimerTask() {
  public void run() {
    --countDown;
  }
};

int x = 285; //fortæller brandmandens start xkoordinat
int y = 620; //brandmands start-y
int bX = 52; //fortæller babyens start start xkoordinat
int bY = 400;//babys start-y
PImage bg;

brandmand helt;
VandTank v1;
baby bby;
ild brand1;
ild brand2;
ild brand3;
ild brand4;
ild brand5;
ild brand6;
ild brand7;
ild brand8;
//ild brand9;
//ild brand10;


//knap er spillet startet
Boolean erSpilletStartet = false;

void setup() {
  size(700, 700);
  bg = loadImage("hus.jpg");

  helt = new brandmand(); 
  bby = new baby();

  //hvor hurtigt den tæller ned
  myTimer.schedule(myTask, 1000, 1000);
  v1 = new VandTank(); //den skal musens koordinater - skal fortælles i draw 

  brand1 = new ild();
  brand2 = new ild();
  brand3 = new ild();
  brand4 = new ild();
  brand5 = new ild();
  brand6 = new ild();
  brand7 = new ild();
  brand8 = new ild();
  // brand9 = new ild();
  //  brand10 = new ild();
}


void draw() {
  //if knappen er trykket kommer baggrund på 
  if (erSpilletStartet) {

    background(bg);
    helt.tegnBrandmand(x, y, 65, 65);
    bby.tegnBaby(bX, bY, 20, 35); 
    bby.babyReddet(x+35, y+14);

    boolean vandStartet = false;
    if (keyPressed) { //starter vandet
      if (key == 'v' || key == 'V') { 
        vandStartet = true;
      }
    }
      brand1.tegnIld2(90, 80, x, y, vandStartet, countDown);
      brand2.tegnIld2(250, 150, x, y, vandStartet, countDown);
      brand3.tegnIld2(600, 100, x, y, vandStartet, countDown);
      brand4.tegnIld2(420, 290, x, y, vandStartet, countDown);
      brand5.tegnIld2(100, 420, x, y, vandStartet, countDown);
      brand6.tegnIld2(120, 520, x, y, vandStartet, countDown);
      brand7.tegnIld2(560, 450, x, y, vandStartet, countDown);
      brand8.tegnIld2(500, 480, x, y, vandStartet, countDown);
      //  brand9.tegnIld2(600, 490, x, y, vandStartet, countDown);
      //  brand10.tegnIld2(570, 150, x, y, vandStartet, countDown);
      update(mouseX, mouseY);
      DisplayText();
    } else {

      update(mouseX, mouseY);

      rect(rectX, rectY, rectSizeX, rectSizeY);

      if (buttonWasClicked) {
        DisplayText();
      }
    }

    if (erSpilletStartet) { 
      if (keyPressed) { //starter vandet
        if (key == 'v' || key == 'V') { //bestemmer tilkaldeknappen
          v1.addVand(new PVector(x+35, y+7)); //giver placeringen for hvor vandet skal komme fra (kan også være mouse)
          v1.run(); //displayer vandet
        }
      }
    }
  }



  void update(int x, int y) {
    if ( knapRamt(rectX, rectY, rectSizeX, rectSizeY) ) {
      knapRamt = true;
    } else {
      knapRamt = false;
    }

    if (countDown < 1) {
      myTimer.cancel();
      erSpilletStartet = false;
    }
  }



  String textToDisplay;
  Boolean buttonWasClicked = false;
  int countDown = 50;

  void DisplayText() {
    fill(255);
    textSize(32);
    text(countDown, 10, 30);
    textSize(32);
  }



  void DispalyTimer() {
  }



  void keyPressed() { //wasd kontrollerne
    if (key == 'a' || key == 'A') { 
      x -= 5; //bevæger sig 2 pixels til venstre
    } else if (key == 'd' || key == 'D') {
      x += 5; //2 pixels til højre
    } else if (key == 'w' || key == 'W') {
      y -= 5; // 2 pixels op
    } else if (key == 's' || key == 'S') {
      y += 5; //2 pixels ned
    }
  }



  void mouseClicked() {
    if (knapRamt) {
      buttonWasClicked = true;
      erSpilletStartet = true;
    }
  }



  /*boolean knapRamt1(int x, int y, int sX, int sY) {
   float disX = x - mouseX;
   float disY = y - mouseY;
   float 
   if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
   return true;
   } else {
   return false;
   }
   }*/

  boolean knapRamt(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
