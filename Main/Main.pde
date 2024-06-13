String screen = "menu"; // starts on "menu", go to "game", ends on "gameover"

// countdown timer
int secondsDown;
int timer;
int interval = 10000; // ten seconds

int startTime;

Monster monster = new Monster(200,200);

void setup()
{
  size(1020, 760);
  timer= millis();
}

void draw()
{
  render();
  update();
  textSize(40);
  text(secondsDown, 40, 40);
  
  if (millis() - timer > interval) 
  {
   timer= millis();
   //text(secondsDown, 150, 195);
  }
  int elapsedSeconds = (millis() - timer) / 1000;
  secondsDown = interval/1000 - elapsedSeconds;
}

void update()
{
  if(screen == "game")
  {
    int elapsedTime = millis() - startTime;
  }
}

void render()
{
  if(screen == "menu")
  {
    
  }
  if(screen == "game")
  {
    monster.render();
  }
  
}

void startGame() // called at the start of the game
{
  screen = "game";
  startTime = millis();
}

void keyPressed()
{
  if(screen == "menu") // sets screen to 'game'
  {
    startGame();
  }
}

void mousePressed() 
{
  if(screen == "menu") // sets screen to 'game'
  {
    startGame();
  }
}
