class Vand {
  PVector position;
  PVector hastighed;
  PVector acceleration;
  float opacity;
  
 Vand(PVector l) {
    acceleration = new PVector(0, 0.1);
    hastighed = new PVector(random(-1, 1), random(-4, -7));
    position = l.copy();
    opacity = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Methoden der opdatere positionen
  void update() {
    hastighed.add(acceleration);
    position.add(hastighed);
    opacity -= 10;
  }

  // metoden for der skal displayes
  void display() {
    stroke(6, 189, 231, opacity);
    fill(6, 189, 231, opacity);
    ellipse(position.x, position.y, 10, 10);
  }
  
  // slet vandet
  boolean isDead() {
    if (opacity < 0.0) {
      return true;
    } else {
      return false;
    }
  }
 }
