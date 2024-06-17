//MonsterBody(260,0); made the body centered relative to its bg

String screen = "menu"; // starts on "menu", go to "game", ends on "final screen"

// countdown timer
int secondsDown;
int timer;
int interval = 30 * 1000; //  it's in milliseconds

int startTime;

boolean victory = false;
boolean gameover = false;

PImage titleScreen;
PImage gameScreen;
PImage victoryScreen;
PImage defeatScreen;

PImage monsterBodyImg;

PImage playerBodyImg;
PImage playerRightArmImg;

MonsterBody monsterBody = new MonsterBody(450,50);

PlayerBody playerBody = new PlayerBody(-70, 50);
PlayerRightArm playerRightArm = new PlayerRightArm(600, 600);

void setup()
{
  size(1020, 760);
  textSize(40);
  
  // backgrounds and screens
  titleScreen = loadImage("titleScreen.png");
  gameScreen = loadImage("gameScreen.png");
  defeatScreen = loadImage("defeatScreen.png");
  victoryScreen = loadImage("victoryScreen.png");
  
  // monster sprites
  monsterBodyImg = loadImage("1- Tronco e Pernas.png");
  
  
  // player sprites
  playerBodyImg = loadImage("1- Tronco e Pernas Player.png");
  playerRightArmImg = loadImage("2- Braço direito player.png");
  
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
  if(screen == "final screen")
  {
    renderFinalScreen();
  }
}

void renderMenu()
{
  //background(175,100,0);
  image(titleScreen, 0, 0, width, height);  
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
  
  
  if (millis() - timer > interval) // when the countdown reaches 0, defeat
  {
   //startTime = millis();
   screen = "final screen";
   //text(secondsDown, 150, 195);
  }
  int elapsedSeconds = (millis() - startTime) / 1000;
  secondsDown = interval/1000 - elapsedSeconds;
}

void renderGame()
{
  //background(0);
  image(gameScreen, 0, 0, width, height);  
  text("Tempo restante: " + secondsDown, 40, 40);  
  
  monsterBody.render();
  
  playerBody.render();
  playerRightArm.render();
}

void renderFinalScreen()
{
  if(!victory)
  {
    image(defeatScreen, 0, 0, width, height);
  }
  else
  {
    image(victoryScreen, 0, 0, width, height);
  }
  //background(0,100,150);
  
  //text("perdeu paizão", 40, 40);
}

void keyPressed()
{
  if(screen == "menu") // sets screen to 'game'
  {
    startGame();
  }
  if(screen == "game")
  {
    
  }
  if(screen == "final screen")
  {
    screen = "menu";
  }
}

void mousePressed() 
{
  if(screen == "menu") // sets screen to 'game'
  {
    startGame();
  }
  if(screen == "game")
  {
    
  }
  if(screen == "final screen")
  {
    screen = "menu";
  }
}
