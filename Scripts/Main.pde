String screen = "menu"; // starts on "menu", go to "game", ends on "final screen"

// countdown timer
int secondsDown;
int timer;
int interval = 30 * 1000; //  it's in milliseconds

int startTime;

int selectedLimb = 1; // 1 = right arm, 2 = left arm

boolean victory = false;
boolean gameover = false;

boolean rightMatches = false; // both arms have to match to trigger 'victory = true'
boolean leftMatches = false;

//boolean LDown = false;
//boolean RDown = false;

PImage titleScreen;
PImage gameScreen;
PImage victoryScreen;
PImage defeatScreen;

PImage monsterBodyImg;
PImage monsterRightArmImg;

PImage playerBodyImg;
PImage playerRightArmImg;
PImage playerLeftArmImg;

MonsterBody monsterBody = new MonsterBody(450,50);
MonsterRightArm monsterRightArm = new MonsterRightArm(680, 310);

PlayerBody playerBody = new PlayerBody(-70, 50);
PlayerRightArm playerRightArm = new PlayerRightArm(160, 310);
PlayerLeftArm playerLeftArm = new PlayerLeftArm(340, 310);

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
  monsterRightArmImg = loadImage("2- Braço direito.png");
  
  
  // player sprites
  playerBodyImg = loadImage("1- Tronco e Pernas Player.png");
  playerRightArmImg = loadImage("2- Braço direito player.png");
  playerLeftArmImg = loadImage("2- Braço esquerdo player.png");
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
  
  monsterRightArm.randomize();
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
  
  playerRightArm.update();
  playerLeftArm.update();
}

void renderGame()
{
  //background(0);
  image(gameScreen, 0, 0, width, height);  
  text("Tempo restante: " + secondsDown, 40, 40);  
  
  monsterBody.render();
  monsterRightArm.render();
  
  playerBody.render();
  playerRightArm.render();
  playerLeftArm.render();
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

void checkIfArmsMatch()
{
  //playerRightArm.angle = 2*PI; 
  println("direito: " + playerRightArm.angle);
  println("esquerdo: " + playerLeftArm.angle);
      
  if(playerRightArm.angle > monsterRightArm.angle - 0.1)
  {
    if(playerRightArm.angle < monsterRightArm.angle + 0.1)
    {
      println("direto bate");
    }
  }
}

void keyPressed()
{
  if(screen == "menu") // sets screen to 'game'
  {
    startGame();
  }
  if(screen == "game")
  {
    if(keyCode == LEFT)
    {
      if(selectedLimb == 1)
      {
        playerRightArm.rotating = true;
        playerRightArm.inverted = false;
      }
      if(selectedLimb == 2)
      {
        playerLeftArm.rotating = true;
        playerLeftArm.inverted = false;
      }
    }
    if(keyCode == RIGHT)
    {
      if(selectedLimb == 1)
      {
        playerRightArm.rotating = true;
        playerRightArm.inverted = true;
      }
      if(selectedLimb == 2)
      {
        playerLeftArm.rotating = true;
        playerLeftArm.inverted = true;
      }
    }
    if(keyCode == ENTER)
    {
      checkIfArmsMatch();
    }
    if(keyCode == TAB) // switch selected limb
    {
      if(selectedLimb == 1)
      {
        selectedLimb = 2;
      }
      else
      {
        selectedLimb = 1;
      }
    }
  }
  
  if(screen == "final screen")
  {
    screen = "menu";
  }
}

void keyReleased()
{
  if(screen == "game")
  {
    if(keyCode == LEFT || keyCode == RIGHT)
    {
      playerRightArm.rotating = false;
      playerLeftArm.rotating = false;
    }
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
