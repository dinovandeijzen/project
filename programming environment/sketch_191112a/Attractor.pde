class Attractor{
  
  int id,toggle;
  float x,y,w,h,intensity;
  String label;
  boolean drag,resize; 
  
  Attractor(float xx, float yy, float Intensity){
    
    x = xx;
    y = yy;
    intensity = Intensity;
  }
  
  void draw(){
    //if(toggle==1){
    stroke(0);
    fill(0);
    if(intensity>0){
      fill(255);
    }
    ellipse(x,y,10,10);
    //}
  };
  
  void add(){
    
    if(mousePressed){
      
    }
  };
  
  boolean pos(){
    float X = mouseX;
    float Y = mouseY;
    return X > x && X < x + 10 && Y > y && Y < y + 10; 
  }
  
};
