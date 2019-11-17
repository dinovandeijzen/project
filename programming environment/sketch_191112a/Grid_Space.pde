class Grid_space{
  
  int id, row, col,t,toggle,steps,counter;
  float x,y,w,h,vx,vy,ax,ay,elasticity,lim;
  String label;
  boolean drag,resize,collide,forward = true,backward = false, pause = false;
  ArrayList<PVector> pos = new ArrayList<PVector>();
  
  Grid_space(float xx,float yy, float ww, float hh, int Id){
    
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    id = Id;
    
    ax = 0.02;
    ay = 0.02;
  }
  
  void init(){
    
  }
  
  void draw(){
   
  }
  
  void move(){
    
    float a = 5;
    
    vx += random(-a,a);
    vy += random(-a,a);
    
  }
  
  boolean pos(){
    
    return mouseX>x&&mouseX<x+w&&mouseY>y&&mouseY<y+h;
  }
  
  void update(){
    steps = pos.size()-1;
    
    if(forward){
      counter = pos.size()-1;
    //if(lim>0){
    //  vx += Limit(vx,lim);
    //  vy += Limit(vy,lim);
    //}else{
    
    if(vx>4){
      vx = 4;
      
    }
    
    if(vx<-4){
      vx = -4;
      
    }
    if(vy>4){
      vx = 4;
      
    }
    if(vy<-4){
      vx = -4;
      
    }
    x += vx;
    y += vy;
    
    
      pos.add(new PVector(x,y));
    }
    else if(backward){
      
      x = pos.get(counter).x;
      y = pos.get(counter).y;
      counter --;
    }
    else if(pause){
      
    }
  };
  
  
  
  void mouse(){
    if(forward){
    float t1 = atan2(mouseY - y, mouseX - x);
    
    vx += ax * cos(t1);
    vy += ay * sin(t1);
    }
  };
  
  void attractors(){
    if(forward){
    if(attractors.size()>0){
    for(int i=0;i<attractors.size();i++){
      
      Attractor a = attractors.get(i);
      
      float t1 = atan2(a.y - y, a.x - x);
    
      ax = a.intensity;
      ay = a.intensity;
      //vx -=  a.intensity * dx; ;
      //vy -=  a.intensity * dy; ;
      vx -= ax * cos(t1);
      vy -= ay * sin(t1);
      
    }}}
  };
  
  float Limit(float a,float b){
    if(a>0){
    if(a > b) a = b;
    }
    if(a<0){
    if(a < -b) a = b;
    }
    return a;
  };
  
  void wrap(){
    
      if(x>W){
        x=1;
      }
      if(x<0){
        x=W;
      }
      if(y>H){
        y=1;
      }
      if(y>H){
        x=1;
      }
      if(y<0){
        y=H;
      }
    
  };
  
  void bounce(){
    if(forward){
    float e = elasticity;
    if(elasticity!=0){
    if(x >= W ){
      vx = - vx;
    }
    if(x <= 0){
      vx = - vx;
    }
    
    if(y >= H ){
      vy = - vy;
    }
    if(y <= 0 ){
      vy = - vy;
    }}
    
    else{
      if(x >= W ){
      vx = - vx * (1 - e);
    }
    if(x <= 0){
      vx = - vx * (1 - e);
    }
    
    if(y >= H ){
      vy = - vy * (1 - e);
    }
    if(y <= 0 ){
      vy = - vy * (1 - e);
    }}}
  };
  
};
