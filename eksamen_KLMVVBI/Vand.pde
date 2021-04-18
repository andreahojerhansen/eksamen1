class Vand {
  PVector position;
  PVector hastighed;
  PVector acceleration;
  float opacitet;

  Vand(PVector v) {
    acceleration = new PVector(0, 0.1);
    hastighed = new PVector(random(-1, 1), random(-4, -7));
    position = v.copy();
    opacitet = 255.0; 
  }

  void run() {
    update();
    display();
  }

  // Metoden der opdatere positionen
  void update() {
    hastighed.add(acceleration);
    position.add(hastighed);
    opacitet -= 10;
  }

  // metoden for den skal displayes
  void display() {
    stroke(6, 189, 231, opacitet);
    fill(6, 189, 231, opacitet);
    ellipse(position.x, position.y, 10, 10);
  }

  // slet vandet
  boolean isDead() {
    if (opacitet < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
