class MonsterBody // the body and the head doesn't move
{
  private int x; 
  private int y;
  
  private int w = 100;
  private int h = 100;
  
  MonsterBody(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void update()
  {
  }
  
  void render()
  {
    rect(x,y,w,h);
  }
}
