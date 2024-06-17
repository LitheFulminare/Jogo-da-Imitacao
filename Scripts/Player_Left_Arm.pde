class PlayerLeftArm // the body and the head don't move
{
  private int x; 
  private int y;
  
  private float angle = 0;
  
  private boolean rotating = false;
  private boolean inverted = false;
  
  //private int w = 100;
  //private int h = 100;
  
  
  
  PlayerLeftArm(int x, int y)
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
      if(rotating)
      {
        if(!inverted)
        {
          angle += 0.035;
        }
        else
        {
          angle -= 0.035;
        }
      }
      translate(x, y);
      rotate(angle);
      image(playerLeftArmImg, -20, 0); // x offset = -20 makes it centered relative to the joint
    popMatrix();
  }
}
