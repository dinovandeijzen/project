class Slider{
  
  int id,type;
  float x,y,w,h;
  String label;
  boolean drag,resize,border,fill = true ,toggle,visible;
  color col = color(0);
  color col2 = color(255);
  Menu parent;
  HashMap<String,Boolean> values = new HashMap<String,Boolean>();
  
  Slider(float xx,float yy, float ww, float hh){
    
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    
    if(fill){
      values.put("fill",true);
    }
    else{
      values.put("fill",false);
    }
    if(drag){
      values.put("drag",true);
    }
    else{
      values.put("drag",false);
    }
    if(resize){
      values.put("resize",true);
    }
    else{
      values.put("resize",false);
    }
    if(border){
      values.put("border",true);
    }
    else{
      values.put("border",false);
    }
  }
  
  void classic_square(){
    if(!fill){
      noFill();
    }
    fill(col2);
    rect(x,y,w,h);
    
  };
  
  void classic_round(){
    if(!fill){
      noFill();
    }
    fill(col2);
    rect(x,y,w,h);
    
  };
  
  void bar(){
    if(!fill){
      noFill();
    }
    fill(col2);
    rect(x,y,w,h);
    
  };
  
  void matrix(){
    if(!fill){
      noFill();
    }
    fill(col2);
    rect(x,y,w,h);
    
  };
  
  void pie_square(){
    if(!fill){
      noFill();
    }
    fill(col2);
    rect(x,y,w,h);
    
  };
  
  void pie_radio(){
    if(!fill){
      noFill();
    }
    fill(col2);
    rect(x,y,w,h);
    
  };
  void pie_bar(){
    if(!fill){
      noFill();
    }
    fill(col2);
    rect(x,y,w,h);
    
  };
  
  
  void event_listener(){
    if(drag&&!values.get("drag")){
      drag = false;
    }
    else if(!drag &&values.get("drag")){
      drag = true;
    }
    if(resize&&!values.get("resize")){
      resize = false;
    }
    else if(!resize &&values.get("resize")){
      resize = true;
    }
    if(fill&&!values.get("fill")){
      fill = false;
    }
    else if(!fill &&values.get("fill")){
      fill = true;
    }
    if(border&&!values.get("border")){
      border = false;
    }
    else if(!toggle &&values.get("toggle")){
      toggle = true;
    }
    if(border&&!values.get("toggle")){
      toggle = false;
    }
    else if(!border &&values.get("toggle")){
      toggle = true;
    }
    if(visible&&!values.get("visible")){
      visible = false;
    }
    else if(!border &&values.get("visible")){
      visible = true;
    }
  };
  
  boolean pos(){
    return mouseX>x&&mouseX<x+w&&mouseY>y&&mouseY<y+h;
  }
};
