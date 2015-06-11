class ShapeFactory {
  PShape BasicPlayer;
  PShape basicEnemy;
  PShape basicBullet;
  ShapeFactory() {
    buildBasicEnemy();
    buildBasicPlayer();
    buildBasicBullet();
  }


  void buildBasicBullet() {
    basicBullet=createShape(ELLIPSE, -10, -10, 20, 20);
    basicBullet.setStroke(color(255));
    basicBullet.setStrokeWeight(4);
    basicBullet.setFill(color(127));
  }
  PShape getBasicPlayer() {
    return BasicPlayer;
  }
  PShape getBasicEnemy() {
    return basicEnemy;
  }
  void buildBasicPlayer() {
    BasicPlayer= createShape(GROUP);
    PShape bouncer =createShape();
    bouncer.beginShape();
    bouncer.vertex(80, -40);
    bouncer.vertex(100, -40);
    bouncer.vertex(100, -60);
    bouncer.vertex(80, -60);
    bouncer.vertex(60, -40);
    bouncer.vertex(80, -40);
    bouncer.vertex(60, -60);
    bouncer.vertex(40, -60);
    bouncer.vertex(40, -40);
    bouncer.vertex(60, -40);
    bouncer.vertex(60, -60);
    bouncer.vertex(80, -60);
    bouncer.vertex(80, -40);
    bouncer.endShape();
    PShape bouncepad= createShape(RECT, 80, -40, 40, -20);
    BasicPlayer.addChild(bouncer);
    BasicPlayer.addChild(bouncepad);
  }

  void buildBasicEnemy() {
    basicEnemy= createShape(GROUP);
    PShape shooter = createShape();
    shooter.beginShape();
    shooter.fill(0, 125, 0);
    shooter.vertex(-25, -25);
    shooter.vertex(25, -25);
    shooter.vertex(25, 25);
    shooter.vertex(-25, 25);
    shooter.vertex(-25, -25);
    shooter.endShape();
    basicEnemy.addChild(shooter);
  }
}

