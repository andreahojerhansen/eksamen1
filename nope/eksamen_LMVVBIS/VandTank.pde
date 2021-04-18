class VandTank {
  ArrayList<Vand> vand;
  PVector start;

  VandTank() {

    vand = new ArrayList<Vand>();
  }

  void addVand(PVector position) {
    start = position.copy();
    vand.add(new Vand(start));
  }

  void run() { 
    for (int i = 1; i < vand.size(); i++) {
      Vand p = vand.get(i);
      p.run();
      if (p.isDead()) {
        vand.remove(i);
      }
    }
  }
}
