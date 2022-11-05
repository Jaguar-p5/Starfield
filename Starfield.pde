ArrayList <Particle> set = new ArrayList <Particle>();
Camera observer;
Particle[] sky = new Particle[100000];
int pointer = 99899; // where next particle will be placed

void setup(){
  
  size(500, 500);
  observer = new Camera();
  strokeWeight(0);
  fill(255);
  for(int i = pointer; i < 100000; i++){
    sky[i] = new Particle(240, 250);
    
    
    
  }
  pointer--;


}

class OddBall extends Particle{
  OddBall(float x, float y, float z){
    super(x, y, z);
    size = 20;
  }
  void show(Camera cam){
  if(cam.myZ-myZ < 0)
    return;
  float cyLeft = cam.myY - (tan(cam.theta)*(cam.myZ-myZ));

  float cyRight = cam.myY + (tan(cam.theta)*(cam.myZ-myZ));
  float viewingY = cyRight - cyLeft;
  float percentY = (myY - cyLeft)/viewingY;
  
    
  float cxLeft = cam.myX - (tan(cam.theta)*(cam.myZ-myZ));
  float cxRight = cam.myX + (tan(cam.theta)*(cam.myZ-myZ));
  float viewingX =cxRight - cxLeft;
  float percentX = (myX - cxLeft)/viewingX;
  if(myX > cxLeft && myY > cyLeft){
    
  fill(77, 55, 66);  
  ellipse(percentX*width, percentY*width, size, size);
  }
  }
  
}

class Particle{
  float size;
  float myX;
  float myY;
  float myZ;
  int myColor;
  Particle(float x, float y){
  myColor = color(255, 255, 255);
  myX = x;
  myY = y;
  myZ = 250;
  size = 5;
  }
   Particle(float x, float y, float z){
  myX = x;
  myY = y;
  myZ = z;
  size = 5;
  }
  void show(Camera cam){
  if(cam.myZ-myZ < 0)
    return;
  float cyLeft = cam.myY - (tan(cam.theta)*(cam.myZ-myZ));

  float cyRight = cam.myY + (tan(cam.theta)*(cam.myZ-myZ));
  float viewingY = cyRight - cyLeft;
  float percentY = (myY - cyLeft)/viewingY;
  
    
  float cxLeft = cam.myX - (tan(cam.theta)*(cam.myZ-myZ));
  float cxRight = cam.myX + (tan(cam.theta)*(cam.myZ-myZ));
  float viewingX =cxRight - cxLeft;
  float percentX = (myX - cxLeft)/viewingX;
  if(myX > cxLeft && myY > cyLeft){
  fill(255 - (cam.myZ-myZ));  
  ellipse(percentX*width, percentY*width, size, size);
  }
  }
}

void draw(){
  background(0);
  
  observer.myZ -= 2;
  sky[pointer] = new Particle((float)Math.random()*250 + 125, (float)Math.random()*250 + 125, -255 + observer.myZ);
  if(Math.random() > 0.998)
    sky[pointer]= new OddBall((float)Math.random()*250 + 125, (float)Math.random()*250 + 125, -255 + observer.myZ);
  pointer --;
  for(int i = pointer + 1; i < 100000; i++)
    sky[i].show(observer);


}

class Camera{
 float myX, myY, myZ;
 float theta;
 Camera(){
  theta = PI/4;
  myX = width/2;
  myY = height/2;
  myZ = 500; 
 }
}
