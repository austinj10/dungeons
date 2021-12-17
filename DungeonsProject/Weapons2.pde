class Shotgun extends Weapon {
  Shotgun() {
    super(70, 5);
  }
  void shoot() {
    if (shotTimer >= threshold) {
      for (int i = 0; i < 15; i++) {
        PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
        aimVector.rotate(random(0.35));
        aimVector.setMag(bulletSpeed+dmg/2);
        myObjects.add(new Bullet(aimVector, stone, 10));
        shotTimer = 0;
      }
    }
  }
}



class Pistol extends Weapon {
  Pistol() {
    super(40, 10);
  }
}



class Sniper extends Weapon {
  Sniper() {
    super(80, 50);
  }
}



class MachineGun extends Weapon {
  MachineGun() {
    super(10, 9);
  }
}
