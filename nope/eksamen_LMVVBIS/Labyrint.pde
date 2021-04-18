public class Labyrint {

    boolean hovedRamt(int x,int y) {
    boolean hovedRamt = false;
    color hoved = get(x+32, y+10); //tjekker den pixels farve
    println(hoved);
     if(hoved == -558592){ 
     hovedRamt = true;
     } 
     return hovedRamt;
  }
  
      boolean rygRamt(int x,int y) {
    boolean rygRamt = false;
    color ryg = get(x+32, y+51);
    println(ryg);
     if(ryg == -575232){ //find rette farve
     rygRamt = true;
     } 
     return rygRamt;
  }
  
       boolean hskulderRamt(int x,int y) {
    boolean hskulderRamt = false;
     color hskulder = get(x+55, y+32);
    println(hskulder);
     if(hskulder == -1414912){ //find rette farve
     hskulderRamt = true;
     } 
     return hskulderRamt;
  }
  
     boolean vskulderRamt(int x,int y) {
    boolean vskulderRamt = false;
    color vskulder = get(x+10, y+32);
    println(vskulder);
     if(vskulder == -1623283){ //find rette farve
     vskulderRamt = true;
     } 
     return vskulderRamt;
  }
}
