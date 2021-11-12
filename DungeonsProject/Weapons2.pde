class Shotgun extends Weapon {
  Shotgun(){
    super(90,5);
  }
   void shoot(){
    if (shotTimer >= threshold){
      for (int i = 0; i < 30; i++){
        PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
        aimVector.rotate(random(0.35));
        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(aimVector, stone, 10));
        shotTimer = 0;
        }
    }
  }
}



class Pistol extends Weapon {
   Pistol(){
    super(10,10);
   }
}



class Sniper extends Weapon {
   Sniper(){
    super(80,20);
   }
}



class MachineGun extends Weapon {
   MachineGun(){
    super(10,50);
   }
}
