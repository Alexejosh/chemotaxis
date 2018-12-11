Bombs [] group;
boolean gameOver = false;
void setup()   
{     
  size(500, 500);
  group = new Bombs[1000];
  for (int i = 0; i < group.length; i++)
  {
    group[i] = new Bombs();
  }
}   
void draw()   
{    
  background(0);

  for (int j = 0; j < group.length; j++)
  {
    group[j].show();
    group[j].randomMove();
    group[j].move();
    group[j].Die();
  }
  Dot myMouse = new Dot();
  myMouse.show();
  if (gameOver == true)
  {
    background(0);
    textSize(50);
    text("GAME OVER", 100, 250);
    if (mousePressed == true)
    {
      gameOver = false;
    }
  }
} 
class Dot
{
  int myX;
  int myY;
  Dot()
  {
    myX = mouseX;
    myY = mouseY;
  }
  void show()
  {
    fill(0, 230, 0);
    ellipse(myX, myY, 10, 10);
  }
}
class Bombs 
{    
  int myX;
  int myY;
  int myColor1;
  int myColor2;
  int myColor3;
  Bombs()
  {
    myX = (int)(Math.random() * 461) + 20;
    myY = (int)(Math.random() * 461) + 20;
    //myColor1 = (int)(Math.random() * 256) + 20;
    //myColor2 = (int)(Math.random() * 256) + 20;
    //myColor3 = (int)(Math.random() * 256) + 20;
  }
  void move()
  {
    if (mouseX > myX)
    {
      myX = myX + (int)(Math.random() * 3);
    }
    if (mouseX < myX)
    {
      myX = myX - (int)(Math.random() * 6);
    }
    if (mouseY < myY)
    {
      myY = myY - (int)(Math.random() * 3);
    }
    if (mouseY > myY)
    {
      myY = myY + (int)(Math.random() * 3);
    }
  }
  void randomMove()
  {
    myX = myX + (int)(Math.random() * 5) -2;
    myY = myY + (int)(Math.random() * 5) -2;
  }
  void show()
  {
    myColor1 = (int)(Math.random() * 256) + 20;
    myColor2 = (int)(Math.random() * 256) + 20;
    myColor3 = (int)(Math.random() * 256) + 20;
    fill(myColor1, myColor2, myColor3);
    ellipse(myX, myY, 7, 7);
    stroke(10);
    //arc(myX, myY + 5, 10, 10, 5, 2 * PI);
    //fill(59, 61, 66);
    //ellipse(myX +0, myY -7, 15, 15);
    //ellipse(myX - 5, myY - 5, 5, 5);
  }
  void Die()
  {
    if (mouseX == myX && mouseY == myY)
    {
      gameOver = true;
    }
  }
}    