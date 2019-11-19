class TextArea{
  
  int id,toggle,cols,rows,size,t,twidth = 0;
  float x,y,w,h,textsize;
  String label;
  boolean drag,resize,hover,border,background,hidden,fill = true,init,ready;
  Button child;
  ArrayList<String> textbox = new ArrayList<String>();
  String b = null;
  color col = color(255);
  Window parent;
  
  TextArea(float X,float Y,float WW,float HH,int Cols,int Rows){
    
    x = X;
    y = Y;
    w = WW;
    h = HH;
    cols = Cols;
    rows = Rows;
    //for(int i=0;i<cols;i++){
    //  for(int j=0;j<rows;j++){
    //    int id = i + j * cols;
    //  textbox.add(new Char(" ",id,x + i*10,y + j*10));
    //  }}
      size = textbox.size();
  };
  
  void draw(){
    //twidth = 0;
    
    if(b!=null){
      twidth += textWidth(textbox.get(textbox.size()-1));
    }
    
    t = 0;
    if(!hidden){
      if(border){
        stroke(0);
      }
      else{
        noStroke();
      }
      if(fill){
        if(pos()){
          fill(255,0,0);
        }
        else{
          fill(col);
        }}
      else{
        noFill();
        fill(col);
      }
      rect(x,y,w,h);
      
      for(int i=0;i<textbox.size();i++){
        b = textbox.get(i);
      }}
      if(t>0){
        cursor(POINT);
      }
      else{
        //cursor(HAND);
      }
      
      if(pos()){
        cursor(POINT);
        if(mousePressed){
        ready = true;
      }}
      else{
        cursor(ARROW);
      }
      if(ready && keyPressed){
        //textbox.add(key);
      }
  };
  
  
  void init(){
    
  };
  
  boolean pos(){
    
    float X = mouseX;
    float Y = mouseY;
    
    return X > x && X < x + w && Y > y && Y < y + h; 
  };
  
};
