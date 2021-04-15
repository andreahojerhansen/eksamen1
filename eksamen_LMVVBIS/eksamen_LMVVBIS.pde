import java.util.Timer;
import java.util.TimerTask;
//placering af start knap
int rectX = 280;
int rectY = 500;

//størelse af startknap
int rectSizeX = 140;   
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
PImage ss;

//objekter 
brandmand helt;
VandTank v1;
baby bby;
Labyrint vaeg;
ild brand2;
ild brand4;
ild brand5;
ild brand7;


//knap er spillet startet
Boolean erSpilletStartet = false;

void setup() {
  size(700, 700);
  ss = loadImage("baggrund2.png");
  background(ss);
  bg = loadImage("hus.png"); 
  bg.loadPixels(); //

  helt = new brandmand(); 
  bby = new baby();
  vaeg = new Labyrint(); 


  //hvor hurtigt den tæller ned
  myTimer.schedule(myTask, 1000, 1000);
  v1 = new VandTank(); //den skal musens koordinater - skal fortælles i draw 


  brand2 = new ild();
  brand4 = new ild();
  brand5 = new ild();
  brand7 = new ild();
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
        //  println("vandStartet:" +vandStartet);
      }
    }
    
    
    brand2.tegnIld2(250, 150, x, y, vandStartet, countDown);
    brand4.tegnIld2(420, 290, x, y, vandStartet, countDown);
    brand5.tegnIld2(100, 420, x, y, vandStartet, countDown);
    brand7.tegnIld2(560, 450, x, y, vandStartet, countDown);
    update(mouseX, mouseY);
    DisplayText();
  } else {

    update(mouseX, mouseY);

    fill(255, 0, 0);
    rect(rectX, rectY, rectSizeX, rectSizeY);

    fill(255);
    textSize(32);
    text("Start", 312, 545); 


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
int countDown = 70;

void DisplayText() {
  fill(255);
  textSize(32);
  text(countDown, 10, 30);
  textSize(32);
}



void DispalyTimer() {
}



void keyPressed() { //wasd kontrollerne
  if ((key == 'a' || key == 'A') && !vaeg.vskulderRamt(x,y)) { 
    x -= 3; //bevæger sig 2 pixels til venstre
  } 
  if ((key == 'd' || key == 'D') && !vaeg.hskulderRamt(x,y)) {
    x += 3; //2 pixels til højre
  } 
  if ((key == 'w' || key == 'W') && !vaeg.hovedRamt(x,y)) {
     y -= 3; // 2 pixels op 
    } 
  if ((key == 's' || key == 'S') && !vaeg.rygRamt(x,y)) {
    y += 3; //2 pixels ned
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
    //println("x:" + x + " y: " + y + " width:" + width + " height: " + height + " mouseX: " + mouseX + " mouseY:" + mouseY);
    return false;
  }
}
