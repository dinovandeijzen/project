class TextArea{
  
  int id,toggle,cols,rows,size,t,timer = 5;
  float x,y,w,h,textsize,twidth = 0;
  String label;
  boolean drag,resize,hover,border,background,hidden,fill = true,init,ready;
  Button child;
  ArrayList<String> textbox = new ArrayList<String>();
  ArrayList<Integer> counted = new ArrayList<Integer>();
  ArrayList<Float> tsize = new ArrayList<Float>();
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
    twidth = 0;
    
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
          fill(col);
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
      if(!pos()&&mousePressed){
        ready = false;
      }
      if(ready && keyPressed&& timer ==5){
        String a = getKey();
        if(a!=null){
          timer --;
          textbox.add(a);
          
          if(timer<=0){
            timer = 5;
          }}}
      
      if (!keyPressed){
        timer = 5;
      }
      float spacing = 0;
      //String [] a = null;
      
      float d = 0;
      
      if(textbox.size()>0){
        float c = 0;
        for(int i=0;i<textbox.size();i++){
          String a = textbox.get(i);
          char k = a.charAt(0);
          c = textWidth(k);
          
          stroke(0);
          if(c>w-10){
            c = 0;
            d++;
          }
            String p = textbox.get(i);
          if(a=="l"||p=="i"||p=="r"||p =="t"||p =="n"||p=="i"){
            spacing =200;
            //text(a ,x+c+25,y+10+10*d);
            c+=10;
          }
          stroke(0);
          strokeWeight(1);
          //line(c,y,x+c,y+10);
          fill(0);
          text(spacing ,x+c-7+spacing,y+10+10*i);
          
        }}
        //text(textbox ,x+c+10,y+10+10*d);
  };
  
  
  void init(){
    
  };
  
  String getKey2(){
    String a  = null;
    if(key == 'a'){
      a = "a";
    }else if (key == 'b'){
      a = "b";
    }else if (key == 'c'){
      a = "c";
    }else if (key == 'd'){
      a = "d";
    }else if (key == 'e'){
      a = "e";
    }else if (key == 'f'){
      a = "f";
    }else if (key == 'g'){
      a = "g";
    }else if (key == 'h'){
      a = "h";
    }else if (key == 'i'){
      a = "i";
    }else if (key == 'j'){
      a = "j";
    }else if (key == 'k'){
      a = "k";
    }else if (key == 'l'){
      a = "l";
    }else if (key == 'm'){
      a = "m";
    }else if (key == 'm'){
      a = "m";
    }else if (key == 'n'){
      a = "n";
    }else if (key == 'o'){
      a = "o";
    }else if (key == 'p'){
      a = "p";
    }else if (key == 'q'){
      a = "q";
    }else if (key == 'r'){
      a = "r";
    }else if (key == 's'){
      a = "s";
    }else if (key == 't'){
      a = "t";
    }else if (key == 'u'){
      a = "u";
    }else if (key == 'v'){
      a = "v";
    }else if (key == 'w'){
      a = "w";
    }else if (key == 'x'){
      a = "x";
    }else if (key == 'y'){
      a = "y";
    }else if (key == 'z'){
      a = "z";
    }
    else{
      a = "";
    }
    
    return a;
  }
  
  String getKey(){
    String a = null;
    
    if(keyPressed){
      a  = str(char(key));
    }
    
    return a;
    
  }
  char getchar(){
    char a = '¬';
    
    if(keyPressed){
      a  = char(key);
    }
    
    return a;
    
  }
  
  boolean pos(){
    
    float X = mouseX;
    float Y = mouseY;
    
    return X > x && X < x + w && Y > y && Y < y + h; 
  };
  
};
