public class brandmand{
  

    void tegnBrandmand(int x,int y, int w, int b){ //laver en plads til manden
        PImage bm = loadImage("brandmand.png");
        fill(192, 57, 43);
        image(bm, x,y,w,b);
        
    }
     color cY = get(249, 55);  //farven på de vandrette vægge 249 55 2
     color cX = get(230, 58); //farven på de lodrette vægge 230 58 11
   
    void flytBrandmand(){
    }
}
