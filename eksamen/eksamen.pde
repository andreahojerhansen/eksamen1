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



int x = 285;
int y = 620;
PImage bg;

brandmand helt;


//knap er spillet startet
Boolean erSpilletStartet = false;



void setup() {
  helt = new brandmand();
  size(700, 700);
  bg = loadImage("hus.jpg");

  //circleX = width/2+circleSize/2+10;
  //circleY = height/2;
  //hvor hurtigt den tæller ned
  myTimer.schedule(myTask, 1000, 1000);
}



void draw() {
//if knappen er trykket kommer baggrund på 
  if (erSpilletStartet) {

    background(bg);
    helt.tegnBrandmand(x, y, 65, 65);

update(mouseX, mouseY);
    DisplayText();
    
    
  } else {
    
    update(mouseX, mouseY);
  
  rect(rectX,rectY,rectSizeX, rectSizeY);
    //ellipse(circleX, circleY, 44, 54);

    if (buttonWasClicked) {
      DisplayText();
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
int countDown = 31;

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
boolean knapRamt(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
