class PlayerRightArm
{
  private int x; 
  private int y;
  
  private float angle = 0;
  
  private boolean rotating = false;
  private boolean inverted = false;
  
  //private int w = 100;
  //private int h = 100;
  
  
  
  PlayerRightArm(int x, int y)
  {
    this.x = x;
    this.y = y;
    
  }
  
  void update()
  {
    if(angle > PI*2) // sets a angle cap. The if statments can make the angle = -0.034, that's not good
    {
      angle = PI*2;
    }
    if(angle < 0)
    {
      angle = 0;
    }
  }
  
  void render()
  {
    pushMatrix();
      if(rotating)
      {
        if(!inverted) // depends on which arrow key the player is holding down
        {
          if(angle < PI*2) // prevents arm from going around multiple times
          {
            angle += 0.035;
          }
        }
        else
        {
          if(angle > 0) // prevents arm from going around multiple times
          {
            angle -= 0.035;
          }
        }
      }
      translate(x, y);
      rotate(angle);
      image(playerRightArmImg, -20, 0); // x offset = -20 makes it centered relative to the joint
    popMatrix();
  }
}
