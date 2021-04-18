import java.util.Timer;
import java.util.TimerTask;
//placering af start knap
int rectX = 280;
int rectY = 500;

//størelse af startknap
int rectSizeX = 140;   
int rectSizeY = 70;
boolean knapRamt = false;
boolean klarTilNextLevel = false;

boolean erNextLevelSatOp = false; 

int gameLevel = 1; 

String knapText = "Start";
//timer
String textToDisplay;
Boolean buttonWasClicked = false;
int countDown;

int tX = 312;
int tY = 545;

int x = 285; //fortæller brandmandens start xkoordinat
int y = 620; //brandmands start-y
int bX = 52; //fortæller babyens start start xkoordinat
int bY = 400;//babys start-y
int brx = 270; //baby slut kordinat
int bry = 550; //baby slut kordinat

//bagggrunde
PImage bg;
PImage ss;
PImage nlb;


Knap knap;

//timerTask biler erkleret 
Timer myTimer = new Timer();
TimerTask myTask;


//objekter 
brandmand helt;
VandTank v1;
baby bby;
Labyrint vaeg;
ild brand2;
ild brand4;
ild brand5;
ild brand7;
ild brandNextLevel1;
ild brandNextLevel2;
ild brandNextLevel3;
ild brandNextLevel4;
ild brandNextLevel5;


//knap er spillet startet
Boolean erSpilletStartet = false;


//setup til level 1
void setup() {
  setupTimer(); //timer sættes 
  size(700, 700);
  
  ss = loadImage("baggrund2.jpg");
  bg = loadImage("hus.png"); 
  bg.loadPixels(); 
  background(ss);

  helt = new brandmand(); 
  bby = new baby();
  vaeg = new Labyrint(); 
  knap = new Knap();

  //hvor hurtigt den tæller ned
  myTimer.schedule(myTask, 1000, 1000);
  
  v1 = new VandTank(); //den skal musens koordinater - skal fortælles i draw 


  brand2 = new ild();
  brand4 = new ild();
  brand5 = new ild();
  brand7 = new ild();
}


//setup til level 2
void setupNextLevel() {
  setupTimer(); //timer sættes igen til level 2
  bg = loadImage("hus.png"); 
  bg.loadPixels(); //

  bby = new baby();
  bX = 52; //fortæller babyens start start xkoordinat
  bY = 400;//babys start-y

  brandNextLevel1 = new ild();
  brandNextLevel2 = new ild();
  brandNextLevel3 = new ild();
  brandNextLevel4 = new ild();
  brandNextLevel5 = new ild();
}




void draw() {
  println("klarTilNextLevel: " + klarTilNextLevel + " erNextLevelSatOp: " + erNextLevelSatOp);
  //if knappen er trykket kommer baggrund på 
  if (erSpilletStartet) {


    background(bg);
    helt.tegnBrandmand(x, y, 65, 65);
    bby.tegnBaby(bX, bY, 20, 35); 
    bby.babyReddet(x+35, y+14);
    klarTilNextLevel = bby.babySafe(x, y);

    if (gameLevel == 1 && klarTilNextLevel) {
      setupNextLevel();
      gameLevel = 2;
    }

    boolean vandStartet = false;
    if (erSpilletStartet) { 
      if (keyPressed) { //starter vandet
        if (key == 'v' || key == 'V') { 
          vandStartet = true;
          v1.addVand(new PVector(x+35, y+7)); //giver placeringen for hvor vandet skal komme fra (kan også være mouse)
          v1.run(); //displayer vandet
          //  println("vandStartet:" +vandStartet);
        }
      }
    }
    
    
 // opdeling af levels   
    switch (gameLevel) {
    case 1:
      brand2.tegnIld2(250, 150, x, y, vandStartet, countDown);
      brand4.tegnIld2(420, 290, x, y, vandStartet, countDown);
      brand5.tegnIld2(100, 420, x, y, vandStartet, countDown);
      brand7.tegnIld2(560, 450, x, y, vandStartet, countDown);

      break;

    case 2:
      knapText = "Start level 2";
      rectX = 225;
      rectY = 500;
      rectSizeX = 250;   
      rectSizeY = 70;
      tX = 260;
      tY = 545;


      brandNextLevel1.tegnIld2(250, 150, x, y, vandStartet, countDown);
      brandNextLevel2.tegnIld2(420, 290, x, y, vandStartet, countDown);
      brandNextLevel3.tegnIld2(100, 420, x, y, vandStartet, countDown);
      brandNextLevel4.tegnIld2(560, 450, x, y, vandStartet, countDown);
      brandNextLevel5.tegnIld2(560, 100, x, y, vandStartet, countDown);
      break;
    }


    update(mouseX, mouseY);
    DisplayText();
  } else {

    update(mouseX, mouseY);
    knap.tegnKnap(rectX, rectY, rectSizeX, rectSizeY, knapText);

    if (buttonWasClicked) {
      DisplayText();
    }
  }
}

//functioner

//timeren instancieres
void setupTimer(){
  countDown = 60;
 myTask = new TimerTask() {
  public void run() {
    --countDown;
  }
 };
}


void update(int x, int y) {
  if ( knap.knapRamt(rectX, rectY, rectSizeX, rectSizeY) ) {
    knapRamt = true;
  } else {
    knapRamt = false;
  }

  if (countDown < 1) {
    myTimer.cancel();
    erSpilletStartet = false;
  }
}



void DisplayText() {
  fill(255);
  textSize(32);
  text(countDown, 10, 30);
  textSize(32);
}


void DispalyTimer() {
}



void keyPressed() { //wasd kontrollerne
  if ((key == 'a' || key == 'A') && !vaeg.vskulderRamt(x, y)) { 
    x -= 3; //bevæger sig 2 pixels til venstre
  } 
  if ((key == 'd' || key == 'D') && !vaeg.hskulderRamt(x, y)) {
    x += 3; //2 pixels til højre
  } 
  if ((key == 'w' || key == 'W') && !vaeg.hovedRamt(x, y)) {
    y -= 3; // 2 pixels op
  } 
  if ((key == 's' || key == 'S') && !vaeg.rygRamt(x, y)) {
    y += 3; //2 pixels ned
  }
}



void mouseClicked() {
  if (knapRamt) {
    buttonWasClicked = true;
    erSpilletStartet = true;
  }
}
