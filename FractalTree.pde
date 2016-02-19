private double fractionLength = 0.8; 
private int smallestBranch = 10; 
private double branchAngle = 0.2;  
public void setup() 
{   
  size(640,480);    
  
} 
public void draw() 
{   
  background(0);   
  stroke(255,0,0);   
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2);  //will add later 
  
} 
public void keyPressed(){
  if(keyCode == UP && fractionLength < 0.8) {
    fractionLength += 0.1;
  }
  if(keyCode == DOWN && fractionLength > 0.05) {
    fractionLength -= 0.1;
  }
  if(keyCode == LEFT) {
    branchAngle += 0.1;
  }
  if(keyCode == RIGHT) {
    branchAngle -= 0.1;
  }
  if(key == 's'&&smallestBranch<100) {
    smallestBranch ++;
  }
  if(key == 'w' && smallestBranch>5) {
    smallestBranch--;
  }
}
  
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  //your code here
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if(branchLength>smallestBranch) {
     drawBranches(endX1,endY1,branchLength,angle1);
     drawBranches(endX2,endY2,branchLength,angle2);
  }
} 
