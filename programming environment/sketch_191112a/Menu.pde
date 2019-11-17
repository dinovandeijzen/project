class Menu{
  
  int id,item,t,toggle,toggle2,type = 0, index =-1,subindex = -1;
  float x,y,w,h,xoff,yoff,window,htotal,Yoff,xpos,ypos;
  String label;
  boolean drag,resize,slide = false,visible = true,border,menu;
  ArrayList<Button> items = new ArrayList<Button>();
  ArrayList<Boolean> child = new ArrayList<Boolean>();
  Button parent;
  color col = 255;
  
  Menu(float xx, float yy, float ww, float hh ,String Label){
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    label = Label;
    xoff = 0;
    yoff = 0;
    toggle =0;
  }
  
  Menu(float xx, float yy, float ww, float hh){
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    xoff = 0;
    yoff = 0;
    toggle =0;
  }
  
  void draw(){
    
    if(pos()){
      col = color(255,0,255);
    }
    else{
     col = 255; 
    }
    
    if(outpos()&&mousePressed&&!menu&&reset.toggle!=1){
      toggle=0;
    }
    
    
    
    if(subindex!=index&&subindex!=-1){
      subindex = -1;
      index = -1;
    }
    if(items.size()>0&&index>=0&&toggle==1){
      Button a = items.get(index);
      a.highlight2();
      
      if(a.submenu!=null){
        //a.submenu.draw();
      }
      //a.draw();
    }
    if(items.size()>0&&subindex>=0&&subindex==index&&toggle==1){
      Button a = items.get(subindex);
      if(a.submenu!=null){
        if(a.submenu.pos2()){
          
        menu = true;
        }
        else{
         menu = false; 
        }
        a.submenu.trace();
      }}
    
    if(type==0){
      trace();
    }
    else if(type==1){
      
      if(parent.pos()&&parent.parent.toggle==1){
        textSize(20);
        text(">",parent.x + parent.w -15,parent.y +15);
        textSize(12);
        //parent.parent.subindex = index;
      }
      
      if(parent.subpos()&&parent.parent.toggle==1){
        //parent.parent.subindex = index;
        trace();
      }
    }
  };
  
  void trace(){
    float speed = 2;
    
    while(items.size()!=child.size()){
      child.add(false);
    }
    stroke(0);
    if(!border){
      noStroke();
    }
    fill(col);
    if(visible){
    rect(x,y,w,h);
    }
    fill(0);
    if(label!=null){
      
    text(label, x+xoff,y+yoff + 18);
    }
    else{
     toggle = 1; 
    }
    for(int i=0;i<items.size();i++){
      
      Button a = items.get(i);
      if(toggle==1){
      if(a.pos()&&i>=0){
      index = i;
      }
      if(a.subpos()&&i>=0){
        subindex = i;
      }}
      if(!slide){
        if(toggle==1){
            a.draw();
            if(pos2()){
            a.highlight();
            }
            if(toggle==1){
            if(a.pos()){
              index = i;
              }
            if(a.subpos()){
              subindex = i;
            }}
          }}
        else{
        if(toggle==1){
          window += speed;
          if(window>y + 20*items.size()){
            window = y+20*items.size();
          }}
        else{
          window -= speed;
          if(window<0){
            window = 0;
          }
        }
        
        if(y + window >= a.y){
          
          a.draw();
          a.highlight();
        }}
        
    }
    if(drag){
      stroke(0);
      fill(0);
      rect(x+w-10,y,10,5);
    }
    if(dpos()&&mousePressed&&drag){
      
      float dx = mouseX - x;
      float dy = mouseY - y;
      Float X = float(mouseX - pmouseX);
      Float Y = float(mouseY - pmouseY);
      
      
      //x =  (x + w) - (mouseX - x)  - (x +w -mouseX)+1 ;
      //y =  (y + h) - (mouseY - y)  - (y +h -mouseY)+1;
      
      x = mouseX - (xpos) + -w+5;
      y = mouseY - ypos -2;
    }
    
  };
  
  boolean pos(){
    
    return mouseX>x&&mouseX<x+w&&mouseY>y&&mouseY<y+h+1;
  };
  boolean pos2(){
    
    return mouseX>x&&mouseX<x+w&&mouseY>y&&mouseY<y+h*(items.size()+1)+1;
  };
  
  void drag(){
    
  };
  
  boolean dpos(){
    return mouseX>x + w - 10&&mouseX<x+w&&mouseY>y&&mouseY<y+h+1;
  };
  
  boolean outpos(){
    float X = mouseX;
    float Y = mouseY;
    return (X < x || X > x + w+10) || (Y < y || Y > y + h * (items.size()+1));
  }
  
  void click(){
    if(pos() && mousePressed){
      toggle++;
    }
    if(toggle==2){
      toggle = 0;
    }
  };
  
}
