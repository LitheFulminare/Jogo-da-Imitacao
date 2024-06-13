String screen = "menu"; // starts on "menu", go to "game", ends on "gameover"

// countdown timer
int secondsDown;
int timer;
int interval = 30000; //  it's in milliseconds

int startTime;

Monster monster = new Monster(200,200);

void setup()
{
  size(1020, 760);
  textSize(40);
}

void draw()
{
  update(); // i'll use spefic funcions for each screen. e.g. updateGame()
  render(); // handles the update() while screen == game
}

void update()
{
  if(screen == "game")
  {
    updateGame();
  }
}

void render()
{
  if(screen == "menu")
  {
    renderMenu();
  }
  if(screen == "game")
  {
    renderGame();
  }
  
}

void renderMenu()
{
  background(175,100,0);
}

void startGame() // called at the start of the game
{
  screen = "game";
  startTime = millis();
  timer= millis();
}

void updateGame()
{
  
  //int elapsedTime = millis() - startTime;
  
  
  if (millis() - timer > interval) 
  {
   startTime = millis();
   //text(secondsDown, 150, 195);
  }
  int elapsedSeconds = (millis() - startTime) / 1000;
  secondsDown = interval/1000 - elapsedSeconds;
}

void renderGame()
{
  background(0);
  text("Tempo restante: " + secondsDown, 40, 40);  
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
