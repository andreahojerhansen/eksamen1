import java.util.Timer;
import java.util.TimerTask;
//placering af start knap
int rectX = 280;
int rectY = 500;

//størelse af startknap
int rectSizeX = 140;   
int rectSizeY = 70;

//nyt level
boolean klarTilLevel2;
boolean erNextLevelSatOp; 
int gameLevel; 

//timer
String textToDisplay;
Boolean buttonWasClicked = false;
int countDown;

//tekst
String knapText = "Start";
int tX;
int tY;

//koordinater
int x; //fortæller brandmandens start xkoordinat
int y; //brandmands start-y
int bX; //fortæller babyens start start xkoordinat
int bY;//babys start-y
int brx; //baby slut kordinat
int bry; //baby slut kordinat

//bagggrunde
PImage bg;
PImage ss;

Knap knap;

//timerTask biler erklæret 
Timer myTimer;
TimerTask myTask;


//objekter 
brandmand helt;
VandTank v1;
baby bby;
Labyrint vaeg;
ild brand;
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

void setup(){
   size(700, 700);
  
   ss = loadImage("baggrund2.jpg");
   bg = loadImage("hus.png"); 
   bg.loadPixels(); 
   background(ss);
   
   helt = new brandmand(); 
   vaeg = new Labyrint(); 
   knap = new Knap();
   brand = new ild();
   v1 = new VandTank(); 
   
   tX = 312; // knappens placering
   tY = 545;
   setupFirstLevel();
}

//setup til level 1
void setupFirstLevel() {
  
  println("level 1"); //for at se hvornår level1 starter
  myTimer = new Timer();
  setupTimer(); //timer sættes 
 
  x = 285; //fortæller brandmandens start xkoordinat
  y = 620; //brandmands start-y
  bX = 52; //fortæller babyens start start xkoordinat
  bY = 400;//babys start-y
  brx = 270; //baby slut kordinat
  bry = 550; //baby slut kordinat

  gameLevel = 1;
  //hvor hurtigt den tæller ned
  myTimer.schedule(myTask, 1000, 1000);

  bby = new baby();

  brand2 = new ild();
  brand4 = new ild();
  brand5 = new ild();
  brand7 = new ild();
  
  buttonWasClicked = false;
}

//setup til level 2
void setupNextLevel() {
  println("level 2"); //for at se hvornår level2 starter
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
  println("klarTilNextLevel: " + klarTilLevel2 + " erNextLevelSatOp: " + erNextLevelSatOp);
  
  //if knappen er trykket kommer baggrund på 
  if (erSpilletStartet) {

    background(bg);
    helt.tegnBrandmand(x, y, 65, 65);
    bby.tegnBaby(bX, bY, 20, 35); 
    bby.babyReddet(x+35, y+14);
    klarTilLevel2 = bby.babySafe(x, y) && !brand2.ildSlukket() && !brand4.ildSlukket() && !brand5.ildSlukket() && !brand7.ildSlukket();
   
    if (gameLevel == 1 && klarTilLevel2) { 
      println("vundet level 1");
      setupNextLevel();
      gameLevel = 2;
    }
    
    /* eksempel på hvordan levels kan 
    if(gameLevel == 2 && klarTilLevel3){ 
      setupLevel3();
      gameLevel = 3;
    }*/ 

    boolean vandStartet = false;
    if (erSpilletStartet) { 
      if (keyPressed) { //starter vandet
        if (key == 'v' || key == 'V') { 
          vandStartet = true;
          v1.addVand(new PVector(x+35, y+7)); //giver placeringen for hvor vandet skal komme fra (fra brandmanden)
          v1.run(); //displayer vandet
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
    background(ss);
    update(mouseX, mouseY);
    knap.tegnKnap(rectX, rectY, rectSizeX, rectSizeY, knapText);

    if (buttonWasClicked && !klarTilLevel2){
      setupFirstLevel();
      DisplayText();
    } else if (buttonWasClicked && klarTilLevel2){
      setupNextLevel();
      DisplayText();
    } 
  }
}

//funktioner

//timeren instancieres
void setupTimer(){
  countDown = 120;
 myTask = new TimerTask() {
  public void run() {
    --countDown;
  }
 };
}


void update(float mouseX, float mouseY) {
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

void keyPressed() { //wasd kontrollerne
  if ((key == 'a' || key == 'A') && !vaeg.vskulderRamt(x, y)) { //hvis tasten er ramt samt den ikke rammer en mur bevæger den sig
    x -= 3; //bevæger sig 3 pixels til venstre
  } 
  if ((key == 'd' || key == 'D') && !vaeg.hskulderRamt(x, y)) {
    x += 3; 
  } 
  if ((key == 'w' || key == 'W') && !vaeg.hovedRamt(x, y)) {
    y -= 3; 
  } 
  if ((key == 's' || key == 'S') && !vaeg.rygRamt(x, y)) {
    y += 3; 
  }
}

void mouseClicked() {
  if (knap.knapRamt(rectX, rectY, rectSizeX, rectSizeY)) {
    buttonWasClicked = true;
    erSpilletStartet = true;
  }
}
