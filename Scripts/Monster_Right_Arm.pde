class MonsterRightArm
{
  private int x; 
  private int y;
  
  private float angle = 0;
  
  private boolean rotating = false;
  private boolean inverted = false;
  
  //private int w = 100;
  //private int h = 100;
  
  
  
  MonsterRightArm(int x, int y)
  {
    this.x = x;
    this.y = y;
    
  }
  
  void update()
  {
    
  }
  
  void render()
  {
    pushMatrix();
      //angle += 0.035;
      translate(x, y);
      rotate(angle);
      image(monsterRightArmImg, -20, 0); // x offset = -20 makes it centered relative to the joint
    popMatrix();
  }
  
  void randomize()
  {
    angle = random(0, PI*2); // PI*2 is 360 degrees
    println("angulo: " + angle);
  }
}
