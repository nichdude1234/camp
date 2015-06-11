class HostileSprite extends AbstractSprite {
  int team;
  long shortTime;
  long fireDelay;

  HostileSprite(int team, int radius, PShape graphic, PVector position, PVector velocity) {

    super(position, velocity);
    this.team=team;
    create(graphic, radius);
  }
  void fire(PVector projectileVelocity) {
  }
  void fire(HostileSprite target) {
  }
  boolean readyToFire() {
    return true;
  }
}
boolean readyToFire() {
  long now = millis();
  if (now > shortTime + fireDelay)
    return true;
  else
    return false;
}

void fire(PVector projectileVelocity) {
  if (readyToFire()) {
    PShape graphic = factory.getBasicBullet();
    PVector position = new PVector(this.position.x, this.position.y);
    int radius = factory.getBasicBulletRadius();
    ProjectileSprite projectile =
      new ProjectileSprite(this, radius, graphic, position, projectileVelocity);
      sprites.add(projectile);
      shortTime = millis();
  }
}
void fire(HostileSprite target, int speed){
  speed = 10*speed;
  if(readyToFire()) {
    double distance;
    float x1 = this.position.x;
    float y1 = this.position.y;
    float x2 = target.position.x;
    float y2 = target.position.y;
    float x3 = x1;
    float y3 = y2;
    if(x1 == x2) {
      distance = Math.abs(x2 - x1);
      fire(new PVector(0, speed));
    }else if (y1 == y2) {
      distance = Math.abs(y1 == y2);
      fire(new PVector(speed, 0));
    }else {
      distance = Math.sqrt((x2 - x1) + (y2 - y1));
      float side1 = x2 - x1;
      float side2 = y2 - y1;
      float dx = side1 / Math.abs(speed);
      float dy = side2 / Math.abs(speed);
      fire(new PVector(dx, dy));
    }
  }
}
