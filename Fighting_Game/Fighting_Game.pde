//Fighting Game (Title in progress)
//To do
//Things in the picture:
//Add second chariter
//Other:
//Add comments
//Add the text file for questions
//Zip and hand in

String gameState="start";
int time;
int people;
//testing
float player2Health;
float player1Health;
int i;
char playerMode1;
char playerMode2;
float startingTime;
float x;
ArrayList<water> water;
PVector v;

//Crowd class.
crowd[] crowd = new crowd[12];

//Player class
player[] player = new player[2];

//water class
//water[] water = new water[0];

void setup(){
  //Basic setup.
  size(1280, 1024);
  frameRate(30);
  background(0,153,255);
  strokeWeight(2);
  //Starting values.
  //remove later
  gameState="start";
  people=0;
  water = new ArrayList();
  while (people<12) {
      crowd[people]= new crowd(people);
      people+=1;
  }
  i=0;
}

void draw(){
  //The 3 states of the game
  if (gameState=="start"){
    Start();
  }
  if (gameState=="main"){
    //This is for the main gameplay
    main();
  }
  if (gameState=="end"){
    player2Health=0;
    end();
  }
  
  //println(gameState);
}


void mouseClicked(){
  if (gameState=="start"){
    gameState="main";
    player1Health=100;
    player2Health=100;
    startingTime=99+(millis()/1000);
    i=0;
    while (i<2) {
      player[i]= new player(i);
      i+=1;
    }
  }
  if (gameState=="end"){
    gameState="start";
  }
  
}





void keyPressed() {
  if (gameState=="main"){
  if (key=='a'){
    player[1].updateMode('a');
  }
  if (key=='d'){
    player[1].updateMode('d');
  }
  if (key=='w'){
    //player[1].updateMode('w');
    if (player[1].velocity.y==0.0) {
      player[1].velocity.y -= 1.25;
    }
    else{
      
    }
  }
  if (key=='z'){
    player[1].updateMode('z');
  }
  if (key=='x'){
    player[1].updateMode('x');
  }
  if (key=='c'){
    player[1].updateMode('c');
  }
  
  if (key=='j'){
    player[1].updateMode('a');
  }
  if (key=='l'){
    player[1].updateMode('d');
  }
  if (key=='i'){
    player[1].updateMode('w');
  }
  if (key=='m'){
    player[1].updateMode('z');
  }
  if (key==','){
    player[1].updateMode('x');
  }
  if (key=='.'){
    player[1].updateMode('c');
  }
  }
}




void Start(){//Capatal because 'start' messes up everything. :(
  drawBackground();
  
  fill(96,96,96,200);
  rect(0,0,1280,1024);
  textSize(200);
  fill(0,255,0);
  text("Fighters",300, 200);
  
  textSize(75);
  fill(255,255,255);
  text("Player 1",150, 350);
  text("Player 2",850, 350);
  textSize(50);
  text("a to move left\nd to move right\nw to jump\nz for high attack\nx for middle attack\nc for low attack",125, 450);
  text("j to move left\nl to move right\ni to jump\nm for high attack\n, for middle attack\n. for low attack",825, 450);
  
  textSize(100);
  fill(255,255,0);
  text("Click to Start",350, 925);
}



void main(){
  //println("Works");
  time=int(startingTime)-(millis()/1000);
  drawBackground();
  for (int i=0; i<crowd.length; i++) {
    crowd[i].drawCrowd();
  }
  drawUI();
  for (int i=0; i<player.length; i++) {
    player[i].drawPlayer();
  }
  if (player[0].hurtCounter==25){
    player1Health-=11;
  }
  if (player[1].hurtCounter==25){
    player2Health-=11;
  }
  
  if ((player1Health<=0) || (player2Health<=0) || (time<=0)){
    gameState="end";
    
    
  }
  if (millis()%5==0){
      water.add(new water());
  }  
  for (int i = water.size()-1; i >= 0; i--) {
    water Water = water.get(i);
    
    float waterHeight=Water.drawWater();
    if (waterHeight>1050){
      water.remove(i);
    }
  }
}

void end(){
  drawBackground();
  
  fill(96,96,96,200);
  rect(0,0,1280,1024);
  textSize(200);
  fill(0,255,0);
  text("Fighters",300, 400);
  textSize(100);
  fill(255,255,255);
  if (time<=0){
    fill(255,255,255);
    text("Tie",550, 700);
    fill(0,0,255);
    text("Click to play again",250, 850);
  }
  else if (player1Health<=0){
    fill(255,255,255);
    text("Player 1 wins",350, 700);
    fill(0,0,255);
    text("Click to play again",250, 850);
  }
  else if (player2Health<=0){
    fill(255,255,255);
    text("Player 2 wins",350, 700);
    fill(0,0,255);
    text("Click to play again",250, 850);
  }
  
}



void drawBackground(){
  fill(0,153,255);
  rect(0,0,1280,1024);
  fill (160, 160, 160);
  rect(0,824,1280,200);
  tiles(); //This will be redone when I add the interaciblty. This is just to see how it looks.
  
  //clouds
  stroke(255,255,255);
  fill(255,255,255);
  ellipse(300,200,100,100);
  ellipse(250,140,100,100);
  ellipse(280,120,100,100);
  ellipse(210,90,100,100);
  ellipse(230,60,100,100);
  ellipse(170,50,100,100);
  ellipse(130,30,100,100);
  rect(0,0,150,200);
  rect(100,75,140,125);
  
  stroke(0,0,0);
  
  
  //Bench back
  fill(102,51,0);
  rect(0,190,1280,460);
  
  rect(0,650,80,174);
  rect(1200,650,80,174);
  
}

void health(int team){
  if (team==1){
    player2Health-=damage(player[1].velocity.y);
    
  }
  if(team==2){
    player2Health-=damage(player[1].velocity.y);
  }
}


void tiles(){
  for (int i = 0; i < 4; i = i+1){
    for (int j = 0; j < 12; j = j+1){
      fill(255,160,50+50*(j%2));
      rect(0+j*106.66666666666666666666666666667,824+i*50,106.66666666666666666666666666667,50);
    }
    
  }
  
}


void drawUI(){
  //Player 1
  fill(160,160,160);
  rect(75,75,400,80);
  fill(255,0,0);
  rect(75,75,player1Health*4,80);
  textSize(40);
  text("Player 1", 75, 70);
  
  //Player 2
  fill(160,160,160);
  rect(1205,75,-400,80);
  fill(255,0,0);
  rect(1205,75,-player2Health*4,80);
  text("Player 2", 1070, 70);
  
  //timer
  fill(255,255,255);
  rect (560, 65, 160, 100, 100);
  fill(0,0,0);
  textSize(60);
  text(int(time), 610, 135);
  
  //Bench front
  fill(102,51,0);
  rect(0,330,1280,80);
  
  fill(102,51,0);
  rect(0,580,1280,80);
  
  //crack
  line(870,825,870,845);
  line(860,850,870,845);
  line(880,855,870,845);
  line(880,855,890,850);
}

float damage(float D){
  
  x=int(D+5);
  return x;
  
}
