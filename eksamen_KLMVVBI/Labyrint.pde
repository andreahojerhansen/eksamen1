public class Labyrint {

    boolean hovedRamt(int x,int y) {
    boolean hovedRamt = false;
    color hoved = get(x+32, y+15); //tjekker den pixels farve
    println(hoved);
     if(hoved == -558592){ 
     hovedRamt = true;
     } 
     return hovedRamt;
  }
  
      boolean rygRamt(int x,int y) {
    boolean rygRamt = false;
    color ryg = get(x+32, y+55);
    println(ryg);
     if(ryg == -575232){ 
     rygRamt = true;
     } 
     return rygRamt;
  }
  
       boolean hskulderRamt(int x,int y) {
    boolean hskulderRamt = false;
    color hskulder = get(x+55, y+32);
    println(hskulder);
     if(hskulder == -1414912){
     hskulderRamt = true;
     } 
     return hskulderRamt;
  }
  
     boolean vskulderRamt(int x,int y) {
    boolean vskulderRamt = false;
    color vskulder = get(x+15, y+32);
    println(vskulder);
     if(vskulder == -1623283){ 
     vskulderRamt = true;
     } 
     return vskulderRamt;
  }
}
