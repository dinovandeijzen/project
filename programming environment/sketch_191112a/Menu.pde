class Menu{
  
  int id,item,t,toggle,toggle2,type = 0, index =-1,subindex = -1,t2;
  float x,y,w,h,xoff,yoff,window,htotal,Yoff,xpos,ypos;
  String label;
  boolean drag = false,resize = false,slide = false,visible = true,border = false,menu = false, menuhover = false;
  ArrayList<Button> items = new ArrayList<Button>();
  ArrayList<Boolean> child = new ArrayList<Boolean>();
  HashMap<String,Boolean> values ;
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
    
    values = new HashMap<String,Boolean>(){{
    put("drag",false);
    put("resize",false);
    put("slide",false);
    put("visible",false);
    put("border",false);
    put("menu",false);
    put("menuhover",false);
    }};
  }
  
  Menu(float xx, float yy, float ww, float hh){
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    xoff = 0;
    yoff = 0;
    toggle =0;
    
    values = new HashMap<String,Boolean>(){{
    put("drag",false);
    put("resize",false);
    put("slide",false);
    put("visible",false);
    put("border",false);
    put("menu",false);
    put("menuhover",false);
    }};
  }
  
  void draw(){
    event_listener();
    if(pos()){
      col = color(255,0,255);
    }
    else{
     col = 255; 
    }
    if(!pos()){
    if(mousePressed&&!menu&&reset.toggle!=1&&!menuhover){
      toggle=0;
    }}
    
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
    t2 = 0;
    
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
        t2 ++;
        index = i;
      }
      if(a.subpos()&&i>=0){
        t2 ++;
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
              t2 ++;
              index = i;
              }
            if(a.subpos()){
              t2 ++;
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
    
    if(t2>0){
      menuhover = true;
    }
    else{
      menuhover = false;
    }
  };
  
  boolean pos(){
    
    return mouseX>x&&mouseX<x+w&&mouseY>y&&mouseY<y+h+1;
  };
  boolean pos2(){
    
    return mouseX>x&&mouseX<x+w&&mouseY>y&&mouseY<y+20*(items.size());
  };
  boolean pos3(){
    
    return mouseX>x&&mouseX<x+w&&mouseY>y&&mouseY<y+20*(items.size());
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
    if(slide&&values.get("slide")){
      values.put("slide",true);
    }
    else if(!slide &&values.get("slide")){
      values.put("slide",false);
    }
    if(visible&&!values.get("visible")){
      values.put("visible",true);
    }
    else if(!visible &&values.get("visible")){
      values.put("visible",false);
    }
    if(border && !values.get("border")){
      values.put("border",true);
    }
    else if(!border &&values.get("border")){
      values.put("border",false);
    }
    if(menu && !values.get("menu")){
      values.put("menu",true);
    }
    else if(!menu &&values.get("menu")){
      values.put("menu",false);
    }
    if(menuhover && !values.get("menuhover")){
      values.put("menuhover",true);
    }
    else if(!menuhover &&values.get("menuhover")){
      values.put("menuhover",false);
    }
  };
  
};
