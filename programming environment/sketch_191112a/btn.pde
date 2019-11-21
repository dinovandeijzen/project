class Button{
  
  float x,y,w,h,size,textsize,xoff,yoff;
  int id,toggle,toggle2,type;
  String label;
  boolean drag,resize, radio,update,border = true,vertical,horizontal;
  color col;
  Menu parent;
  Menu submenu;
  ArrayList<Button> buttons = new ArrayList<Button>();
  HashMap<String,Boolean> values = new HashMap<String,Boolean>();
  
  Button(float xx, float yy, float ww, float hh, String Label){
    
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    label = Label;
    size = 1;
    textsize = 12;
    col = color(255);
    
    values.put("drag",false);
    values.put("resize",false);
    values.put("radio",false);
    values.put("update",false);
    values.put("border",false);
  }
  
  void draw(){
    //background(51);
    
    if(subpos()){
      //toggle = 1;
    }
    float X = 0;
    float Y = 0;
    if(parent!=null){
      X = parent.x;
      Y = parent.y;
    }
    if(!radio){
      stroke(0);
      strokeWeight(size);
      if(!border){
        noStroke();
      }
      fill(col);
      rect(x ,y,w,h);
      fill(0);
      textSize(textsize);
      text(label,x+5+xoff,y+13+yoff);
    }
    
    if(radio){
      fill(0);
      stroke(col);
      if(!border){
        noStroke();
      }
      if(w>h){
      rect(x ,y,w,w);
      fill(col);
      ellipse(x+w/2 ,y+w/2,w-3,w-3);
    }
    else{
      rect(x,y,h,h);
      fill(col);
      ellipse(x+h/2,y+h/2,h-3,h-3);
    }}
    
    if(subpos()){
      toggle2 = 1;
    }
    else{
      toggle2 = 0;
    }
    
  };
  
  void radio(){
    
    radio = true;
  };
  
  void func(Grid a){
    
      a.draw();
    
  };
  void func(Plot_2D a){
    
      a.draw();
    
  };
  
  void click(Button a){
    
    if(pos() && parent.toggle==1){
      if(a.toggle==1){
        a.toggle = 0;
        }
        else if(a.toggle==0){
          a.toggle = 1;
        }
      }
  };
  
  void onclick(){
    if(pos() && parent.toggle==1){
    reset.toggle=1;
    }
  };
  
  void onclick(Grid a){
    
    //toggle ++;
    
    if(pos()&&parent.toggle==1){
    if(toggle==2){
      toggle=0;
    }
      a.toggle++;
      gridbox.toggle++;
    if(a.toggle==2){
     a.toggle=0; 
     gridbox.toggle=0;
    }}
  };
  
  void onclick(Plot_2D a){
    if(pos()&&parent.toggle==1){
    //if(toggle==1){
      a.toggle++;
    //}
    if(a.toggle==2){
     a.toggle=0; 
    }}
  };
  
  void onclick(ArrayList<Attractor> b){
    if(pos()&&parent.toggle==1){
    toggle++;
    
    if(toggle==2){
      toggle=0;
    }}
    
    if(pos()&&parent.toggle==1){
      for(int i=0;i<b.size();i++){
        Attractor c = b.get(i);
        if(toggle==1){
          
          c.toggle = toggle;
          }
          else{
           c.toggle = toggle; 
          }}}
  };
  
  boolean pos(){
    float X = 0;
    float Y = 0;
    
    if(parent!=null){
      X = parent.x;
      Y = parent.y;
    }
    
    return x  < mouseX && mouseX < x + w && y < mouseY && mouseY < y + h+2;
  };
  
  void click(){
   
    if(pos() && parent.toggle==1){
      toggle ++;
    
    if(toggle==2){
      toggle = 0;
    }}
    
  };
  
  void toggle(Grid a,String b){
    
    if(parent!=null){
    if(pos() && parent.toggle==1){
       if(b=="pause"){
        a.values.put("forward",false);
        a.values.put("backward",false);
        a.values.put(b,true);
      }
      else if(b=="forward"){
        a.values.put(b,true);
        a.values.put("backward",false);
        a.values.put("pause",false);
      }
      else if(b=="backward"){
        a.values.put("forward",false);
        a.values.put(b,true);
        a.values.put("pause",false);
      }}}
  };
  
  void toggle2(Grid a, String b){
    
    if(pos() && parent.toggle==1){
      toggle ++;
      if(toggle==2){
        toggle=0;
    }}
    
    if(pos() && parent.toggle==1){
      if(toggle==1){
        a.values.put(b,true);
      }
      else{
        a.values.put(b,false);
      }}
  };
  
  void toggle2(Attractor a, String b){
    
    if(pos() && parent.toggle==1){
      toggle ++;
      
      if(toggle==2){
        toggle=0;
    }}
    
    if(pos() && parent.toggle==1){
      if(toggle==1){
        a.values.put(b,true);
      }
      else{
        a.values.put(b,false);
      }}
  };
  void toggle2(Boundary a, String b){
    
    if(pos() && parent.toggle==1){
      toggle ++;
      
      if(toggle==2){
        toggle=0;
    }}
    
    if(pos() && parent.toggle==1){
      if(toggle==1){
        a.values.put(b,true);
      }
      else{
        a.values.put(b,false);
      }}
  };
  
  void highlight2(){
    col = color(255,0,255);
  }
  
  void highlight(){
    if(buttons.size()==0){
    if(pos()){
      col = color(255,0,255);
    }
    else{
      col = color(255);
    }}
    else{
      if(pos()||subpos()){
      col = color(255,0,255);
    }
    else{
      col = color(255);
    }
    }
  };
  
  boolean subpos(){
     float X = 0;
     float Y = 0;
      if(parent!=null){
        X = parent.x;
        Y = parent.y;
      }
    
      return mouseX> x + w-10+xoff&& mouseX < x + w&& mouseY > y&& mouseY < y + h;
    
  };
  
  void event_listener(){
    if(drag&&!values.get("drag")){
      values.put("drag",true);
    }
    else if(!drag &&values.get("drag")){
      values.put("drag",false);
    }
    if(resize&&!values.get("resize")){
      values.put("resize",true);
    }
    else if(!resize &&values.get("resize")){
      values.put("resize",false);
    }
    if(radio&&!values.get("radio")){
      values.put("radio",true);
    }
    else if(!radio &&values.get("radio")){
      values.put("line",false);
    }
    if(update&&!values.get("update")){
      values.put("update",true);
    }
    else if(!update &&values.get("update")){
      values.put("update",false);
    }
    if(border&&!values.get("border")){
      values.put("border",true);
    }
    else if(!border &&values.get("border")){
      values.put("border",false);
    }
  };
};
