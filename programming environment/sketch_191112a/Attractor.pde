class Attractor{
  
  int id,toggle,type;
  float x,y,w,h,intensity,mass = 200;
  String label;
  boolean drag,resize; 
  HashMap<String,Boolean> values = new HashMap<String,Boolean>();
  ArrayList<Attractor> attractors = new ArrayList<Attractor>();
  
  Attractor(float xx, float yy, float Intensity){
    
    x = xx;
    y = yy;
    intensity = Intensity;
    
    values.put("drag",false);
    values.put("resize",false);
  }
  
  void draw(){
    //if(toggle==1){
    event_listener();
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
  };
  
};
