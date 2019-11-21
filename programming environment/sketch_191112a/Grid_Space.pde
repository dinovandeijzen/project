class Grid_space{
  
  int id, row,t,toggle,steps,counter = 0,index,t2;
  float x,y,w,h,vx,vy,ax,ay,elasticity,lim,mass = 10,type,dx,dy;
  String label;
  boolean drag,resize,collide,forward = true,backward = false, pause = false,graph,visible,field;
  ArrayList<PVector> pos = new ArrayList<PVector>();
  PVector heading ;
  float incidence;
  float reflection ;
  float norm;
  Scene parent;
  ArrayList<PVector> vel = new ArrayList<PVector>();
  ArrayList<PVector> headings = new ArrayList<PVector>();
  PVector temp = new PVector(0,0);
  HashMap<String,Boolean> values = new HashMap<String,Boolean>();
  color col = 255;
  Grid_space(float xx,float yy, float ww, float hh, int Id){
    
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    id = Id;
    
    ax = 0.02;
    ay = 0.02;
    
    values.put("drag",false);
    values.put("resize",false);
    values.put("collide",false);
    values.put("forward",true);
    values.put("backward",false);
    values.put("pause",false);
    values.put("graph",false);
    values.put("visible",true);
    values.put("field",false);
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
      
      if(index==0){
        if(pos.size()>0){
          counter = pos.size()-1;
        }
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
    if(boundaries()){
      reflect();
    }
      x += vx;
      y += vy;
    
      
      if(attractors.size()>0){
        find_heading();
        pos.add(new PVector(x,y));
        vel.add(new PVector(vx,vy));
      }
    }
    else if(index ==1){
      vx = vel.get(counter).x;
      vy = vel.get(counter).y;
      x = pos.get(counter).x;
      y = pos.get(counter).y;
      counter++;
      if(counter == pos.size()){
        index = 0;
      }
    }}
    else if(backward){
      if(counter>0){
        index = 1;
      vx = vel.get(counter).x;
      vy = vel.get(counter).y;
      x = pos.get(counter).x;
      y = pos.get(counter).y;
      counter --;
      if(counter==0){
        pos = new ArrayList<PVector>();
        vel = new ArrayList<PVector>();
        //pos.remove(pos.size()-1);
      }
      if(counter == 0){
        index = 0;
      }
      //steps = counter;
    }}
    else if(pause){
      
    }
    
    if(graph){
      graph();
    }
  };
  
  
  
  void mouse(){
    if(forward){
    float t1 = atan2(mouseY - y, mouseX - x);
    
    vx += ax * cos(t1);
    vy += ay * sin(t1);
    }
  };
  
  void find_heading(){
    heading = new PVector(x,y);
    if(pos.size()>0){
        PVector p = pos.get(pos.size()-1);
        PVector c = new PVector(x,y);
        
        //PVector p = new PVector(x + vx,y +vy);;
        //PVector c = new PVector(x,y);
        
        int mult = 10;
        float dx = c.x - p.x;
        float dy = c.y - p.y;
        
        float theta = atan2(dy,dx);
        incidence = theta;
        
        if(dx>0){
          heading.x = x + dx * mult * cos(theta);
        }
        else{
          heading.x = x - dx * mult * cos(theta);
        }
        if(dy>0){
          
          heading.y = y + dy * mult * sin(theta);
        }
        else{
          heading.y = y - dy * mult * sin(theta);
        }
        heading.x += vx;
        heading.y += vy;
      
    }
        
        
  };
  
  void attractors(){
    if(forward){
    if(attractors.size()>0){
    for(int i=0;i<attractors.size();i++){
      
      Attractor a = attractors.get(i);
      
      float t1 = atan2(a.y - y, a.x - x);
    
      float d = dist(x,y,a.x,a.y);
      if(a.type == 1){
      ax = (a.mass + mass)/(d*d)*9.81*a.intensity;
      ay = (a.mass + mass)/(d*d)*9.81*a.intensity;
      }
      else if( a.type == 2){
      ax = a.intensity;
      ay = a.intensity;
      //vx -=  a.intensity * dx; ;
      //vy -=  a.intensity * dy; ;
      }
      vx -= ax * cos(t1);
      vy -= ay * sin(t1);
      
    }}}
  };
  
  void reflect(){
    if(collide){
      vx = -ax  * cos(reflection);
      vy = -ay  * sin(reflection);
    }
    
  };
  
  boolean boundaries(){
    t2 = 0;
    boolean k = false;
    float incidence = 0;
    PVector temp = new PVector(0,0);
    if(forward){
    if(lines.Boundaries.size()>0){
      
    for(int i=0;i<lines.Boundaries.size();i++){
      
      Boundary a = lines.Boundaries.get(i);
      float n = lines.norm.get(i);
      
      PVector a1 = new PVector(a.x1,a.y1); 
      PVector a2 = new PVector(a.x2,a.y2); 
      
      boolean k2 = check_lineP(a1,a2,new PVector(x,y));
      //norm.set(0,a.norm);
      norm = n;
      if(k2){
        t2++;
      }}}}
    
    if(t2>0){
      k = true;
      collide = true;
    }
    else{
      collide = false;
    }
    
    reflection = norm + (norm + incidence);
    return k;
  };
  
  
  boolean check_lineP(PVector a, PVector b,PVector c){
    
    boolean k = false;
    float d1 = dist(a.x,a.y,b.x,b.y);
    float d2 = dist(a.x,a.y,c.x,c.y);
    float d3 = dist(b.x,b.y,c.x,c.y);
    float d4 = d2 + d3;
    
    
    //if(d5>=inc/2&&d6>=inc/2){
    if(d4 <= d1 + 0.05 && d4 >= d1 - 0.05){
      k = true;
    }
    return k;
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
  
  void graph(){
    stroke(col);
    int max = 10;
    if(forward){
      if(index==0){
        
    if(pos.size()>max&& pos.size()>2){
      for( int i=pos.size()-max;i<pos.size()-1;i++){
        PVector a = pos.get(i);
        PVector b = pos.get(i+1);
        
        line(a.x,a.y,b.x,b.y);
      }}
    else{
      for( int i=0;i<pos.size()-1;i++){
        PVector a = pos.get(i);
        PVector b = pos.get(i+1);
        
        line(a.x,a.y,b.x,b.y);
      }}}
    else if(index==1){
          if(counter>max&& pos.size()>2){
      for( int i=counter-max;i<counter;i++){
        PVector a = pos.get(i);
        PVector b = pos.get(i+1);
        
        line(a.x,a.y,b.x,b.y);
      }}
    else{
      for( int i=counter-max;i<counter;i++){
        PVector a = pos.get(i);
        PVector b = pos.get(i+1);
        
        line(a.x,a.y,b.x,b.y);
      }}}}
    else if(backward){
      if(counter>max&& pos.size()>2){
      for( int i=counter-max;i<counter;i++){
        PVector a = pos.get(i);
        PVector b = pos.get(i+1);
        
        line(a.x,a.y,b.x,b.y);
      }}
    else{
      for(int i=0;i<counter;i++){
        PVector a = pos.get(i);
        PVector b = pos.get(i+1);
        
        line(a.x,a.y,b.x,b.y);
      }}}
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
    if(collide&&!values.get("collide")){
      collide = false;
    }
    else if(!collide &&values.get("collide")){
      collide = true;
    }
    if(forward&&!values.get("forward")){
      forward = false;
    }
    else if(!forward &&values.get("forward")){
      forward = true;
    }
    if(backward && !values.get("backward")){
      backward = false;
    }
    else if(!backward &&values.get("backward")){
      backward = true;
    }
    if(pause && !values.get("pause")){
      pause = false;
    }
    else if(!pause &&values.get("pause")){
      pause = true;
    }
    if(visible&&!values.get("visible")){
     visible = false;
    }
    else if(!visible &&values.get("visible")){
      visible = true;
    }
    if(graph && !values.get("graph")){
      graph = false;
    }
    else if(!graph &&values.get("graph")){
      graph = true;
    }
    if(field && !values.get("field")){
      field = false;
    }
    else if(!field &&values.get("field")){
      field = true;
    }
  };
  
};
