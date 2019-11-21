class Window{
  
  int id,toggle;
  float x,y,w,h;
  String label;
  boolean drag,resize,hover,border,background,hidden,fill = true;
  Button child;
  Menu parent;
  
  color col = color(255);
  
  Window(float X,float Y,float WW,float HH){
    
    x = X;
    y = Y;
    w = WW;
    h = HH;
    
  };
  
  void draw(){
    
    if(!hidden){
      if(border){
        stroke(0);
      }
      else{
        noStroke();
      }
      if(fill){
      fill(col);
      }
      else{
        noFill();
      }
      rect(x,y,w,h);
    }
  };
  
};
