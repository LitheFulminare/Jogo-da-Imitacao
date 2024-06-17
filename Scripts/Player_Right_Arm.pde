class PlayerRightArm // the body and the head don't move
{
  private int x; 
  private int y;
  
  private float angle = 0;

  private int dir = 1; // if rotates CW or CCW
  
  //private int w = 100;
  //private int h = 100;
  
  
  
  PlayerRightArm(int x, int y)
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
      angle += 0.01;
      translate(x, y);
      rotate(angle);
      image(playerRightArmImg, 0, 0);
    popMatrix();
    //rect(x,y,w,h);
  }
  
}
