class Plot_2D{
  
  int id,toggle;
  float x,y,w,h;
  String label;
  boolean drag,resize,line,dotted,dashed;
  PVector origin;
  color col;
  HashMap<String,Boolean> values = new HashMap<String,Boolean>();
  
  Plot_2D(PVector Origin,float ww, float hh){
    origin = Origin;
    w = ww;
    h = hh;
    
    values.put("drag",false);
    values.put("resize",false);
    values.put("line",false);
    values.put("dotted",false);
    values.put("dashed",false);
  }
  
  void draw(){
    if(toggle==1){
    PVector o = origin;
    
    float step = 50;
    
    if(col==0){
    stroke(0);
    }
    else{
      if((o.x - mouseX -10)% step==0||(o.x + mouseX -10) % step==0){
        col = color(255,255,0);
      }
      else{
        col = color(0,255,0);
      }
      stroke(col);
    }
    if(line){
    line(o.x,o.y,o.x+w/2, o.y);
    line(o.x,o.y,o.x-w/2, o.y);
    line(o.x,o.y,o.x,o.y+h/2);
    line(o.x,o.y,o.x,o.y-h/2);
    }
    
    if(mouseX>o.x - w/2 &&mouseX < o.x + w/2 &&mouseY > o.y - h/2 && mouseY < o.y + h/2){
      line(o.x,mouseY,mouseX,mouseY);
      line(mouseX,o.y,mouseX,mouseY);
    }
    if(mouseX < o.x - w/2){
      line(o.x,mouseY,o.x - w/2,mouseY);
      line(o.x - w/2,o.y,o.x - w/2,mouseY);
    }
    if(mouseX > o.x + w/2){
      line(o.x,mouseY,o.x + w/2,mouseY);
      line(o.x + w/2,o.y,o.x + w/2,mouseY);
    }
    fill(0);
    for(int i=-10;i<10;i++){
      
      textSize(20);
      if(i>=0){
        text(i,o.x - 10, o.y + 18 - i * 50);
        text(i,o.x - 10 + i * 50, o.y + 18);
      }
      else{
        text(i,o.x - 20, o.y + 18 - i * 50);
        text(i,o.x - 10 + i * 50, o.y + 18);
      }
      textSize(12);
    }}
  };
  
  void regression(){
    
  }
  
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
    if(line&&!values.get("line")){
      values.put("line",true);
    }
    else if(!line &&values.get("line")){
      values.put("line",false);
    }
    if(dotted&&!values.get("dotted")){
      values.put("dotted",true);
    }
    else if(!dotted &&values.get("dotted")){
      values.put("dotted",false);
    }
    if(dashed&&!values.get("dashed")){
      values.put("dashed",true);
    }
    else if(!dashed &&values.get("dashed")){
      values.put("dashed",false);
    }
  };
  
}
