class Char{
  
  int id;
  float x,y,w,h;
  String label,letter;
  boolean drag,resize;
  Button child;
  
  Char(String a, int ID,float X,float Y){
    letter = a;
    id = ID;
    w = 10;
    h = 10;
    x = X;
    y = Y;
  };
  
  void draw(){
    
    
  };
  
  boolean pos(){
    float X = mouseX;
    float Y = mouseY;
    
    return X > x -1 && X < x + 11 && Y > y -1 && Y < y + 11; 
  }
  
};
